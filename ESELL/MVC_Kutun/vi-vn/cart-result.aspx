<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="cart-result.aspx.cs" Inherits="MVC_Kutun.vi_vn.cart_result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Cart Page-->
    <link href="../vi-vn/Styles/process_payment.css" rel="stylesheet" type="text/css" />
    <div id="cart_page">
        <div class="row_th_cart">
            <h3 class="th_table_cart fl" style="width: 15%">
                Hình ảnh
            </h3>
            <h3 class="th_table_cart fl" style="width: 39%">
                Tên sản phẩm
            </h3>
            <h3 class="th_table_cart fl" style="width: 15%">
                Giá bán
            </h3>
            <h3 class="th_table_cart fl" style="width: 10%">
                Số lượng
            </h3>
            <h3 class="th_table_cart fl" style="width: 20%">
                Thành tiền
            </h3>
        </div>
        <asp:Repeater ID="Rpgiohang" runat="server" OnItemCommand="Rpgiohang_ItemCommand">
            <ItemTemplate>
                <!--Item Cart-->
                <div class="item_cart fl">
                    <input type="hidden" value='<%# Eval("news_id") %>' id="newsid" runat="server" />
                    <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>' target='_parent'
                        class='img_cart fl'>
                        <img src='<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>' alt='' height='100' /></a>
                    <div class="cell name">
                        <div class="productdescription">
                            <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>'>
                                <%# Eval("NEWS_TITLE") %></a></div>
                        <div class="cart_brand">
                            <%#getNamethuognhieu(Eval("UNIT_ID2"))%>
                        </div>
                        <span class="stock">✓ Còn hàng</span> <span class="productlink">
                            <asp:LinkButton ID="Lbdelete" class="cartItemRemove" runat="server" CommandName="delete"
                                CommandArgument='<%# Eval("news_id") %>'>Xóa</asp:LinkButton>
                        </span>
                    </div>
                    <div class="cell unit">
                        <span class="new" id="soldprice_1757" <%#setStyle(Eval("NEWS_PRICE2")) %>>
                            <%# String.Format("{0:0,0 VNĐ}", Eval("Basket_Price")).Replace(",",".")%></span>
                        <del class="old">
                            <%#GetPrice2(Eval("NEWS_PRICE1"),Eval("NEWS_PRICE2"))%></del>
                        <%#Getgiam(Eval("NEWS_PRICE1"),Eval("NEWS_PRICE2"))%></div>
                    <div class="cell amount">
                        <!-- so luong -->
                        <div class="quantity" style="margin: 0">
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
                        <!-- -->
                    </div>
                    <div class="cell total" id="dealtotal_1757">
                        <%# String.Format("{0:0,0 VNĐ}",Convert.ToInt32(Eval("Basket_Price"))*Convert.ToInt32(Eval("Basket_Quantity"))).Replace(",",".") %></div>
                </div>
                <!--end Item Cart-->
            </ItemTemplate>
        </asp:Repeater>
        <div class="foo-cart">
            <div class="total-cart">
                <p>
                    Tổng cộng:<span id="total-sum"><asp:Label ID="Lbtotal2" runat="server" Text=""></asp:Label></span></p>
                <p class="all_total">
                    Thành tiền:<span id="total-money">
                        <asp:Label ID="Lbtotal" runat="server" Text=""></asp:Label>
                    </span>
                </p>
            </div>
        </div>
        <div class="button_cart">
            <a class="btn_web btn_payment fr" href="/thanh-toan-buoc-1.html" style="margin-left: 15px">
                Tiến hành đặt hàng »</a>
            <%--<asp:LinkButton ID="Lbcapnhap" runat="server" class="btn_web btn_payment fr" OnClick="Lbcapnhap_Click"
                Style="margin-left: 15px">Cập nhật giỏ hàng</asp:LinkButton>--%>
            <a class="btn_web btn_payment fr" href="/trang-chu.html">Mua thêm sản phẩm khác...</a></div>
    </div>
    <!--end Cart Page-->
    <script>
        function formatNumeric(num) {
            num = repStr(num.toString());
            if (isNaN(num)) {
                num = "0";
            }
            return (num);
        }
        function repStr(str) {
            var strResult = "";
            for (i = 0; i < str.length; i++)
                if ((str.charAt(i) != "$") && (str.charAt(i) != ",")) {
                    strResult = strResult + str.charAt(i)
                }
            return strResult;
        }
    </script>
</asp:Content>
