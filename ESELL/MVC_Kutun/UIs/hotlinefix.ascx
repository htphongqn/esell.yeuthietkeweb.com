<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="hotlinefix.ascx.cs"
    Inherits="MVC_Kutun.UIs.hotlinefix" %>
<asp:Repeater ID="Rphotline" runat="server">
    <ItemTemplate>
        <%# Eval("ONLINE_DESC")%>
    </ItemTemplate>
</asp:Repeater>
