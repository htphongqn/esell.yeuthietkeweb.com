<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Payment-finish.aspx.cs" Inherits="MVC_Kutun.vi_vn.Payment_finish" %>

<%@ Register Src="../UIs/cartInfoFinal.ascx" TagName="cartInfoFinal" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="Stylesheet" type="text/css" href="../vi-vn/Styles/process_payment.css" />
    <!--Order Success-->
    <div class="box_payment_ct">
        <div style="padding: 20px; float: left; width: 50%">
            <h1 class="chkSucP-orderInfo-hdl" style="margin-bottom: 10px">
                <i class="icn_social icn_social-checked_26x26"></i>
                <img width="70" height="70" src="../vi-vn/Images/success.png" style="float: left;
                    margin-right: 5px"><span class="large">Chân thành cám ơn bạn đã đặt mua hàng tại Esell.vn</span><br />
                Chúng tôi đã tiếp nhận đơn hàng của bạn và sẽ giao hàng cho bạn trong thời gian
                sớm nhất!</h1>
            <div class="row">
                <span>Mã đơn hàng:
                    <asp:Label ID="Lbcode" runat="server" Text="" ForeColor="Blue"></asp:Label>
                </span>
            </div>
            <div class="row">
                <div style="width: 78%">
                    <span>- Địa chỉ giao hàng:
                        <asp:Label ID="Lbaddress" runat="server" Text=""></asp:Label>
                    </span>
                </div>
            </div>
            <div class="row">
                <span>- Số điện thoại:
                    <asp:Label ID="Lbphone" runat="server" Text=""></asp:Label>
                </span>
            </div>
            <div class="row">
                Chúng tôi đã gởi cho bạn một email xác nhận với đầy đủ thông tin chi tiết (Vui lòng
                kiểm tra hộp thư đến hoặc spam)
            </div>
            <div class="row">
                <a href="/" class="btn_web btn_account">Trở về trang chủ »</a>
            </div>
        </div>
        <div class="info_transport form_web pay-form" style="float: right; width: 40%; padding: 15px 30px">
            <uc1:cartInfoFinal ID="cartInfoFinal1" runat="server" />
        </div>
    </div>
    <!--end Order Success-->
</asp:Content>
