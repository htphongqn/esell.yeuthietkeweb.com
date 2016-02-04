<%@ Page Title="" Language="C#" MasterPageFile="~/MOBILE/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="Order-payment-detail.aspx.cs" Inherits="MVC_Kutun.MOBILE.vi_vn.Order_payment_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="path">
        <a href="/">Trang chủ</a> &gt; <a class="aLink1" href="/m-lich-su-mua-hang.html">Đơn
            hàng của tôi</a>
    </div>
    <!--Cart-->
    <div class="box">
        <h1 class="box_Tab">
            Sản phẩm <span class="tt_quantity">Số lượng</span></h1>
        <div class="box_ct">
            <asp:Repeater ID="Rpgiohang" runat="server">
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
                                    <%# String.Format("{0:0,0 VNĐ}", Eval("ITEM_PRICE")).Replace(",", ".")%></span></div>
                        </div>
                        <div class="fright">
                            <%#Eval("ITEM_QUANTITY")%>
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
                    <p>
                        Phí vận chuyển:<span id="fee" class="fr">
                            <asp:Label ID="Lbship" runat="server" Text=""></asp:Label></span></p>
                    <div style="margin-bottom: 10px" class="line_dot">
                    </div>
                    <p>
                        Thành tiền:<span id="total-money">
                            <asp:Label ID="Lbtotal" runat="server" Text=""></asp:Label>
                        </span>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <!--End Cart-->
</asp:Content>
