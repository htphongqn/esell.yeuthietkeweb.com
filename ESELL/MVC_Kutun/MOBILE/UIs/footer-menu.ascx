<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer-menu.ascx.cs"
    Inherits="MVC_Kutun.MOBILE.UIs.footer_menu" %>
<ul>
    <asp:Repeater ID="Rpmenufoot" runat="server">
        <ItemTemplate>
            <li><a href="<%#GetLink_Cat(Eval("Cat_Url"),Eval("Cat_Seo_Url")) %>">
                <%#Eval("CAT_NAME") %></a> </li>
        </ItemTemplate>
    </asp:Repeater>
</ul>
