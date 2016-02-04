<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Order-news.ascx.cs"
    Inherits="MVC_Kutun.UIs.Order_news" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<ComponentArt:Rotator ID="thongbaomuahangthanhcong" runat="server" CssClass="Rotator"
    Width="380" Height="15" RotationType="SmoothScroll" ScrollInterval="15" SlidePause="3000"
    PauseOnMouseOver="true">
    <SlideTemplate>
        <strong>
            <%# Eval("ORDER_NAME")%>
        </strong>vừa mua thành công <a id="A1" href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>'
            runat="server">
            <%# Eval("NEWS_TITLE")%>
        </a>
    </SlideTemplate>
</ComponentArt:Rotator>
