<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="MVC_Kutun.MOBILE.UIs.header" %>
<%--<a href="/" id="mobile_logo" class="fleft">
    <img src="/MOBILE/vi-vn/Images/logo.png" alt="esell.vn">
</a>--%>
 <asp:Repeater ID="Rplogo" runat="server">
  <ItemTemplate> <%# Getbanner(Eval("BANNER_TYPE"),Eval("BANNER_FIELD1"), Eval("BANNER_ID"), Eval("BANNER_FILE"))%> </ItemTemplate>
 </asp:Repeater>
<a href="/m-gio-hang.html" id="cart" class="fright"><b class="itemNumber"><%=getQuantityCart()%></b></a>