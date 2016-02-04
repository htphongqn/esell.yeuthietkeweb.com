<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="foot-menubottom.ascx.cs"
    Inherits="MVC_Kutun.UIs.foot_menubottom" %>
<div class="wrap">
    <div id="footer_menu_bottom">
        <asp:Repeater ID="Rpmenu_foot" runat="server">
            <ItemTemplate>
                <a href="<%#GetLink_Cat(Eval("Cat_Url"),Eval("Cat_Seo_Url")) %>">
                    <%#Eval("CAT_NAME") %></a>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div id="copyright">
        Copyright © 2015 by Ketnoitructuyen.com - Đang online: <b><%=Loadonlineday()%></b> - Tổng truy cập:
        <b><%=Loadcounter() %></b></div>
</div>
