<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Register_Partner.aspx.cs" Inherits="MVC_Kutun.vi_vn.Register_Partner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <!--Main Content-->
    <div id="main" class="cf">
        <link rel="Stylesheet" type="text/css" href="../vi-vn/Styles/process_payment.css" />
        <!--Form Register-->
        <div class="regis_form form_web">
            <div class="box_Tab_main">
                <h1 class="title_page">
                    Đăng ký đại lý</h1>
            </div>
            <!--Info Member-->
            <div class="info_account cf">
                <div class="row_account">
                    <label class="item_title" for="formEmail">
                        Địa chỉ email<span class="required">*
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Vui lòng nhập địa chỉ email"
                                ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator>
                        </span>
                    </label>
                    <div class="right_row_account fr">
                        <input class="txtpassdangnhap" type="text" name="txtEmail" id="txtEmail" runat="server" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail"
                            ErrorMessage="Địa chỉ email nhập không đúng định dạng" SetFocusOnError="True"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"
                            ValidationGroup="G8" CssClass="errorsval"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row_account">
                    <label class="item_title" for="formPassword">
                        Mật khẩu<span class="required">*
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng nhập mật khẩu"
                                ControlToValidate="txtPassword1" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator>
                        </span>
                    </label>
                    <div class="right_row_account fr">
                        <input class="txtpassdangnhap" type="password" name="txtPassword1" id="txtPassword1"
                            runat="server" />
                        <i style="font-size: 11px">(Mật khẩu phải chứa ít nhất 6 ký tự bao gồm cả chữ và số)</i>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPassword1"
                            ErrorMessage="Mật khẩu phải chứa ít nhất 6 ký tự bao gồm cả chữ và số" SetFocusOnError="True"
                            ValidationExpression="^.{6,50}$" ForeColor="Red" ValidationGroup="G8" CssClass="errorsval"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row_account">
                    <label class="item_title" for="formPassword_2">
                        Gõ lại mật khẩu<span class="required">*
                            <asp:RequiredFieldValidator ID="rfvRePassword" runat="server" ErrorMessage="Vui lòng nhập lại mật khẩu"
                                ControlToValidate="txtRePassword" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator>
                        </span>
                    </label>
                    <div class="right_row_account fr">
                        <input class="txtpassdangnhap" type="password" name="txtRePassword" id="txtRePassword"
                            runat="server" />
                        <asp:CompareValidator ID="comparePasswords" runat="server" ControlToCompare="txtPassword1"
                            ControlToValidate="txtRePassword" ErrorMessage="Mật khẩu gõ lại không đúng" Display="Dynamic"
                            ForeColor="Red" CssClass="errorsval" />
                    </div>
                </div>
                <div class="row_account">
                    <label class="item_title" for="formFullname">
                        Họ và tên<span class="required">*
                            <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Vui lòng nhập họ tên"
                                ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator>
                        </span>
                    </label>
                    <div class="right_row_account fr">
                        <input class="txtpassdangnhap" type="text" name="txtName" id="txtName" runat="server" />
                    </div>
                </div>
                <div class="row_account">
                    <label class="item_title" for="formDateBirth">
                        Ngày sinh</label>
                    <div class="right_row_account fr">
                        <asp:DropDownList ID="Drday" runat="server" class="sl_form_web accountBirthDay">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Drmoth" runat="server" class="sl_form_web accountBirthDay">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Dryear" runat="server" class="sl_form_web accountBirthDay">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row_account">
                    <label class="item_title" for="formSex">
                        Giới tính<span class="required">*</span></label>
                    <div class="right_row_account fr">
                        <asp:RadioButtonList ID="Rdsex" runat="server" RepeatColumns="3">
                            <asp:ListItem Value="0" Text="Nam" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Nữ"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Khác"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>
                <div class="row_account">
                    <label class="item_title" for="formPhone">
                        Số điện thoại<span class="required">*
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập số điện thoại"
                                ControlToValidate="txtphone" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator>
                        </span>
                    </label>
                    <div class="right_row_account fr">
                        <input class="txtpassdangnhap" type="text" name="txtphone" id="txtphone" runat="server" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtphone"
                            ErrorMessage="Số điện thoại nhập không đúng định dạng" SetFocusOnError="True"
                            ValidationExpression="^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d{9,40}$" ForeColor="Red"
                            ValidationGroup="G8" CssClass="errorsval"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row_account">
                    <label class="item_title" for="formFullname">
                        Tài khoản ngân hàng
                    </label>
                    <div class="right_row_account fr">
                        <input class="txtpassdangnhap" type="text" name="txtcodebank" id="txtcodebank" runat="server" />
                    </div>
                </div>
                <div class="row_account">
                    <label class="item_title" for="formAddress">
                        Địa chỉ<span class="required">*
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập địa chỉ (số nhà, tên đường, phường/xã ...)"
                                ControlToValidate="txtadd" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator>
                        </span>
                    </label>
                    <div class="right_row_account fr">
                        <input class="txtpassdangnhap" placeholder="Số nhà, tên đường, phường/xã ... *" type="text"
                            name="txtadd" id="txtadd" runat="server" />
                    </div>
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="row_account">
                            <label class="item_title" for="formCountry">
                                Tỉnh/thành phố<span class="required">*
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Vui lòng chọn tỉnh/thành phố"
                                        ControlToValidate="Drcity" Display="Dynamic" ForeColor="Red" ValidationGroup="G8"
                                        InitialValue="0">*</asp:RequiredFieldValidator></span></label>
                            <div class="right_row_account fr">
                                <asp:DropDownList ID="Drcity" runat="server" class="sl_form_web" AutoPostBack="True"
                                    OnSelectedIndexChanged="Drcity_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row_account">
                            <label class="item_title" for="formCountry">
                                Quận/huyện<span class="required">*
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Vui lòng chọn quận/huyện"
                                        ControlToValidate="Drdistric" Display="Dynamic" ForeColor="Red" ValidationGroup="G8"
                                        InitialValue="0">*</asp:RequiredFieldValidator></span></label>
                            <div class="right_row_account fr">
                                <asp:DropDownList ID="Drdistric" runat="server" class="sl_form_web">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="row_account">
                    <label class="item_title" for="formCode">
                        Mã bảo vệ<span class="required">*
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Vui lòng nhập mã bảo vệ"
                                ControlToValidate="txtcode" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator></span></label>
                    <div class="right_row_account fr">
                        <input class="txtpassdangnhap" type="text" name="txtcode" id="txtcode" style="width: 40%;
                            margin-right: 10px" runat="server" />
                        <asp:Image ID="Image1" runat="server" ImageUrl="../vi-vn/CImage.aspx" Width="170px"
                            alt="" />
                    </div>
                </div>
                <div class="row_account" style="margin: 10px 0">
                    <span class="required">* Thông tin bắt buộc</span><asp:Label ID="Labelerrors" runat="server"
                        Text="" ForeColor="Red"></asp:Label></div>
                <div class="row_account">
                    <asp:LinkButton ID="Lbregis" runat="server" class="btn_web btn_action" ValidationGroup="G8"
                        OnClick="Lbregis_Click">Đăng ký</asp:LinkButton>
                </div>
                <div class="row_account">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="G8" />
                </div>
                <div class="row_account">
                    <label class="cl_red" for="RegistrationForm_newsletter">
                        Tôi đã đọc và đồng ý với <a href="/quy-che-san-giao-dich.html" style="color: #FF0000"
                            target="_blank">quy chế sàn giao dịch</a> của Esell</label>
                </div>
                <div class="row_account">
                    <asp:CheckBox ID="Checkemail" runat="server" Checked="true" />
                    <label class="floatl mts" for="RegistrationForm_newsletter">
                        Đăng ký nhận tin khuyến mãi qua email</label>
                </div>
                <!--end Info Member-->
            </div>
        </div>
        <!--End Form Register-->
    </div>
    <!--End Main Content-->
</asp:Content>
