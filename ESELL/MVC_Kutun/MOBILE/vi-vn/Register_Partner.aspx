<%@ Page Title="" Language="C#" MasterPageFile="~/MOBILE/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Register_Partner.aspx.cs" Inherits="MVC_Kutun.MOBILE.vi_vn.Register_Partner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
        <a href="/">Trang chủ</a> » <a href="#">Đăng ký</a></div>
    <!--Login Page-->
    <div class="box" id="account">
        <div class="box_Tab">
            Đăng ký</div>
        <!--Form Login-->
        <div class="box_ct login_form form_web">
            <div class="row_account">
                <input type="text" id="txtEmail" name="txtEmail" class="inputbox" runat="server"
                    placeholder="Địa chỉ email *" required pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    oninvalid="validate(this,0);" oninput="validate(this,0);">
            </div>
            <div class="row_account">
                <asp:TextBox ID="txtPassword1" name="txtPassword1" class="inputbox" runat="server"
                    placeholder="Mật khẩu *" required oninvalid="validate(this,1);" oninput="validate(this,1);"
                    ClientIDMode="Static" TextMode="Password"></asp:TextBox>
            </div>
            <div class="row_account">
                <asp:TextBox ID="txtRePassword" name="txtRePassword" class="inputbox" runat="server"
                    placeholder="Mật khẩu *" required oninvalid="validate(this,2);" oninput="validate(this,2);"
                    ClientIDMode="Static" TextMode="Password"></asp:TextBox>
            </div>
            <div class="row_account">
                <input type="text" id="txtName" name="txtName" class="inputbox" runat="server" placeholder="Họ và tên *"
                    required oninvalid="validate(this,3);" oninput="validate(this,3);">
            </div>
            <div class="row_account">
                <asp:DropDownList ID="Drday" runat="server" class="inputbox accountBirthDay" required
                    oninvalid="validate(this,9);" oninput="validate(this,9);">
                </asp:DropDownList>
                <asp:DropDownList ID="Drmoth" runat="server" class="inputbox accountBirthDay" required
                    oninvalid="validate(this,10);" oninput="validate(this,10);">
                </asp:DropDownList>
                <asp:DropDownList ID="Dryear" runat="server" class="inputbox accountBirthDay" required
                    oninvalid="validate(this,11);" oninput="validate(this,11);">
                </asp:DropDownList>
            </div>
            <div class="row_account">
                <asp:RadioButtonList ID="Rdsex" runat="server" class="item_title" RepeatColumns="3">
                    <asp:ListItem Value="0" Text="Nam" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Nữ"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Khác"></asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="row_account">
                <input type="text" id="txtadd" name="txtadd" class="inputbox" runat="server" placeholder="Số nhà, tên đường, phường/xã ... *"
                    required oninvalid="validate(this,4);" oninput="validate(this,4);">
            </div>
            <div class="row_account">
                <asp:DropDownList ID="Drcity" runat="server" class="inputbox" AutoPostBack="True"
                    OnSelectedIndexChanged="Drcity_SelectedIndexChanged" required oninvalid="validate(this,7);"
                    oninput="validate(this,7);">
                </asp:DropDownList>
            </div>
            <div class="row_account">
                <asp:DropDownList ID="Drdistric" runat="server" class="inputbox" required oninvalid="validate(this,8);"
                    oninput="validate(this,8);">
                </asp:DropDownList>
            </div>
            <div class="row_account">
                <input type="text" id="txtphone" name="txtphone" class="inputbox" runat="server"
                    placeholder="Số điện thoại *" required pattern="^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d{9,40}$"
                    oninvalid="validate(this,5);" oninput="validate(this,5);">
            </div>
            <div class="row_account">
                <input type="text" id="txtcodebank" name="txtcodebank" class="inputbox" runat="server"
                    placeholder="Tài khoản ngân hàng">
            </div>
            <div class="row_account">
                <input type="text" id="txtcode" name="txtcode" class="inputbox" runat="server" placeholder='Mã bảo vệ *'
                    required oninvalid="validate(this,6);" oninput="validate(this,6);">
            </div>
            <div class="row_account">
                <asp:Image ID="Image1" runat="server" ImageUrl="../vi-vn/CImage.aspx" Width="170px"
                    alt="" />
            </div>
            <div class="row_account">
                <span class="required">* Thông tin bắt buộc</span>
                <label for="formAg" class="item_title">
                    Tôi đã đọc và đồng ý với <a target="_blank" style="color: #FF0000" href="/quy-che-san-giao-dich.html">
                        quy chế sàn giao dịch</a> của Esell.vn</label>
            </div>
            <div class="row_account text" style="text-align: center">
                <div style="width: 100%">
                    <asp:Button ID="btnRegister" runat="server" Text="Đăng ký" ValidationGroup="G8" Style="width: 50%;
                        display: inline-block; height: auto" class="btn_web btn_payment" OnClick="btnRegister_Click" />
                </div>
            </div>
            <div class="row_account">
                <asp:CheckBox ID="Checkemail" runat="server" Text="Đăng ký nhận tin khuyến mãi qua email"
                    Checked="true" />
            </div>
            <div style="text-align: center">
                <asp:Label ID="Labelerrors" runat="server" Text=""></asp:Label>
            </div>
            <!--End Form Login-->
        </div>
    </div>
    <!--End Login Page-->
    <script>
        function validate(vl, type) {
            var arrnotify = "";
            var emailformatnotify = "Địa chỉ email không đúng";
            var phoneformatnotify = "Số điện thoại không đúng";
            switch (type) {
                case 0: arrnotify = "Vui lòng nhập địa chỉ email"; break;
                case 1: arrnotify = "Vui lòng nhập mật khẩu"; break;
                case 2: arrnotify = "Vui lòng gõ lại mật khẩu"; break;
                case 3: arrnotify = "Vui lòng nhập họ và tên"; break;
                case 4: arrnotify = "Vui lòng nhập địa chỉ"; break;
                case 5: arrnotify = "Vui lòng nhập số điện thoại"; break;
                case 6: arrnotify = "Vui lòng nhập mã bảo vệ"; break;
                case 7: arrnotify = "Vui lòng chọn tỉnh/thành phố"; break;
                case 8: arrnotify = "Vui lòng chọn quận/huyện"; break;
                case 9: arrnotify = "Vui lòng chọn ngày sinh"; break;
                case 10: arrnotify = "Vui lòng chọn tháng sinh"; break;
                case 11: arrnotify = "Vui lòng chọn năm sinh"; break;
            }

            if (vl.value == "")
                vl.setCustomValidity(arrnotify);
            else if (vl.validity.patternMismatch) {
                if (type == 0)
                    vl.setCustomValidity(emailformatnotify);
                else
                    vl.setCustomValidity(phoneformatnotify);
            }
            else {
                if (type == 2) {
                    if (document.getElementById("txtPassword1").value != vl.value)
                        vl.setCustomValidity("Mật khẩu gõ lại không giống");
                    else
                        vl.setCustomValidity('');
                }
                else
                    vl.setCustomValidity('');
            }

        }
    </script>
</asp:Content>
