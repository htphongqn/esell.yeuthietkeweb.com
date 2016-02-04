<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="proHighlights.ascx.cs" Inherits="MVC_Kutun.UIs.proHighlights" %>

<%@ Register Src="Ads-rightpro.ascx" TagName="Ads" TagPrefix="uc1" %>
<!--Popular Products-->
<div id="l_slP" class="fl">
    <div class="tt_popP">
        <span>Sản phẩm nổi bật</span></div>
    <div id="popular_products" class="sl_products">
        <ul>
            <asp:Repeater ID="Rpprohighlight" runat="server">
                <ItemTemplate>
                    <li>
                        <!--Start Product-->
                        <div class="product">
                            <a class="img_product" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE") %>">
                                <img width="150" height="150" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%#Eval("NEWS_TITLE") %>"></a>
                            <h3 class="product_name">
                                <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE") %>">
                                    <%#Eval("NEWS_TITLE") %></a></h3>
                            <div class="info_price">
                                <span class="f_price"><del>
                                    <%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del></span> <span class="main_price">
                                        <%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></span>
                            </div>
                            <%#Getgiam(Eval("News_Price1"), Eval("News_Price2"))%>
                            <%#getBuy(Eval("NEWS_ID"), Eval("NEWS_FIELD3"))%>
                        </div>
                        <!--End Product-->
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        <div class="cf">
        </div>
        <a id="prev_popP" class="prev" href="#">&lt;</a> <a id="next_popP" class="next" href="#">
            &gt;</a>
    </div>
</div>
<!--end Slide Popular Products-->
<!--Ads Right Popular Products-->
<div class="ads ads_right_P fr">
    <div class="ads_item">
        <uc1:Ads ID="Ads1" runat="server" />
    </div>
</div>
<!--end Ads Right Popular Products-->