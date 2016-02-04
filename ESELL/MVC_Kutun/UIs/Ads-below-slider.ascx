<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ads-below-slider.ascx.cs"
    Inherits="MVC_Kutun.UIs.Ads_below_slider" %>
<asp:Repeater ID="Rpads" runat="server">
    <ItemTemplate>
        <div class="top_P_item">
            <div class="top_P_item_in">
                <div class="ads_P_img trans">
                    <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%></div>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>
