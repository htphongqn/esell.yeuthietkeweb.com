<%@ Page Title="" Language="C#" MasterPageFile="~/MOBILE/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Payment-step1.aspx.cs" Inherits="MVC_Kutun.MOBILE.vi_vn.Payment_step1" %>

<%@ Register Src="../UIs/cart.ascx" TagName="cart" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Login Page-->
    <div class="progress-bar current-step-1">
        <ul>
            <li class="current">1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
        </ul>
    </div>
    <div class="box" id="account">
        <div class="box_Tab">
            Đăng nhập</div>
        <asp:RadioButtonList ID="Rdchecklogin" runat="server" onchange="changeform();" class="rb">
            <asp:ListItem Value="0" Selected="True" Text=" Đặt hàng mà không cần đăng ký"></asp:ListItem>
            <asp:ListItem Value="1" Text="Tôi đã có tài khoản tại esell.vn"></asp:ListItem>
        </asp:RadioButtonList>
        <!--Form Login-->
        <div class="box_ct login_form form_web">
            <div style="display: none" id="div_login">
                <div class="row_account">
                    <input type="text" id="txtemail" name="txtemail" class="inputbox" runat="server"
                        placeholder="Địa chỉ email *">
                </div>
                <div class="row_account">
                    <input type="password" id="txtpass" name="txtpass" class="inputbox" runat="server"
                        placeholder="Mật khẩu *">
                </div>
                <div class="row_account text">
                    <a class="forgot_pass fright" id="" href="/m-quen-mat-khau.html"><u>Quên mật khẩu?</u></a></div>
            </div>
            <div class="row_account text">
                <asp:Button ID="btnNext" runat="server" Text="Tiếp tục »" class="btn_web btn_payment"
                    OnClick="btnNext_Click" />
            </div>
        </div>
        <!--End Form Login-->
    </div>
    <!--End Login Page-->
    <!--order_info-->
    <div class="box" style="display: none">
        <uc1:cart ID="cart1" runat="server" />
    </div>
    <!--order_info-->
    <script type="text/javascript">
        $(function () {
            var idrd = $('#<%=Rdchecklogin.ClientID %> input[type=radio]:checked').val();
            if (idrd == 0)
                document.getElementById("div_login").style.display = "none";
            else document.getElementById("div_login").style.display = "block";
        });
        function changeform() {
            var idrd = $('#<%=Rdchecklogin.ClientID %> input[type=radio]:checked').val();
            if (idrd == 0)
                document.getElementById("div_login").style.display = "none";
            else document.getElementById("div_login").style.display = "block";
        }
    </script>
</asp:Content>
