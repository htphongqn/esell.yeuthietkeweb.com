<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ads-truot.ascx.cs" Inherits="MVC_Kutun.UIs.Ads_truot" %>
<div id="divAdLeft">
    <div style="padding: 2px 0px">
        <asp:Repeater ID="Rpads1" runat="server">
            <ItemTemplate>
                <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
<div id="divAdRight">
    <div style="padding: 2px 0px">
        <asp:Repeater ID="Rpads2" runat="server">
            <ItemTemplate>
                <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
