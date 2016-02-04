<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pop-chooseCate.ascx.cs"
    Inherits="vpro.eshop.cpanel.UIs.Pop_chooseCate" %>

<div class="modal fade bs-example-modal-small" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-small">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">
                    Chuyên mục</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-warning">
                                <div class="panel-heading">
                                    <h3 class="panel-title" id="H1">
                                        Danh sách chuyên mục</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlCategory" runat="server" class="form-control">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <asp:LinkButton ID="lbtSave" runat="server" OnClick="lbtSave_Click" class="btn btn-success btn-sm"
                                            ValidationGroup="G10"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>&nbsp;Save</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
