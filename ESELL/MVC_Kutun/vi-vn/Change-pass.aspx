<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Change-pass.aspx.cs" Inherits="MVC_Kutun.vi_vn.Change_pass" %>

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
                    <li><a href="/lich-su-mua-hang.html">Đơn hàng của tôi</a></li>
                    <li class="active"><a href="/doi-mat-khau.html">Đổi mật khẩu</a></li>
                </ul>
            </div>
        </div>
        <!--end Sidebar-->
        <!--Main Content-->
        <div id="main_content" class="fr">
            <div class="box">
                <div class="inner_user_info">
                    <div class="box_Tab_main">
                        <h1 class="title_page">
                            Đổi mật khẩu</h1>
                    </div>
                    <div class="inner_2col">
                        <h2>
                            <span>Thông tin thay đổi</span></h2>
                        <div class="profile-row">
                            <span class="left">Mật khẩu cũ: <span class="required">*
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập mật khẩu cũ"
                                    ControlToValidate="txtpassOld" Display="Dynamic" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator></span></span>
                            <div class="text">
                                <asp:TextBox ID="txtpassOld" runat="server" CssClass="input-txt" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="profile-row">
                            <span class="left">Mật khẩu mới: <span class="required">*
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập mật khẩu mới"
                                    ControlToValidate="txtpassNew" Display="Dynamic" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator></span></span>
                            <div class="text">
                                <asp:TextBox ID="txtpassNew" runat="server" CssClass="input-txt" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="profile-row">
                            <span class="left">Nhập lại mật khẩu: <span class="required">*
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng nhập lại mật khẩu "
                                    ControlToValidate="txtrepass" Display="Dynamic" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator></span></span>
                            <div class="text">
                                <asp:TextBox ID="txtrepass" runat="server" CssClass="input-txt" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="profile-row">
                            <span class="left"><span class="required">* Thông tin bắt buộc</span></span></div>
                        <div class="profile-row button_change">
                            <div class="input">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                                    ShowSummary="False" ValidationGroup="G5" />
                                <a href="/quan-ly-tai-khoan.html" class="btn_web">&lt;&lt; Trở lại</a><a> </a>
                                <asp:LinkButton ID="Lblogins" runat="server" ValidationGroup="G5" CssClass="btn_web"
                                    OnClick="Lblogins_Click">Lưu</asp:LinkButton>
                                <asp:CompareValidator ID="comparePasswords" runat="server" ControlToCompare="txtpassNew"
                                    ControlToValidate="txtrepass" ErrorMessage="2 mật khẩu không giống nhau!" Display="Dynamic"
                                    ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                    <!--bleft end-->
                    <div class="clearfix">
                    </div>
                    <!--b right end-->
                </div>
            </div>
        </div>
        <!--end Main Content-->
    </div>
</asp:Content>
