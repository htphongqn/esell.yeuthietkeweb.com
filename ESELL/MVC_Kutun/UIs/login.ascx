<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="login.ascx.cs" Inherits="MVC_Kutun.UIs.login" %>
<script src="../vi-vn/Ajax/login.js" type="text/javascript"></script>
<asp:Panel ID="Panel2" runat="server" CssClass="hidden login_div">
    <div style="width: 1349px; height: 15347px; display: block;" class="shadows">
    </div>
    <div style="top: 70px; position: absolute; left: 27%; z-index: 9999;" class="popup">
        <div class="popup-bg">
            <div class="popup-title">
                <h2>
                    Đăng nhập</h2>
            </div>
            <div class="popup-form">
                <p class="text input-text">
                    <label>
                        Email *</label>
                    <input type="text" name="txtEmail" id="txtEmail" style="width: 235px" runat="server" />
                </p>
                <p class="text input-text">
                    <label>
                        Mật khẩu *</label>
                    <input type="password" name="Txtpass" id="Txtpass" style="width: 235px" runat="server" />
                </p>
                <p class="text">
                    <a href="javascript:void(0)" onclick="showquyenmk()">Quên mật khẩu</a>
                </p>
                <div class="button">
                    <a href="javascript:void(0)" onclick="ajaxlogin();" style="background: #f17800; -webkit-border-radius: 5px;
                        -moz-border-radius: 5px; border-radius: 5px; width: 160px;" id="bt_login" runat="server">
                        Đăng nhập</a> <a href="javascript:void(0)" onclick="showdk()" style="background: #f17800;
                            -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; width: 160px;">
                            Đăng ký</a>
                    <p class="text-error">
                        <span id="loading-errors"></span><span class="errors"></span>
                    </p>
                </div>
            </div>
        </div>
        <i class="popup-close" onclick="tat();"></i>
    </div>
</asp:Panel>
