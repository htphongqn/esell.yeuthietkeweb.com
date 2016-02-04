<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="list-news.ascx.cs" Inherits="MVC_Kutun.MOBILE.UIs.list_news" %>
<%@ Register Src="path.ascx" TagName="path" TagPrefix="uc1" %>
<div class="path">
    <a href="/">Trang chủ</a>
    <uc1:path ID="path1" runat="server" />
</div>
<div class="box">
    <div class="box_Tab">
        <asp:Literal ID="Lbtitle" runat="server"></asp:Literal>
    </div>
    <div class="box_ct" id="list_news">
        <ul>
            <asp:Repeater ID="Rplistnews" runat="server">
                <ItemTemplate>
                    <li>
                        <h3>
                            <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>">
                                <%# Eval("NEWS_TITLE") %></a>
                        </h3>
                        <%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMAGE3"), Eval("NEWS_URL"), Eval("NEWS_SEO_URL"))%>
                        <div class="short_news">
                            <p>
                                <%# Eval("NEWS_DESC") %></p>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <!--End box_ct-->
    <div class="navigation_news">
        <asp:Literal ID="ltrPage" runat="server"></asp:Literal></a>
    </div>
</div>
<!--End box-->
