<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxcateproductIndex.aspx.cs"
    Inherits="MVC_Kutun.vi_vn.AjaxcateproductIndex" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Repeater ID="Rpcateindex" runat="server">
        <ItemTemplate>
            <!--Row Products 1-->
            <div class="row_products">
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
                                    <div class="product">
                                        <h3 class="product_name">
                                            <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">
                                                <%#Eval("NEWS_TITLE") %></a></h3>
                                        <div class="info_price">
                                            <span class="f_price"><del>
                                                <%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del></span> <span class="main_price">
                                                    <%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></span>
                                        </div>
                                        <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"
                                            class="img_product">
                                            <img width="220" height="220" alt="<%#Eval("NEWS_TITLE") %>" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"></a>
                                    </div>
                                    <!--End Product-->
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <div class="cate_shadow">
                </div>
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
                                    <div class="product">
                                        <h3 class="product_name">
                                            <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">
                                                <%#Eval("NEWS_TITLE") %></a></h3>
                                        <div class="info_price">
                                            <span class="f_price"><del>
                                                <%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del></span> <span class="main_price">
                                                    <%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></span>
                                        </div>
                                        <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"
                                            class="img_product">
                                            <img width="220" height="220" alt="<%#Eval("NEWS_TITLE") %>" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"></a>
                                    </div>
                                    <!--End Product-->
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            <!--end Row Products 2-->
        </ItemTemplate>
    </asp:Repeater>
    </form>
</body>
</html>
