<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="search-result.ascx.cs"
    Inherits="MVC_Kutun.UIs.search_result" %>
<div id="main" class="cf">
    <div class="path">
        <a href="/trang-chu.html">Trang chủ</a> » Tìm kiếm
    </div>
    <!--Right Col-->
    <div id="main_content" class="fr" style="width: 100%">
        <div class="box">
            <div class="box_Tab_main">
                <h1>
                    Tìm kiếm</h1>
            </div>
            <div class="box_ct_home list_products">
                <ul>
                    <asp:Repeater ID="Rpproduct" runat="server">
                        <ItemTemplate>
                            <li class="item_P">
                                <!--Start Product-->
                                <div class="product">
                                    <a class="img_product" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>">
                                        <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%#Eval("NEWS_TITLE") %>"></a>
                                    <h3 class="product_name">
                                        <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>">
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
            </div>
            <div class="pagination">
                <asp:Literal ID="ltrPage" runat="server"></asp:Literal>
            </div>
        </div>
    </div>
<!--end Right Col-->
</div> 