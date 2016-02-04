<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="right-fix.ascx.cs" Inherits="MVC_Kutun.UIs.right_fix" %>
<!--Viewed Products-->

<div id="viewed_P" class="item_side_fix">
 <div class="tt_popP"><span> Sản phẩm đã xem ( <%=countprosee() %> )</span></div>
 <div class="inner" style="padding:0px 30px;">
  <div id="slide_viewed_P">
   <ul>
    <asp:Repeater ID="Rppro_see" runat="server">
     <ItemTemplate>
      <li><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE") %>"> <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%#Eval("NEWS_TITLE") %>" height="42" /></a> </li>
     </ItemTemplate>
    </asp:Repeater>
   </ul>
   <div class="cf"> </div>
   <a id="prev_viewedP" class="prev" href="#">&lt;</a> <a id="next_viewedP" class="next" href="#">&gt;</a></div>
 </div>
</div>
<!--end Viewed Products--> 
<!--Convert Mobile Version-->
<div class="item_side_fix cf hidden">
 <asp:LinkButton ID="Lbadddevice" runat="server" OnClick="Lbadddevice_Click" class="icon_mobile trans"></asp:LinkButton>
</div>
<!--end Convert Mobile Version--> 
