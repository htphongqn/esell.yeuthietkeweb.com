<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="main.ascx.cs" Inherits="MVC_Kutun.MOBILE.UIs.main" %>
<link rel="stylesheet" href="/MOBILE/vi-vn/Styles/idangerous.swiper.css">
<script src="/MOBILE/vi-vn/Scripts/idangerous.swiper.min.js"></script>
<!--List Products-->
<div class="box">
    <h2 class="box_Tab">
        Sản phẩm nổi bật</h2>
    <div class="box_ct index_products">
        <div id="owl-slideP" class="owl-carousel products_home">
            <!--#item_P-->
            <asp:Repeater ID="Rpprohighlight" runat="server">
                <ItemTemplate>
                    <div class="item_P">
                        <div class="product">
                            <div class="img_product">
                                <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>">
                                    <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%#Eval("NEWS_TITLE") %>" />
                                </a>
                            </div>
                            <div class="info_P">
                                <h3 class="product_name">
                                    <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>">
                                        <%#Eval("NEWS_TITLE") %></a></h3>
                                <div class="txt_desc">
                                    <div class="price_n">
                                        <price><%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></price>
                                    </div>
                                    <div class="price_s">
                                        <del>
                                            <%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del>
                                    </div>
                                </div>
                                <!--btn_P-->
                            </div>
                            <!--info_P-->
                        </div>
                        <!--product-->
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <!--/item_P-->
        </div>
        <!--/device-->
    </div>
    <!--/box_ct-->
</div>
<!--/box-->
<!--End List Products-->

