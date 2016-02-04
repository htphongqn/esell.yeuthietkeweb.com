<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="news-index.ascx.cs"
    Inherits="MVC_Kutun.UIs.news_index" %>
<div class="lof-main-outer">
    <ul class="lof-main-wapper">
        <asp:Repeater ID="Rpnews_sliderleft" runat="server">
            <ItemTemplate>
                <li>
                    <div <%#setStyle() %> >
                        <%#getVideo(Eval("NEWS_DIET"))%>
                    </div>
                    <div <%#setStyle1() %>>
                        <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>'
                            class='img_general' target='_parent'>
                            <img src='<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3"),Eval("NEWS_DIET")) %>' alt='' /></a>
                        <div class="lof-main-item-desc">
                            <h2>
                                <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>'>
                                    <%#Eval("NEWS_TITLE") %></a></h2>
                        </div>
                    </div>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>
<div class="lof-navigator-outer">
    <ul class="lof-navigator">
        <asp:Repeater ID="Rpnews_sliderright" runat="server">
            <ItemTemplate>
                <li>
                    <div>
                        <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>' target='_parent'>
                            <img src='<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3"),Eval("NEWS_DIET")) %>' alt='' /></a>
                        <h3>
                            <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>'>
                                <%#Eval("NEWS_TITLE") %></a></h3>
                    </div>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>
