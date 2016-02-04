<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="MVC_Kutun.UIs.header" %>
<%@ Register Src="header-search.ascx" TagName="header" TagPrefix="uc1" %>
<%@ Register Src="forgetpass.ascx" TagName="forgetpass" TagPrefix="uc2" %>

<div class="wrap">
 <asp:Repeater ID="Rplogo" runat="server">
  <ItemTemplate> <%# Getbanner(Eval("BANNER_TYPE"),Eval("BANNER_FIELD1"), Eval("BANNER_ID"), Eval("BANNER_FILE"))%> </ItemTemplate>
 </asp:Repeater>
 <div id="header_r" class="fr">
  <div class="search_form fl">
   <uc1:header ID="header1" runat="server" />
  </div>
  <div class="order-tracking-shortcut">
  <a title="Kiểm tra trạng thái Đơn hàng của bạn" onclick="ktdh()" class="link_ktradh">Kiểm tra Đơn hàng</a>
  <div class="contentEGP dropdown orderTracking hidden" id="drop_ktradh">
  <div class="closebtn">x</div>
    <div class="dropdown_title"> Kiểm tra đơn hàng</div>
    <div class="input_form">
     <label for="order_number"> Vui lòng nhập mã đơn hàng:</label>
     <input type="text" id="orderCode" value="" name="orderNr" class="form__input__text" runat="server">
    </div>
    <div class="input_form">
     <label for="order_number"> Vui lòng nhập địa chỉ email:</label>
     <input type="text" id="email" value="" name="email" class="form__input__text" runat="server">
    </div>
    <p class="form_text"> Nếu bạn có mắc thắc nào khác, <a class="link_acount" target="_blank" href="/lien-he.html"> Nhấn vào đây</a> </p>
    <div class="input_form">
     <asp:LinkButton ID="LbcheckOrder" runat="server" class="button" OnClick="LbcheckOrder_Click">Kiểm tra</asp:LinkButton>
    </div>
   </div>
   </div>
  <div class="header-user">
   <div class="user-name js-header-user-name">
    <div class="user-name-link user-ajax-link">
     <ul class="txtuser">
      <li id="div_login" runat="server" class="user-name-short">   
          <span class="tt_linktop link_login"><a onclick="login()">Đăng nhập</a></span>  /<a href="/dang-ky.html"> Đăng ký</a>
      <div class="contentEGP popup_login" id="dpop">
      <div class="closebtn">x</div>
    <div class="input_form">
     <label for="LoginForm_email"> Địa chỉ email <span class="required">*</span></label>
     <input type="text" id="txtemail" maxlength="50" class="input identity">
    </div>
    <div class="input_form">
     <label for="LoginForm_password"> Mật khẩu <span class="required">*</span></label>
     <input type="password" id="txtpass" class="input password">
    </div>
    <div class="errors" style="color: Red"> </div>
    <div id="loading-errors"> </div>
    <div class="note_wrapper clearfix">
     <div class="lost_password"> <a class="link_acount" onclick="showquyenmk();" href="javascript:void(0)">Quên mật khẩu?</a> </div>
    </div>
    <div class="input_form"> <a href="javascript:void(0)" onclick="ajaxlogin();" class="button">Đăng nhập</a> </div>
    <div class="note_wrapper"> Bạn chưa là thành viên? <a rel="nofollow" href="/dang-ky.html" class="link_acount">Đăng
     ký ngay</a></div>
   </div>
      </li>
         <li><span id="div_logout" runat="server">
          <div class="filter_name"> <span class="tt_linktop"><b style="color: #fcd207">Chào,
           <asp:Label ID="lbthanhvien" runat="server" Text=""></asp:Label>
           </b><img src="../vi-vn/Images/white_arr_down.png" alt="" /></span>
           <div class="contentEGP popup_login" id="Div1"> <a class="dropdown_item" target="_parent" href="/quan-ly-tai-khoan.html">Quản lý tài
            khoản</a> <a class="dropdown_item" target="_parent" href="/lich-su-mua-hang.html">Đơn
            hàng của tôi</a> <a class="dropdown_item" target="_parent" href="/doi-mat-khau.html"> Đổi mật khẩu</a>
            <asp:LinkButton ID="lbtnDangXuat" runat="server" CausesValidation="False" OnClick="lbtnDangXuat_Click"
                                CssClass="dropdown_item">Đăng xuất</asp:LinkButton>
           </div>
          </div>
          </span></li>
      <li class="user-name-account"> Tài khoản &amp; Đơn hàng </li>
      
     </ul>
     <span class="caret"></span> </div>
   </div>
   <div class="cart_head  user-cart" data-container="body" data-placement="auto bottom"> <a href="/gio-hang.html" class="user-cart-link"> <i class="fa fa-shopping-cart"></i> <span class="user-cart-text">Giỏ hàng</span> <span class="user-cart-quantity hide"><%=totalCart() %></span> </a> </div>
  </div>
  <div class="fr hidden"> <a href="javascript:void(0)" onclick="regisEmail();" title="Đăng ký ngay nhận nhiều ưu đãi"> <span class="register_button"></span> </a> </div>
 </div>
</div>
<script>
 $(".link_login").click(function(){
    $(".popup_login").fadeIn(); 
});

$(".closebtn").click(function(){
    $(".popup_login").fadeOut(); 
});


 $(".link_ktradh").click(function(){
    $("#drop_ktradh").fadeIn(); 
});

$(".closebtn").click(function(){
    $("#drop_ktradh").fadeOut(); 
});
    function regisEmail() {
        $('html, body').animate({ scrollTop: $("#get_email").offset().top }, 1000);
    }
</script>
<ul class="link_right fr hidden">
 <li id="div_register" runat="server"><span class="top_ico account_ico1"></span>
 <a href="/dang-ky.html" class="regis_link ">Đăng ký</a></li>

 <li>
  <div class="filter_name" id="dLikeProduct"> <span class="top_ico liked_ico"></span><span class="tt_linktop">Sản phẩm yêu thích</span>
   <div class="contentEGP dropdown liked_P">
    <div id="likecount"> Có <b style="color: #FF0000"> <%=countprolike()%></b> sản phẩm được yêu thích</div>
    <div class="list_liked_P">
     <ul>
      <asp:Repeater ID="Rppro_like" runat="server">
       <ItemTemplate>
        <li> 
         <!--Start Product-->
         <div class="liked_item_P">
          <div class="img_general"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>"> <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"> </a> </div>
          <div class="r_product_info">
           <h4> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>"> <%#Eval("NEWS_TITLE") %></a></h4>
           <div class="info_price"> <span class="f_price"><del> <%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del></span> <span class="main_price"> <%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></span> </div>
          </div>
         </div>
         <!--End Product--> 
        </li>
       </ItemTemplate>
      </asp:Repeater>
     </ul>
    </div>
   </div>
  </div>
 </li>
 <li> 
  <!--Toggle Click-->
  <div class="filter_name"> <span class="top_ico check_order_ico"></span><span class="tt_linktop">Kiểm tra đơn hàng</span>
   
  </div>
  <!--End Toggle Click--> 
 </li>
 <li>
  <div class="filter_name">
   <asp:Repeater ID="Rpmenutop" runat="server">
    <ItemTemplate> <span class="top_ico support_ico"></span><span class="tt_linktop"> <%#Eval("CAT_NAME") %></span>
     <div class="contentEGP dropdown dropdown_items">
     <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
      <ItemTemplate> <a target="_top" class="dropdown_item" href="http<%#GetLinkCat(Eval("Cat_Url"),Eval("Cat_Seo_Url")) %>"> <%#Eval("CAT_NAME") %></a>
       </div>
      </ItemTemplate>
     </asp:Repeater>
    </ItemTemplate>
   </asp:Repeater>
  </div>
 </li>
</ul>
<uc2:forgetpass ID="forgetpass1" runat="server" />
<script  src="../vi-vn/Ajax/login.js" type="text/javascript"></script> 