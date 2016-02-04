<%@ Page Title="" Language="C#" MasterPageFile="~/MOBILE/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Check-order.aspx.cs" Inherits="MVC_Kutun.MOBILE.vi_vn.Check_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="path">
        <a href="/">Trang chủ</a> » <a href="#">Kiểm tra đơn hàng</a></div>
    <!--Login Page-->
    <div class="box" id="account">
        <div class="box_Tab">
            Kiểm tra đơn hàng</div>
        <!--Form Login-->
        <div class="box_ct login_form form_web">
            <div class="row_account">
                <input type="text" id="txtcode" name="txtcode" class="inputbox" runat="server" placeholder="Mã đơn hàng *">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập mã đơn hàng"
                    ControlToValidate="txtemail" Display="Dynamic" ForeColor="Red" ValidationGroup="G7"
                    CssClass="tlp-error">*</asp:RequiredFieldValidator>
            </div>
            <div class="row_account">
                <input type="text" id="txtemail" name="txtemail" class="inputbox" runat="server"
                    placeholder="Địa chỉ email *">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập địa chỉ email"
                    ControlToValidate="txtemail" Display="Dynamic" ForeColor="Red" ValidationGroup="G7"
                    CssClass="tlp-error">*</asp:RequiredFieldValidator>
            </div>
            <div class="row_account text">
                <asp:LinkButton ID="Lbcheckcode" runat="server" class="btn_web btn_payment" ValidationGroup="G7"
                    OnClick="Lbcheckcode_Click">Kiểm tra</asp:LinkButton>
                <br />
                <asp:Label ID="Lberrors" runat="server" Text="" ForeColor="Red"></asp:Label>
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                    ShowSummary="False" ValidationGroup="G7" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail"
                    ErrorMessage="Địa chỉ email chưa đúng định dạng" ForeColor="Red" SetFocusOnError="True"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="G7"></asp:RegularExpressionValidator>
                <br />
            </div>
        </div>
        <!--End Form Login-->
        <div id="div_order" runat="server">
            <asp:Repeater ID="Rphistory" runat="server">
                <ItemTemplate>
                    <div class="box">
                        <div class="box_ct" style="position: relative">
                            <div style="position: absolute; right: 25px; top: 80%; cursor: pointer">
                                <img src="/MOBILE/vi-vn/Images/icon_order.png" width="20px" />
                            </div>
                            Mã đơn hàng: <font color="blue">
                                <%#Eval("ORDER_CODE") %></font><br />
                            Ngày:
                            <%#getPublishDate(Eval("ORDER_PUBLISHDATE"))%><br />
                            Địa chỉ:
                            <%#Eval("ORDER_ADDRESS")%><br />
                            Hình thức thanh toán:
                            <%#getOrderPayment(Eval("ORDER_PAYMENT"))%><br />
                            Tình trạng:
                            <%#getOrderStatus(Eval("ORDER_STATUS"))%><br />
                        </div>
                        <div class="boxitem cf" style="display: none; margin: 0 15px;">
                            <h1 class="box_Tab">
                                Sản phẩm <span class="tt_quantity">Số lượng</span></h1>
                            <div class="box_ct">
                                <asp:Repeater ID="Rpgiohang" runat="server" DataSource='<%#loadOrderItem(Eval("ORDER_ID")) %>'>
                                    <ItemTemplate>
                                        <div class="item_cart">
                                            <input type="hidden" value='<%# Eval("news_id") %>' id="newsid" runat="server" />
                                            <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" target="_parent">
                                                <img class="img_cart" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"
                                                    alt=""></a>
                                            <div class="detail_cart fleft">
                                                <div class="cell name">
                                                    <span><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>">
                                                        <%# Eval("NEWS_TITLE") %></a></span></div>
                                                <div class="cell unit">
                                                    <span class="new">
                                                        <%# GetMoney(Eval("ITEM_PRICE"))%></span></div>
                                            </div>
                                            <div class="fright">
                                                <b>
                                                    <%#Eval("ITEM_QUANTITY")%></b>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <div class="foo-cart">
                                    <div class="total-cart">
                                        <p>
                                            Tổng cộng:<span class="fr">
                                                <%#GetMoney(Eval("ORDER_TOTAL_ALL"))%>
                                        </p>
                                        <div style="margin-bottom: 10px" class="line_dot">
                                        </div>
                                        <p>
                                            Phí vận chuyển:<span class="fr">
                                                <%#getship(Eval("ORDER_SHIPPING_FEE"))%></span></p>
                                        <div style="margin-bottom: 10px" class="line_dot">
                                        </div>
                                        <p>
                                            Thành tiền:<span class="fr">
                                                <%#GetMoney(Eval("ORDER_TOTAL_AMOUNT"))%></span>
                                        </p>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <!--End Cart-->
        </div>
    </div>
    <!--End Login Page-->
    <script>
        $(function () {
            $('.box_ct').click(function () {
                $(this).next(".boxitem:first").slideToggle();
            });
        });
    </script>
</asp:Content>
