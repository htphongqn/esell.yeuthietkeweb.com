<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer.ascx.cs" Inherits="MVC_Kutun.MOBILE.UIs.footer" %>
<div class="info_header">
    <div class="info_item">
        <span class="info_ico genuine_icon"></span>Hàng chính hãng</div>
    <div class="info_item">
        <span class="info_ico return_icon"></span>Đổi trả dễ dàng</div>
    <div class="info_item">
        <span class="info_ico delivery_icon"></span>Giao hàng tận nơi</div>
    <div class="info_item">
        <span class="info_ico payment_icon"></span>Thanh toán khi nhận hàng</div>
</div>
<div id="footer_menu">
    <a href="/chinh-sach-bao-mat.html">Chính sách bảo mật</a> | <a href="/dieu-khoan-dieu-kien-mua-ban.html">
        Điều khoản</a> | <a href="/m-lien-he.html">Liên hệ</a>
</div>
<!--Social Network-->
<div id="social_network" style="display: none">
    <asp:Repeater ID="Rpfacebook" runat="server">
        <ItemTemplate>
            <%# LoadOnline(Eval("ONLINE_TYPE"), Eval("ONLINE_DESC"), Eval("ONLINE_NICKNAME"))%>
        </ItemTemplate>
    </asp:Repeater>
</div>
<!--end Social Network-->
<!--Info Footer-->
<div id="info_footer" class="cf">
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
</div>
<div class="boxGetEmail" style="display: none">
    <p>
        <strong>Đăng kí nhận bản tin</strong></p>
    <div class="getEmail fr">
        <input type="text" class="inputSearch" id="Txtemail" onblur="SearchOnBlur(this)"
            onkeyup="initTyper(this)" onkeydown="" onfocus="SearchOnFocus(this)" placeholder="Nhập email..">
        <button name="" class="submitSearch" type="button" value="Đăng kí" onclick="regis_mail()">
            Đăng kí</button>
    </div>
</div>
<!--end boxGetEmail-->
<script  src="../../vi-vn/Ajax/Email.js" type="text/javascript"></script>
