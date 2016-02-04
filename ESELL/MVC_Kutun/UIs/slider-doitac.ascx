<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="slider-doitac.ascx.cs"
    Inherits="MVC_Kutun.UIs.slider_doitact" %>
<asp:Repeater ID="Rpslider" runat="server">
    <ItemTemplate>
        <li>
            <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%></li>
    </ItemTemplate>
</asp:Repeater>


