<%@ Page Title="" Language="C#" MasterPageFile="~/MOBILE/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Payment-finish.aspx.cs" Inherits="MVC_Kutun.MOBILE.vi_vn.Payment_finish" %>

<%@ Register Src="../UIs/cartinfoFinal.ascx" TagName="cartinfoFinal" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Login Page-->
    <div class="box" style="margin-top: 10px">
        <!--Order Success-->
        <div id="orderInfo">
            <div style="padding: 20px">
                <div align="center">
                    <img width="100" src="../MOBILE/vi-vn/Images/succe.png" /></div>
                <p>
                    <span style="font-size: 18px; line-height: 1.2">Chân thành cám ơn bạn đã đặt mua hàng
                        tại Esell.vn</span></p>
                <p>
                    <span style="font-size: 18px; line-height: 1.2">Chúng tôi đã tiếp nhận đơn hàng
                    của bạn và sẽ giao hàng cho bạn trong thời gian sớm nhất!</p>
                <div class="row" style="margin-bottom: 10px">
                    Mã đơn hàng:
                    <asp:Label ID="Lbcode" runat="server" Text="" ForeColor="Blue"></asp:Label><br />
                    - Họ và tên:
                    <asp:Label ID="Lbname" runat="server" Text=""></asp:Label><br />
                    - Địa chỉ giao hàng:
                    <asp:Label ID="Lbaddress" runat="server" Text=""></asp:Label><br />
                    - Số điện thoại:
                    <asp:Label ID="Lbphone" runat="server" Text=""></asp:Label>
                </div>
                <uc1:cartinfoFinal ID="cartinfoFinal1" runat="server" />
                <div class="row">
                    <p>
                        Chúng tôi đã gởi cho bạn một email xác nhận với đầy đủ thông tin chi tiết (Vui lòng
                        kiểm tra hộp thư đến hoặc thư mục spam).</p>
                    <p>
                        Bạn có thể tra cứu tình trạng đơn hàng tại <a href="/m-kiem-tra-don-hang.html" style="color: #FF9900;
                            text-decoration: underline">đây</a>.</p>
                </div>
                <div class="row" style="text-align: center; margin-bottom: 15px">
                    <a href="/" class="btn_web btn_payment">Trở về trang chủ »</a>
                </div>
            </div>
        </div>
        <!--Order Success-->
    </div>
    <!--End Login Page-->
    </span>
</asp:Content>
