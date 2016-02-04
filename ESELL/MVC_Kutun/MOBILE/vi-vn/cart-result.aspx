<%@ Page Title="" Language="C#" MasterPageFile="~/MOBILE/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="cart-result.aspx.cs" Inherits="MVC_Kutun.MOBILE.vi_vn.cart_result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="path">
        <a href="/">Trang chủ</a> &gt; <a class="aLink1" href="#">Giỏ hàng</a>
    </div>
    <!--Cart-->
    <div class="box">
        <h1 class="box_Tab">
            Sản phẩm <span class="tt_quantity">Số lượng</span></h1>
        <div class="box_ct">
            <asp:Repeater ID="Rpgiohang" runat="server" OnItemCommand="Rpgiohang_ItemCommand">
                <ItemTemplate>
                    <div class="item_cart">
                        <input type="hidden" value='<%# Eval("news_id") %>' id="newsid" runat="server" />
                        <a target="_parent" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>">
                            <img alt="" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" class="img_cart" /></a>
                        <div class="detail_cart fleft">
                            <div class="cell name">
                                <span><a target="_parent" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>">
                                    <%# Eval("NEWS_TITLE") %></a></span></div>
                            <div class="cart_brand">
                                <%#getNamethuognhieu(Eval("UNIT_ID2"))%>
                            </div>
                            <div class="cell unit">
                                <span class="new">
                                    <%# String.Format("{0:0,0 VNĐ}", Eval("Basket_Price")).Replace(",",".")%></span></div>
                            <div class="cell unit">
                                <del class="old">
                                    <%#GetPrice2(Eval("NEWS_PRICE1"),Eval("NEWS_PRICE2"))%></del></div>
                            <div class="stock">
                                ✓ Còn hàng</div>
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
                    <div class="line_dot" style="margin-bottom: 10px">
                    </div>
                    Tổng tiền:<span id="total-money">
                        <asp:Label ID="Lbtotal" runat="server" Text=""></asp:Label>
                    </span>
                </div>
            </div>
            <div class="button_cart" style="float:left;width:100%">
                <a href="/thanh-toan-buoc-1-mobile.html" class="btn_web btn_payment">Tiến hành đặt hàng
                    »</a>
                <!--<asp:LinkButton ID="Lbcapnhap" runat="server" class="btn_web btn_payment" OnClick="Lbcapnhap_Click">Cập nhật giỏ hàng</asp:LinkButton>-->
                <a href="/" class="btn_web btn_payment">Mua thêm sản phẩm khác</a>
            </div>
        </div>
    </div>
    <!--End Cart-->
</asp:Content>
