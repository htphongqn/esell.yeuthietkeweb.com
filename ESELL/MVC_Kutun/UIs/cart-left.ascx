<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="cart-left.ascx.cs" Inherits="MVC_Kutun.UIs.cart_left" %>
<div class="box giohang_baner">
    <div class="box_Tab font1">
        Giỏ hàng</div>
    <div class="box_ct">
        <table>
            <tr>
                <td>
                    Giỏ hàng :
                </td>
                <td>
                    <asp:Label ID="Lbquancart" runat="server" Text=""></asp:Label> mặt hàng
                </td>
            </tr>
            <tr>
                <td>
                    Tổng :
                </td>
                <td>
                    <asp:Label ID="Lbmoney" runat="server" Text=""></asp:Label>
                    VND
                </td>
            </tr>
        </table>
        <img class="fr" src="../vi-vn/images/icon_cart.png" id="div_img" runat="server"/>
        <a href="/gio-hang.html" class="view_detail">Xem chi tiết</a>
    </div>
</div>
<!--End box-->
