<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Hispayment_Partner.ascx.cs"
    Inherits="MVC_Kutun.MOBILE.UIs.Hispayment_Partner" %>
<div class="path">
    <a href="/">Trang chủ</a> » <a class="aLink1" href="/m-quan-ly-tai-khoan.html">Tài khoản
        của tôi</a> » <a class="aLink1" href="#">Đơn hàng của tôi</a>
</div>
<!--Cart-->
<link href="../../vi-vn/Datepicker/jquery-ui.min.css" rel="stylesheet" type="text/css" />
<script src="../../vi-vn/Datepicker/jquery-ui.min.js" type="text/javascript"></script>
<script>
    $(function () {
        $("#txtdatefrom").datepicker({
            changeMonth: true,
            numberOfMonths: 1,
            dateFormat: "dd-mm-yy",
            onClose: function (selectedDate) {
                $("#txtdateto").datepicker("option", "minDate", selectedDate);
            }
        });
        $("#txtdateto").datepicker({
            changeMonth: true,
            numberOfMonths: 1,
            dateFormat: "dd-mm-yy",
            onClose: function (selectedDate) {
                $("#txtdatefrom").datepicker("option", "maxDate", selectedDate);
            }
        });


    });
</script>
<style>
    .inputbox
    {
        border: 1px solid #cccccc;
        color: black;
        padding: 8px 0;
        text-indent: 10px;
        width: 100%;
        font: normal 14px Arial, Helvetica, sans-serif;
        margin: 10px 0;
    }
</style>
<div style="width: 100%; margin: 5px auto;">
    <input type="text" id="txtdatefrom" class="inputbox" runat="server" clientidmode="Static"
        placeholder='Từ ngày' readonly="readonly" />
    <input type="text" id="txtdateto" class="inputbox" runat="server" clientidmode="Static"
        placeholder='Đến ngày' readonly="readonly" />
    <asp:LinkButton ID="Lbsearch" runat="server" CssClass="btn_web btn_payment" OnClick="Lbsearch_Click">Kiểm tra</asp:LinkButton>
</div>
<asp:Repeater ID="Rphistory" runat="server">
    <ItemTemplate>
        <div class="box">
            <div class="box_ct" style="position: relative">
                <div style="position: absolute; right: 25px; top: 80%; cursor: pointer">
                    <img src="/MOBILE/vi-vn/Images/icon_order.png" width="20px" />
                </div>
                Mã đơn hàng: <font color="blue">
                    <%#Eval("ORDER_CODE") %></font><br />
                Ngày đặt hàng:
                <%#getPublishDate(Eval("ORDER_PUBLISHDATE"))%><br />
                Địa chỉ giao hàng:
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
<script>
    $(function () {
        $('.box_ct').click(function () {
            $(this).next(".boxitem:first").slideToggle();
        });
    });
</script>
