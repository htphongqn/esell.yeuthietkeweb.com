<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="nhap-kho.aspx.cs" Inherits="vpro.eshop.cpanel.page.nhap_kho" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row page-header col-md-12">
        <asp:LinkButton ID="lbtSave" runat="server" OnClick="lbtSave_Click" class="btn btn-success btn-sm"
            ValidationGroup="G1"><span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span>&nbsp;Lưu</asp:LinkButton>
        <asp:LinkButton ID="lbtSaveNew" runat="server" OnClick="lbtSaveNew_Click" class="btn btn-default btn-sm"
            ValidationGroup="G1">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Lưu &
            Thêm mới
        </asp:LinkButton>
        <asp:LinkButton ID="LbsaveClose" runat="server" class="btn btn-default btn-sm" OnClick="LbsaveClose_Click"
            ValidationGroup="G1">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;Lưu & Đóng
        </asp:LinkButton>
        <asp:HyperLink ID="Hyperback" runat="server" class="btn btn-default btn-sm"> 
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;Đóng</asp:HyperLink>
    </div>
    <div class="row">
        <div class="col-md-8 form-horizontal">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title" id="H1">
                        Thông tin sản phẩm</h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">
                            Mã sản phẩm</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtcode" runat="server" AutoPostBack="true" OnTextChanged="txtcode_TextChanged"
                                class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng chọn mã sản phẩm !"
                                Text="Vui lòng chọn mã sản phẩm !" ControlToValidate="txtCode" CssClass="label label-danger"
                                ValidationGroup="G1"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">
                            Tên sản phẩm</label>
                        <div class="col-sm-10">
                            <asp:HyperLink ID="Hynews" runat="server" ForeColor="Blue" Target="_blank"></asp:HyperLink>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">
                            Số lượng</label>
                        <div class="col-sm-10">
                            <input type="text" name="txtquan" id="txtquan" runat="server" class="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập số lượng !"
                                Text="Vui lòng nhập số lượng !" ControlToValidate="txtquan" CssClass="label label-danger"
                                ValidationGroup="G1"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title" id="H3">
                        Thông tin khách hàng</h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">
                            Tên khách hàng</label>
                        <div class="col-sm-10">
                            <input type="text" name="txtnameKH" id="txtnameKH" runat="server" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">
                            Địa chỉ</label>
                        <div class="col-sm-10">
                            <input type="text" name="txtadd" id="txtadd" runat="server" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">
                            Số phiếu</label>
                        <div class="col-sm-10">
                            <input type="text" name="txtsophieu" id="txtsophieu" runat="server" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">
                            Ghi chú</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="txtnote" runat="server" ></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title" id="H2">
                        Thông tin phí</h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label>
                            Giá (Số lượng 1)</label>
                        <input type="text" name="txtPrice" id="txtPrice" runat="server" maxlength="18" class="form-control"
                            value="0" />
                    </div>
                    <div class="form-group">
                        <label>
                            Chiếc khấu %
                        </label>
                        <input type="text" name="txtChieckhau" id="txtChieckhau" runat="server" maxlength="18"
                            class="form-control" value="0" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
