<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Order-payment.aspx.cs" Inherits="MVC_Kutun.vi_vn.Order_payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main" class="cf">
        <div class="path">
            <a href="/">Trang chủ</a> » Quản lý tài khoản</div>
        <!--Sidebar-->
        <div class="sidebar_user fl" id="sidebar">
            <div class="most-viewed col_user">
                <div class="tab_user">
                    Tài khoản của bạn</div>
                <ul class="list_field">
                    <li><a href="/quan-ly-tai-khoan.html">Quản lý tài khoản</a></li>
                    <li><a href="/thong-tin-ca-nhan.html">Thông tin cá nhân</a></li>
                    <li><a href="/dia-chi-giao-hang.html">Địa chỉ giao hàng</a></li>
                    <li class="active"><a href="/lich-su-mua-hang.html">Đơn hàng của tôi</a></li>
                    <li><a href="/doi-mat-khau.html">Đổi mật khẩu</a></li>
                </ul>
            </div>
        </div>
        <!--end Sidebar-->
        <!--Main Content-->
        <div id="main_content" class="fr">
            <div class="inner_user_info">
                <asp:PlaceHolder ID="Plorder" runat="server"></asp:PlaceHolder>
            </div>
        </div>
        <!--end Main Content-->
    </div>
</asp:Content>
