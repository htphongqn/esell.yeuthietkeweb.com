<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucAddressPayment.ascx.cs"
    Inherits="MVC_Kutun.UIs.ucAddressPayment" %>
<!--Dia chi giao hang-->
<div id="info_address" class="fr">
    <div class="box_payment_ct">
        <div class="tt_payment_step">
            Giao hàng đến <a href="/thanh-toan-buoc-2.html" class="change_info">thay đổi</a>
        </div>
        <div class="address">
            <asp:Literal ID="Litadd" runat="server"></asp:Literal>
        </div>
    </div>
</div>
<!--end Dia chi giao hang-->
