<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="contact.aspx.cs" Inherits="MVC_Kutun.vi_vn.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="path">
        <a href="/trang-chu.html">Trang chủ</a> » <a href="/lien-he.html">Liên hệ</a></div>
    <!--Contact-->
    <link href="../vi-vn/Styles/contact.css" rel="stylesheet" type="text/css" />
    <div class="box">
        <div class="box_Tab_main">
            <h1>
                Liên hệ</h1>
        </div>
        <div id="info_contact" class="fl">
            <div>
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            </div>
            <div id="map" class="cf">
                <asp:Literal ID="Literal2" runat="server"></asp:Literal>
            </div>
            <!--End Map-->
        </div>
        <!--Form Contact-->
        <div class="form_web fr" id="contactus">
            <div class="row_contact">
                <label class="left_row">
                    Họ và tên:<span class="required">*<asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server"
                        ErrorMessage="Vui lòng nhập họ và tên" ControlToValidate="Txtname" Display="Dynamic"
                        ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span></label>
                <div class="right_row">
                    <input type="text" class="inputbox" id="Txtname" runat="server">
                </div>
            </div>
            <div class="row_contact">
                <label class="left_row">
                    Địa chỉ:<span class="required">*<asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                        runat="server" ErrorMessage="Vui lòng nhập địa chỉ"
                        ControlToValidate="Txtaddress" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span></label>
                <div class="right_row">
                    <input type="text" class="inputbox" id="Txtaddress" runat="server">
                </div>
            </div>
            <div class="row_contact">
                <label class="left_row">
                    Số điện thoại:<span class="required">*<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server" ErrorMessage="Vui lòng nhập số điện thoại" ControlToValidate="Txtphone"
                        Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span></label>
                <div class="right_row">
                    <input type="text" class="inputbox" id="Txtphone" runat="server">
                </div>
            </div>
            <div class="row_contact">
                <label class="left_row">
                    Địa chỉ email:<span class="required">*<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server" ErrorMessage="Vui lòng nhập địa chỉ email" ControlToValidate="txtEmail"
                        Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span></label>
                <div class="right_row">
                    <input type="text" class="inputbox" id="txtEmail" runat="server">
                </div>
            </div>
            <div class="row_contact">
                <label class="left_row">
                    Tiêu đề:<span class="required">*<asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                        runat="server" ErrorMessage="Vui lòng nhập tiêu đề" ControlToValidate="txttitle"
                        Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span></label>
                <div class="right_row">
                    <input type="text" class="inputbox" id="txttitle" runat="server">
                </div>
            </div>
            <div class="row_contact">
                <div style="width: 75%" class="fl">
                    <label class="left_row">
                        Nội dung liên hệ:<span class="required">*<asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                            runat="server" ErrorMessage="Vui lòng nhập nội dung liên hệ" ControlToValidate="txtContent"
                            Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span></label>
                    <div class="right_row">
                        <textarea cols="45" rows="10" id="txtContent" runat="server"></textarea>
                    </div>
                </div>
                <div style="width: 22%" class="fr">
                    <label class="left_row">
                        Mã bảo vệ:<span class="required">*<asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                            runat="server" ErrorMessage="Vui lòng nhập mã bảo vệ" ControlToValidate="txtCapcha"
                            Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span></label>
                    <div class="right_row">
                        <input type="text" class="inputbox" id="txtCapcha" runat="server">
                        <div class="fl" style="background-color: White; width: 102%; margin-top: 10px">
                            <asp:Image ID="Image1" runat="server" ImageUrl="../vi-vn/CImage.aspx" Width="128px" /></div>
                    </div>
                    <div class="row_contact">
                        <asp:LinkButton ID="Lbthanhtoan" runat="server" class="btn_web send_cmt" OnClick="Lbthanhtoan_Click"
                            ValidationGroup="G40">Gửi</asp:LinkButton>
                        <a href="javascript:void(0)" onclick="reset();" class="btn_web send_cmt reset_btn">Làm
                            lại</a>
                    </div>
                </div>
            </div>
            <div style="text-align: center">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                    ShowSummary="False" ValidationGroup="G40" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Địa chỉ email chưa đúng" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Txtphone"
                    ErrorMessage="Số điện thoại chưa đúng" SetFocusOnError="True" ValidationExpression="^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d$"
                    ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
                <asp:Label ID="lblresult" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>
        <!--End Form Contact-->
    </div>
    <!--End Contact-->
</asp:Content>
