<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer.ascx.cs" Inherits="MVC_Kutun.UIs.footer" %>
<%@ Register Src="hotlinefix.ascx" TagName="hotlinefix" TagPrefix="uc1" %>
<%@ Register Src="Seo-sologan.ascx" TagName="Seo" TagPrefix="uc2" %>
<!--Info SEO-->
<style>


</style>
<div class="box boxseo">
 
 <div class="inner-box pad10">
 <asp:PlaceHolder ID="Plseo" runat="server"></asp:PlaceHolder>
 </div>
</div>
<!--end Info SEO--> 
<style>

</style>
<div class="box " id="footer_slogans_container">
<div id="footer_slogans">
        <div class="slogan">
            <div class="icon adr-icon-diamond">
            </div>
            <!-- end .media-left -->
            <div class="text">
                <div class="title">
                    Uy tín hàng đầu
                </div>
                <div class="subtitle">
                      Uy tín hàng đầu
                </div>
            </div>
            <!-- end .media-body -->
        </div>
        <!-- end .slogan -->
        <div class="slogan">
            <div class="icon adr-icon-big-truck">
            </div>
            <!-- end .media-left -->
            <div class="text">
                <div class="title">
                    Vận chuyển siêu tốc
                </div>
                <div class="subtitle">
                    Giao trong ngày với hầu hết các mặt hàng
                </div>
            </div>
            <!-- end .media-body -->
        </div>
        <!-- end .slogan -->
        <div class="slogan">
            <div class="icon adr-icon-products">
            </div>
            <!-- end .media-left -->
            <div class="text">
                <div class="title">
                    Sản phẩm đa dạng
                </div>
                <div class="subtitle">
                    Từ rau, củ, quả, deal dịch vụ đến ô tô, xe máy
                </div>
            </div>
            <!-- end .media-body -->
        </div>
        <!-- end .slogan -->
    </div>

</div>
<!--Footer Column-->
<div id="footer_columns" class="box boxmenuft">
 <ul id="list_col_footer">
  <asp:Repeater ID="Rpmenu_foot" runat="server">
            <ItemTemplate>
                <!--Column Footer-->
                <li class="col_foo">
                    <div class="col_F_ct">
                        <h3 class="title_col_footer">
                            <%#Eval("CAT_NAME") %></h3>
                        <ul class="list_menu_footer">
                            <asp:Repeater ID="Repeater1" runat="server" DataSource='<%#Load_caterank2(Eval("CAT_ID")) %>'>
                                <ItemTemplate>
                                    <li><a class="footer_item_link" href="<%#GetLink_Cat(Eval("Cat_Url"),Eval("Cat_Seo_Url")) %>" title="<%#Eval("CAT_NAME") %>">
                                        <%#Eval("CAT_NAME") %></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </li>
                <!--end Column Footer-->
            </ItemTemplate>
        </asp:Repeater>
<%-- 
  <!--Column Footer-->
  <li class="col_foo">
   <div class="col_F_ct">
    <h3 class="title_col_footer"> Thông tin chung</h3>
    <ul class="list_menu_footer">
     <li><a class="footer_item_link" href="/gioi-thieu-ve-esell-vn.html"> Giới thiệu về Esell.Vn</a></li>
     <li><a class="footer_item_link" href="/dieu-khoan-dieu-kien-mua-ban.html"> Điều khoản &amp; điều kiện mua bán</a></li>
     <li><a class="footer_item_link" href="/chinh-sach-bao-mat.html"> Chính sách bảo mật</a></li>
     <li><a class="footer_item_link" href="/cam-nang-mua-sam.html"> Cẩm nang mua sắm</a></li>
     <li><a class="footer_item_link" href="/hoi-dap.html"> Hỏi đáp</a></li>
     <li><a class="footer_item_link" href="/quy-che-san-giao-dich.html"> Quy chế sàn giao dịch</a></li>
    </ul>
   </div>
  </li>
  <!--end Column Footer--> 
  <!--Column Footer-->
  <li class="col_foo">
   <div class="col_F_ct">
    <h3 class="title_col_footer"> Hỗ trợ khách hàng</h3>
    <ul class="list_menu_footer">
     <li><a class="footer_item_link" href="/lien-he.html"> Liên hệ</a></li>
     <li><a class="footer_item_link" href="/giao-hang-nhan-hang.html"> Giao hàng &amp; Nhận hàng</a></li>
     <li><a class="footer_item_link" href="/cach-thuc-thanh-toan.html"> Cách thức thanh toán</a></li>
     <li><a class="footer_item_link" href="/huong-dan-dat-hang.html"> Hướng dẫn đặt hàng</a></li>
     <li><a class="footer_item_link" href="/chinh-sach-doi-tra-hang.html"> Chính sách đổi trả hàng</a></li>
     <li><a class="footer_item_link" href="/bao-hanh.html"> Bảo hành</a></li>
    </ul>
   </div>
  </li>
  <!--end Column Footer-->
      --%>
  <!--Column Footer-->
  <li class="col_foo">
   <div class="col_F_ct">
    <h3 class="title_col_footer"> Chăm sóc khách hàng</h3>
    <div> Hotline: <b style="color: #FF0000">
     <uc1:hotlinefix ID="hotlinefix1" runat="server" />
     </b> <br />
     <p class="f_cc" style="float: left; width: 50%;"> <strong>Thứ 2-6</strong><br>
      từ 8:00 - 17:30</p>
     <p class="f_cc" style="float: left; width: 50%;"> <strong>Thứ 7</strong><br>
      từ 8:00 - 12:00 </p>
    </div>
    <!--Social-->
    <div id="social_network" class="cf">
     <div class="lb_col_foo"> <b>ĐƯỢC CHỨNG NHẬN</b></div>
     <a target="_blank" href="http://online.gov.vn/HomePage/WebsiteDisplay.aspx?DocId=6594"
                        title="Đã đăng ký bộ công thương"> <img style="height: 62px;  border-width: 0px;" alt="Click xem chi tiết"
                            src="http://online.gov.vn/Images/s1.png" title="Click xem chi tiết"> <br>
     </a>
     <asp:Repeater ID="Rpfacebook" runat="server">
      <ItemTemplate> <%# LoadOnline(Eval("ONLINE_TYPE"), Eval("ONLINE_DESC"), Eval("ONLINE_NICKNAME"))%> </ItemTemplate>
     </asp:Repeater>
    </div>
   </div>
  </li>
  <!--end Column Footer--> 
  <!--Column Footer-->
  <li class="col_foo">
   <div class="col_F_ct">
    <!--Register to get email-->
    <div id="get_email" class="cf">
     <div class="title_col_footer"> <b>Đăng ký nhận tin</b></div>
     <p>( Đăng ký nhận bản tin từ chúng tôi )</p>
     <input type="text" onkeypress="if(event.which || event.keyCode || event.charCode){if ((event.charCode == 13) || (event.which == 13) || (event.keyCode == 13)) {document.getElementById('vi7_lbtnSearch').click();return false;}} else {return true}; "
                        value="Nhập địa chỉ Email của bạn" onfocus="if (this.value=='Email…') this.value='';"
                        onblur="if (this.value=='') this.value='Nhập địa chỉ Email của bạn';" class="input_email"
                        id="Txtemail" onclick="this.value=''" />
     <a href="javascript:void(0)" onclick="regis_mail()" class="send_button">Đăng ký</a> </div>
    <!--end Register to get email--> 
   </div>
  </li>
  <!--end Column Footer-->
 </ul>
</div>
<!--end Footer Column--> 
<style>
</style>
<!--Categories Footer-->
<div id="category_footer" class="cf">
 <div class="lb_cate_foo"> Danh mục sản phẩm nổi bật</div>
 <div class="pad10">
  <asp:Repeater ID="Rpmenufoot_thuonghieu" runat="server">
   <ItemTemplate>
    <h2 class="footer_link"> <a class="footer_item_link" href="<%#GetLink_Cat(Eval("Cat_Url"),Eval("Cat_Seo_Url")) %>" title="<%#Eval("CAT_NAME") %>"> <%#Eval("CAT_NAME") %></a></h2>
   </ItemTemplate>
  </asp:Repeater>
 </div>
</div>
<address class="addft">
<asp:Literal ID="Literal1" runat="server"></asp:Literal>

</address>
 
<!--end Categories Footer--> 
<script  src="../vi-vn/Ajax/Email.js" type="text/javascript"></script> 
