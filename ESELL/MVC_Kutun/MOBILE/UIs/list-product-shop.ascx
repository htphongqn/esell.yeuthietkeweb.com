<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="list-product-shop.ascx.cs"
    Inherits="MVC_Kutun.MOBILE.UIs.list_product_shop" %>
<%@ Register Src="path.ascx" TagName="path" TagPrefix="uc1" %>
<div class="path">
    <a href="/">Trang chủ</a>
    <uc1:path ID="path1" runat="server" />
</div>
<!--List Products-->
<h1 class="heading_page">
    Sản phẩm của shop: <asp:Label ID="lbShopName" runat="server" Text="" ForeColor="#4a90e2"></asp:Label><br />
                    <asp:Label ID="Lbtitle" runat="server" Text=""></asp:Label>
</h1>
<div id="list_products">
    <ul id="moredata">
        <asp:Repeater ID="Rplistpro" runat="server">
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
<!-- page number-->
<div class="navigation_news">
    <!--<asp:Literal ID="ltrPage" runat="server"></asp:Literal>-->
    <button data-page="3" id="product-more" class="orange-button" type="button" style="cursor:pointer;color:White">
        Xem thêm sản phẩm »</button>
</div>
<asp:HiddenField ID="Hdcount" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="Hdcatid" runat="server" ClientIDMode="Static"/>
<script  src="//code.jquery.com/jquery-1.11.3.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        var _catid = document.getElementById("Hdcatid").value;
        var _countpro = document.getElementById("Hdcount").value;
        var _count = 20;
        if (_countpro <= 20)
            $("#product-more").hide();
        $('#product-more').click(function () {
            
            $.ajax({
                type: "POST",
                url: "/MOBILE/vi-vn/ViewmoreAjax.asmx/viewmore",
                data: "{catid:'" + _catid + "',skip:'" + _count + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (e) {
                    $('#moredata').append(e.d);
                    if (_count >= _countpro)
                        $("#product-more").hide();
                    _count += 20;
                }
            });
        });
    })
</script>

