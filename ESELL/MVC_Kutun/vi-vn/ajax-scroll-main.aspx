<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ajax-scroll-main.aspx.cs"
    Inherits="MVC_Kutun.vi_vn.Ajax_scroll_main" %>
<body>
<link rel="stylesheet" href="../vi-vn/Styles/jquery.sliderTabs.min.css">
<script type="text/javascript" src="../vi-vn/Scripts/jquery-1.8.3.min.js"></script>
<script src="../vi-vn/Scripts/jquery.sliderTabs.min.js"></script>
<script type="text/javascript">
        $(document).ready(function () {
            var tabs = $("div#mySliderTabs1").sliderTabs({
                autoplay: false,
                indicators: false,
                panelArrows: false,
                panelArrowsShowOnHover: false,
                mousewheel: true
            });
        });
        $(document).ready(function () {
            var tabs = $("div#mySliderTabs2").sliderTabs({
                autoplay: false,
                indicators: false,
                panelArrows: false,
                panelArrowsShowOnHover: false,
                mousewheel: true
            });
        });
        $(document).ready(function () {
            var tabs = $("div#mySliderTabs3").sliderTabs({
                autoplay: false,
                indicators: false,
                panelArrows: false,
                panelArrowsShowOnHover: false,
                mousewheel: true
            });
        });
        $(document).ready(function () {
            var tabs = $("div#mySliderTabs4").sliderTabs({
                autoplay: false,
                indicators: false,
                panelArrows: false,
                panelArrowsShowOnHover: false,
                mousewheel: true
            });
        });
        $(document).ready(function () {
            var tabs = $("div#mySliderTabs5").sliderTabs({
                autoplay: false,
                indicators: false,
                panelArrows: false,
                panelArrowsShowOnHover: false,
                mousewheel: true
            });
        });
    </script>
<script src="../vi-vn/Ajax/Ajaxcate.js" type="text/javascript"></script>
<form id="form1" runat="server">
  <asp:Repeater ID="Rpcateindex_pro" runat="server">
    <ItemTemplate>
      <section id="<%#setClassSectionMain() %>">
        <!--Category Home-->
        <div class="box">
          <div class="box_home_left fl">
            <div class="box_Tab_cate_home"> <a href="<%#GetLinkCat(Eval("cat_url"),Eval("cat_seo_url"))%>" title="<%#Eval("cat_name")%>" class="main_cate">
              <h2><%#Eval("cat_name")%></h2>
              </a>
              <ul class="link_tab_cate">
                <asp:Repeater ID="Repeater1" runat="server" DataSource='<%#Load_caterank2(Eval("CAT_ID"),6) %>'>
                  <ItemTemplate>
                    <li><a class="link_tab_ajaxcate" href="#" catid="<%#Eval("CAT_ID") %>"> <%#Eval("cat_name")%></a></li>
                  </ItemTemplate>
                </asp:Repeater>
                <li class="loadingajax"></li>
              </ul>
            </div>
            <div class="ajaxprocate">
              <!--Row Products 1-->
              <div class="row_products row_P1">
                <ul>
                  <asp:Repeater ID="Rpadsleft" runat="server" DataSource='<%#Load_ads_cate(Eval("CAT_ID"),4) %>'>
                    <ItemTemplate>
                      <li class="cate_banner fl">
                        <!--Banner Cate-->
                        <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%>
                        <!--end Banner Cate-->
                      </li>
                    </ItemTemplate>
                  </asp:Repeater>
                  <asp:Repeater ID="Repeater2" runat="server" DataSource='<%#Load_proindex(Eval("CAT_ID"),0,3) %>'>
                    <ItemTemplate>
                      <li class="item_col_product fl">
                        <div class="item_col_product_in">
                          <!--Start Product-->
                          <div class="product"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" class="img_product"><img width="220" height="220" alt="<%#Eval("NEWS_TITLE") %>" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"></a>
                            <h3 class="product_name"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"> <%#Eval("NEWS_TITLE") %></a></h3>
                            <div class="info_price"> <span class="f_price"><del><%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del></span> <span class="main_price"><%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></span> </div>
                          </div>
                          <!--End Product-->
                        </div>
                      </li>
                    </ItemTemplate>
                  </asp:Repeater>
                </ul>
                <div class="cate_shadow"></div>
              </div>
              <!--end Row Products 1-->
              <!--Row Products 2-->
              <div class="row_products row_P2">
                <!--4 Products-->
                <ul>
                  <asp:Repeater ID="Repeater3" runat="server" DataSource='<%#Load_proindex(Eval("CAT_ID"),3,4) %>'>
                    <ItemTemplate>
                      <li class="item_col_product fl">
                        <div class="item_col_product_in">
                          <!--Start Product-->
                          <div class="product"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" class="img_product"><img width="220" height="220" alt="<%#Eval("NEWS_TITLE") %>" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"></a>
                            <h3 class="product_name"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"> <%#Eval("NEWS_TITLE") %></a></h3>
                            <div class="info_price"> <span class="f_price"><del><%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del></span> <span class="main_price"><%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></span> </div>
                          </div>
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
          <!--Right Slide Products-->
          <div class="right_products fr">
            <div class="right_Tab_cate_home">Sản phẩm tiêu biểu</div>
            <!-- Sample slider -->
            <div id="mySliderTabs<%#setTabs() %>">
              <ul class="slides-nav">
                <asp:Repeater ID="Repeater4" runat="server" DataSource='<%#Load_caterank2(Eval("CAT_ID"),3) %>'>
                  <ItemTemplate>
                    <li class="<%#setClasson() %>"><a href="#cate_right<%#setCountsli() %>" title="<%#Eval("CAT_NAME") %>"><%#spiltCate(Eval("CAT_NAME"))%></a></li>
                  </ItemTemplate>
                </asp:Repeater>
              </ul>
              <asp:Repeater ID="Repeater6" runat="server" DataSource='<%#Load_caterank2(Eval("CAT_ID"),3) %>'>
                <ItemTemplate>
                  <div id="cate_right<%#setCountcate() %>">
                    <asp:Repeater ID="Repeater5" runat="server" DataSource='<%#Load_proindex(Eval("CAT_ID"),0,10) %>'>
                      <ItemTemplate>
                        <!--Start Product-->
                        <div class="product_item_slide">
                          <div class="img_general"><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"> <img width="40" height="40" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"> </a></div>
                          <div class="r_product_info">
                            <h4><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%#Eval("NEWS_TITLE") %></a></h4>
                            <div class="info_price"> <span class="f_price"><del><%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del></span> <span class="main_price"><%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></span> </div>
                          </div>
                        </div>
                        <!--End Product-->
                      </ItemTemplate>
                    </asp:Repeater>
                  </div>
                </ItemTemplate>
              </asp:Repeater>
            </div>
          </div>
          <!--end Right Slide Products-->
        </div>
        <!--End Category Home-->
        <!--Ads Category Home-->
        <div class="box ads_below_cate">
          <asp:Repeater ID="Repeater7" runat="server"  DataSource='<%#Load_ads_cate(Eval("CAT_ID"),5) %>'>
            <ItemTemplate> <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%> </ItemTemplate>
          </asp:Repeater>
        </div>
        <!--Ads Category Home-->
      </section>
    </ItemTemplate>
  </asp:Repeater>
</form>
</body>
</html>