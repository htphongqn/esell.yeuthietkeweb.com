<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="pro-giasoc.ascx.cs"
    Inherits="MVC_Kutun.UIs.pro_giasoc" %>
<ul>
    <asp:Repeater ID="Rppro_giasoc" runat="server">
        <ItemTemplate>
            <li>
                <!--Start Product-->
                <div class="product">
                    <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>"
                        class="img_product">
                        <img alt="<%#Eval("NEWS_TITLE") %>" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"></a>
                    <h3 class="product_name">
                        <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>">
                            <%#Eval("NEWS_TITLE") %></a></h3>
                    <div class="info_price">
                        <span class="f_price"><del>
                            <%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del></span> <span class="main_price">
                                <%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></span>
                    </div>
                    <%#Getgiam(Eval("News_Price1"), Eval("News_Price2"))%>
                    <div class="addtocart">
                        <a href="../vi-vn/addtocart.aspx?id=<%#Eval("NEWS_ID") %>">Mua ngay</a></div>
                </div>
                <!--End Product-->
            </li>
        </ItemTemplate>
    </asp:Repeater>
</ul>
