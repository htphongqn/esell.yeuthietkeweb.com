<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="search-box.ascx.cs"
    Inherits="MVC_Kutun.MOBILE.UIs.search_box" %>
<div id="search_form">
    <div class="dropdown">
        <label>
            <asp:DropDownList ID="Drcate_search" runat="server" class="dr_search">
            </asp:DropDownList>
        </label>
    </div>
    <input type="text" name="txtsearch" id="txtsearch" class="input_Search" onblur="if (this.value=='') this.value='Từ khóa tìm kiếm';"
        onfocus="if (this.value=='Từ khóa tìm kiếm') this.value='';" value="Từ khóa tìm kiếm"
        onkeypress="if(event.which || event.keyCode || event.charCode){if ((event.charCode == 13) || (event.which == 13) || (event.keyCode == 13)) {document.getElementById('vi7_lbtnSearch').click();return false;}} else {return true}; "
        runat="server" clientidmode="Static">
    <asp:Button ID="btnSearch" runat="server" Text="" class="search_btn" OnClick="btnSearch_Click" />
</div>
<%--<link href="../../vi-vn/Complete/jquery-ui-1.10.4.custom.min.css" rel="stylesheet"
    type="text/css" />
<script   src="../../vi-vn/Complete/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
<style>
    .ui-autocomplete-category
    {
        font-weight: bold;
        padding: .2em .4em;
        margin: .8em 0 .2em;
        line-height: 1.5;
    }
    .ui-autocomplete
    {
        max-height: 500px;
        overflow: hidden;
    }
</style>
<script>
    $.widget("custom.catcomplete", $.ui.autocomplete, {
        _create: function () {
            this._super();
            this.widget().menu("option", "items", "> :not(.ui-autocomplete-category)");
        },
        _renderMenu: function (ul, items) {
            var that = this,
        currentCategory = "";
            $.each(items, function (index, item) {
                var li;
                if (item.category != currentCategory) {
                    ul.append("<li class='ui-autocomplete-category'>" + item.category + "</li>");
                    currentCategory = item.category;
                }
                li = that._renderItemData(ul, item);
                if (item.category) {
                    li.attr("aria-label", item.category + " : " + item.label);
                }
            });
        }
    });
</script>
<script   src="../../vi-vn/Ajax/Ajaxcomplete.js" type="text/javascript"></script>--%>
