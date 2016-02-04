<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="leftmenu-userinfo.ascx.cs"
    Inherits="MVC_Kutun.UIs.leftmenu_userinfo" %>
<div class="most-viewed" id="origin">
    <ul class="list_field">
        <li><a target="_parent" href="/quan-ly-tai-khoan.aspx">Quản lý tài khoản</a> </li>
        <li><a target="_parent" href="/thong-tin-ca-nhan.aspx">Thông tin cá nhân</a> </li>
        <li><a target="_parent" href="/dia-chi-giao-hang.aspx">Địa chỉ giao hàng</a> </li>
        <li><a target="_parent" href="/lich-su-mua-hang.aspx">Đơn hàng của tôi</a> </li>
        <li><a target="_parent" href="/doi-mat-khau.aspx">Đổi mật khẩu</a> </li>
    </ul>
</div>
<!--Stick Menu-->
<script  src="../vi-vn/Scripts/jquery.sticky.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".sticky").sticky({ topSpacing: 40 });
    });
</script>
