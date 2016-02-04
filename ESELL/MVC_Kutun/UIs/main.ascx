<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="main.ascx.cs" Inherits="MVC_Kutun.UIs.main" %>
<%@ Register Src="proHighlights.ascx" TagName="proHighlights" TagPrefix="uc1" %>

<div id="main" class="cf">
 <div class="box row_home">
  <uc1:proHighlights ID="proHighlights1" runat="server" />
 </div>
 <!--end Popular Products-->
 <asp:Repeater ID="Rpcateindex" runat="server">
  <ItemTemplate> 
   <!--Category Home-->
   <div class="box box_cate_home <%#setCountcate() %>">
    <div class="box_Tab_cate_home"> <a class="main_cate" title="<%#Eval("cat_name")%>" href="<%#GetLinkCat(Eval("cat_url"),Eval("cat_seo_url"))%>">
     <h2>
      <div class="icon_cate"> <i> <img src="<%#getImagecat(Eval("CAT_ID"),Eval("CAT_IMAGE1")) %>"  alt="<%#Eval("cat_name")%>" /></i></div>
      <%#Eval("cat_name")%></h2>
     </a>
     <ul class="link_tab_cate">
      <asp:Repeater ID="Repeater1" runat="server" DataSource='<%#Load_caterank2(Eval("CAT_ID"),50) %>'>
       <ItemTemplate>
        <li><a href="<%#GetLinkCat(Eval("cat_url"),Eval("cat_seo_url"))%>" title="<%#Eval("cat_name")%>"> <%#Eval("cat_name")%></a></li>
       </ItemTemplate>
      </asp:Repeater>
      <a href="<%#GetLinkCat(Eval("cat_url"),Eval("cat_seo_url"))%>" title="<%#Eval("cat_name")%>" class="view_all_P"> <i>Xem tất cả</i></a>
     </ul>
      </div>
    <!--Left Category Home-->
    <div class="left_cate_home fl">
     <div class="left_cate_inner">
      <div class="tt_brand cf hidden"> Thương hiệu</div>
      <ul class="logo_brands">
       <asp:Repeater ID="Rpadsleft" runat="server" DataSource='<%#Load_ads_cate(Eval("CAT_ID"),4) %>'>
        <ItemTemplate>
         <li> <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("AD_ITEM_DESC"))%></li>
        </ItemTemplate>
       </asp:Repeater>
      </ul>
     </div>
    </div>
    <!--end Left Category Home--> 
    <!--Right Cate Home-->
    <div class="ajaxprocate pro-cate-index"> 
     <!--Row Products 1-->
     <div class="col-left-cate">
      <div class="inner">
       <div class="img-ads-cate">
        <asp:Repeater ID="Repeater2" runat="server" DataSource='<%#Load_ads_cate(Eval("CAT_ID"),5) %>'>
         <ItemTemplate> <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("AD_ITEM_DESC"))%> </ItemTemplate>
        </asp:Repeater>
       </div>
       <div class="list-pro-ver">
         
        <asp:Repeater ID="Repeater5" runat="server" DataSource='<%#Load_proindex2(Eval("CAT_ID"),0,3, 1) %>'>
         <ItemTemplate>
          <!--Start Product-->
        <div class="product">
         <div class="inner-pro">
          <figure class="img-pro"><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE") %>"> <img alt="<%#Eval("NEWS_TITLE") %>" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"></a> </figure>
          <div class="des-pro">
           <h2 class="name-pro"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE") %>"><%#Eval("NEWS_TITLE") %></a></h2>
           <div class="price-pro">
            <p class="main_price"> <%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></p>
            <p class="f_price"><del> <%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del></p>
           </div>
           <%#Getgiam(Eval("News_Price1"), Eval("News_Price2"))%>
            <%#getBuy(Eval("NEWS_ID"), Eval("NEWS_FIELD3"))%>
          </div>
         </div>
        </div>
        <!--End Product--> 
         </ItemTemplate>
        </asp:Repeater>
       </div>
      </div>
     </div>
     <div class="col-right-cate">
      <div class="tt-cate">Sản phẩm bán chạy</div>
      <div class="list-pro-hoz  <%#setClass() %> ">
       <asp:Repeater ID="Repeater3" runat="server" DataSource='<%#Load_proindex2(Eval("CAT_ID"),0,4, 2) %>'>
        <ItemTemplate> 
         
         <!--Start Product-->
         <div class="product">
          <figure class="img-pro"><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE")%>"> <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%#Eval("NEWS_TITLE")%>"></a> </figure>
          <div class="des-pro">
           <h2 class="name-pro <%#setFirstClass() %>"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE")%>"> <%#Eval("NEWS_TITLE") %></a></h2>
           <div class="price-pro <%#setFirstClass() %>">
            <p class="main_price"> <%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></p>
            <p class="f_price"><del> <%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del></p>
           </div>
           <%#Getgiam(Eval("News_Price1"), Eval("News_Price2"))%> <%#getBuy(Eval("NEWS_ID"), Eval("NEWS_FIELD3"))%> </div>
         </div>
         <!--End Product--> 
         
        </ItemTemplate>
       </asp:Repeater>
      </div>
     </div>
     
     <!--end Row Products 1--> 
     <!--Row Products 2-->
     <div class="row_products row_P2 hidden"> 
      <!--5 Products-->
      <ul>
       <asp:Repeater ID="Repeater4" runat="server" DataSource='<%#Load_proindex(Eval("CAT_ID"),4,5) %>'>
        <ItemTemplate>
         <li class="item_col_product fl">
          <div class="item_col_product_in"> 
           <!--Start Product-->
           <div class="product">
            <h3 class="product_name"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE")%>"> <%#Eval("NEWS_TITLE") %></a></h3>
            <a class="img_product" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE")%>"> <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%#Eval("NEWS_TITLE") %>"></a>
            <div class="info_price fr"> <span class="f_price"><del> <%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del></span> <span class="main_price"> <%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></span> </div>
            <%#Getgiam(Eval("News_Price1"), Eval("News_Price2"))%> <%#getBuy(Eval("NEWS_ID"), Eval("NEWS_FIELD3"))%> </div>
           <!--End Product--> 
          </div>
         </li>
        </ItemTemplate>
       </asp:Repeater>
      </ul>
     </div>
     <!--end Row Products 2--> 
    </div>
   </div>
   <!--End Category Home--> 
  </ItemTemplate>
 </asp:Repeater>
 <!--Best Selling Products-->
 <div class="box hidden">
  <div class="tt_popP"> <span>Sản phẩm được mua nhiều</span> </div>
  <div id="bestselling_products" class="sl_products">
   <ul>
    <asp:Repeater ID="Rpprobuy" runat="server">
     <ItemTemplate>
      <li> 
       <!--Start Product-->
       <div class="product"> <a class="img_product" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE")%>"> <img width="150" height="150" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"
                                        alt=" <%#Eval("NEWS_TITLE") %>"> </a>&nbsp;
        <h3 class="product_name"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE")%>"> <%#Eval("NEWS_TITLE") %></a></h3>
        <div class="info_price"> <span class="f_price"><del> <%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del></span> <span class="main_price"> <%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></span> </div>
        <%#Getgiam(Eval("News_Price1"), Eval("News_Price2"))%> <%#getBuy(Eval("NEWS_ID"), Eval("NEWS_FIELD3"))%> </div>
       <!--End Product--> 
      </li>
     </ItemTemplate>
    </asp:Repeater>
   </ul>
   <div class="cf"> </div>
   <a id="prev_bestsellP" class="prev" href="#">&lt;</a> <a id="next_bestsellP" class="next"
                href="#">&gt;</a> </div>
 </div>
 <!--end Slide Best Selling Products--> 
</div>
<style>
</style>
