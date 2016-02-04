<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="product-top.ascx.cs"
    Inherits="MVC_Kutun.UIs.product_top" %>
<asp:Repeater ID="Rppro_top" runat="server">
    <ItemTemplate>
        <li class="hot-query-highlight"><a href="<%# GetLinkCat(Eval("Cat_Url"),Eval("Cat_Seo_Url")) %>">
            <%#Eval("CAT_NAME") %></a></li>
    </ItemTemplate>
</asp:Repeater>
