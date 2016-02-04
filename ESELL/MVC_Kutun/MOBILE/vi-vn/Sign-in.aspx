<%@ Page Title="" Language="C#" MasterPageFile="~/MOBILE/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Sign-in.html.cs" Inherits="MVC_Kutun.MOBILE.vi_vn.Sign_in" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="path">
        <a href="/">Trang chủ</a> » <a href="#">Đăng nhập</a></div>
    <!--Login Page-->
    <div class="box" id="account">
        <div class="box_Tab">
            Đăng nhập</div>
        <!--Form Login-->
        <div class="box_ct login_form form_web">
            <div class="row_account">
                <label class="item_title" for="formEmail">
                    Địa chỉ email: <span class="required">*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng nhập địa chỉ email "
                            ControlToValidate="txtemail" Display="Dynamic" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator></span>
                </label>
                <input type="text" id="txtemail" name="txtemail" class="inputbox" runat="server"
                    placeholder='Địa chỉ email'>
            </div>
            <div class="row_account">
                <label class="item_title" for="formEmail">
                    Mật khẩu: <span class="required">*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập mật khẩu "
                            ControlToValidate="txtpass" Display="Dynamic" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator></span>
                </label>
                <input type="password" id="txtpass" name="txtpass" class="inputbox" runat="server"
                    placeholder='Mật khẩu' clientidmode="Static">
            </div>
            <div class="row_account text">
                <asp:CheckBox ID="Checktyepass" runat="server" Text="Hiện mật khẩu" onclick="changetype(this);" />
            </div>
            <div class="row_account text">
                <asp:LinkButton ID="Lblogin" runat="server" class="btn_web btn_payment" OnClick="Lblogin_Click"
                    ValidationGroup="G5">Đăng nhập</asp:LinkButton>
            </div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                ShowSummary="False" ValidationGroup="G5" />
            <div class="row_account text">
                <a class="forgot_pass" href="/m-quen-mat-khau.html">Quên mật khẩu?</a></div>
            <div class="row_account text">
                <a class="forgot_pass" href="/m-dang-ky.html">Bạn chưa có tài khoản?</a>
            </div>
        </div>
        <!--End Form Login-->
    </div>
    <!--End Login Page-->
    <script>
        function changetype(vl) {
            if (vl.checked) {
                var pass = document.getElementById("txtpass");
                pass.setAttribute("type", "text");

            }
            else {
                var pass = document.getElementById("txtpass");
                pass.setAttribute("type", "password");
            }
        }
    </script>
</asp:Content>
