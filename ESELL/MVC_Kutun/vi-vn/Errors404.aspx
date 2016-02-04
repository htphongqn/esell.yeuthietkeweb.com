<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Errors404.aspx.cs" Inherits="MVC_Kutun.vi_vn.Errors404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 98%; float: left; padding: 5px 5px; line-height: 150%; margin-bottom: 10px;">
        <a href="/">
            <img border="0" usemap="#Map" src="/vi-vn/Images/404-Error-Page-Design.png" style="float: right;
                margin-left: 30px;" /></a>
                    <p style="margin-bottom: 10px; font-size: 14px; line-height: 150%""> <strong style=" color: #CC0000;font-size:20px">Thông báo</strong><br />
            <br />
            Không tìm thấy thông tin bạn cần tìm. Thông tin không tồn tại hoặc đã được gỡ bỏ
            khỏi hệ thống. Hãy thử những điều sau đây:</p>
          <ul style="list-style: circle">
            <li style="margin-bottom: 10px; list-style: circle; margin-left: 20px">Hãy chắc chắn
              rằng địa chỉ trang web hiển thị trong thanh địa chỉ của trình duyệt của bạn được
              viết và định dạng một cách chính xác</li>
            <li style="margin-bottom: 10px; list-style: circle; margin-left: 20px">Nếu bạn đã đạt
              đến trang này bằng cách nhấp chuột vào một liên kết, liên hệ với chúng tôi để thông
              báo cho chúng tôi liên kết không đúng định dạng</li>
          </ul>
    </div>
</asp:Content>
