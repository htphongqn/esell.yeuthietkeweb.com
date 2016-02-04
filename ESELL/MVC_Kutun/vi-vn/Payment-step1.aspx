<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master-payment.Master" AutoEventWireup="true"
    CodeBehind="Payment-step1.aspx.cs" Inherits="MVC_Kutun.vi_vn.Payment_step1" %>

<%@ Register Src="../UIs/forgetpass.ascx" TagName="forgetpass" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Ctimg" runat="server">
    <ul>
        <li class="current" id="step1"><span class="number icon_step1">1</span><span class="title_step">Đăng
            nhập</span></li>
        <li id="step2"><span class="number icon_step2">2</span><span class="title_step">Thông
            tin giao hàng</span></li>
        <li id="step3"><span class="number icon_step3">3</span><span class="title_step">Cách
            thức thanh toán</span></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box_payment_left process_payment fl" id="account_info">
        <div class="box_payment_ct">
            <div class="tt_payment_step">
                Đăng nhập</div>
            <div id="payment_step1" class="form_web">
                <asp:RadioButtonList ID="Rdchecklogin" runat="server" onchange="changeform();" class="rb">
                    <asp:ListItem Value="0" Selected="True" Text="Đặt hàng mà không cần đăng ký"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Tôi đã có tài khoản tại Esell.vn"></asp:ListItem>
                </asp:RadioButtonList>
                <div style="display: none" id="div_login">
                    <div class="row_account">
                        <input type="text" name="txtemail" id="txtemail" class="txtpassdangnhap" placeholder="Địa chỉ email *"
                            onkeypress="if(event.which || event.keyCode || event.charCode){if ((event.charCode == 13) || (event.which == 13) || (event.keyCode == 13)) {document.getElementById('ContentPlaceHolder1_btntieptuc').click();return false;}} else {return true}; "
                            runat="server">
                    </div>
                    <div class="row_account">
                        <input type="password" name="txtpass" id="txtpass" class="txtpassdangnhap" placeholder="Mật khẩu *"
                            onkeypress="if(event.which || event.keyCode || event.charCode){if ((event.charCode == 13) || (event.which == 13) || (event.keyCode == 13)) {document.getElementById('ContentPlaceHolder1_btntieptuc').click();return false;}} else {return true}; "
                            runat="server">
                        &nbsp;<a class="forgot_pass" href="javascript:void(0)" onclick="showquyenmk();">Quên
                            mật khẩu?</a></div>
                </div>
                <div class="row_account">
                    <asp:Button ID="btnNext" runat="server" Text="Tiếp tục »" class="btn_web btn_account"
                        OnClick="btnNext_Click" />
                </div>
            </div>
        </div>
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
        <uc1:forgetpass ID="forgetpass1" runat="server" />
    </div>
</asp:Content>
