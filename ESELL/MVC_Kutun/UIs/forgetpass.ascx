<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="forgetpass.ascx.cs"
    Inherits="MVC_Kutun.UIs.forgetpass" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc2" %>
<asp:Panel ID="Panel3" runat="server" CssClass="hidden panelforget">
    <div style="width: 1349px; height: 15347px; display: block;" id="dShadow" class="shadows">
    </div>
    <div style="top: 70px; position: fixed; left: 30%; z-index: 99999" class="popup"
        id="dPopUp">
        <div class="popup-bg" style="height: 350px">
            <div class="popup-title">
                <h2>
                    Quên mật khẩu</h2>
            </div>
            <div class="popup-form">
                <div id="div3" runat="server">
                    <p class="text input-text">
                        <label>
                            Địa chỉ email: *</label>
                        <input type="text" name="txtemail" id="Txtmailforget" runat="server" style="width: 230px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập địa chỉ email"
                            ControlToValidate="Txtmailforget" Display="Dynamic" ForeColor="Red" ValidationGroup="G7"
                            CssClass="tlp-error">*</asp:RequiredFieldValidator>
                    </p>
                    <p class="text input-text">
                        <label>
                            Mã bảo vệ: *</label>
                        <asp:TextBox ID="Textcapchaforget" runat="server" Height="18px" Width="230px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Vui lòng nhập mã bảo mật"
                            ControlToValidate="Textcapchaforget" Display="Dynamic" ForeColor="Red" ValidationGroup="G7">*</asp:RequiredFieldValidator>
                    </p>
                    <p class="text input-text">
                        <label>
                        </label>
                        <asp:Image ID="Image1" runat="server" ImageUrl="../vi-vn/CImage.aspx" Width="170px"
                            alt="" />
                    </p>
                    <div class="button">
                        <asp:LinkButton ID="Lbforgetpass" runat="server" OnClick="Lbforgetpass_Click" ValidationGroup="G7"
                            Style="background: #f17800; -webkit-border-radius: 5px; -moz-border-radius: 5px;
                            border-radius: 5px;"><b>Gửi</b></asp:LinkButton>
                        <p id="P2" class="text-error">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Txtmailforget"
                                ErrorMessage="Địa chỉ email chưa đúng" ForeColor="Red" SetFocusOnError="True"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="G8"></asp:RegularExpressionValidator>
                            <br />
                            <asp:Label ID="Lbforgeterrors" runat="server" Text=""></asp:Label>
                            <br />
                            <asp:Label ID="Label1" runat="server" ForeColor="#FF3300" Text="Mã Xác Nhận Không Đúng"></asp:Label>
                        </p>
                    </div>
                    <p class="text-note">
                    </p>
                </div>
                <div id="div5" runat="server" style="text-align: center; margin-top: 100px">
                    <span>Chúng Tôi Đã Gửi Yêu Cầu Mật Khẩu Của Bạn Về Hộp Thư </span><a href="/" style="font-size: 14px;
                        color: Red">Về Trang Chủ</a>
                </div>
            </div>
            <i class="popup-close" onclick="tatquyenmk()"></i>
        </div>
    </div>
</asp:Panel>
<script type="text/javascript">
    function showquyenmk() {
        $('.login_div').addClass("hidden");
        $('.panelforget').removeClass("hidden");
    }
    function tatquyenmk() {
        $('.panelforget').addClass("hidden");
    }
</script>
