<%@ Page Title="" Language="C#" MasterPageFile="~/MOBILE/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Payment-step3.aspx.cs" Inherits="MVC_Kutun.MOBILE.vi_vn.Payment_step3" %>

<%@ Register Src="../UIs/cart.ascx" TagName="cart" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Method Payment-->
    <div class="progress-bar current-step-1">
        <ul>
            <li>1</li>
            <li>2</li>
            <li class="current">3</li>
            <li>4</li>
        </ul>
    </div>
    <div class="box">
        <div class="box_Tab">
            Hình thức thanh toán</div>
        <div class="box_ct payment_info">
            <script>//<![CDATA[
                $(function () {
                    //  Accordion Panels    
                    $(".payment_info h4:first").addClass('current');
                    $(".payment_info .pane:first").show();
                    $(".payment_info h4").click(function () {
                        $(this).addClass('current').siblings().removeClass('current');
                        $(this).next(".pane").slideDown(300).siblings(".pane:visible").slideUp(300);
                    });
                });
            </script>
            <h4>
                <i></i><b>Thanh toán bằng tiền mặt</b></h4>
            <div class="pane">
                <!--Content-->
                <div class="payment_wrap">
                    <asp:Literal ID="Litcast" runat="server"></asp:Literal>
                </div>
                <!--end Content-->
            </div>
            <h4>
                <i></i><b>Thanh toán bằng chuyển khoản</b></h4>
            <div class="pane">
                <!--Content-->
                <div class="payment_wrap">
                   <asp:Literal ID="Litbanking" runat="server"></asp:Literal>
                </div>
                <!--end Content-->
            </div>
            <asp:LinkButton ID="Lbpayment" runat="server" class="btn_web btn_payment" OnClick="Lbpayment_Click">Thanh toán</asp:LinkButton>
        </div>
    </div>
    <!--End Method Payment-->
    <!--Thong tin don hang-->
    <div class="box">
        <uc1:cart ID="cart1" runat="server" />
    </div>
    <!--end Thong tin don hang-->
</asp:Content>
