<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header-search.ascx.cs"
    Inherits="MVC_Kutun.UIs.header_search" %>
<script  src="../vi-vn/Complete/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
<link href="../vi-vn/Complete/jquery-ui-1.10.4.custom.min.css" rel="stylesheet" type="text/css" />
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
<script  src="../vi-vn/Ajax/Ajaxcomplete.js" type="text/javascript"></script>
<div class="search_dropdown">
    <div class="select_wrap">
        <asp:DropDownList ID="Drcate_search" runat="server">
        </asp:DropDownList>
    </div>
</div>
<input type="text" onfocus="if(this.value=='Tìm kiếm sản phẩm') this.value='';" onblur="if(this.value=='') this.value='Tìm kiếm sản phẩm';"
    value="Tìm kiếm sản phẩm" size="30" class="inputSearch ui-autocomplete-input"
    alt="Search" id="txtsearch" name="txtsearch" autocomplete="off" runat="server"
    clientidmode="Static">

<asp:Button ID="Btnseach" runat="server" Text="TÌM" class="btn" OnClick="Btnseach_Click" />
