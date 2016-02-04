<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master-payment.Master" AutoEventWireup="true"
    CodeBehind="Payment-step2.aspx.cs" Inherits="MVC_Kutun.vi_vn.Payment_step2" %>

<%@ Register Src="../UIs/Payment-giaohangtannoi.ascx" TagName="Payment" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Ctimg" runat="server">
    <ul>
        <li id="step1"><span class="number icon_step1 icon_passed">1</span><span class="title_step">Đăng
            nhập</span></li>
        <li class="current" id="step2"><span class="number icon_step2">2</span><span class="title_step">Thông
            tin giao hàng</span></li>
        <li id="step3"><span class="number icon_step3">3</span><span class="title_step">Cách
            thức thanh toán</span></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box_payment_left process_payment fl" id="account_info">
        <div class="box_payment_ct">
            <div class="tt_payment_step">
                Thông tin giao hàng</div>
            <!--Tab Transport-->
            <div class="info_transport form_web pay-form">
                <uc2:Payment ID="Payment1" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
