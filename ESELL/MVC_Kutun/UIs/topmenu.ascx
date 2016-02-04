<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="topmenu.ascx.cs" Inherits="MVC_Kutun.UIs.topmenu" %>

<div class="wrap"> 
 <!-- Main Menu-->
 <div id="div_script" runat="server"> 
  <script>//<![CDATA[
            $(function () {
                var sticky_navigation_offset_top = $('.top_main').offset().top;
                var sticky_navigation = function () {
                    var scroll_top = $(window).scrollTop();
                    if (scroll_top > sticky_navigation_offset_top) {
                        $('.top_main').css({ 'position': 'fixed', 'top': 0 });
                        $('.search_form').addClass('search_fixed');
                        $('.cart_head').addClass('cart_fixed');
                        $('#right_top_main').hide();
																								$('.top_main').addClass("top_main_fixed");
                    } else {
                        $('.top_main').css({ 'position': 'relative' });
                        $('.search_form').removeClass('search_fixed');
                        $('.cart_head').removeClass('cart_fixed');
                        $('#right_top_main').show();
																								$('.top_main').removeClass("top_main_fixed");
                    }
                };

                sticky_navigation();

                $(window).scroll(function () {
                    sticky_navigation();
                });
																
            }); // JavaScript Document
        </script> 
 </div>
 <style>
 
 </style>
 <div class="all_categories fl">
  <div class="show_menu">
   <div class="tab_cate"> <span>DANH MỤC SẢN PHẨM<i class="arr_down"></i></span></div>
   <!--Main Menu-->             
   <ul <%=addClass() %>>
    <asp:Repeater ID="Rpmenucate" runat="server">
        <ItemTemplate>
    <li class="m_li"><i class="icon_cate"> <img alt="<%#Eval("cat_name")%>" src="<%#getImagecat(Eval("CAT_ID"),Eval("CAT_IMAGE1")) %>"></i><a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"))%>" title="<%#Eval("cat_name")%>"
                        class="t_menu"><%#Eval("cat_name")%></a>        
     <div class="list_categories">
      <div class="subcatwrapper">
          <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
            <ItemTemplate>
               <div class="pc_menu">
                <p> <a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"))%>" title="<%#Eval("cat_name")%>"><%#Eval("cat_name")%></a> </p>
                <ul>
                    <asp:Repeater ID="Repeater2" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                        <ItemTemplate>
                            <li><a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"))%>" title="<%#Eval("cat_name")%>"><%#Eval("cat_name")%></a> </li>
                    </ItemTemplate>
                 </asp:Repeater>
                </ul>
                <p> </p>
                <div class="cf"> </div>
               </div>
            </ItemTemplate>
        </asp:Repeater>
      </div>
      <div class="ads-menu-top"> <a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"))%>" title="<%#Eval("cat_name")%>"><img alt="<%#Eval("cat_name")%>" src="<%#getImagecat(Eval("CAT_ID"),Eval("CAT_IMAGE2")) %>" /></a> </div>
      <div class="pro-menu-top">
       <div class="list-pro-hoz"> 
        <asp:Repeater ID="Repeater5" runat="server" DataSource='<%#Load_proindex2(Eval("CAT_ID"),0,3) %>'>
         <ItemTemplate>
            <!--Start Product-->
            <div class="product">
             <figure class="img-pro"><a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE") %>"> <img alt="<%#Eval("NEWS_TITLE") %>" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"></a> </figure>
             <div class="des-pro">
              <h2 class="name-pro "> <a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE") %>"> <%#Eval("NEWS_TITLE") %></a></h2>
              <div class="price-pro ">
               <p class="main_price"> <%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></p>
               <p class="f_price"><del><%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%> </del></p>
              </div>
              <%#getBuy(Eval("NEWS_ID"), Eval("NEWS_FIELD3"))%>
             </div>
            </div>
            <!--End Product--> 
         </ItemTemplate>
        </asp:Repeater>    
       </div>
      </div>
     </div>
    </li>
        </ItemTemplate>
    </asp:Repeater>
   </ul>
  </div>
 </div>
 <!--end Main Menu--> 
 <!--Right Top Main-->
 <div id="right_top_main" class="fr"> 
  <!--Function Web-->
  <div class="info_header">
   <div class="info_item"> <span class="info_ico genuine_icon"></span><b>Hàng chính hãng</b> </div>
   <div class="info_item"> <span class="info_ico return_icon"></span><b>Đổi trả dễ dàng</b> </div>
   <div class="info_item"> <span class="info_ico delivery_icon"></span><b>Giao hàng tận nơi</b> </div>
   <div class="info_item"> <span class="info_ico payment_icon"></span><b>Thanh toán khi nhận hàng</b> </div>
  </div>
  <asp:PlaceHolder ID="PlSlider" runat="server"></asp:PlaceHolder>
 </div>
 <!--End Right Top Main--> 
</div>
