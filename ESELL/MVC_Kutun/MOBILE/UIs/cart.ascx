<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="cart.ascx.cs" Inherits="MVC_Kutun.MOBILE.UIs.cart" %>
<h1 class="box_Tab">
    Sản phẩm <span class="tt_quantity">Số lượng</span></h1>
<div class="box_ct">
    <asp:Repeater ID="Rpgiohang" runat="server" OnItemCommand="Rpgiohang_ItemCommand">
        <ItemTemplate>
            <div class="item_cart">
                <input type="hidden" value='<%# Eval("news_id") %>' id="newsid" runat="server" />
                <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" target="_parent">
                    <img class="img_cart" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"
                        alt=""></a>
                <div class="detail_cart fleft">
                    <div class="cell name">
                        <span>
                            <%# Eval("NEWS_TITLE") %></span></div>
                    <div class="cell unit">
                        <span class="new">
                            <%# String.Format("{0:0,0 VNĐ}", Eval("Basket_Price")).Replace(",",".")%></span></div>
                </div>
                <div class="fright">
                    <div class="cell amount dropdown_list">
                        <asp:DropDownList ID="Drquan" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drSoLuong_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Text="6" Value="6"></asp:ListItem>
                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                            <asp:ListItem Text="8" Value="8"></asp:ListItem>
                            <asp:ListItem Text="9" Value="9"></asp:ListItem>
                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                            <asp:ListItem Text="11" Value="11"></asp:ListItem>
                            <asp:ListItem Text="12" Value="12"></asp:ListItem>
                            <asp:ListItem Text="13" Value="13"></asp:ListItem>
                            <asp:ListItem Text="14" Value="14"></asp:ListItem>
                            <asp:ListItem Text="15" Value="15"></asp:ListItem>
                            <asp:ListItem Text="16" Value="16"></asp:ListItem>
                            <asp:ListItem Text="17" Value="17"></asp:ListItem>
                            <asp:ListItem Text="18" Value="18"></asp:ListItem>
                            <asp:ListItem Text="19" Value="19"></asp:ListItem>
                            <asp:ListItem Text="20" Value="20"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:LinkButton ID="LinkXoa" class="close" runat="server" CommandName="delete" CommandArgument='<%# Eval("news_id") %>'>Xóa</asp:LinkButton>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <div class="foo-cart">
        <div class="total-cart">
            <p>
                Tổng cộng:
                <asp:Label ID="lbtotalmoney" runat="server" Text=""></asp:Label>
            </p>
            <div style="margin-bottom: 10px" class="line_dot">
            </div>
            <div id="div_ship" runat="server">
                <p>
                    Phí vận chuyển:<span id="fee" class="fr">
                        <asp:Label ID="Lbship" runat="server" Text=""></asp:Label></span></p>
                <div style="margin-bottom: 10px" class="line_dot">
                </div>
            </div>
            <p>
                Thành tiền:<span id="total-money">
                    <asp:Label ID="Lbtotal" runat="server" Text=""></asp:Label>
                </span>
            </p>
        </div>
    </div>
</div>
