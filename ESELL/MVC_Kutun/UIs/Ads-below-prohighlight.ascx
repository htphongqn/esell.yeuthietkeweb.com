<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ads-below-prohighlight.ascx.cs" Inherits="MVC_Kutun.UIs.Ads_below_prohighlight" %>
<asp:Repeater ID="Rpads" runat="server">
    <ItemTemplate>
        <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%>
    </ItemTemplate>
</asp:Repeater>