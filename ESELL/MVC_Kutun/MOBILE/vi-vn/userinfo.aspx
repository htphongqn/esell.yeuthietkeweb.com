<%@ Page Title="" Language="C#" MasterPageFile="~/MOBILE/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="userinfo.aspx.cs" Inherits="MVC_Kutun.MOBILE.vi_vn.userinfo" %>

<%@ Register Src="../../Calendar/pickerAndCalendar.ascx" TagName="pickerAndCalendar"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../Calendar/calendarStyle.css" rel="stylesheet" type="text/css" />
    <div class="path">
        <a href="/">Trang chủ</a> » <a class="aLink1" href="/m-quan-ly-tai-khoan.html">Tài khoản
            của tôi</a> » <a href="#">Thông tin cá nhân</a></div>
    <!--Login Page-->
    <div class="box" id="account">
        <div class="box_Tab">
            Thông tin cá nhân</div>
        <!--Form Login-->
        <div class="box_ct login_form form_web">
            <div class="row_account">
                <span class="left">Địa chỉ email:</span> <font color="blue">
                    <asp:Label ID="Lbemail" runat="server" Text="Label"></asp:Label></font>
            </div>
            <div class="row_account" id="div_code" runat="server">
                <span class="left">Mã đại lý:</span> <font color="blue">
                    <asp:Label ID="lbcodePartner" runat="server" Text="" ForeColor="Blue"></asp:Label></font>
            </div>
            <div class="row_account">
                <label class="item_title" for="formEmail">
                    Họ và tên <span class="required">*
                        <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Vui lòng nhập họ và tên"
                            ControlToValidate="Txtname" Display="Dynamic" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator>
                    </span>
                </label>
                <asp:TextBox ID="Txtname" runat="server" class="inputbox" placeholder="Họ và tên *"></asp:TextBox>
            </div>
            <div class="row_account">
                <label class="item_title" for="formEmail">
                    Số điện thoại: <span class="required">*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng nhập số điện thoại"
                            ControlToValidate="Txtphone" Display="Dynamic" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator></span>
                </label>
                <asp:TextBox ID="Txtphone" runat="server" class="inputbox" placeholder="Số điện thại *"></asp:TextBox>
            </div>
            <div class="row_account" id="div_codebank" runat="server">
                <asp:TextBox ID="txtCodebank" runat="server" class="inputbox" placeholder="Tài khoản ngân hàng"></asp:TextBox>
            </div>
            <div class="row_account">
                <asp:DropDownList ID="Drday" runat="server" class="inputbox accountBirthDay">
                </asp:DropDownList>
                <asp:DropDownList ID="Drmoth" runat="server" class="inputbox accountBirthDay">
                </asp:DropDownList>
                <asp:DropDownList ID="Dryear" runat="server" class="inputbox accountBirthDay">
                </asp:DropDownList>
            </div>
            <div class="row_account">
                <asp:DropDownList ID="Drsex" runat="server" CssClass="inputbox">
                    <asp:ListItem Value="0" Text="Nam" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Nữ"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Khác"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                ShowSummary="False" ValidationGroup="G5" />
            <div class="row_account">
                <asp:Button ID="btnSave" runat="server" Text="Lưu" ValidationGroup="G5" CssClass="btn_web btn_payment"
                    OnClick="btnSave_Click" />
            </div>
        </div>
        <!--End Form Login-->
    </div>
    <!--End Login Page-->
    <script>
        function validate(vl, type) {
            var arrnotify = "";
            var emailformatnotify = "Địa chỉ email không đúng";
            var phoneformatnotify = "Số điện thoại không đúng";
            switch (type) {
                case 0: arrnotify = "Vui lòng nhập họ và tên"; break;
                case 1: arrnotify = "Vui lòng nhập số điện thoại"; break;
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
                vl.setCustomValidity('');
            }
        }
    </script>
</asp:Content>
