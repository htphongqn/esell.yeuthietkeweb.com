<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="baogia.ascx.cs" Inherits="MVC_Kutun.UIs.baogia" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc3" %>
<link href="../vi-vn/Styles/toolbar.css" rel="stylesheet" type="text/css" />
<!--Gui mail-->
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<div style="float: right; margin-right: 10px;">
    <cc3:ModalPopupExtender ID="mp2" runat="server" PopupControlID="Panel2" TargetControlID="hplSendEmail"
        CancelControlID="hplClose2" BackgroundCssClass="modalBackground" BehaviorID="">
    </cc3:ModalPopupExtender>
    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" align="center" Style="display: none;
        width: 500px">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div style="height: 30px; float: left; width: 100%">
                    <a href="#" id="hplClose2" runat="server" style="float: right;">
                        <img src="../vi-vn/Images/p_close.gif" alt="" /></a> <span class="p_title">Gửi Báo Giá
                            Cho Bạn Bè</span>
                </div>
                <div class="block1">
                    <div class="blockcontent1 padding2" style="border: 0;">
                        <div class="row">
                            <div class="col1 left_col1">
                                Họ và tên của bạn:<span class="required">*</span></div>
                            <div class="col1 right_col1">
                                <input name="Send_txtFullname" id="Send_txtFullname" type="text" runat="server" class="inputbox" />
                                <br />
                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator4" Forecol1or="Red"
                                    runat="server" ErrorMessage="Vui lòng nhập họ tên" Text="Vui lòng nhập họ tên"
                                    ControlToValidate="Send_txtFullname" CssClass="required" ValidationGroup="SendEmailGroup2"></asp:RequiredFieldValidator></div>
                        </div>
                        <div class="row">
                            <div class="col1 left_col1">
                                Email của bạn:<span class="required">*</span></div>
                            <div class="col1 right_col1">
                                <input name="Send_txtEmail" type="text" class="inputbox" runat="server" id="Send_txtEmail" />
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" runat="server"
                                    Forecol1or="Red" ErrorMessage="Vui lòng nhập Email" Text="Vui lòng nhập Email"
                                    ControlToValidate="Send_txtEmail" CssClass="required" ValidationGroup="SendEmailGroup2"></asp:RequiredFieldValidator></div>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic"
                                runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="Send_txtEmail" Forecol1or="Red" ErrorMessage="Email không hợp lệ"
                                CssClass="required" ValidationGroup="SendEmailGroup2"></asp:RegularExpressionValidator>
                        </div>
                        <div class="row">
                            <div class="col1 left_col1">
                                Gửi đến (To):<span class="required">*</span></div>
                            <div class="col1 right_col1">
                                <input name="Send_txtEmailTo" type="text" class="inputbox" runat="server" id="Send_txtEmailTo" />
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Forecol1or="Red" runat="server"
                                    ErrorMessage="Vui lòng nhập Email" Text="Vui lòng nhập Email" Display="Dynamic"
                                    ControlToValidate="Send_txtEmailTo" CssClass="required" ValidationGroup="SendEmailGroup2"></asp:RequiredFieldValidator></div>
                            <asp:RegularExpressionValidator Forecol1or="Red" Display="Dynamic" ID="RegularExpressionValidator2"
                                runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="Send_txtEmailTo" ErrorMessage="Email không hợp lệ" CssClass="required"
                                ValidationGroup="SendEmailGroup2"></asp:RegularExpressionValidator>
                        </div>
                        <div class="row">
                            <div class="col1 left_col1">
                                Đồng gửi đến (CC):<span class="required">*</span></div>
                            <div class="col1 right_col1">
                                <input name="Send_txtEmailCC" type="text" class="inputbox" runat="server" id="Send_txtEmailCC" />
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic"
                                    runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ControlToValidate="Send_txtEmailCC" Forecol1or="Red" ErrorMessage="Email không hợp lệ"
                                    CssClass="required" ValidationGroup="SendEmailGroup2"></asp:RegularExpressionValidator>
                            </div>
                            <div class="row">
                                <div class="col1 left_col1">
                                    Nội dung:<span class="required">*</span></div>
                                <div class="col1 right_col1">
                                    <textarea name="Send_txtContent" rows="5" col1s="30" runat="server" id="Send_txtContent"></textarea>
                                    <br />
                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator6" runat="server"
                                        ErrorMessage="Vui lòng nhập Nội dung" Text="Vui lòng nhập Nội dung" Forecol1or="Red"
                                        ControlToValidate="Send_txtContent" CssClass="required" ValidationGroup="SendEmailGroup2"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col1 left_col1">
                                    &nbsp;
                                </div>
                                <div class="col1 right_col1">
                                    <asp:Image ID="Image2" runat="server" ImageUrl="../vi-vn/CImage.aspx" Width="170px" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col1 left_col1">
                                    Mã an toàn:<span class="required">*</span></div>
                                <div class="col1 right_col1">
                                    <input name="Send_txtCapcha" id="Send_txtCapcha" runat="server" type="text" class="inputbox" />
                                    <br />
                                    <asp:Label ID="Send_lblResult" runat="server" />
                                    <br />
                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator8" runat="server"
                                        ErrorMessage="Vui lòng nhập Captcha" Text="Vui lòng nhập Captcha" Forecol1or="Red"
                                        ControlToValidate="Send_txtCapcha" CssClass="required" ValidationGroup="SendEmailGroup2"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="buttonE row" style="margin-bottom: 10px">
                                <asp:LinkButton ID="lbtSendEmail" runat="server" OnClick="lbtSendEmail_Click" ValidationGroup="SendEmailGroup2"><img src="../vi-vn/Images/send.png" alt="" /></asp:LinkButton>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel2" runat="server">
            <ProgressTemplate>
                <img alt="progress" src="../vi-vn/images/loading.gif" />
                <p>
                    Processing...</p>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </asp:Panel>
</div>
