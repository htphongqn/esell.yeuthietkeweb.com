<%@ Page Title="" Language="C#" MasterPageFile="~/MOBILE/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Contact.aspx.cs" Inherits="MVC_Kutun.MOBILE.vi_vn.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .row_contact
        {
            margin: 5px 0;
        }
    </style>
    <style type="text/css">
        input:required:invalid, input:focus:invalid
        {
            background-image: url(/MOBILE/vi-vn/images/invalid.png);
            background-position: right 50%;
            background-repeat: no-repeat;
        }
        input:required:valid
        {
            background-image: url(/MOBILE/vi-vn/images/valid.png);
            background-position: right 50%;
            background-repeat: no-repeat;
        }
    </style>
    <div class="path">
        <a href="/">Trang chủ</a> » <a href="#">Liên hệ</a></div>
    <!--Login Page-->
    <div class="box" id="account">
        <div class="box_Tab">
            Liên hệ</div>
        <!--Form Login-->
        <div class="box_ct login_form form_web">
            <div class="row_contact">
                <div class="right_row">
                    <input type="text" class="inputbox" id="Txtname" runat="server" placeholder="Họ và tên *"
                        required oninvalid="validate(this,0);" oninput="validate(this,0);">
                </div>
            </div>
            <div class="row_contact">
                <div class="right_row">
                    <input type="text" class="inputbox" id="Txtaddress" runat="server" placeholder="Số nhà, tên đường, phường/xã ... *"
                        required oninvalid="validate(this,1);" oninput="validate(this,1);">
                </div>
            </div>
            <div class="row_contact">
                <div class="right_row">
                    <input type="text" class="inputbox" id="Txtphone" runat="server" placeholder="Số điện thoại *"
                        required pattern="^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d{9,40}$" oninvalid="validate(this,2);"
                        oninput="validate(this,2);">
                </div>
            </div>
            <div class="row_contact">
                <div class="right_row">
                    <input type="text" class="inputbox" id="txtEmail" runat="server" placeholder="Địa chỉ email *"
                        required pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" oninvalid="validate(this,3);"
                        oninput="validate(this,3);">
                </div>
            </div>
            <div class="row_contact">
                <div class="right_row">
                    <input type="text" class="inputbox" id="txttitle" runat="server" placeholder="Tiêu đề *"
                        required oninvalid="validate(this,4);" oninput="validate(this,4);">
                </div>
            </div>
            <div class="row_contact">
                <div class="right_row">
                    <textarea cols="45" rows="10" id="txtContent" runat="server" class="inputbox" placeholder="Nội dung liên hệ *"
                        required oninvalid="validate(this,5);" oninput="validate(this,5);"></textarea>
                </div>
            </div>
            <div class="row_contact">
                <div class="right_row">
                    <input type="text" class="inputbox" id="txtCapcha" runat="server" placeholder="Mã bảo vệ *"
                        required oninvalid="validate(this,6);" oninput="validate(this,6);">
                </div>
            </div>
            <div class="row_contact">
                <label class="left_row">
                </label>
                <div class="right_row">
                    <asp:Image ID="Image1" runat="server" ImageUrl="../vi-vn/CImage.aspx" Width="150px" />
                </div>
            </div>
            <div class="row_contact">
                <label class="left_row">
                </label>
                <div class="right_row">
                    <asp:Button ID="btnSend" runat="server" Text="Gửi" class="btn_web send_cmt btn_payment"
                        ValidationGroup="G40" OnClick="btnSend_Click" />
                </div>
            </div>
            <div style="text-align: center">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                    ShowSummary="False" ValidationGroup="G40" />
                <asp:Label ID="lblresult" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>
        <!--End Form Login-->
    </div>
    <!--End Login Page-->
    <script type="text/javascript">
        function reset() {
            var name = document.getElementById("<%= Txtname.ClientID %>");
            var email = document.getElementById("<%= txtEmail.ClientID %>");
            var add = document.getElementById("<%= Txtaddress.ClientID %>");
            var desc = document.getElementById("<%= txtContent.ClientID %>");
            var phone = document.getElementById("<%= Txtphone.ClientID %>");
            var title = document.getElementById("<%= txttitle.ClientID %>");
            var capcha = document.getElementById("<%= txtCapcha.ClientID %>");
            name.value = email.value = add.value = desc.value = phone.value = title.value = capcha.value = "";
        }
    </script>
    <script>
        function validate(vl, type) {
            var arrnotify = "";
            var emailformatnotify = "Địa chỉ email không đúng";
            var phoneformatnotify = "Số điện thoại không đúng";
            switch (type) {
                case 0: arrnotify = "Vui lòng nhập họ và tên"; break;
                case 1: arrnotify = "Vui lòng nhập địa chỉ"; break;
                case 2: arrnotify = "Vui lòng nhập số điện thoại"; break;
                case 3: arrnotify = "Vui lòng nhập email"; break;
                case 4: arrnotify = "Vui lòng nhập tiêu đề"; break;
                case 5: arrnotify = "Vui lòng nhập nội dung"; break;
                case 6: arrnotify = "Vui lòng nhập mã bảo vệ"; break;
            }
            if (vl.value == "")
                vl.setCustomValidity(arrnotify);
            else if (vl.validity.patternMismatch) {
                if (type == 3)
                    vl.setCustomValidity(emailformatnotify);
                else
                    vl.setCustomValidity(phoneformatnotify);
            }
            else {
                vl.setCustomValidity('');
            }
        }
    </script>
</asp:Content>
