<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="User-manager.aspx.cs" Inherits="MVC_Kutun.vi_vn.User_manager" %>

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
                    <li class="active"><a href="/quan-ly-tai-khoan.html">Quản lý tài khoản</a></li>
                    <li><a href="/thong-tin-ca-nhan.html">Thông tin cá nhân</a></li>
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
                            Quản lý tài khoản</h1>
                    </div>
                    <p class="p">
                        <b>
                            <asp:Label ID="Lbgetting" runat="server" Text="" ForeColor="Blue"></asp:Label>
                        </b>
                        <br>
                        Chọn một link bên dưới để xem hay chỉnh sửa thông tin.
                    </p>
                    <div class="user_2col">
                        <div class="b_left inner_2col cf" style="height:90px">
                            <asp:Label ID="Lbname" runat="server" Text=""></asp:Label>
                            <br />
                            <asp:Label ID="Lbemail" runat="server" Text=""></asp:Label>
                            <br />
                            <a class="link_user" href="/doi-mat-khau.html">Thay đổi mật khẩu</a><br />
                            <a class="link_user fr" href="/thong-tin-ca-nhan.html">Chỉnh sửa</a>
                        </div>
                        <!--bleft end-->
                    </div>
                    <div class="user_2col">
                        <div class="b_right inner_2col cf" style="height:90px">
                            <div class="change-pass ">
                                <h2>
                                    <span>Địa chỉ giao hàng</span></h2>
                                <div>
                                    <asp:Label ID="Lbadd" runat="server" Text=""></asp:Label>
                                    <br />
                                    <a class="link_user fr" href="/dia-chi-giao-hang.html">Chỉnh sửa</a>
                                </div>
                            </div>
                            <div class="cf">
                            </div>
                        </div>
                        <div class="cf">
                        </div>
                        <!--b right end-->
                    </div>
                </div>
            </div>
        </div>
        <!--end Main Content-->
    </div>
</asp:Content>
