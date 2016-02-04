<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master-payment.Master" AutoEventWireup="true"
    CodeBehind="Payment-step3.aspx.cs" Inherits="MVC_Kutun.vi_vn.Payment_step3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Ctimg" runat="server">
    <ul>
        <li id="step1"><span class="number icon_step1 icon_passed">1</span><span class="title_step">Đăng
            nhập</span></li>
        <li id="step2"><span class="number icon_step2 icon_passed">2</span><span class="title_step">Thông
            tin giao hàng</span></li>
        <li class="current" id="step3"><span class="number icon_step3">3</span><span class="title_step">Cách
            thức thanh toán</span></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box_payment_left process_payment fl" id="account_info">
        <div class="box_payment_ct">
            <div class="tt_payment_step">
                Cách thức thanh toán</div>
            <!--Tab Method Payment-->
            <script>//<![CDATA[
                $(window).load(function () {
                    $(document).ready(function () {
                        $(".tabs-menu a").click(function (event) {
                            event.preventDefault();
                            $(this).parent().addClass("current");
                            $(this).parent().siblings().removeClass("current");
                            var tab = $(this).attr("href");
                            $(".tab-content").not(tab).css("display", "none");
                            $(tab).fadeIn();
                        });
                    });
                    /* <![CDATA[ */
                    (function ($) {
                        $('a[href="#"]').click(function (e) {
                            e.preventDefault();
                        });
                    })(jQuery);
                    /* ]]> */
                });//]]>  

            </script>
            <div id="tabs-container">
                <ul class="tabs-menu tabs_payment fl">
                    <li class="current" style="text-align: left"><a href="#tab-1" title="Thanh toán bằng tiền mặt"
                        style="text-transform: none">Thanh toán bằng tiền mặt</a></li>
                    <li style="text-align: left"><a href="#tab-2" title="Thanh toán bằng chuyển khoản"
                        style="text-transform: none">Thanh toán bằng chuyển khoản</a></li>
                </ul>
                <div class="tab tab_payment_ct fr">
                    <div id="tab-1" class="tab-content" style="padding:10px">
                        <div class="cod_page">
                            <div class="payment_wrap">
                                <asp:Literal ID="Litcast" runat="server"></asp:Literal>
                            </div>
                        </div>
                        <div class="payment_page">
                            <div id="place_order_default">
                                <div class="row">
                                    <asp:LinkButton ID="LbPayment" runat="server" class="btn_web btn_account" OnClick="LbPayment_Click1">Tiếp tục »</asp:LinkButton>
                                </div>
                                <div class="row">
                                    <div class="cod_inform">
                                        Bạn sẽ được thông báo về tình trạng đơn hàng qua email và tin nhắn.
                                    </div>
                                </div>
                            </div>
                            <div class="newsletter">
                                <div class="row">
                                    * Tôi đã đọc và đồng ý với các <a href="/dieu-khoan-dieu-kien-mua-ban.html" target="_blank">điều khoản
                                        & điều kiện mua bán của Esell.vn</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-content" style="padding:10px">
                        <!--Method Payment 2-->
                        <div class="payment_wrap">
                            <asp:Literal ID="Litbanking" runat="server"></asp:Literal>
                        </div>
                        <div class="row">
                            <asp:LinkButton ID="LbPayment2" runat="server" class="btn_web btn_account" OnClick="LbPayment2_Click">Tiếp tục »</asp:LinkButton>
                        </div>
                        <!--end Method Payment 2-->
                    </div>
                </div>
            </div>
            <!--End Tab Method Payment-->
        </div>
    </div>
</asp:Content>
