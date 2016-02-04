<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="register.ascx.cs" Inherits="MVC_Kutun.UIs.register" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<asp:Panel ID="Panel2" runat="server" CssClass="pndangki hidden">
    <div style="width: 1349px; height: 15347px; display: block;" class="shadows">
    </div>
    <div style="top: 70px; position: absolute; left: 27%; z-index: 9999;" class="popup">
        <div class="popup-bg">
            <div class="popup-title">
                <h2>
                    Đăng Ký</h2>
            </div>
            <div class="popup-form">
                <p class="text input-text">
                    <label>
                        Email *</label>
                    <input type="text" name="txtEmail" id="txtEmail" style="width: 235px" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập Email"
                        ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator>
                </p>
                <p class="text input-text">
                    <label>
                        Mật Khẩu *
                    </label>
                    <input name="txtPassword1" id="txtPassword1" style="width: 235px" runat="server"
                        type="password" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập mật khẩu"
                        ControlToValidate="txtPassword1" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator>
                </p>
                <p class="text input-text">
                    <label>
                        Nhập Lại Mật Khẩu *
                    </label>
                    <input name="txtRePassword" id="txtRePassword" style="width: 235px" runat="server"
                        type="password" />
                    <asp:RequiredFieldValidator ID="rfvRePassword" runat="server" ErrorMessage="Chưa nhập lại mật khẩu"
                        ControlToValidate="txtRePassword" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator>
                </p>
                <p class="text input-text">
                    <label>
                        Họ Và Tên *
                    </label>
                    <input type="text" name="txtName" id="txtName" style="width: 235px" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Chưa nhập họ tên"
                        ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator>
                </p>
                <p class="text input-text">
                    <label>
                        Nhập vào chuỗi *</label>
                    <asp:TextBox ID="txtCaptcha" runat="server" Height="18px" Width="235px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCaptcha" runat="server" ErrorMessage="Chưa nhập mã bảo mật"
                        ControlToValidate="txtCaptcha" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator>
                </p>
                <p class="text input-text" style="text-align: center">
                    <asp:Image ID="Image1" runat="server" ImageUrl="../vi-vn/CImage.aspx" Width="170px"
                        alt="" />
                </p>
                <div class="button">
                    <asp:LinkButton ID="IbtnFinish" runat="server" OnClick="IbtnFinish_Click" ValidationGroup="G8"
                        Style="background: #f17800; -webkit-border-radius: 5px; -moz-border-radius: 5px;
                        border-radius: 5px;">Đăng Ký</asp:LinkButton>
                    <p class="text-error">
                        <br />
                        <asp:CompareValidator ID="comparePasswords" runat="server" ControlToCompare="txtPassword1"
                            ControlToValidate="txtRePassword" ErrorMessage="2 mật khẩu không giống nhau!"
                            Display="Dynamic" ForeColor="Red" />
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Email Định Dạng Chưa Đúng" ForeColor="Red" SetFocusOnError="True"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="G8"></asp:RegularExpressionValidator>
                        <asp:Label ID="Labelerrors" runat="server" Text=""></asp:Label>
                    </p>
                </div>
            </div>
        </div>
        <i class="popup-close" onclick="tatdk()"></i>
    </div>
</asp:Panel>
<script type="text/javascript">
    function showdk() {
        $('.pndangki').removeClass("hidden");
        $('.login_div').addClass("hidden");
    }
    function tatdk() {
        $('.pndangki').addClass("hidden");
    }
</script>
