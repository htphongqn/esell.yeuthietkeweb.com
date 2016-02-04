<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="list-product.ascx.cs"
    Inherits="MVC_Kutun.UIs.list_product" %>
<%@ Register Src="path.ascx" TagName="path" TagPrefix="uc1" %>
<%@ Register Src="left-menu.ascx" TagName="left" TagPrefix="uc2" %>
<%@ Register Src="Seo-cate.ascx" TagName="Seo" TagPrefix="uc3" %>
<div id="main" class="cf">
    <div class="path">
        <a href="/">Trang chủ</a>
        <uc1:path ID="path1" runat="server" />
    </div>
    <div id="div_left" runat="server">
        <!--Sidebar-->
        <div id="sidebar" class="fl">
            <uc2:left ID="left1" runat="server" />
        </div>
    </div>
    <!--end Sidebar-->
    <!--Main Content-->
    <div id="main_content" class="fr" <%=setStyle() %>>
        <div class="box">
            <div class="box_Tab_main">
                <h1 class="title_page">
                    <asp:Label ID="Lbtitle" runat="server" Text=""></asp:Label></h1>
                <div class="sort_area">
                    <asp:HiddenField ID="Hdurl" runat="server" />
                    <asp:HiddenField ID="Hdpage" runat="server" />
                    <asp:HiddenField ID="Hdparam" runat="server" />
                    <asp:HiddenField ID="Hdprice" runat="server" />
                    <asp:DropDownList ID="Drsort" runat="server" Style="width: auto" onchange="changesort();">
                        <asp:ListItem Value="0">Sắp xếp theo</asp:ListItem>
                        <asp:ListItem Value="1">Tên: A-Z</asp:ListItem>
                        <asp:ListItem Value="2">Tên: Z-A</asp:ListItem>
                        <asp:ListItem Value="3">Giá: Cao đến thấp</asp:ListItem>
                        <asp:ListItem Value="4">Giá: Thấp đến cao</asp:ListItem>
                        <asp:ListItem Value="5">Mức giảm giá: Cao đến thấp</asp:ListItem>
                        <asp:ListItem Value="6">Mức giảm giá: Thấp đến cao</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="list_products">
                <ul>
                    <asp:Repeater ID="Rplistpro" runat="server">
                        <ItemTemplate>
                            <li class="item_P">
                                <!--Start Product-->
                                <div class="product">
                                    <a class="img_product" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE") %>">
                                        <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%#Eval("NEWS_TITLE") %>"></a>
                                    <h3 class="product_name">
                                        <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE") %>">
                                            <%#Eval("NEWS_TITLE") %></a></h3>
                                    <div class="info_price">
                                        <span class="f_price"><del>
                                            <%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del></span> 
                                        <span class="main_price">
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
                <asp:Literal ID="ltrPage" runat="server"></asp:Literal></div>
        </div>
    </div>
    <!--end Main Content-->
    <!--Info SEO-->
    <div class="box">
        <div class="info_SEO_cate">
            <uc3:Seo ID="Seo1" runat="server" />
        </div>
    </div>
    <!--end Info SEO-->
</div>
<script>
    function changesort() {
        var vl = document.getElementById("<%=Drsort.ClientID %>").value;
        var url = document.getElementById("<%=Hdurl.ClientID %>").value;
        var page = document.getElementById("<%=Hdpage.ClientID %>").value;
        var param = document.getElementById("<%=Hdparam.ClientID %>").value;
        var price = document.getElementById("<%=Hdprice.ClientID %>").value;
        document.location = "/" + url + ".html?code=&page=" + page + "&sort=" + vl + "&" + price + "&paramTH=" + param;
    }
</script>