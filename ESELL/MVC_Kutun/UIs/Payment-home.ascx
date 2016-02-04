<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Payment-home.ascx.cs"
    Inherits="MVC_Kutun.UIs.Payment_home" %>
<div class="form_header font3">
    THÔNG TIN NGƯỜI NHẬN HÀNG</div>
<div style="text-align: center">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
        ShowSummary="False" ValidationGroup="G50" />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtphone"
        ErrorMessage="Số điện thoại ít nhất 10 số và không khoảng trống" SetFocusOnError="True"
        ValidationExpression="^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d{9,40}$" ForeColor="Red"
        ValidationGroup="G50"></asp:RegularExpressionValidator>
    <br />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail"
        ErrorMessage="Email Định Dạng Chưa Đúng" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
        ForeColor="Red" ValidationGroup="G50"></asp:RegularExpressionValidator>
</div>
<div class="row_account">
    <label class="item_title" for="formFullname">
        Họ tên:<span class="required">*</span></label>
    <div class="right_row_account fr">
        <input class="txtpassdangnhap" type="text" name="txtname" id="txtname" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập tên"
            ControlToValidate="txtname" Display="Dynamic" ForeColor="Red" ValidationGroup="G50">*</asp:RequiredFieldValidator>
    </div>
</div>
<div class="row_account">
    <label class="item_title" for="formEmail">
        Email liên lạc:<span class="required">*</span></label>
    <div class="right_row_account fr">
        <input class="txtpassdangnhap" type="text" name="txtemail" id="txtemail" placeholder="Ví dụ: name@gmail.com"
            runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập email"
            ControlToValidate="txtemail" Display="Dynamic" ForeColor="Red" ValidationGroup="G50">*</asp:RequiredFieldValidator>
    </div>
</div>
<div class="row_account">
    <label class="item_title" for="formPhone">
        Điện thoại liên lạc:<span class="required">*</span></label>
    <div class="right_row_account fr">
        <input class="txtpassdangnhap" type="text" name="txtphone" id="txtphone" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập số điện thoại"
            ControlToValidate="txtphone" Display="Dynamic" ForeColor="Red" ValidationGroup="G50">*</asp:RequiredFieldValidator>
    </div>
</div>
<div class="row_account">
    <label class="item_title" for="formMessage">
        Lời nhắn:</label>
    <div class="right_row_account fr">
        <textarea placeholder="Vui lòng điền thông tin màu sắc, kích thước, thời gian …… để chúng tôi phục vụ tốt hơn"
            id="txtremark" name="txtremark" class="txtpassdangnhap" style="height: 100px"
            runat="server"></textarea>
    </div>
</div>
<div class="row_account" style="margin: 10px 0 0 146px">
    <p class="required">
        Lưu ý: (*) là thông tin bắt buộc nhập
    </p>
    <p>
        <asp:LinkButton ID="lbNext" runat="server" class="btn_web btn_account" OnClick="lbNext_Click"
            ValidationGroup="G50">Tiếp tục</asp:LinkButton>
    </p>
</div>
