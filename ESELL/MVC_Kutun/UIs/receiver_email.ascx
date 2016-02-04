<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="receiver_email.ascx.cs"
    Inherits="MVC_Kutun.UIs.receiver_email" %>
<%@ Register Src="../UIs/Register-email.ascx" TagName="Register" TagPrefix="uc12" %>
<div class="box voucher">
    <h3 class="voucher_text">
        TẶNG NGAY <b>100,000đ</b></h3>
    <div class="voucher_ct">
        <b>Khi đăng ký nhận bản tin</b>
        <asp:Button ID="btnregisemail" runat="server" Text="Đăng ký ngay" class="btn_submit fr" />
        <div class="choose_type fr">
            <input type="hidden" name="YII_CSRF_TOKEN" value="c826b8411903b7844538ac5307c56f40871ee72d">
            <input type="radio" checked="checked" value="female" id="nb-women" name="newsletter[gender]">
            <label for="nb-women" class="nl_header">
                Cao Cấp</label>
            <input type="radio" value="male" id="nb-men" name="newsletter[gender]">
            <label for="nb-men" class="nl_header">
                Trung cấp</label>
            <input type="radio" value="male" id="nb-men" name="newsletter[gender]">
            <label for="nb-men" class="nl_header">
                Thông dụng</label>
        </div>
    </div>
</div>
<uc12:Register ID="Register1" runat="server" />
