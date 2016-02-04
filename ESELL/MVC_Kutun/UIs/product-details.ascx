<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="product-details.ascx.cs"
    Inherits="MVC_Kutun.UIs.product_details" %>
<%@ Register Src="path.ascx" TagName="path" TagPrefix="uc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:HiddenField ID="Hdscore" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="Hdurl" runat="server" ClientIDMode="Static" />
<div id="main" class="cf">
 <div class="path"> <a href="/">Trang chủ</a>
  <uc1:path ID="path1" runat="server" />
 </div>
 <!--Detail Products--> 
 <!--Colorbox--> 
 <script src="../vi-vn/Ajax/Ajaxlike.js" type="text/javascript"></script>
 <link rel="stylesheet" href="../vi-vn/Styles/detail_product.css" type="text/css" />
 <link href="../vi-vn/Styles/colorbox.css" media="all" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="../vi-vn/Scripts/jquery.colorbox.js"></script> 
 <script>//<![CDATA[
        $(document).ready(function () {
            $(".group_colorbox").colorbox({ rel: 'group_colorbox', width: "60%", height: "90%" });
        });	
    </script>
 <div class="box">
  <div id="detail_products" itemscope itemtype="http://schema.org/Product">
   <div class="dtp_row hidden" style="border-bottom: 1px solid #cacaca; margin-bottom: 15px"> </div>
   <div class="pro_left">
    <div class="pro_l_in wmn">
     <link href="../vi-vn/Styles/cloud-zoom.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="../vi-vn/Scripts/cloud-zoom.1.0.2.js"></script>
     <div class="zoom-desc fl">
      <ul>
       <asp:Repeater ID="Rpimg_small" runat="server">
        <ItemTemplate>
         <li><a href='<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>' class='cloud-zoom-gallery group_colorbox'
                                        title='<%#Eval("NEWS_IMG_DESC") %>' rel="useZoom: 'zoom1', smallImage: '<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>'"> <img class="zoom-tiny-image" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>"
                                            alt="<%#Eval("NEWS_IMG_DESC") %>" /></a> </li>
        </ItemTemplate>
       </asp:Repeater>
      </ul>
      <div class="cf"> </div>
      <a id="prev_thumb" class="prev" href="#">&lt;</a> <a id="next_thumb" class="next"
                            href="#">&gt;</a> </div>
     <div class="zoom-section fl">
      <asp:Repeater ID="Rpimg_big" runat="server">
       <ItemTemplate>
        <div class="zoom-small-image"> <a href='<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>' class='cloud-zoom'
                                        id='zoom1' rel="adjustX: 10, adjustY:-4" title="<%#Eval("NEWS_IMG_DESC") %>"> <img class="mainImage" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>"
                                            alt='<%#Eval("NEWS_IMG_DESC") %>' title="<%#Eval("NEWS_IMG_DESC") %>" itemprop="image"  /></a>
         <div class="zoom cf"> <a href='<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>' class='group_colorbox'
                                            title='<%#Eval("NEWS_IMG_DESC") %>'>Click vào thumbnail để xem hình lớn</a></div>
        </div>
       </ItemTemplate>
      </asp:Repeater>
      <div class="clear bottom-img-zoom" style="margin-top:40px; display: block;"> </div>
     </div>
    </div>
   </div>
   <!--end: #dp-thumb-->
   <div id="dtp_info" class="fl">
    <h1 class="h1Title" itemprop="name">
     <asp:Label ID="Lbtitle_details" runat="server" Text=""></asp:Label>
    </h1>
    <div class="item-row1">
     <div class="item-price">
      <div class="item-brand"> <span>Thương hiệu</span>
       <p>
        <asp:HyperLink ID="Hyperthuonghieu" runat="server"></asp:HyperLink>
       </p>
      </div>
      <p class="old-price-item" id="p-listpirce"> <span>Giá thị trường:</span> <span>
       <asp:Label ID="Lbprice_goc" runat="server" Text=""></asp:Label>
       </span> </p>
      <p class="special-price-item" data-value="159000" id="p-specialprice"> <span>Giá khuyến mãi:</span> <span id="span-price">
       <asp:Label ID="Lbprice_promos" runat="server" Text="" ForeColor="Red"></asp:Label>
       </span> <span>(Đã có VAT)</span> </p>
      <p class="saleoff-price-item"> <span>Tiết kiệm:</span> <span>
       <asp:Label ID="Lbpricepointtietkiem" runat="server" Text="" ForeColor="red"></asp:Label>
       </span> </p>
     </div>
     <div class="item-other">
      <%--<div itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
       <meta itemprop="ratingValue" content = "4.3">
       <meta itemprop="ratingCount" content = "34">
      </div>--%>
         <asp:Literal ID="lbAggregateRating" runat="server"></asp:Literal>
      <!--Rating Star-->
      <link rel="stylesheet" href="../vi-vn/Styles/jRating.jquery.css" type="text/css" />
      <script type="text/javascript" src="../vi-vn/Scripts/jquery.raty.js"></script> 
      <script type="text/javascript">
                    $(document).ready(function () {
                        var scro = document.getElementById("Hdscore").value;
                        $('#star').raty({
                            number: 5,
                            score: scro,
                            click: function (score, evt) {
                                console.log(score);
                                addLike(score);
                            }
                        });
                    });
                    function addLike(score) {
                        var seourl = document.getElementById("Hdurl").value;
                        $.ajax({
                            type: "POST",
                            url: "../vi-vn/Ajaxallservice.asmx/addRatting",
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
      <div class="item-rating">
       <div class="rating">
        <div id="star"> </div>
       </div>
      </div>
      <p class="item-review-now"> <a id="write_review" href="#goto_write_review">Viết nhận xét</a> </p>
      <div class="item-benefit">
       <%--<p><strong>Bảo hành 12 tháng chính hãng</strong></p>
        <p>Miễn phí vận chuyển </p>
       <p><span>Miễn phí đổi trả trong vòng 7 ngày</span> <a href="" target="_blank"><i class="fa fa-caret-right"></i>Chi tiết</a></p>--%>
       <asp:Label ID="Lbdesc_details" runat="server" Text=""></asp:Label>
      </div>
     </div>
    </div>
    
    <!--Info Detail Products-->
    
    <div class="item-promotion">
     <div class="item-promotion-title">
      <h2>Thông tin &amp; Khuyến mãi</h2>
     </div>
     <div class="item-promotion-content">
      <div class="quatangkm" style="display:inline-block; max-width:200px; vertical-align:top;margin-right:20px">
       <asp:Label ID="lbImgPromo" runat="server"></asp:Label>
      </div>
      <div class="dknhanhang" style="display:inline-block;max-width:70% ; vertical-align:top">
       <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
       <asp:UpdatePanel ID="upnhanhang" runat="server">
        <ContentTemplate>
         <p class="pp1" style="">Nhận hàng tại
          <asp:DropDownList ID="Drarea2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Drarea2_SelectedIndexChanged"> </asp:DropDownList>
          <asp:Label ID="lbDesArea" runat="server" Text="từ 3 - 5 ngày , không kể Thứ 7 & CN"></asp:Label>
         </p>
        </ContentTemplate>
       </asp:UpdatePanel>
       <%--<p> <img src="vi-vn/images/24h.png" height="20" style="margin-right:5px">Sản phẩm có thể được giao trong vòng 24 giờ đến các quận nội thành tại TP Hồ Chí Minh</p>--%>
       <asp:Literal ID="Litdescbot" runat="server"></asp:Literal>
      </div>
     </div>
    </div>
    
    <!--Info Detail Products-->
    <div class="wmn">
     <div class="quantity-box">
      <p class="quantity-label">Số lượng:</p>
      <div class="quantity-col1">
       <div class="number-input">
        <div class="input-group bootstrap-touchspin">
         <asp:TextBox ID="qty" runat="server" Text="1" CssClass="form-control ipsl"></asp:TextBox>
         <span class="input-group-btn-vertical">
         <asp:LinkButton ID="btnUp" runat="server" CssClass="btn btn-default bootstrap-touchspin-up" type="button"><i class="fa fa-chevron-up"></i></asp:LinkButton>
         <asp:LinkButton ID="btnDown" runat="server" CssClass="btn btn-default bootstrap-touchspin-down" type="button"><i class="fa fa-chevron-down"></i></asp:LinkButton>
         </span>
         <ajaxToolkit:NumericUpDownExtender ID="NUD1" runat="server"
            TargetControlID="qty" 
            Width="100"
            RefValues="1;2;3;4;5;6;7;8;9"
            TargetButtonDownID="btnDown"
            TargetButtonUpID="btnUp"
            Tag="1" />
        </div>
       </div>
      </div>
      <div class="quantity-col2">
       <asp:LinkButton ID="Hyperaddtocart" runat="server" OnClick="Lbaddtocart_Click" CssClass="hidden">
        <button class="add-to-cart js-add-to-cart disabled is-css" type="button" > <span class="icon"> <i class="fa fa-shopping-cart"></i> </span> <span class="text">Mua Ngay</span> </button>
       </asp:LinkButton>
       <asp:LinkButton ID="btnAddtocart" runat="server" OnClick="btnAddtocart_Click">
        <button class="add-to-cart js-add-to-cart disabled is-css" type="button" > <span class="icon"> <i class="fa fa-shopping-cart"></i> </span> <span class="text">Thêm Vào Giỏ Hàng</span> </button>
       </asp:LinkButton>
      </div>
      <a href="/huong-dan-dat-hang.html" class="producthowToBuy" target="_blank"> <i class="icnhowtobuy"></i>Hướng dẫn<br>
      mua hàng</a> </div>
     <div class="box-like">
      <div id="fb-root"  class="wmn"> 
       <script>                            (function (d, s, id) {
                                var js, fjs = d.getElementsByTagName(s)[0];
                                if (d.getElementById(id)) return;
                                js = d.createElement(s); js.id = id;
                                js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.3&appId=922486724480167";
                                fjs.parentNode.insertBefore(js, fjs);
                            } (document, 'script', 'facebook-jssdk'));</script>
       <asp:Label ID="Lbface" runat="server" Text=""></asp:Label>
      </div>
      <div class="cf"></div>
      <div class="wmn themvaoyeuthich">
       <asp:HyperLink ID="Hyperlike" runat="server" CssClass="addlike" Style="cursor: pointer">
        <button class="btnlike" type="button"><i class="fa fa-heart"></i> <span class="text">Thêm Vào Yêu Thích</span></button>
       </asp:HyperLink>
      </div>
     </div>
    </div>
    <div class="info_dtp_product fl">
     <div class="dtp_row hidden" id="code_P">
      <div style="float: left; width: 50%"> <span>Mã sản phẩm:</span>
       <asp:Label ID="Lbcode" runat="server" Text="" ForeColor="blue"></asp:Label>
      </div>
      <div style="float: right; width: 50%; text-align: right"> <span>Lượt xem:</span>
       <asp:Label ID="Lbcount_see" runat="server" Text="" ForeColor="blue"></asp:Label>
      </div>
     </div>
     <div class="dtp_row hidden" id=" short_des_dtp">
      <div class="dtp_row" id="li_des">
       <ul>
       </ul>
      </div>
     </div>
     <div class="dtp_row price_detail">
      <div class="col_detail fl">
       <div class="dtp_price"> <b> </b> </div>
       <div id="div_promos" runat="server">
        <div class="f_price"> </div>
        <div class="prod_saving"> </div>
       </div>
      </div>
      <div class="col_detail fr">
       <div class="dtp_row">
        <div class="status_product available fr">
         <asp:Label ID="lbtinhtrang" runat="server" Text=""></asp:Label>
        </div>
        <!--<div class="status_product unavailable fr">Hết hàng</div>--> 
       </div>
      </div>
     </div>
     <div class="dtp_row buy_function"> <a href="/huong-dan-dat-hang.html" class="product__howToBuy" target="_blank"><i class="icn-howtobuy"> </i>Hướng dẫn mua hàng</a> </div>
    </div>
    <!--end Info Detail Products--> 
    <!--Support Detail-->
    <%--<div class="prod_r_content fr hidden">
     <div class="dtp_row"> </div>
     <div class="box_ct cf">
      <div class="product_leadtime_title"> Chọn địa chỉ của bạn để kiểm tra phí vận chuyển và thời gian giao hàng dự kiến</div>
      
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>
        <div class="dtp_row">
         <label for="delivery_province"> Tỉnh/thành phố:</label>
         <span class="select_item slect_location"> </span> </div>
        <div class="dtp_row">
         <label> Quận/huyện:</label>
         <span class="select_item slect_zip">
         <asp:DropDownList ID="Drdistric" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Drdistric_SelectedIndexChanged"> </asp:DropDownList>
         </span> </div>
        <div class="delivery_types"> <b>
         <asp:Literal ID="Lbgiaohang" runat="server"></asp:Literal>
         </b> </div>
       </ContentTemplate>
      </asp:UpdatePanel>
      <div class="method_payment cf"> <span>Thẻ ATM nội địa</span><span>Thanh toán khi nhận hàng </span> </div>
     </div>
     <div class="box_ct shop" id="trShop" runat="server"> <span>Được bán & giao hàng bởi </span>
      <asp:HyperLink ID="hplShop" runat="server" ForeColor="Blue"></asp:HyperLink>
     </div>
     <div class="box_ct method_payment"> <span>Bảo đảm chính hãng 100%</span><span>Đổi trả dễ dàng</span><span>Giao hàng tận
      nơi</span><span>Thanh toán khi nhận hàng</span> </div>
    </div>--%>
    <!--End Support Detail--> 
   </div>
  </div>
  <div class="cf"> </div>
 </div>
 <!--End Detail Products-->
 <div class="box bg-none"> 
  <!--Sidebar Detail Products-->
  <div id="l_slP" class="fl"> 
   <!--Tab Detail Products-->
   <div id="tabs-container">
    <h3 class="tt_popP"> <span>Chi tiết sản phẩm</span></h3>
    <div class="tabs_detail_content">
     <asp:Literal ID="liHtml_info" runat="server"></asp:Literal>
     <div class="cf"> </div>
    </div>
    <h3 class="tt_popP"> <span>Thông số kỹ thuật</span></h3>
    <div class="tabs_detail_content"> 
     <!--Info Brand-->
     <asp:Literal ID="liHtml_thongso" runat="server"></asp:Literal>
     <!--end Info Brand-->
     <div class="cf"> </div>
    </div>
    <h3 class="tt_popP"> <span><a name="goto_write_review">Nhận xét về sản phẩm</a></span></h3>
    <div class="tabs_detail_content"> 
     <!--Comment-->
     <div class="wmn">
      <div class="box_danhgia">
       <div class="danhgia">
        <div class="row_danhgia">
         <label class="l_danhgia"> Tiêu đề<span class="required">*<asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server"
                                    ErrorMessage="Chưa nhập tiêu đề" ControlToValidate="txttitle" Display="None"
                                    ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span> </label>
         <div class="r_danhgia">
          <input type="text" id="txttitle" runat="server" class="input_danhgia" placeholder="Nhập tiêu đề">
         </div>
        </div>
        <div class="row_danhgia">
         <label class="l_danhgia"> Nội dung<span class="required">*<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                    runat="server" ErrorMessage="Nhận xét về sản phẩm" ControlToValidate="txtcontent"
                                    Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span> </label>
         <div class="r_danhgia">
          <textarea id="txtcontent" runat="server" class="input_danhgia" cols="20" placeholder="Nhập nhận xét của bạn." rows="2"></textarea>
         </div>
        </div>
        <div class="row_danhgia">
         <label class="l_danhgia"> Tên<span class="required">*<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                    runat="server" ErrorMessage="Nhập tên của bạn" ControlToValidate="txtname" Display="None"
                                    ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span> </label>
         <div class="r_danhgia">
          <input type="text" id="txtname" runat="server" class="input_danhgia" placeholder="Nhập tên của bạn">
         </div>
        </div>
        <div class="row_danhgia">
         <label class="l_danhgia"> Email<span class="required">*<asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                    runat="server" ErrorMessage="Nhập email của bạn" ControlToValidate="txtemail"
                                    Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span> </label>
         <div class="r_danhgia">
          <input type="text" id="txtemail" runat="server" class="input_danhgia" placeholder="Nhập email của bạn">
         </div>
        </div>
        <div class="row_danhgia">
         <label class="l_danhgia"> Mã bảo vệ<span class="required">*<asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                    runat="server" ErrorMessage="Nhập mã bảo vệ" ControlToValidate="txtcapcha" Display="None"
                                    ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator></span> </label>
         <div class="r_danhgia"> <asp:Image ID="Image1" runat="server" ImageUrl="../vi-vn/CImage.aspx" Width="150px" /> <br>
          <input type="text" id="txtcapcha" runat="server" class="input_danhgia" placeholder="Nhập mã bảo vệ">
         </div>
        </div>
        <div class="row_danhgia">
         <asp:Button ID="btnRate" runat="server" Text="Gửi đánh giá" class="buttoncm" OnClick="btnSendrate_Click"
                                ValidationGroup="G40" />
            
        </div>
        <div class="row_danhgia">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="true"
                ShowSummary="false" ValidationGroup="G40" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail"
                ErrorMessage="Email Định Dạng Chưa Đúng" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
            <asp:Label ID="lblresult" runat="server" ForeColor="Red"></asp:Label>
        </div>            
       </div>
        <div class="choose_star"> <b>Đánh giá sản phẩm</b>
        <ul>
            <li>
                <asp:RadioButton ID="Rdfiverate" runat="server" class="contact_now_to_check" Checked="true"
                    GroupName="rate" />
                <span class="star_icon five_star"></span></li>
            <li>
                <asp:RadioButton ID="Rdfourrate" runat="server" class="contact_now_to_check" GroupName="rate" />
                <span class="star_icon four_star"></span></li>
            <li>
                <asp:RadioButton ID="Rdthreerate" runat="server" class="contact_now_to_check" GroupName="rate" />
                <span class="star_icon three_star"></span></li>
            <li>
                <asp:RadioButton ID="Rdtworate" runat="server" class="contact_now_to_check" GroupName="rate" />
                <span class="star_icon two_star"></span></li>
            <li>
                <asp:RadioButton ID="Rdonerate" runat="server" class="contact_now_to_check" GroupName="rate" />
                <span class="star_icon one_star"></span></li>
        </ul>
       </div>
       <div class="cf"> </div>  
     </div>
         
       <div class="comment_review" itemprop="review" itemscope itemtype="http://schema.org/Review">
       <h3 class="tt-bl" id="lbNhanxet" runat="server"><span>Nhận xét mới</span></h3>
        <div class="commentPost">         
         <!--End noi dung binh luan-->
            <asp:Repeater ID="Rpcomment" runat="server">
                <ItemTemplate>
                    <div class="itemFeedback"> 
                      <!--Hinh dai dien nguoi binh luan-->
                      <div class="postActor"> <img />
                       <div class="nameActor">
                        <p itemprop="author"><b><%#Eval("COMMENT_NAME")%></b> </p>
                        <p class="postDateTime">(<%#getdate(Eval("COMMENT_PUBLISHDATE"))%>)</p>
                        <p class="actorAdd"></p>
                       </div>
                      </div>
                      <!--End hinh dai dien nguoi binh luan--> 
                      <!--Noi dung binh luan-->
                      <div class="postBody">
                       <div class="postContainer">
                        <div class="innerPostContainer">
                         <p class="danhgia-bl" ><span class="star_icon <%# getRatingComment(Eval("COMMENT_FIELD2"))%>"></span><span itemprop="name"><%#Eval("COMMENT_FIELD1")%></span> </p>
                         <%--<p class="pp1">Đã mua sản phẩm này từ 2 tháng trước</p>--%>
                         <div class="contentP" itemprop="reviewBody"> <%#Eval("COMMENT_CONTENT")%></div>
                        </div>
                       </div>
                      </div>
                     </div>
                    <div itemprop="itemReviewed" itemscope itemtype="http://schema.org/Product">
                            <span itemprop="name" content=""></span>
                    </div>
                    <div itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">
                            <meta itemprop="ratingValue" content="<%#Eval("COMMENT_FIELD2")%>">
                        </div>
                </ItemTemplate>
            </asp:Repeater>          
        </div>
       </div>
       <div class="cf"> </div>
     <div class="comment_part"> 
      <script>                            (function (d, s, id) {
                                var js, fjs = d.getElementsByTagName(s)[0];
                                if (d.getElementById(id)) return;
                                js = d.createElement(s); js.id = id;
                                js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.3&appId=922486724480167";
                                fjs.parentNode.insertBefore(js, fjs);
                            } (document, 'script', 'facebook-jssdk'));</script>
      <div class="fb-comments" data-href="<%=getUrlface() %>" data-numposts="5" data-colorscheme="light"
                            data-width="900"> </div>
     </div>
     <!--End Comment-->
     <div class="cf"> </div>
    </div>
   </div>
   <!--End Tab Detail Products--> 
   <!--The Same Products-->
   <div class="box">
    <div class="tt_popP"> <span>Sản phẩm tương tự</span></div>
    <div id="thesame_products" class="sl_products">
     <ul>
      <asp:Repeater ID="rp_sanphamcungloai" runat="server">
       <ItemTemplate>
        <li> 
         <!--Start Product-->
         <div class="product">
          
          <a class="img_product" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE") %>"> <img height="150" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"
                                                alt="<%#Eval("NEWS_TITLE") %>"></a>
          <h3 class="product_name"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE") %>"> <%#Eval("NEWS_TITLE") %></a></h3>
          <div class="info_price"> <span class="f_price"><del> <%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del></span> <span class="main_price"> <%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></span> </div>
          <%#Getgiam(Eval("News_Price1"), Eval("News_Price2"))%> <%#getBuy(Eval("NEWS_ID"), Eval("NEWS_FIELD3"))%> </div>
         <!--End Product--> 
        </li>
       </ItemTemplate>
      </asp:Repeater>
     </ul>
     <div class="cf"> </div>
     <a id="prev_thesameP" class="prev" href="#">&lt;</a> <a id="next_thesameP" class="next"
                        href="#">&gt;</a> </div>
   </div>
   <!--end The Same Products--> 
  </div>
  <!--end Sidebar Detail Products--> 

 </div>  <!--Other Products--> 
  <script src="../vi-vn/Scripts/jquery.sticky.js" type="text/javascript"></script> 
  <script type="text/javascript">
      $(document).ready(function () {
          $(".sticky").sticky({ topSpacing: 40 });
      });
        </script>
  <div id="other_products" class="fr">
   <div class="sticky" style="width: 245px">
    <div class="tt_popP"> <span>Có Thể Bạn Quan Tâm</span></div>
    <div class="box_ct">
     <ul>
      <asp:Repeater ID="Rpproquantam" runat="server">
       <ItemTemplate>
        <li> 
         <!--Start Product-->
         <div class="product"> 
          <h3 class="product_name"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE") %>"> <%#Eval("NEWS_TITLE") %></a></h3>
          <a class="img_product" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE") %>"> <img   src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"
                                                alt="<%#Eval("NEWS_TITLE") %>"></a>
          <div class="info_price"> <span class="f_price"><del> <%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del></span> <span class="main_price"> <%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></span> </div>
          <div class="btn_P"> <a class="view_detail" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" title="<%#Eval("NEWS_TITLE") %>"> Chi tiết</a></div>
         </div>
         <!--End Product--> 
        </li>
       </ItemTemplate>
      </asp:Repeater>
     </ul>
    </div>
   </div>
  </div>
</div>
