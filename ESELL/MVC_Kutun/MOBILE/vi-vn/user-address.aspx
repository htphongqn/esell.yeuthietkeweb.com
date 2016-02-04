<%@ Page Title="" Language="C#" MasterPageFile="~/MOBILE/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="User-address.aspx.cs" Inherits="MVC_Kutun.MOBILE.vi_vn.User_address" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="path">
        <a href="/">Trang chủ</a> » <a class="aLink1" href="/m-quan-ly-tai-khoan.html">Tài khoản
            của tôi</a> » <a href="#">Địa chỉ giao hàng</a></div>
    <!--Login Page-->
    <div class="box" id="account">
        <div class="box_Tab">
            Địa chỉ giao hàng</div>
        <!--Form Login-->
        <div class="box_ct login_form form_web">
            <div class="row_account">
                <label class="item_title" for="formEmail">
                    Số nhà, tên đường, phường/xã: <span class="required">*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập số nhà, tên đường, phường/xã"
                            ControlToValidate="Txtadd" Display="Dynamic" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator>
                    </span>
                </label>
                <asp:TextBox ID="Txtadd" runat="server" CssClass="inputbox" placeholder="Số nhà, tên đường, phường/xã ..."></asp:TextBox>
            </div>
            <div class="row_account">
                <label class="item_title" for="formEmail">
                    Tỉnh/thành phố: <span class="required">*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Vui lòng chọn thành phố"
                            ControlToValidate="Drcity" Display="Dynamic" ForeColor="Red" ValidationGroup="G5"
                            InitialValue="0">*</asp:RequiredFieldValidator>
                    </span>
                </label>
                <asp:DropDownList ID="Drcity" runat="server" CssClass="inputbox" AutoPostBack="True"
                    OnSelectedIndexChanged="Drcity_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="row_account">
                <label class="item_title" for="formEmail">
                    Quận/huyện: <span class="required">*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng chọn quận huyện"
                            ControlToValidate="Drdistric" Display="Dynamic" ForeColor="Red" ValidationGroup="G5"
                            InitialValue="0">*</asp:RequiredFieldValidator>
                    </span>
                </label>
                <asp:DropDownList ID="Drdistric" runat="server" CssClass="inputbox">
                </asp:DropDownList>
            </div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                ShowSummary="False" ValidationGroup="G5" />
            <div class="row_account">
                <asp:Button ID="btnSave" runat="server" Text="Lưu" CssClass="btn_web btn_payment"
                    ValidationGroup="G5" OnClick="btnSave_Click" />
            </div>
        </div>
        <!--End Form Login-->
    </div>
    <!--End Login Page-->
    <script>
        function validate(vl, type) {
            var arrnotify = "";
            switch (type) {
                case 0: arrnotify = "Vui lòng nhập địa chỉ"; break;
                case 1: arrnotify = "Vui lòng chọn tỉnh/thành phố"; break;
                case 2: arrnotify = "Vui lòng chọn quận/huyện"; break;
            }
            if (vl.value == "")
                vl.setCustomValidity(arrnotify);
            else {
                vl.setCustomValidity('');
            }
        }
    </script>
</asp:Content>
