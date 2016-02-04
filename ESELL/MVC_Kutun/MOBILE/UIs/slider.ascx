<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="slider.ascx.cs" Inherits="MVC_Kutun.MOBILE.UIs.slider" %>
<asp:Repeater ID="Rpslider" runat="server">
    <ItemTemplate>
        <div class="item">
            <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%></div>    </ItemTemplate>
</asp:Repeater>