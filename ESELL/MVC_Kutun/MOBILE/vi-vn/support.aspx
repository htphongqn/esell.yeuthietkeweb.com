<%@ Page Title="" Language="C#" MasterPageFile="~/MOBILE/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="support.aspx.cs" Inherits="MVC_Kutun.MOBILE.vi_vn.support" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="path">
        <a href="/">Trang chủ</a> » <a href="#">Hỗ trợ </a>
    </div>
    <style type="text/css">
        .catList-link
        {
            padding: 14px 10px 14px 40px;
            position: relative;
            display: block;
            border-bottom: 1px solid rgb(183, 183, 183);
            box-sizing: border-box;
            color: rgb(102, 102, 102);
            display: block;
        }
        .menu-list .faq-icon a:before
        {
            background-image: url(faq_icons.png);
            content: " ";
            display: block;
            width: 17px;
            height: 17px;
            position: absolute;
            background-position: 0 0;
            left: 10px;
            background-color: transparent;
        }
        .menu-list .contact-us-icon a:before
        {
            background-image: url(faq_icons.png);
            content: " ";
            display: block;
            width: 18px;
            height: 17px;
            position: absolute;
            background-position: -17px 3px;
            left: 10px;
            background-color: transparent;
        }
        .menu-list .shipping-return-icon a:before
        {
            background-image: url(faq_icons.png);
            content: " ";
            display: block;
            width: 19px;
            height: 17px;
            position: absolute;
            background-position: -35px 2px;
            left: 11px;
            background-color: transparent;
        }
        .menu-list .tos-icon a:before
        {
            background-image: url(faq_icons.png);
            content: " ";
            display: block;
            width: 12px;
            height: 17px;
            position: absolute;
            background-position: -55px 0;
            left: 12px;
            background-color: transparent;
        }
    </style>
    <!--Faq Page-->
    <div class="box" id="account">
        <asp:Repeater ID="RpmenunewsLeft" runat="server">
            <ItemTemplate>
                <div class="box_Tab">
                    <%# Eval("CAT_NAME")%></div>
                <ul class="catList menu-list">
                    <asp:Repeater ID="Repeater1" runat="server" DataSource='<%#Load_Menu2(Eval("CAT_ID")) %>'>
                        <ItemTemplate>
                            <li class="contact-us-icon"><a class="catList-link" href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"))%>">
                                <%# Eval("CAT_NAME")%><span class="category-list-more"></span></a> </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <!--End Faq-->
</asp:Content>
