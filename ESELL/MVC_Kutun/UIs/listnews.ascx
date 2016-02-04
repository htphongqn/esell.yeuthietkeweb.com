<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="listnews.ascx.cs" Inherits="MVC_Kutun.UIs.listnews" %>
<%@ Register Src="path.ascx" TagName="path" TagPrefix="uc1" %>
<%@ Register Src="left-menu-news.ascx" TagName="left" TagPrefix="uc2" %>
<div id="main" class="cf">
    <div class="path">
        <a href="/">Trang chủ</a>
        <uc1:path ID="path1" runat="server" />
    </div>
    <!--Sidebar-->
    <div id="sidebar" class="fl">
        <uc2:left ID="left1" runat="server" />
    </div>
    <!--end Sidebar-->
    <!--Main Content-->
    <div id="main_content" class="fr">
        <!--List News-->
        <div class="box">
            <div class="box_Tab_main">
                <h1 class="title_page">
                    <asp:Label ID="Lbtitle" runat="server" Text=""></asp:Label>
                </h1>
            </div>
            <div id="list_news">
                <ul>
                    <asp:Repeater ID="Rplistnews" runat="server">
                        <ItemTemplate>
                            <li>
                                <h2>
                                    <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>" class="news_title">
                                        <%# Eval("NEWS_TITLE") %>
                                    </a>
                                </h2>
                                <%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMAGE3"), Eval("NEWS_URL"), Eval("NEWS_SEO_URL"), Eval("NEWS_TITLE"))%>
                                <div class="shortdes">
                                    <p>
                                        <%# Eval("NEWS_DESC") %></p>
                                </div>
                                <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" class="view_more">Xem
                                    chi tiết &raquo;</a> </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <div class="pagination">
                    <asp:Literal ID="ltrPage" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
        <!--End List News-->
    </div>
    <!--end Main Content-->
</div>
