<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ads-left-menu.ascx.cs" Inherits="MVC_Kutun.UIs.Ads_left_menu" %>
<asp:Repeater ID="Rpads" runat="server">
    <ItemTemplate>
        <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%>
    </ItemTemplate>
</asp:Repeater>