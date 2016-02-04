<%@ Page Title="" Language="C#" MasterPageFile="~/MOBILE/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Payment-step4.aspx.cs" Inherits="MVC_Kutun.MOBILE.vi_vn.Payment_step4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="progress-bar current-step-1">
        <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
            <li class="current">4</li>
        </ul>
    </div>
    <!--Step 4-->
    <div class="block">
        <div class="block_ct">
            <asp:Repeater ID="Rpitemcart" runat="server">
                <ItemTemplate>
                    <div class="item_cart">
                        <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>"
                            target="_parent">
                            <img width="150" height="110" class="img_cart" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"
                                alt=""></a>
                        <div class="detail_cart fleft">
                            <div class="cell name">
                                <%# Eval("NEWS_TITLE") %>
                            </div>
                            <div class="cell unit">
                                Số lượng:
                                <%# Eval("Basket_quantity")  %>
                            </div>
                        </div>
                        <div class="total-cart fright">
                            <span>
                                <%# String.Format("{0:0,0 VNĐ}", Eval("Basket_Price")).Replace(",",".")%></span></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="foo-cart">
                <div class="total-cart">
                    <p>
                        Tổng cộng:<span id="total-money">
                            <asp:Label ID="lbtotalmoney" runat="server" Text=""></asp:Label></span></p>
                    <p>
                        Phí vận chuyển<span id="total-money">
                            <asp:Label ID="Lbship" runat="server" Text=""></asp:Label></span></p>
                    <div style="margin-bottom: 10px" class="line_dot">
                    </div>
                    <p>
                        Thành tiền:<span id="total-money">
                            <asp:Label ID="Lbtotal" runat="server" Text=""></asp:Label></span></p>
                </div>
            </div>
        </div>
    </div>
    <div class="block">
        <div class="box_Tab">Thông tin giao hàng</div>
        <div id="info_bill" class="block_ct">
            <div id="ctl00_content_dTransportFree_HCM" class="pay-form-inner" style="display: block;">
                <div class="row">
                    <span class="text">Họ &amp; Tên</span>
                    <p class="input-text">
                        <asp:Label ID="Lbname" runat="server" Text=""></asp:Label></p>
                </div>
                <div class="row">
                    <span class="text">Điện thoại liên lạc</span>
                    <p class="input-text">
                        <asp:Label ID="Lbphone" runat="server" Text=""></asp:Label>
                    </p>
                </div>
                <div class="row">
                    <span class="text">Email liên lạc</span>
                    <p class="input-text">
                        <asp:Label ID="Lbemail" runat="server" Text=""></asp:Label></p>
                </div>
                <div class="row">
                    <span class="text">Địa chỉ giao hàng</span>
                    <p class="input-text">
                        <asp:Label ID="Lbadd" runat="server" Text=""></asp:Label></p>
                </div>
                <div class="row">
                    <span class="text">Địa chỉ thanh toán</span>
                    <p class="input-text">
                        Như địa chỉ giao hàng</p>
                </div>
                <div class="row">
                    <span class="text">Hình thức thanh toán</span>
                    <p class="input-text">
                        <asp:Label ID="Lbhinhthuc" runat="server" Text=""></asp:Label></p>
                </div>
                <div class="row">
                    <span class="text">Lời nhắn:</span>
                    <p class="input-text">
                        <asp:Label ID="Lbnote" runat="server" Text=""></asp:Label>
                    </p>
                </div>
                <div class="row">
                    <script type="text/javascript">
                        $(function () {

                            $("#addCoupon").click(function () {
                                $('.coupon-container').slideToggle('fast');
                            });

                        });
                    </script>
                </div>
                <div class="row button_cart">
                    <asp:LinkButton ID="Lbpayment" runat="server" class="btn_web button1" 
                        onclick="Lbpayment_Click">Đặt hàng</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--Step 4-->
</asp:Content>
