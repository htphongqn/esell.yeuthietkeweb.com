<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Page-so-sanh.aspx.cs" Inherits="MVC_Kutun.vi_vn.Page_so_sanh" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="path">
        <a href="/trang-chu.html">Trang chủ</a> » So sánh sản phẩm</div>
    <!--Compare Products-->
    <link rel="stylesheet" href="../vi-vn/Styles/detail_product.css" type="text/css" />
    <div id="compare-content">
        <div class="headline2 cf">
            <h2>
                So sánh sản phẩm
            </h2>
        </div>
        <div class="compare-content" id="compare-content">
            <table cellspacing="0" cellpadding="0" border="0" width="100%">
                <thead>
                    <tr>
                        <th>
                            &nbsp;
                        </th>
                        <td>
                            <div>
                                <asp:HyperLink ID="Hyname1" runat="server"></asp:HyperLink>
                                <asp:HyperLink ID="Hyperimg1" runat="server"></asp:HyperLink>
                                <span class="btn"></span>
                            </div>
                        </td>
                        <td>
                            <div>
                                <asp:HyperLink ID="Hyname2" runat="server"></asp:HyperLink>
                                <asp:HyperLink ID="Hyperimg2" runat="server"></asp:HyperLink>
                                <span class="btn"></span>
                            </div>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>
                            Giá
                        </th>
                        <td>
                            <strong>
                                <asp:Label ID="Lbprice1" runat="server" Text=""></asp:Label></strong>
                        </td>
                        <td>
                            <strong>
                                <asp:Label ID="Lbprice2" runat="server" Text=""></asp:Label></strong>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Mô tả
                        </th>
                        <td>
                            <asp:Label ID="Lbdesc1" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Lbdesc2" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Bảo hành
                        </th>
                        <td>
                            <asp:Label ID="Lbbaohanh1" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Lbbaohanh2" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Xuất xứ
                        </th>
                        <td>
                            <asp:Label ID="Lbxuatxu1" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Lbxuatxu2" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Thương hiệu
                        </th>
                        <td>
                            <asp:Label ID="lbthuonghieu1" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lbthuonghieu2" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <em>* Bản so sánh này chỉ so sánh giá và mô tả. Muốn xem chi tiết, vui lòng vào trang
                                chi tiết sản phẩm</em>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!--End Compare Products-->
</asp:Content>
