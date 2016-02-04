<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="News-main.aspx.cs" Inherits="MVC_Kutun.vi_vn.News_main" %>

<%@ Register Src="../UIs/Main-news.ascx" TagName="Main" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:Main ID="Main1" runat="server" />
</asp:Content>
