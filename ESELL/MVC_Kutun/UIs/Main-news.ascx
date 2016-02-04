<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Main-news.ascx.cs" Inherits="MVC_Kutun.UIs.Main_news" %>
<%@ Register Src="menu-news.ascx" TagName="menu" TagPrefix="uc1" %>
<%@ Register Src="news-index.ascx" TagName="news" TagPrefix="uc2" %>
<%@ Register Src="Ads-news-main.ascx" TagName="Ads" TagPrefix="uc3" %>
<asp:HiddenField ID="Hdlink" runat="server" />
<!--Menu News-->
<div class="nav_news">
    <div class="nav_news_inner">
        <uc1:menu ID="menu1" runat="server" />
    </div>
</div>
<!--End Menu News-->
<link rel="stylesheet" type="text/css" href="../vi-vn/Styles/banner.css" />
<script language="javascript" type="text/javascript" src="../vi-vn/Scripts/jquery.easing.js"></script>
<script language="javascript" type="text/javascript" src="../vi-vn/Scripts/script_news.js"></script>
<div id="div_slider" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var gettypevideo = document.getElementById("<%=Hdlink.ClientID %>").value;
            $('#lofslidecontent45').lofJSidernews({ interval: 4000,
                direction: gettypevideo == 3 ? '' : 'opacity',
                duration: 1000,
                easing: 'easeInOutSine',
                auto: (gettypevideo==3 ? false : true)
            });
        });

    </script>
</div>
<div id="lofslidecontent45" class="lof-slidecontent cf">
    <div class="preload">
        <div>
        </div>
    </div>
    <!-- MAIN CONTENT -->
    <uc2:news ID="news1" runat="server" />
    <!-- END MAIN CONTENT -->
    <!-- NAVIGATOR -->
</div>
<!--Left Content News-->
<div id="left-content-news" class="fl">
    <asp:Repeater ID="Rpcate_newsindex" runat="server">
        <ItemTemplate>
            <div class="list-cate">
                <h2>
                    <span>
                        <%#Eval("cat_name")%></span><a href="<%#GetLinkCat(Eval("cat_url"),Eval("cat_seo_url"))%>"
                            class="link_viewall">Xem tất cả</a></h2>
                <div class="list-cate-inner">
                    <div class="article">
                        <asp:Repeater ID="Repeater1" runat="server" DataSource='<%#Load_newsindex(Eval("CAT_ID"),0,1) %>'>
                            <ItemTemplate>
                                <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>'
                                    target='_parent'>
                                    <img src='<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3"),Eval("NEWS_DIET")) %>' alt='' width='355'
                                        height='200' /></a>
                                <h3>
                                    <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>'>
                                        <%#Eval("NEWS_TITLE") %></a></h3>
                                <p>
                                    <%#Eval("NEWS_DESC") %></p>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="list-article">
                        <div class="list-article-inner">
                            <ul>
                                <asp:Repeater ID="Repeater2" runat="server" DataSource='<%#Load_newsindex(Eval("CAT_ID"),1,2) %>'>
                                    <ItemTemplate>
                                        <li><a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>'
                                            class='img_general' target='_parent'>
                                            <img src='<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3"),Eval("NEWS_DIET")) %>' alt='' width='150'
                                                height='80' /></a> </p> <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>'>
                                                    <%#Eval("NEWS_TITLE") %></a> </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                        <ul class="list-type">
                            <asp:Repeater ID="Repeater3" runat="server" DataSource='<%#Load_newsindex(Eval("CAT_ID"),3,4) %>'>
                                <ItemTemplate>
                                    <li><a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>'>
                                        <%#Eval("NEWS_TITLE") %></a> </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
<!--End Left Content News-->
<!--Right Content News-->
<div id="right-content-news" class="fr">
    <div class="banner_ads">
        <uc3:Ads ID="Ads1" runat="server" />
    </div>
</div>
<!--End Right Content News-->
