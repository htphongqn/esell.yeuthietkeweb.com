<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="print-page.aspx.cs" Inherits="MVC_Kutun.vi_vn.print_page" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title></title>
<link href="Styles/template.css" rel="stylesheet" type="text/css" />
<asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</head>
<body>
<form id="form1" runat="server">
  <div id="printting">
    <div id="header">
      <asp:Repeater ID="Rplogo" runat="server">
        <ItemTemplate> <%# Getbanner(Eval("BANNER_TYPE"),Eval("BANNER_FIELD1"), Eval("BANNER_ID"), Eval("BANNER_FILE"))%> </ItemTemplate>
      </asp:Repeater>
    </div>
    <div id="function_print">
      <div class="fl"> <a href="JavaScript:window.print()">
        <asp:Image ID="Image2" Width="20px" runat="server" ImageUrl="../vi-vn/Images/btn-print.png" />
        In trang</a></div>
      <div class="fr">
        <asp:Label ID="lbDate" runat="server" Text=""></asp:Label>
      </div>
    </div>
    <div id="main">
      <h2 class="h2Title">
        <asp:Label ID="lbTitle" runat="server" Text=""></asp:Label>
      </h2>
      <div id="detail_news">
        <asp:Literal ID="ltrHtml" runat="server"></asp:Literal>
      </div>
    </div>
  </div>
  <p class="copyright" align="center"> Copyright &copy; 2014 By <strong>Thời Đại Mới</strong> - <a href="http://www.dangcapviet.vn" target="_blank"> Thiết kế website</a> bởi <a href="http://dangcapviet.vn" title="Website đẳng cấp việt" target="_blank"> Đẳng Cấp Việt</a> </p>
  </div>
</form>
</body>
</html>
