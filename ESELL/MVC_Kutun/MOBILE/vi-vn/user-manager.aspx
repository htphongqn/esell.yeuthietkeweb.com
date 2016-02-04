<%@ Page Title="" Language="C#" MasterPageFile="~/MOBILE/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="User-manager.html.cs" Inherits="MVC_Kutun.MOBILE.vi_vn.User_manager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .catList-link
        {
            padding: 14px 10px 14px 40px;
            position: relative;
            display: block;
            border-bottom: 1px solid rgb(183, 183, 183);
            box-sizing: border-box;
            color: rgb(102, 102, 102);
            display: block;
            top: 0px;
            left: 0px;
        }
        .menu-list .faq-icon a:before
        {
            background-image: url(faq_icons.png);
            content: " ";
            display: block;
            width: 17px;
            height: 17px;
            position: absolute;
            background-position: 0 0;
            left: 10px;
            background-color: transparent;
        }
        .menu-list .contact-us-icon a:before
        {
            background-image: url(faq_icons.png);
            content: " ";
            display: block;
            width: 18px;
            height: 17px;
            position: absolute;
            background-position: -17px 3px;
            left: 10px;
            background-color: transparent;
        }
        .menu-list .shipping-return-icon a:before
        {
            background-image: url(faq_icons.png);
            content: " ";
            display: block;
            width: 19px;
            height: 17px;
            position: absolute;
            background-position: -35px 2px;
            left: 11px;
            background-color: transparent;
        }
        .menu-list .tos-icon a:before
        {
            background-image: url(faq_icons.png);
            content: " ";
            display: block;
            width: 12px;
            height: 17px;
            position: absolute;
            background-position: -55px 0;
            left: 12px;
            background-color: transparent;
        }
    </style>
    <div class="path">
        <a href="/">Trang chủ</a> &gt; <a class="aLink1" href="#">Tài
            khoản của tôi</a>
    </div>
    <div class="box" id="account">
        <div class="box_Tab">
            Chào <b style="color: Blue">
                <asp:Literal ID="Lbname" runat="server"></asp:Literal></b>
        </div>
        <div class="box_ct" id="all_categories">
            <ul class="catList menu-list">
                <li class="contact-us-icon"><a class="catList-link" target="_parent" href="/m-thong-tin-ca-nhan.html">
                    Thông tin cá nhân</a> </li>
                <li class="contact-us-icon"><a class="catList-link" target="_parent" href="/m-dia-chi-giao-hang.html">
                    Địa chỉ giao hàng </a></li>
                <li class="contact-us-icon"><a class="catList-link" target="_parent" href="/m-lich-su-mua-hang.html">
                    Đơn hàng của tôi </a></li>
                <li class="contact-us-icon"><a class="catList-link" target="_parent" href="/m-doi-mat-khau.html">
                    Thay đổi mật khẩu</a> </li>
                <li class="contact-us-icon">
                    <asp:CheckBox ID="Checkreceiemail" AutoPostBack="true" OnCheckedChanged="Checkreceiemail_CheckedChanged"
                        runat="server" Text="Đăng ký nhận bản tin" class="catList-link" />
                </li>
            </ul>
        </div>
    </div>
</asp:Content>
