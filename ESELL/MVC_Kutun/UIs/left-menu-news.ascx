<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="left-menu-news.ascx.cs"
    Inherits="MVC_Kutun.UIs.left_menu_news" %>
<link href="../vi-vn/Styles/arcord_menu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        //  Accordion Panels   
//        $(".menuheader:first").addClass("current");
//        $(".categoryitems:first").show();
        $(".menuheader").click(function () {
            $(this).next(".categoryitems").slideToggle("fast").siblings(".categoryitems:visible").slideUp("fast");
            $(this).toggleClass("current");
            $(this).siblings(".menuheader").removeClass("current");
        });
    });
</script>
<div class="box">
    <div class="arrowlistmenu">
        <asp:Repeater ID="Rpcateleft" runat="server">
            <ItemTemplate>
                <h3 class="menuheader" class="<%#setClassCurrent(Eval("CAT_ID")) %>">
                    <span class="accordprefix"></span>
                    <%#Eval("CAT_NAME") %><span class="accordsuffix"></span></h3>
                <ul class="categoryitems" <%#getActive(Eval("CAT_ID")) %>>
                    <asp:Repeater ID="Rpnews" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                        <ItemTemplate>
                            <li><a target="_parent" href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"))%>">
                                <%# Eval("CAT_NAME")%>
                            </a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
<!--Likebox-->
<div class="box">
</div>
