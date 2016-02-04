<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="top-page.ascx.cs" Inherits="MVC_Kutun.UIs.top_page" %>
<%@ Register Src="hotlinefix.ascx" TagName="hotlinefix" TagPrefix="uc1" %>

<div class="wrap" id="top_link">
<div class="g-f-share"></div>
 <div class="hotline-top"> <span>Hotline:</span>
  <b><uc1:hotlinefix ID="hotlinefix1" runat="server" /></b>
 </div>
 
 <div class="tvmh">
  <a href="/tu-van-mua-hang.html"><span>Tư vấn mua hàng</span></a>
 </div>
 <div class="cskh">
 <i class="fa fa-mobile"></i>
 <a href="/cham-soc-khach-hang.html">Chăm sóc khách hàng</a> 
 </div>
 
</div>

