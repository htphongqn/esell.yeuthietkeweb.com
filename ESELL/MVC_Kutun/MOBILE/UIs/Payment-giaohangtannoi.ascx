<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Payment-giaohangtannoi.ascx.cs"
    Inherits="MVC_Kutun.MOBILE.UIs.Payment_giaohangtannoi" %>
<style>
label
{
    margin-bottom:5px;
    display:block;    
}
</style>
<div class="row_account">
    <label>
        Địa chỉ email:<span class="required">*
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Vui lòng nhập địa chỉ email"
                ControlToValidate="txtemail" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span>
    </label>
    <input class="input-text" type="text" name="formEmail" id="txtemail" placeholder="Địa chỉ email"
        runat="server" />
</div>
<div class="row_account">
    <label>
        Họ và tên:<span class="required">*
            <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Vui lòng nhập họ và tên"
                ControlToValidate="Txtname" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span>
    </label>
    <input class="input-text" type="text" name="formFullname" id="Txtname" placeholder="Họ và tên"
        runat="server" />
</div>
<div class="row_account">
    <label>
        Số điện thoại:<span class="required">*
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập số điện thoại"
                ControlToValidate="txtphone" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span>
    </label>
    <input class="input-text" type="text" name="formPhone" id="txtphone" placeholder="Số điện thoại"
        runat="server" />
</div>
<div class="row_account">
    <label>
        Địa chỉ:<span class="required">*
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng nhập địa chỉ (số nhà, tên đường, phường/xã ..)"
                ControlToValidate="txtadd" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span>
    </label>
    <input class="input-text" type="text" name="formAddress" id="txtadd" placeholder="Số nhà, tên đường, phường/xã ..."
        runat="server" />
</div>
<div class="row_account dropdown_list">
    <label>
        Tỉnh/thành phố:<span class="required">*
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Vui lòng chọn tỉnh/thành phố"
                ControlToValidate="Drcity" Display="Dynamic" ForeColor="Red" ValidationGroup="G40"
                InitialValue="0">*</asp:RequiredFieldValidator></span>
    </label>
    <asp:DropDownList ID="Drcity" runat="server" class="ddlthanhphoh input-text" AutoPostBack="True"
        OnSelectedIndexChanged="Drcity_SelectedIndexChanged">
    </asp:DropDownList>
</div>
<div class="row_account dropdown_list">
    <label>
        Quận/huyện:<span class="required">*
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng chọn quận/huyện"
                ControlToValidate="Drdistric" Display="Dynamic" ForeColor="Red" ValidationGroup="G40"
                InitialValue="0">*</asp:RequiredFieldValidator></span>
    </label>
    <asp:DropDownList ID="Drdistric" runat="server" class="ddlthanhphoh input-text" AutoPostBack="True"
        OnSelectedIndexChanged="Drdistric_SelectedIndexChanged">
    </asp:DropDownList>
</div>
<div class="row_account">
    <textarea placeholder="Ghi chú thêm về màu sắc, kích thước, thời gian giao hàng .. để chúng tôi phục vụ tốt hơn"
        id="txtnote" name="txtnote" class="input-text" style="height: 100px" runat="server"></textarea>
</div>
<div class="row_account button_cart">
    <asp:Button ID="btnNext" runat="server" Text="Tiếp tục »" class="btn_web btn_payment"
        Style="width: 100%; height: auto" ValidationGroup="G40" OnClick="btnNext_Click" />
</div>
<div style="text-align: center">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
        ShowSummary="False" ValidationGroup="G40" />
</div>
<script>
    function validate(vl, type) {
        var arrnotify = "";
        var emailformatnotify = "Địa chỉ email không đúng";
        var phoneformatnotify = "Số điện thoại không đúng";
        switch (type) {
            case 0: arrnotify = "Vui lòng nhập địa chỉ email"; break;
            case 1: arrnotify = "Vui lòng nhập họ và tên"; break;
            case 2: arrnotify = "Vui lòng nhập số điện thoại"; break;
            case 3: arrnotify = "Vui lòng nhập địa chỉ"; break;
            case 4: arrnotify = "Vui lòng chọn tỉnh/thành phố"; break;
            case 5: arrnotify = "Vui lòng chọn quận/huyện"; break;
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
