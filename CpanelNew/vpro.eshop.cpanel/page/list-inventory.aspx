<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="list-inventory.aspx.cs" Inherits="vpro.eshop.cpanel.page.list_inventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Scripts/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui.js" type="text/javascript"></script>
    <link href="../Styles/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script>
        $(function () {
            $("#<%=txtDate.ClientID %>").datepicker({ dateFormat: "dd-mm-yy" });
        });
    </script>
    <script language="javascript">
				<!--
        function ToggleAll(e, action) {
            if (e.checked) {
                CheckAll();
            }
            else {
                ClearAll();
            }
        }

        function CheckAll() {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];

                if (e.name.toString().indexOf("chkSelect") > 0)
                    e.checked = true;
            }
            ml.MainContent_GridItemList_toggleSelect.checked = true;
        }

        function ClearAll() {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];
                if (e.name.toString().indexOf("chkSelect") > 0)
                    e.checked = false;
            }
            ml.MainContent_GridItemList_toggleSelect.checked = false;
        }

        function selectChange() {
            var radioButtons = document.getElementsByName("rblType");
            for (var x = 0; x < radioButtons.length; x++) {
                if (radioButtons[x].checked) {
                    if (radioButtons[x].value == 1)
                    { CheckAll(); }
                }
            }

        }
				    
				// -->
    </script>
    <div class="row page-header">
        <asp:HyperLink ID="Hyaddnew" runat="server" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus"
            aria-hidden="true"></span>&nbsp;Thêm mới</asp:HyperLink>
        <asp:LinkButton ID="Lbdelete" runat="server" class="btn btn-default btn-sm" OnClick="lbtDelete_Click"
            OnClientClick="return confirm('Bạn có chắc chắn xóa không?');"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp;Xóa</asp:LinkButton>
        <a href="#" onclick="javascript:document.location.reload(true);" class="btn btn-default btn-sm">
            <span class="glyphicon glyphicon-random" aria-hidden="true"></span>&nbsp;Refresh</a>
        <div class="navbar-right">
            Danh sách liên hệ</div>
    </div>
    <div class="row page-header">
        <div class="form-inline">
            <div class="form-group">
                <input type="text" class="form-control col-sm-4" id="txtKeyword" placeholder="Từ khóa"
                    runat="server">
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtDate" runat="server" class="form-control col-sm-4" placeholder="Chọn ngày"></asp:TextBox>
            </div>
            <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" class="btn btn-default"
                OnClick="lbtSearch_Click" />
        </div>
    </div>
    <div class="row">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">
                    Danh sách xuất nhập kho</h3>
            </div>
            <div class="panel-body table-responsive">
                <table class="table table-striped">
                    <tr>
                        <td>
                            #
                        </td>
                        <td>
                            <input type="checkbox" id="toggleSelect" runat="server" onclick="javascript: ToggleAll(this,0,'chkSelect');"
                                name="toggleSign">
                        </td>
                        <td>
                            Ngày
                        </td>
                        <td>
                            Mã sản phẩm
                        </td>
                        <td>
                            Tên sản phẩm
                        </td>
                        <td>
                            Số lượng
                        </td>
                        <td>
                            Giá
                        </td>
                        <td>
                            Chiếc khấu
                        </td>
                        <td>
                            Tên khách hàng
                        </td>
                        <td>
                            Địa chỉ
                        </td>
                        <td>
                            Người nhập
                        </td>
                        <td>
                            Xóa
                        </td>
                    </tr>
                    <asp:Repeater ID="RplistInvent" runat="server" OnItemCommand="RplistInvent_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%# getOrder() %>
                                    <asp:HiddenField ID="Hdid" runat="server" Value='<%#Eval("ID") %>' />
                                </td>
                                <td>
                                    <input id="chkSelect" type="checkbox" name="chkSelect" runat="server">
                                </td>
                                <td>
                                    <a href='<%# getLink(Eval("ID")) %>'>
                                        <%# getDate(Eval("INVENT_DATE"))%>
                                    </a>
                                </td>
                                <td>
                                    <%# Eval("NEWS_CODE")%>
                                </td>
                                <td>
                                    <%# Eval("NEWS_TITLE")%>
                                </td>
                                <td>
                                    <%# Eval("INVENT_QUANTITY")%>
                                </td>
                                <td>
                                    <%# formatMoney(Eval("INVENT_PRICE"))%>
                                </td>
                                <td>
                                    <%# Eval("INVENT_CHIECKHAU")%>
                                </td>
                                <td>
                                    <%# Eval("INVENT_NAMEKH")%>
                                </td>
                                <td>
                                    <%# Eval("INVENT_ADDRESS")%>
                                </td>
                                <td>
                                    <%# getName(Eval("USER_ID"))%>
                                </td>
                                <td class="text-center">
                                    <asp:LinkButton ID="lnkbtnDel" runat="server" CommandName="Delete" CommandArgument='<%#Eval("ID") %>'
                                        OnClientClick="return confirm('Bạn có chắc chắn xóa không?');">
                                <img src="../images/delete_icon.gif" title="Xóa" border="0">
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
