<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="right-menu-news.ascx.cs"
    Inherits="MVC_Kutun.UIs.right_menu_news" %>
<%@ Register Src="Ads-news-main.ascx" TagName="Ads" TagPrefix="uc1" %>
<div class="most-viewed-news">
    <h3>
        <span>Xem nhiều nhất</span></h3>
    <ul>
        <asp:Repeater ID="Rpnews_seemore" runat="server">
            <ItemTemplate>
                <li><a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>'>
                    <%# Eval("NEWS_TITLE") %></a> </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>
<div class="banner_ads">
    <uc1:Ads ID="Ads1" runat="server" />
</div>
