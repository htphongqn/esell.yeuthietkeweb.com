<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="User-address.aspx.cs" Inherits="MVC_Kutun.vi_vn.User_address" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <!--Main Content-->
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
                    <li class="active"><a href="/dia-chi-giao-hang.html">Địa chỉ giao hàng</a></li>
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
                            Địa chỉ giao hàng</h1>
                    </div>
                    <div class="inner_2col">
                        <div class="profile-row">
                            <span class="left">Số nhà, tên đường, phường/xã: <span class="required">*<asp:RequiredFieldValidator
                                ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập số nhà, tên đường, phường/xã"
                                ControlToValidate="Txtadd" Display="Dynamic" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator></span></span>
                            <div class="text">
                                <asp:TextBox ID="Txtadd" runat="server" CssClass="input-txt" Width="310px"></asp:TextBox>
                            </div>
                        </div>
                        <div class="profile-row">
                            <span class="left">Khu vực: <span class="required">*<asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                runat="server" ErrorMessage="Vui lòng chọn thành phố" ControlToValidate="Drcity"
                                Display="Dynamic" ForeColor="Red" ValidationGroup="G5" InitialValue="0">*</asp:RequiredFieldValidator><asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng chọn quận huyện"
                                    ControlToValidate="Drdistric" Display="Dynamic" ForeColor="Red" ValidationGroup="G5"
                                    InitialValue="0">*</asp:RequiredFieldValidator></span></span>
                            <div class="text">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="select_wrap">
                                            <asp:DropDownList ID="Drcity" runat="server" CssClass="input-txt" Width="152px" AutoPostBack="True"
                                                OnSelectedIndexChanged="Drcity_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="select_wrap">
                                            <asp:DropDownList ID="Drdistric" runat="server" CssClass="input-txt" Style="width: 152px;
                                                margin-left: 10px;">
                                            </asp:DropDownList>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="profile-row">
                            <span class="left"><span class="required">* Thông tin bắt buộc</span></span></div>
                        <div class="profile-row button_change" style="width:530px">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                                ShowSummary="False" ValidationGroup="G5" />
                            <div class="input">
                                <a href="/quan-ly-tai-khoan.html" class="btn_web">&lt;&lt; Trở lại</a>
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
        <!--End Main Content-->
    </div>
</asp:Content>
