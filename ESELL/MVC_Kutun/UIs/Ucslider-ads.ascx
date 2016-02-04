<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ucslider-ads.ascx.cs"
    Inherits="MVC_Kutun.UIs.Ucslider_ads" %>
<%@ Register Src="slider.ascx" TagName="slider" TagPrefix="uc1" %>
<%@ Register Src="Ads-right-slider.ascx" TagName="Ads" TagPrefix="uc2" %>
<!--end Function Web-->
<div id="homebanners" class="fl">
    <!--Slide Banner-->
    <div class="slider theme-default">
        <div id="slider" class="nivoSlider">
            <uc1:slider ID="slider1" runat="server" />
        </div>
    </div>
    <!--end Slide Banner-->
</div>
<!--Ads Right Top Main-->
<div class="ads ads_right_top_main fr">
    <uc2:Ads ID="Ads1" runat="server" />
</div>
<!--end Ads Right Top Main-->
