<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Check-order.aspx.cs" Inherits="MVC_Kutun.vi_vn.Check_order" %>

<%@ Register Src="../UIs/checkorderPayment.ascx" TagName="checkorderPayment" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="cart_page">
        <uc1:checkorderPayment ID="checkorderPayment1" runat="server" />
    </div>
</asp:Content>
