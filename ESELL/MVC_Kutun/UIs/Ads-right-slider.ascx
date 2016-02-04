<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ads-right-slider.ascx.cs" Inherits="MVC_Kutun.UIs.Ads_right_slider" %>
<asp:Repeater ID="Rpads" runat="server">
    <ItemTemplate>
          <div class="ads_item"><%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%></div>
    </ItemTemplate>
</asp:Repeater>