<%@ Page Title="" Language="C#" MasterPageFile="~/MOBILE/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Change-pass.aspx.cs" Inherits="MVC_Kutun.MOBILE.vi_vn.Change_pass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="path">
        <a href="/">Trang chủ</a> » <a class="aLink1" href="/m-quan-ly-tai-khoan.html">Tài khoản
            của tôi</a> » <a href="#">Đổi mật khẩu</a></div>
    <!--Login Page-->
    <div class="box" id="account">
        <div class="box_Tab">
            Đổi mật khẩu</div>
        <!--Form Login-->
        <div class="box_ct login_form form_web">
            <div class="row_account">
                <label class="item_title" for="formEmail">
                    Mật khẩu cũ: <span class="required">*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập mật khẩu cũ"
                            ControlToValidate="txtpassOld" Display="Dynamic" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator>
                    </span>
                </label>
                <asp:TextBox ID="txtpassOld" runat="server" CssClass="inputbox" TextMode="Password"
                    placeholder="Mật khẩu cũ *" ClientIDMode="Static"></asp:TextBox>
            </div>
            <div class="row_account">
                <label class="item_title" for="formEmail">
                    Mật khẩu mới: <span class="required">*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập mật khẩu mới"
                            ControlToValidate="txtpassNew" Display="Dynamic" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator>
                    </span>
                </label>
                <asp:TextBox ID="txtpassNew" runat="server" CssClass="inputbox" TextMode="Password"
                    placeholder="Mật khẩu mới *" ClientIDMode="Static"></asp:TextBox>
            </div>
            <div class="row_account">
                <label class="item_title" for="formEmail">
                    Nhập lại mật khẩu: <span class="required">*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng nhập lại mật khẩu "
                            ControlToValidate="txtrepass" Display="Dynamic" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator></span>
                </label>
                <asp:TextBox ID="txtrepass" runat="server" CssClass="inputbox" TextMode="Password"
                    placeholder="Gõ lại mật khẩu *" ClientIDMode="Static"></asp:TextBox>
            </div>
            <div class="row_account">
                <asp:CheckBox ID="Checktyepass" runat="server" Text="Hiện mật khẩu" onclick="changetype(this);" />
            </div>
            <div class="row_account">
                <span class="required">* Thông tin bắt buộc</span></div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                ShowSummary="False" ValidationGroup="G5" />
            <div class="row_account">
                <asp:Button ID="btnSave" runat="server" Text="Lưu" ValidationGroup="G5" CssClass="btn_web btn_payment"
                    OnClick="btnSave_Click" />
                <asp:CompareValidator ID="comparePasswords" runat="server" ControlToCompare="txtpassNew"
                    ControlToValidate="txtrepass" ErrorMessage="Mật khẩu gõ lại nhập không đúng"
                    Display="Dynamic" ForeColor="Red" />
            </div>
        </div>
        <!--End Form Login-->
    </div>
    <!--End Login Page-->
    <script>
        function validate(vl, type) {
            var arrnotify = "";
            switch (type) {
                case 0: arrnotify = "Vui lòng nhập mật khẩu cũ"; break;
                case 1: arrnotify = "Vui lòng nhập mật khẩu mới"; break;
                case 2: arrnotify = "Vui lòng gõ lại mật khẩu"; break;

            }

            if (vl.value == "")
                vl.setCustomValidity(arrnotify);
            else {
                if (type == 2) {
                    if (document.getElementById("txtpassNew").value != vl.value)
                        vl.setCustomValidity("Mật khẩu gõ lại không giống");
                    else
                        vl.setCustomValidity('');
                }
                else
                    vl.setCustomValidity('');
            }

        }
    </script>
    <script>
        function changetype(vl) {
            if (vl.checked) {
                var passold = document.getElementById("txtpassOld");
                var passnew = document.getElementById("txtpassNew");
                var passconfim = document.getElementById("txtrepass");
                passold.setAttribute("type", "text");
                passnew.setAttribute("type", "text");
                passconfim.setAttribute("type", "text");
            }
            else {
                var passold = document.getElementById("txtpassOld");
                var passnew = document.getElementById("txtpassNew");
                var passconfim = document.getElementById("txtrepass");
                passold.setAttribute("type", "password");
                passnew.setAttribute("type", "password");
                passconfim.setAttribute("type", "password");
            }
        }
    </script>
</asp:Content>
