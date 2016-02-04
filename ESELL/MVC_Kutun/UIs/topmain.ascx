<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="topmain.ascx.cs" Inherits="MVC_Kutun.UIs.topmain" %>
<div class="wrap">
    <div id="hotline" class="fl"><b>
            <asp:Repeater ID="Rphotline" runat="server">
                <ItemTemplate>
                    <%# Eval("ONLINE_DESC")%>
                </ItemTemplate>
            </asp:Repeater>
        </b>
    </div>
    <!--Social-->
    <div id="social_network" class="fr">
        <asp:Repeater ID="Rpfacebook" runat="server">
            <ItemTemplate>
                <%# LoadOnline(Eval("ONLINE_TYPE"), Eval("ONLINE_DESC"), Eval("ONLINE_NICKNAME"))%>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
