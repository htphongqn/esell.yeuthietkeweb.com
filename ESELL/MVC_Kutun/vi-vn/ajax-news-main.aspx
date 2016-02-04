<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ajax-news-main.aspx.cs"
    Inherits="MVC_Kutun.vi_vn.ajax_news_main" %>

<asp:repeater id="Rpcateindex_news" runat="server">
    <ItemTemplate>
<div id="box_ct_news">
    <!--Row News Home-->
    <div class="row_news_home">
        <div class="hot_news_cate fl">
            <asp:repeater id="Repeater7" runat="server" datasource='<%#Load_newsindex(Eval("CAT_ID"),0,1,6) %>'>
                                <ItemTemplate>
                                    <a title=" <%#Eval("NEWS_TITLE") %>" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">
                                        <img class="fullsize480 img_general" alt=" <%#Eval("NEWS_TITLE") %>" title=" <%#Eval("NEWS_TITLE") %>"
                                            src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"></a>
                                    <h3>
                                        <a class="title_hotnews_cate" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"
                                            target="_parent" title=" <%#Eval("NEWS_TITLE") %>">
                                            <%#Eval("NEWS_TITLE") %></a></h3>
                                    <p class="short_des">
                                        <%#Eval("NEWS_DESC") %>
                                        <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"
                                            class="view_more_news">Đọc tiếp »</a></p>
                                </ItemTemplate>
                            </asp:repeater>
        </div>
        <div class="list_news_cate fr">
            <div class="tab_news">
                Tin mới nhất</div>
            <ul>
                <asp:repeater id="Repeater6" runat="server" datasource='<%#Load_newsindex(Eval("CAT_ID"),1,5,6) %>'>
                                    <ItemTemplate>
                                        <li>
                                            <div class="tt_news_home fl">
                                                <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"
                                                    target="_parent" title="<%#Eval("NEWS_TITLE") %>">
                                                    <%#Eval("NEWS_TITLE") %></a></div>
                                        </li>
                                    </ItemTemplate>
                                </asp:repeater>
            </ul>
        </div>
    </div>
    <!--end Row News Home-->
    <!--Row News Home-->
    <div class="row_news_home">
        <div class="hot_news_cate fl">
            <asp:repeater id="Repeater8" runat="server" datasource='<%#Load_newsindex(Eval("CAT_ID"),0,1,5) %>'>
                                <ItemTemplate>
                                    <a title=" <%#Eval("NEWS_TITLE") %>" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">
                                        <img class="fullsize480 img_general" alt=" <%#Eval("NEWS_TITLE") %>" title=" <%#Eval("NEWS_TITLE") %>"
                                            src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"></a>
                                    <h3>
                                        <a class="title_hotnews_cate" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"
                                            target="_parent" title=" <%#Eval("NEWS_TITLE") %>">
                                            <%#Eval("NEWS_TITLE") %></a></h3>
                                    <p class="short_des">
                                        <%#Eval("NEWS_DESC") %>
                                        <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"
                                            class="view_more_news">Đọc tiếp »</a></p>
                                </ItemTemplate>
                            </asp:repeater>
        </div>
        <div class="list_news_cate fr">
            <div class="tab_news">
                Tin xem nhiều nhất</div>
            <ul>
                <asp:repeater id="Repeater9" runat="server" datasource='<%#Load_newsindex(Eval("CAT_ID"),1,5,5) %>'>
                                    <ItemTemplate>
                                        <li>
                                            <div class="tt_news_home fl">
                                                <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"
                                                    target="_parent" title="<%#Eval("NEWS_TITLE") %>">
                                                    <%#Eval("NEWS_TITLE") %></a></div>
                                        </li>
                                    </ItemTemplate>
                                </asp:repeater>
            </ul>
        </div>
    </div>
    <!--end Row News Home-->
</div>
</ItemTemplate>
</asp:repeater>
