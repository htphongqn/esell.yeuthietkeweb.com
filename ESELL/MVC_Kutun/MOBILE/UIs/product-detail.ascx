<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="product-detail.ascx.cs"
    Inherits="MVC_Kutun.MOBILE.UIs.product_detail" %>
<%@ Register Src="path.ascx" TagName="path" TagPrefix="uc1" %>
<asp:HiddenField ID="Hdscore" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="Hdurl" runat="server" ClientIDMode="Static" />
<div class="path">
    <a href="/">Trang chủ</a>
    <uc1:path ID="path1" runat="server" />
</div>
<!--Slider banner-->
<script src="/MOBILE/vi-vn/Ajax/Ajaxlike.js" type="text/javascript"></script>
<div class="box">
    <div id="owl-slidebanner_dtp" class="owl-carousel">
        <asp:Repeater ID="Rpimg" runat="server">
            <ItemTemplate>
                <div class="item">
                    <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>"></div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
<!-- End Slider banner -->
<!--Detail Products-->
<div class="box">
    <div id="dtp_info">
        <h1 class="h1Title">
            <asp:Label ID="Lbtitle_details" runat="server" Text=""></asp:Label>
        </h1>
        <div class="dtp_status" style="border-bottom: 1px solid #cacaca; margin-bottom: 10px">
            <div class="trademark">
                Thương hiệu:
                <asp:HyperLink ID="Hyperthuonghieu" runat="server"></asp:HyperLink>
            </div>
            <div class="trademark" id="trShop" runat="server">
                Được bán & giao hàng bởi: 
                <asp:HyperLink ID="hplShop" runat="server"></asp:HyperLink>
            </div>
            <!--Rating Star-->
            <div class="rating">
                Đánh giá:
                <div id="star">
                </div>
            </div>
        </div>
        <div class="fl" id="info_dtp_product">
            <div class="dtp_status borderBT" id="code_P">
                <span class="title_status">Mã sản phẩm:</span>
                <asp:Label ID="Lbcode" runat="server" Text="" ForeColor="blue"></asp:Label>
            </div>
            <!--end: .dtp_status-->
            <div class="dtp_status borderBT" id="viewed_count">
                <span class="title_status">Lượt xem: </span>
                <asp:Label ID="Lbcount_see" runat="server" Text="" ForeColor="blue"></asp:Label>
            </div>
            <!--end: .dtp_status-->
            <div class="dtp_status shortInfoPro ">
                <asp:Label ID="Lbdesc_details" runat="server" Text=""></asp:Label>
                <div class="dtp_row" id="li_des">
                    <ul>
                        <asp:Literal ID="Litdescbot" runat="server"></asp:Literal>
                    </ul>
                </div>
            </div>
            <!--end: .dtp_status-->
            <div class="clearfix">
            </div>
            <div class="dd_border bg_eee">
                <div class="col_detail fleft">
                    <div class="dtp_status dtp_price">
                        <b>
                            <asp:Label ID="Lbprice_promos" runat="server" Text=""></asp:Label>
                        </b>
                    </div>
                    <div id="div_promos" runat="server">
                        <div class="dtp_status f_price">
                            Giá trước đây: <del>
                                <asp:Label ID="Lbprice_goc" runat="server" Text=""></asp:Label>
                            </del>
                        </div>
                        <div class="dtp_status prod_saving">
                            Tiết kiệm: <b>
                                <asp:Label ID="Lbpricepointtietkiem" runat="server" Text="" ForeColor="Red"></asp:Label>
                            </b>
                        </div>
                    </div>
                </div>
                <div class="col_detail fright">
                    <div class="statusProStore available fright">
                        <!--unavailable-->
                        <span class="stttxt">
                            <asp:Label ID="lbtinhtrang" runat="server" Text=""></asp:Label>
                        </span>
                    </div>
                    <div class="dtp_row links_more fright clearfix">
                        <asp:HyperLink ID="Hyperlike" runat="server" CssClass="addlike like_pr" Style="cursor: pointer"><span class="heart_icon"></span>Tôi thích sản phẩm này</asp:HyperLink>
                    </div>
                </div>
            </div>
            <div class="clearfix">
            </div>
            <div class="btn_addtocart">
                <asp:HyperLink ID="Hyperaddtocart2" runat="server" class="cart_btn"></asp:HyperLink>
            </div>
            <a target="_blank" class="product__howToBuy" href="/huong-dan-dat-hang.html"><i class="icn-howtobuy">
            </i>Hướng dẫn mua hàng</a>
            <div class="btn_addtocart addtocart_fix">
                <asp:HyperLink ID="Hyperaddtocart" runat="server" class="cart_btn"></asp:HyperLink>
            </div>
            <div class="dtp_status">
                <div id="fb-root">
                </div>
                <script>                    (function (d, s, id) {
                        var js, fjs = d.getElementsByTagName(s)[0];
                        if (d.getElementById(id)) return;
                        js = d.createElement(s); js.id = id;
                        js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.3&appId=922486724480167";
                        fjs.parentNode.insertBefore(js, fjs);
                    } (document, 'script', 'facebook-jssdk'));</script>
                <asp:Label ID="Lbface" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</div>
<!--End Detail Products-->
<!--Thong_tin_chi_tiet-->
<div class="box">
    <div class="box_Tab">
        Chi tiết sản phẩm</div>
    <div class="box_ct info_g">
        <asp:Literal ID="liHtml_info" runat="server"></asp:Literal>
    </div>
</div>
<!--end Thong_tin_chi_tiet-->
<!--Thong_so_ky_thuat-->
<div class="box">
    <div class="box_Tab">
        Thông số kỹ thuật</div>
    <div class="box_ct info_g">
        <asp:Literal ID="liHtml_thongso" runat="server"></asp:Literal>
    </div>
</div>
<!--end Thong_so_ky_thuat-->
<!--Comment-->
<div class="box">
    <div class="box_Tab">
        Nhận xét sản phẩm</div>
    <div class="box_ct">
        <!--Comment-->
        <div class="comment_part cf">
            <script>                (function (d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id)) return;
                    js = d.createElement(s); js.id = id;
                    js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.3&appId=922486724480167";
                    fjs.parentNode.insertBefore(js, fjs);
                } (document, 'script', 'facebook-jssdk'));</script>
            <div class="fb-comments" data-href="<%=getUrlface() %>" data-numposts="5" data-colorscheme="light"
                data-width="280px">
            </div>
        </div>
        <!--End Comment-->
    </div>
</div>
<!--end Comment-->
<div class="box">
    <h2 class="box_Tab">
        Sản phẩm tương tự</h2>
    <div class="box_ct index_products">
        <div id="owl-slideP" class="owl-carousel products_home">
            <asp:Repeater ID="rp_sanphamcungloai" runat="server">
                <ItemTemplate>
                    <!--#item_P-->
                    <div class="item_P">
                        <div class="product">
                            <%#Getgiam(Eval("News_Price1"), Eval("News_Price2"))%>
                            <div class="img_product">
                                <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE") %>">
                                    <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%#Eval("NEWS_TITLE") %>" />
                                </a>
                            </div>
                            <div class="info_P">
                                <h3 class="product_name">
                                    <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE") %>">
                                        <%#Eval("NEWS_TITLE") %></a></h3>
                                <div class="txt_desc">
                                    <div class="price_n">
                                        <price><%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></price>
                                    </div>
                                    <div class="price_s">
                                        <del>
                                            <%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del></div>
                                </div>
                                <!--btn_P-->
                            </div>
                            <!--info_P-->
                        </div>
                        <!--product-->
                    </div>
                    <!--/item_P-->
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <!--/box_ct-->
</div>
<script type="text/javascript">
    $(document).ready(function () {
        var scro = document.getElementById("Hdscore").value;
        $('#star').raty({
            number: 5,
            score: scro,
            click: function (score, evt) {
                alert(score);
                console.log(score);
                addLike(score);
            }
        });
    });
    function addLike(score) {
        var seourl = document.getElementById("Hdurl").value;

        $.ajax({
            type: "POST",
            url: "../../vi-vn/Ajaxallservice.asmx/addRatting",
            data: "{seourl:'" + seourl + "',score:'" + score + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (e) {
                if (e.d == "success")
                    alert("Cảm ơn bạn đã đánh giá " + score + " cho sản phẩm này");
                else
                    alert("Bạn đã đánh giá sản phẩm này rồi");
            }
        });
    }
</script>
