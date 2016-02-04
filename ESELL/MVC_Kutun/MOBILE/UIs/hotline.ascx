<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="hotline.ascx.cs" Inherits="MVC_Kutun.MOBILE.UIs.hotline" %>
Hotline:
<asp:Repeater ID="Rphotline" runat="server">
    <ItemTemplate>
       <span> <%# Eval("ONLINE_DESC")%></span>
    </ItemTemplate>
</asp:Repeater>