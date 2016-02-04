<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProQuantam.ascx.cs"
    Inherits="MVC_Kutun.MOBILE.UIs.ProQuantam" %>
<div class="box">
    <h2 class="box_Tab">
        Có thể bạn quan tâm</h2>
    <div class="box_ct index_products">
        <div id="owl-slideP" class="owl-carousel products_home">
            <asp:Repeater ID="Rpproquantam" runat="server">
                <ItemTemplate>
                    <!--#item_P-->
                    <div class="item_P">
                        <div class="product">
                            <%#Getgiam(Eval("News_Price1"), Eval("News_Price2"))%>
                            <div class="img_product">
                                <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>">
                                    <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="" />
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
                                            <%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del></div>
                                </div>
                                <!--btn_P-->
                            </div>
                            <!--info_P-->
                        </div>
                        <!--product-->
                    </div>
                    <!--/item_P-->
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <!--/box_ct-->
</div>
