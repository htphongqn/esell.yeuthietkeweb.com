<%@ Page Title="" Language="C#" MasterPageFile="~/MOBILE/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Payment-step2.aspx.cs" Inherits="MVC_Kutun.MOBILE.vi_vn.Payment_step2" %>

<%@ Register Src="../UIs/Payment-giaohangtannoi.ascx" TagName="Payment" TagPrefix="uc1" %>
<%@ Register Src="../UIs/cart.ascx" TagName="cart" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--address-->
    <div class="progress-bar current-step-1">
        <ul>
            <li>1</li>
            <li class="current">2</li>
            <li>3</li>
            <li>4</li>
        </ul>
    </div>
    <div class="box">
        <div class="box_Tab">
            Thông tin giao hàng</div>
        <div class="box_ct ship_info">
            <uc1:Payment ID="Payment1" runat="server" />
        </div>
    </div>
    <!--End Cart Page-->
    <div class="box">
        <uc2:cart ID="cart1" runat="server" />
    </div>
</asp:Content>
