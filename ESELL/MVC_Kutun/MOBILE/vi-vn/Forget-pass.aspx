<%@ Page Title="" Language="C#" MasterPageFile="~/MOBILE/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Forget-pass.aspx.cs" Inherits="MVC_Kutun.MOBILE.vi_vn.Forget_pass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="path">
        <a href="/">Trang chủ</a> » <a href="#">Quên mật khẩu</a></div>
    <!--Login Page-->
    <div class="box" id="account">
        <div class="box_Tab">
            Quên mật khẩu</div>
        <!--Form Login-->
        <div class="box_ct login_form form_web">
            <div class="row_account">
                <input type="text" id="txtemail" name="txtemail" class="inputbox" runat="server"
                    placeholder="Địa chỉ email *">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập địa chỉ email"
                    ControlToValidate="txtemail" Display="Dynamic" ForeColor="Red" ValidationGroup="G7"
                    CssClass="tlp-error">*</asp:RequiredFieldValidator>
            </div>
            <div class="row_account">
                <input type="text" id="Textcapchaforget" name="Textcapchaforget" class="inputbox"
                    runat="server" placeholder="Mã bảo vệ *">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Vui lòng nhập mã bảo mật"
                    ControlToValidate="Textcapchaforget" Display="Dynamic" ForeColor="Red" ValidationGroup="G7">*</asp:RequiredFieldValidator>
            </div>
            <div class="row_account">
                <asp:Image ID="Image1" runat="server" ImageUrl="../vi-vn/CImage.aspx" Width="170px"
                    alt="" />
            </div>
            <div class="row_account text">
                <asp:LinkButton ID="Lbforget" runat="server" class="btn_web btn_payment" OnClick="Lbforget_Click"
                    ValidationGroup="G7">Gửi</asp:LinkButton>
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                    ShowSummary="False" ValidationGroup="G7" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail"
                    ErrorMessage="Địa chỉ email chưa đúng" ForeColor="Red" SetFocusOnError="True"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="G7"></asp:RegularExpressionValidator>
                <br />
                <asp:Label ID="Lbforgeterrors" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <!--End Form Login-->
    </div>
    <!--End Login Page-->
</asp:Content>
