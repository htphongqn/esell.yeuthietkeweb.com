<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="left-menu-shop.ascx.cs" Inherits="MVC_Kutun.UIs.left_menu_shop" %>
<div class="most-viewed" id="cate_left">
    <asp:Repeater ID="Rpleftmenu" runat="server">
        <ItemTemplate>
            <h2>
                <%#Eval("cat_name")%>
            </h2>
            <asp:Repeater ID="Repeater2" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                <HeaderTemplate>
                    <ul class="list_field">
                </HeaderTemplate>
                <ItemTemplate>
                    <li><a class="cate_parent_left" href="<%#GetLink(Eval("Cat_ID"))%>">
                        <%#Eval("cat_name")%></a>
                        <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                            <HeaderTemplate>
                                <ul style="margin: 10px 0 !important;">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li><a href="<%#GetLink(Eval("Cat_ID"))%>">
                                    <%#Eval("cat_name")%></a></li></ItemTemplate>
                            <FooterTemplate>
                                </ul></FooterTemplate>
                        </asp:Repeater>
                </ItemTemplate>
                <FooterTemplate>
                    </ul></FooterTemplate>
            </asp:Repeater>
        </ItemTemplate>
    </asp:Repeater>
</div>
<div id="div_thuonghieu" runat="server">
    <div class="most-viewed" id="filter_trademark">
        <h3>
            Thương hiệu</h3>
        <ul>
            <asp:Repeater ID="Rphangsx" runat="server">
                <ItemTemplate>
                    <li title="2good" data-url="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"))%>" class="multiselect__item">
                        <input type="checkbox" <%#setChecked(Eval("CAT_ID")) %> id="<%#Eval("CAT_ID") %>"
                            onclick="chooseTH(this,<%#Eval("CAT_ID") %>)">
                        <label for="<%#Eval("CAT_ID") %>">
                            <span></span>
                            <%#Eval("CAT_NAME") %></label>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
</div>
<div class="most-viewed" id="search_price">
    <h3>
        Tìm theo giá</h3>
    <ul class="list_field">
        <li><a href="<%=getLink_price("200000",3) %>" class="active">Dưới 200.000 VNĐ</a>
        </li>
        <li><a href="<%=getLink_price("200000,500000",1) %>">200.000 - 500.000 VNĐ</a> </li>
        <li><a href="<%=getLink_price("500000,1000000",1) %>">500.000 - 1.000.000 VNĐ</a>
        </li>
        <li><a href="<%=getLink_price("1000000,2000000",1) %>">1.000.000 - 2.000.000 VNĐ</a>
        </li>
        <li><a href="<%=getLink_price("2000000",2) %>">Trên 2.000.000 VNĐ</a> </li>
    </ul>
</div>
<asp:HiddenField ID="Hdurl" runat="server" ClientIDMode="Static" />
<script>

    function chooseTH(e, id) {
        var geturl = document.getElementById("Hdurl").value;
        if (e.checked) {
            document.location = geturl + "-" + id;
        }
        else {
            document.location = geturl.replace("-" + id, "");
        }
    }
</script>
