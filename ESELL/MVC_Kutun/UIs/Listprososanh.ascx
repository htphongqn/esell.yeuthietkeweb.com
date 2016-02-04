<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Listprososanh.ascx.cs"
    Inherits="MVC_Kutun.UIs.Listprososanh" %>
<asp:Panel ID="Panel2" runat="server" CssClass="pndsosanh hidden">
    <div style="width: 100%; height: 15347px; display: block;" class="shadows">
    </div>
    <div style="top: 0; position: absolute; left: 20%; z-index: 9999;width:60%" class="popup">
        <div class="popup-bg" style="width:100%;height:550px;overflow:auto">
            <div class="popup-title">
                <h2>
                    Sản phẩm so sánh</h2>
            </div>
            <div class="popup-form" style="width:100%">
                <ul>
                    <asp:Repeater ID="Rplistpro" runat="server">
                        <ItemTemplate>
                            <li class="item_P">
                                <!--Start Product-->
                                <div class="product">
                                    <div class="boxgrid">
                                        <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"
                                            class="img_product">
                                            <img alt=" <%#Eval("NEWS_TITLE") %>" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" /></a>
                                    </div>
                                    <h3 class="product_name">
                                        <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">
                                            <%#Eval("NEWS_TITLE") %></a></h3>
                                    <div>
                                        <a href="<%#getLinksosanh(Eval("NEWS_ID")) %>">So sánh</a></div>
                                </div>
                                <!--end Start Product-->
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            <div class="cf">
            </div>
        </div>
        <i class="popup-close" onclick="tatss()"></i>
    </div>
</asp:Panel>
