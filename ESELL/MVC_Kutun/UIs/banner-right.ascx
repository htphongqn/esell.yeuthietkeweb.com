<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="banner-right.ascx.cs"
    Inherits="MVC_Kutun.UIs.banner_right" %>
<%@ Register Src="Ads_rightbanner.ascx" TagName="Ads_rightbanner" TagPrefix="uc1" %>
<%@ Register Src="cart-left.ascx" TagName="cart" TagPrefix="uc2" %>
<uc2:cart ID="cart1" runat="server" />
<div class="box">
    <uc1:Ads_rightbanner ID="Ads_rightbanner1" runat="server" />
</div>
<!--End box-->
