<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Payment-giaohangtannoi.ascx.cs"
    Inherits="MVC_Kutun.UIs.Payment_giaohangtannoi" %>
<div class="row_account">
    <label class="item_title" for="formEmail">
        Địa chỉ email:<span class="required">*
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Vui lòng nhập địa chỉ email"
                ControlToValidate="txtemail" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span></label>
    <div class="right_row_account fr">
        <input class="txtpassdangnhap" type="text" name="formEmail" id="txtemail" runat="server" />
    </div>
</div>
<div class="row_account">
    <label class="item_title" for="formFullname">
        Họ và tên:<span class="required">*
            <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Vui lòng nhập họ và tên"
                ControlToValidate="Txtname" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span></label>
    <div class="right_row_account fr">
        <input class="txtpassdangnhap" type="text" name="formFullname" id="Txtname" runat="server"
            clientidmode="Static" />
    </div>
</div>
<div class="row_account">
    <label class="item_title" for="formPhone">
        Số điện thoại:<span class="required">*
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập số điện thoại"
                ControlToValidate="txtphone" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span></label>
    <div class="right_row_account fr">
        <input class="txtpassdangnhap" type="text" name="formPhone" id="txtphone" runat="server" />
    </div>
</div>
<div class="row_account">
    <label class="item_title" for="formAddress">
        Địa chỉ:<span class="required">*
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng nhập địa chỉ (số nhà, tên đường, phường/xã ..)"
                ControlToValidate="txtadd" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span></label>
    <div class="right_row_account fr">
        <input class="txtpassdangnhap" type="text" name="formAddress" id="txtadd" placeholder="Số nhà, tên đường, phường/xã ..."
            runat="server" />
    </div>
</div>
<div class="row_account">
    <label class="item_title" for="formCountry">
        Tỉnh/thành phố:<span class="required">*
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Vui lòng chọn tỉnh/thành phố"
                ControlToValidate="Drcity" Display="Dynamic" ForeColor="Red" ValidationGroup="G40"
                InitialValue="0">*</asp:RequiredFieldValidator></span></label>
    <div class="right_row_account fr">
        <asp:DropDownList ID="Drcity" runat="server" class="sl_form_web" AutoPostBack="True"
            OnSelectedIndexChanged="Drcity_SelectedIndexChanged">
        </asp:DropDownList>
    </div>
</div>
<div class="row_account">
    <label class="item_title" for="formDistrict">
        Quận/huyện:<span class="required">*
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng chọn quận/huyện"
                ControlToValidate="Drdistric" Display="Dynamic" ForeColor="Red" ValidationGroup="G40"
                InitialValue="0">*</asp:RequiredFieldValidator></span></label>
    <div class="right_row_account fr">
        <asp:DropDownList ID="Drdistric" runat="server" class="sl_form_web" AutoPostBack="True"
            OnSelectedIndexChanged="Drdistric_SelectedIndexChanged">
        </asp:DropDownList>
    </div>
</div>
<%--<div class="row_account">
    <label class="item_title" for="formDate">
        Thời gian giao:<span class="required">*<asp:RequiredFieldValidator ID="RequiredFieldValidator4"
            runat="server" ErrorMessage="Chưa chọn thời gian giao" ControlToValidate="txtdate"
            Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span></label>
    <div class="right_row_account fr">
        <input type="text" data-beatpicker="true" data-beatpicker-position="['right','*']"
            data-beatpicker-module="clear" data-beatpicker-format="['DD','MM','YYYY'],separator:'/'"
            class="date depDate hasDatepicker txtpassdangnhap fl" id="txtdate" name="flights-checkin"
            runat="server" />
    </div>
</div>--%>
<div class="row_account">
    <label class="item_title" for="formMessage">
        Lời nhắn:</label>
    <div class="right_row_account fr">
        <textarea placeholder="Ghi chú thêm về màu sắc, kích thước, thời gian giao hàng .. để chúng tôi phục vụ tốt hơn"
            id="txtnote" name="txtnote" class="txtpassdangnhap" style="height: 100px" runat="server"></textarea>
    </div>
</div>
<div class="row_account" style="margin: 10px 0 0 146px">
    <p class="required">
        Lưu ý: (*) là thông tin bắt buộc nhập
    </p>
    <asp:LinkButton ID="lbnext" runat="server" class="btn_web btn_account" OnClick="lbnext_Click"
        ValidationGroup="G40">Tiếp tục »</asp:LinkButton>
</div>
<div style="text-align: center">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
        ShowSummary="False" ValidationGroup="G40" />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtphone"
        ErrorMessage="Số điện thoại ít nhất 10 số và không khoảng trống" SetFocusOnError="True"
        ValidationExpression="^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d{9,40}$" ForeColor="Red"
        ValidationGroup="G40"></asp:RegularExpressionValidator>
    <br />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail"
        ErrorMessage="Email Định Dạng Chưa Đúng" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
        ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
</div>
<link rel="stylesheet" href="../vi-vn/Styles/BeatPicker.min.css" />
<script  src="../vi-vn/Scripts/BeatPicker.min.js" type="text/javascript" ></script>
