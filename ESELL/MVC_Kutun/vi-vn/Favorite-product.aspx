<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Favorite-product.aspx.cs" Inherits="MVC_Kutun.vi_vn.Favorite_product" %>

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
                    <li><a href="/doi-mat-khau.html">Đổi mật khẩu</a></li>
                    <li><a href="/thong-tin-ca-nhan.html">Thông tin cá nhân</a></li>
                    <li><a href="/dia-chi-giao-hang.html">Địa chỉ giao hàng</a></li>
                    <li><a href="/lich-su-mua-hang.html">Đơn hàng của tôi</a></li>
                    <li class="active"><a href="/san-pham-yeu-thich.html">Sản phẩm yêu thích</a></li>
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
                            Danh sách sản phẩm yêu thích</h1>
                    </div>
                    <link type="text/css" rel="stylesheet" href="../vi-vn/Styles/process_payment.css">
                    <div id="cart_page_user">
                        <div class="row_th_cart">
                            <h3 style="width: 15%" class="th_table_cart fl">
                                Hình Ảnh
                            </h3>
                            <h3 style="width: 48%" class="th_table_cart fl">
                                Tên Sản Phẩm
                            </h3>
                            <h3 style="width: 15%" class="th_table_cart fl">
                                Giá Sản Phẩm
                            </h3>
                        </div>
                        <asp:Repeater ID="Rppro_like" runat="server">
                            <ItemTemplate>
                                <!--Item Cart-->
                                <div class="item_cart fl">
                                    <a class="img_cart fl" target="_parent" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>">
                                        <img width="100" height="100" alt="" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>">
                                    </a>
                                    <div class="cell name">
                                        <div>
                                            <span><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>">
                                                <%#Eval("NEWS_TITLE") %></a></span></div>
                                    </div>
                                    <div class="cell unit">
                                        <b style="color: #FF0000">
                                            <%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></b></div>
                                    <div class="cell unit">
                                        <a  class="btn_web" href="../vi-vn/Addtocart.aspx?id=<%#Eval("NEWS_ID") %>">Mua ngay</a>
                                    </div>
                                </div>
                                <!--end Item Cart-->
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <!--b right end-->
                </div>
            </div>
        </div>
        <!--end Main Content-->
    </div>
    <!--End Main Wrap-->
</asp:Content>
