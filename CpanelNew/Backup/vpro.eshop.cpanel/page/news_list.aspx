<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="news_list.aspx.cs" Inherits="vpro.eshop.cpanel.page.news_list" ValidateRequest="false" %>

<%@ Register Src="../UIs/Popup-Sendemail.ascx" TagName="Popup" TagPrefix="uc1" %>
<%@ Register Src="../UIs/Pop-chooseCate.ascx" TagName="Pop" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
				    
				// -->
    </script>
    <script>
        $(function () {
            $('.check_dongia').click(function () {
                var checkid = $(this).attr("data-value");
                if (this.checked) {
                    setSession(checkid, 1);
                }
                else {
                    setSession(checkid, 0);
                }
            });
        });
        function setSession(id, typecheck) {
            $.ajax({
                type: "POST",
                url: "Ajaxall.aspx/addCookiecheck",
                data: "{checkid:'" + id + "',typecheck:'" + typecheck + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (e) {

                }
            });
        }
    </script>
    <div class="row page-header">
        <asp:HyperLink ID="Hyperaddnew" runat="server" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm mới</asp:HyperLink>
        <asp:LinkButton ID="lbtSave" runat="server" OnClick="lbtSave_Click" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;Lưu</asp:LinkButton>
        <asp:LinkButton ID="Lbsend_email" runat="server" class="btn btn-default btn-sm" OnClick="Lbsend_email_Click"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>&nbsp;Gửi email</asp:LinkButton>
        <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target=".bs-example-modal-lg">
            <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>&nbsp;Gửi email
            thông điệp</button>
        <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target=".bs-example-modal-small">
            <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>&nbsp;Chuyên
            mục</button>
        <a href="#" onclick="javascript:document.location.reload(true);" class="btn btn-default btn-sm">
            <span class="glyphicon glyphicon-random" aria-hidden="true"></span>&nbsp;Refresh</a>
        <asp:LinkButton ID="Lbdelete" runat="server" class="btn btn-default btn-sm" OnClick="Lbdelete_Click"
            OnClientClick="return confirm('Bạn có chắc chắn xóa không?');"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp;Xóa</asp:LinkButton>
        <div class="navbar-right">
            Danh sách tin tức/sản phẩm</div>
    </div>
    <div class="row page-header">
        <div class="form-inline">
            <div class="form-group">
                <input type="text" class="form-control col-sm-6" id="txtKeyword" placeholder="Từ khóa"
                    runat="server">
            </div>
            <div class="form-group">
                <asp:DropDownList ID="ddlCategory" runat="server" class="form-control col-sm-3">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:DropDownList ID="Drindex" runat="server" class="form-control col-sm-3">
                    <asp:ListItem Text="Hiển thị trang chủ" Value="0" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Sản phẩm nổi bật" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Sản phẩm mua nhiều" Value="2"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" class="btn btn-default"
                OnClick="btnSearch_Click" />
        </div>
    </div>
    <div class="row page-header table-responsive">
        <table class="table table-striped">
            <tr>
                <td>
                    #
                </td>
                <td>
                    <input type="checkbox" id="toggleSelect" runat="server" onclick="javascript: ToggleAll(this,0);"
                        name="toggleSign">
                </td>
                <td>
                    Tiêu đề
                </td>
                <td>
                    Bình luận
                </td>
                <td>
                    Loại tin
                </td>
                <td>
                    Trạng thái
                </td>
                <td>
                    Thứ tự
                </td>
                 <td>
                    Thứ tự trang chủ
                </td>
                <td>
                    Giá gốc
                </td>
                <td>
                    Giá khuyến mãi
                </td>
                <td>
                    Ngày tạo
                </td>
                <td>
                    Chỉnh sửa
                </td>
                <td>
                    Xóa
                </td>
            </tr>
            <asp:Repeater ID="RpItemList" runat="server" OnItemCommand="RpItemList_ItemCommand"
                OnItemDataBound="RpItemList_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# getOrder() %>
                            <input type="hidden" value='<%# Eval("news_id") %>' id="newsid" runat="server" />
                        </td>
                        <td>
                            <input id="chkSelect" type="checkbox" name="chkSelect" runat="server" checked='<%#checkPro(Eval("NEWS_ID")) %>'
                                class="check_dongia" data-value='<%#Eval("NEWS_ID") %>'>
                        </td>
                        <td>
                            <a href='<%# getLink(Eval("NEWS_ID")) %>'>
                                <%# GetNewsStatus(Eval("NEWS_ID"),Eval("NEWS_TITLE"))%>
                            </a>
                        </td>
                        <td>
                            <a href='<%# getLink_comment(Eval("NEWS_ID")) %>'>
                                <%# Getcount_comment(Eval("NEWS_ID"))%>
                            </a>
                        </td>
                        <td>
                            <%# getTypeNew(Eval("NEWS_TYPE"))%>
                        </td>
                        <td class="text-center">
                            <%# getStatus(Eval("NEWS_SHOWTYPE")) %>
                        </td>
                        <td>
                            <asp:TextBox ID="txtorder" runat="server" Text=' <%# Eval("NEWS_ORDER") %>' Width="50"></asp:TextBox>
                        </td>
                         <td>
                            <asp:TextBox ID="txtorderPeriod" runat="server" Text=' <%# Eval("NEWS_ORDER_PERIOD") %>' Width="50"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtprice1" runat="server" Text=' <%# formatLong(Eval("NEWS_PRICE1")) %>'
                                Width="80"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtprice2" runat="server" Text=' <%# formatLong(Eval("NEWS_PRICE2")) %>'
                                Width="80"></asp:TextBox>
                        </td>
                        <td>
                            <%# getDate(Eval("NEWS_PUBLISHDATE"))%>
                        </td>
                        <td class="text-center">
                            <a href='<%# getLink(Eval("NEWS_ID")) %>'><span class="glyphicon glyphicon-pencil"></span>
                            </a>
                        </td>
                        <td class="text-center">
                            <asp:LinkButton ID="lnkbtnDel" runat="server" CommandName="Delete" CommandArgument='<%# Eval("news_id") %>'
                                OnClientClick="return confirm('Bạn có chắc chắn xóa không?');">
                                <img src="../images/delete_icon.gif" title="Xóa" border="0">
                            </asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td colspan="10">
                    <ul class="pagination">
                        <asp:Literal ID="LitPage" runat="server"></asp:Literal>
                    </ul>
                </td>
            </tr>
        </table>
    </div>
    <%--<asp:Literal ID="Literal1" runat="server"></asp:Literal>--%>
    <uc1:Popup ID="Popup1" runat="server" />
    <uc2:Pop ID="Pop1" runat="server" />
</asp:Content>
