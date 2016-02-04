<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ads-news-main.ascx.cs"
    Inherits="MVC_Kutun.UIs.Ads_news_main" %>
<asp:Repeater ID="Rpads" runat="server">
    <ItemTemplate>
        <p>
            <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%></p>
    </ItemTemplate>
</asp:Repeater>
