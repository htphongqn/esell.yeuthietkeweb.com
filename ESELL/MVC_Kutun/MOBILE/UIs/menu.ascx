<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="menu.ascx.cs" Inherits="MVC_Kutun.MOBILE.UIs.menu" %>

<ul>
  <li class="cat-header"><a href="/"> <img src="/MOBILE/vi-vn/Images/home_icon.png" alt="" />Trang chủ</a> </li>
  <li class="cat-header" id="div_login" runat="server"><a href="/m-dang-nhap.html"> <img src="/MOBILE/vi-vn/Images/login_icon.png" alt="" />Đăng nhập</a></li>
  <li class="cat-header" id="div_regis" runat="server"><a href="/m-dang-ky.html"> <img src="/MOBILE/vi-vn/Images/key_icon.png" alt="" />Đăng ký</a></li>
  <li class="cat-header" id="div_logout" runat="server"><a href="/m-quan-ly-tai-khoan.html"><img src="/MOBILE/vi-vn/Images/account_icon.png" alt="" /> Tài khoản của tôi </a></li>
  <li class="cat-header" id="div_logout2" runat="server">
    <asp:LinkButton ID="Lblogout" runat="server" OnClick="Lblogout_Click"><img src="/MOBILE/vi-vn/Images/logout_icon.png" alt="" />Đăng xuất</asp:LinkButton>
  </li>
  <li class="cat-header"><a href="/m-kiem-tra-don-hang.html"> <img src="/MOBILE/vi-vn/Images/checkcargo_icon.png" alt="" />Kiểm tra đơn hàng</a></li>
  <li class="cat-header"><a href="/m-san-pham-yeu-thich.html"> <img src="/MOBILE/vi-vn/Images/heart_icon.png" alt="" />Sản phẩm yêu thích</a></li>
  <li class="cat-header"><a href="/m-san-pham-da-xem.html"> <img src="/MOBILE/vi-vn/Images/eye_icon.png" alt="" />Sản phẩm đã xem</a></li>
  <li class="cat-header"><a href="/m-ho-tro.html"> <img src="/MOBILE/vi-vn/Images/question_icon.png" alt="" />Hỗ trợ khách hàng</a> </li>
</ul>
<div class="close_menu"> Đóng lại</div>
