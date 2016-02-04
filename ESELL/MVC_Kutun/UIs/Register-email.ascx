<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Register-email.ascx.cs"
    Inherits="MVC_Kutun.UIs.Register_email" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc3" %>
<link href="../vi-vn/Styles/toolbar.css" rel="stylesheet" type="text/css" />
<cc3:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="btnregisemail"
    CancelControlID="hplClose" BackgroundCssClass="modalBackground" BehaviorID="btnregisemail">
</cc3:ModalPopupExtender>
<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" Style="display: block;
    width: 500px">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="close" style="height: 30px; float: left; width: 100%">
                <asp:LinkButton ID="hplClose" runat="server" Style="float: right;" 
                    class="buttonE" onclick="hplClose_Click"><img src="../vi-vn/Images/p_close.gif" alt="" /></a></asp:LinkButton>
            </div>
            <div class="block1">
                <div class="blockcontent1 padding2">
                    <div class="row">
                        <label class="col1 left_col1">
                            Email:<span class="required">*</span></label>
                        <div class="col1 right_col1">
                            <input name="txtemail" type="text" class="inputbox" runat="server" id="txtemail" />
                        </div>
                        <div class="buttonE">
                            <asp:LinkButton CssClass="buttonE" ID="lbregisemail" runat="server" ValidationGroup="G1"
                                OnClick="lbregisemail_Click"><img src="../vi-vn/Images/send.png" alt="" width="100%" /></asp:LinkButton>
                            <br />
                            <asp:Label ID="Lberrors" runat="server" Text=""></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập Email"
                                Text="Vui lòng nhập Email" ControlToValidate="txtemail" CssClass="required" ValidationGroup="G1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="txtemail" ErrorMessage="Invalid Email Format" CssClass="required"
                                ValidationGroup="G1"></asp:RegularExpressionValidator>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <!-- ModalPopupExtender -->
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="updProgress" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
        <ProgressTemplate>
            <img alt="progress" src="../vi-vn/Images/loading.gif" />
            <p>
                Processing...</p>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Panel>
