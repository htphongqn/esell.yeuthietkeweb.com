<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ads-bank.ascx.cs" Inherits="MVC_Kutun.UIs.Ads_bank" %>
<asp:Repeater ID="Rpslider" runat="server">
    <ItemTemplate>
         <li><%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%></li>
    </ItemTemplate>
</asp:Repeater>
