<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="userinfo.aspx.cs" Inherits="MVC_Kutun.vi_vn.userinfo" %>

<%@ Register Src="../Calendar/pickerAndCalendar.ascx" TagName="pickerAndCalendar"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Calendar/calendarStyle.css" rel="stylesheet" type="text/css" />
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
                    <li class="active"><a href="/thong-tin-ca-nhan.html">Thông tin cá nhân</a></li>
                    <li><a href="/dia-chi-giao-hang.html">Địa chỉ giao hàng</a></li>
                    <li><a href="/lich-su-mua-hang.html">Đơn hàng của tôi</a></li>
                    <li><a href="/doi-mat-khau.html">Đổi mật khẩu</a></li>
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
                            Thông tin cá nhân</h1>
                    </div>
                    <div class="inner_2col">
                        <div class="profile-row">
                            <span class="left">Địa chỉ email:</span>
                            <div class="text">
                                <asp:Label ID="Lbemail" runat="server" Text="" ForeColor="Blue"></asp:Label></p>
                            </div>
                        </div>
                         <div class="profile-row" id="div_code" runat="server">
                            <span class="left">Mã đại lý:</span>
                            <div class="text">
                                <asp:Label ID="lbcodePartner" runat="server" Text="" ForeColor="Blue"></asp:Label></p>
                            </div>
                        </div>
                        <div class="profile-row">
                            <span class="left">Họ và tên: <span class="required">*<asp:RequiredFieldValidator
                                ID="rfvHoVaTen" runat="server" ErrorMessage="Vui lòng nhập họ và tên" ControlToValidate="Txtname"
                                Display="Dynamic" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator></span></span>
                            <div class="text">
                                <asp:TextBox ID="Txtname" runat="server" CssClass="input-txt"></asp:TextBox>
                            </div>
                        </div>
                        <div class="profile-row">
                            <span class="left">Số điện thoại: <span class="required">*<asp:RequiredFieldValidator
                                ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng nhập số điện thoại"
                                ControlToValidate="Txtphone" Display="Dynamic" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator></span></span>
                            <div class="text">
                                <asp:TextBox ID="Txtphone" runat="server" CssClass="input-txt"></asp:TextBox>
                            </div>
                        </div>
                        <div class="profile-row" id="div_codebank" runat="server">
                            <span class="left">Tài khoản ngân hàng:</span>
                            <div class="text">
                                <asp:TextBox ID="txtCodebank" runat="server" CssClass="input-txt"></asp:TextBox>
                            </div>
                        </div>
                        <div class="profile-row">
                            <span class="left">Ngày sinh: <span class="required">*</span></span>
                            <!--DatePicker Plugin-->
                            <div class="text">
                                <input type="text" data-beatpicker="true" data-beatpicker-position="['right','*']"
                                    data-beatpicker-module="clear" data-beatpicker-format="['DD','MM','YYYY'],separator:'/'"
                                    class="date depDate hasDatepicker input-txt" id="txtdate" name="flights-checkin"
                                    runat="server" />
                            </div>
                        </div>
                        <div class="profile-row">
                            <span class="left">Giới tính: <span class="required">*</span></span>
                            <asp:RadioButtonList ID="Rdsex" runat="server" CssClass="input-txt" RepeatColumns="3">
                                <asp:ListItem Value="0" Text="Nam" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Nữ"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Khác"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <div class="profile-row">
                            <span class="left"><span class="required">* Thông tin bắt buộc</span></span></div>
                        <div class="profile-row button_change">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                                ShowSummary="False" ValidationGroup="G5" />
                            <div class="input">
                                <a href="/quan-ly-tai-khoan.html" class="btn_web">&lt;&lt; Trở lại</a><a> </a>
                                <asp:LinkButton ID="Lblogins" runat="server" ValidationGroup="G5" CssClass="btn_web"
                                    OnClick="Lblogins_Click">Lưu</asp:LinkButton>
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
    <link rel="stylesheet" href="../vi-vn/Styles/BeatPicker.min.css" />
    <script src="../vi-vn/Scripts/BeatPicker.min.js" type="text/javascript"></script>
</asp:Content>
