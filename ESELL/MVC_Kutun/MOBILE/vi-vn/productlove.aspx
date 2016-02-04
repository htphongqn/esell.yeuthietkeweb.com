<%@ Page Title="" Language="C#" MasterPageFile="~/MOBILE/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="ProductLove.aspx.cs" Inherits="MVC_Kutun.MOBILE.vi_vn.ProductLove" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="path">
        <a href="/">Trang chủ</a> » <a href="#">Sản phẩm yêu thích</a>
    </div>
    <!--List Products-->
    <h1 class="heading_page">
        Sản phẩm yêu thích
    </h1>
    <div id="list_products">
        <ul id="moredata">
            <asp:Repeater ID="Rppro_like" runat="server">
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
        </ul>
    </div>
    <!--list_products-->
</asp:Content>
