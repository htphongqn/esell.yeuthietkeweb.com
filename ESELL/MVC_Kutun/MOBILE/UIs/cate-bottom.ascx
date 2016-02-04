<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="cate-bottom.ascx.cs"
    Inherits="MVC_Kutun.MOBILE.UIs.cate_bottom" %>
<!--List All Categories-->
<h2 class="box_Tab">
    Danh mục sản phẩm</h2>
<%--<div id="mnu_bot">
    <ul>
        <asp:Repeater ID="Rpcatepro" runat="server">
            <ItemTemplate>
                <li class="cat-header">
                    <div class="cate_icon">
                        <span>
                            <img src="<%#getImagecat(Eval("CAT_ID"),Eval("CAT_IMAGE1")) %>" alt=""></span></div>
                    <a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"))%>">
                        <%#Eval("cat_name")%></a>
                    <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"))%>">
                                <%#Eval("cat_name")%></a>
                                <asp:Repeater ID="Repeater2" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                                    <HeaderTemplate>
                                        <ul>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li><a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"))%>">
                                            <%#Eval("cat_name")%></a></li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>--%>
<div id="mnu_bot">
    <ul>
        <li class="cat-header">
            <div class="cate_icon">
                <span>
                    <img src="/data/categories/852/cate4.png" alt=""></span></div>
            <a href="/gia-dung-noi-that.html" class="idCatSubcat">Gia dụng - Nội thất</a><span
                class="close"></span>
            <ul style="display: none;">
                <li><a href="/do-gia-dung-nha-bep.html" class="idCatSubcat">Đồ gia dụng nhà bếp</a><span
                    class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/noi-lau-da-nang.html">Nồi lẩu đa năng</a><span></span></li>
                        <li><a href="/noi-sieu-toc-am-sieu-toc.html">Nồi siêu tốc - Ấm siêu tốc</a><span></span></li>
                        <li><a href="/bep-lau-nuong-vi-nuong-dien-chao.html">Bếp lẩu nướng - Vỉ nướng điện -
                            Chảo</a><span></span></li>
                        <li><a href="/bep-hong-ngoai-bep-dien-quang.html">Bếp hồng ngoại - Bếp điện quang</a><span></span></li>
                        <li><a href="/lo-nuong-lo-vi-song.html">Lò nướng - Lò vi sóng</a><span></span></li>
                        <li><a href="/san-pham-tien-ich-cho-nha-bep.html">Sản phẩm tiện ích cho nhà bếp</a><span></span></li>
                        <li><a href="/bep-gas-chinh-hang.html">Bếp gas chính hãng</a><span></span></li>
                        <li><a href="/hop-com-ham-nong.html">Hộp cơm hâm nóng</a><span></span></li>
                        <li><a href="/noi-u.html">Nồi ủ</a><span></span></li>
                    </ul>
                </li>
                <li><a href="/che-bien-thuc-pham.html" class="idCatSubcat">Chế biến thực phẩm</a><span
                    class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/may-xay-ep-sinh-to.html">Máy xay ép sinh tố</a><span></span></li>
                        <li><a href="/may-lam-banh.html">Máy làm bánh</a><span></span></li>
                        <li><a href="/may-lam-sua-chua.html">Máy làm sữa chua</a><span></span></li>
                        <li><a href="/may-danh-trung.html">Máy đánh trứng</a><span></span></li>
                        <li><a href="/khac-2.html">Khác</a><span></span></li>
                    </ul>
                </li>
                <li><a href="/cham-soc-nha-cua.html" class="idCatSubcat">Chăm sóc nhà cửa</a><span
                    class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/bo-lau-nha-thong-minh.html">Bộ lau nhà thông minh</a><span></span></li>
                        <li><a href="/may-xit-rua-hut-bui.html">Máy xịt rửa - Hút bụi</a><span></span></li>
                        <li><a href="/ban-ui-tu-say-quan-ao.html">Bàn ủi - Tủ sấy quần áo</a><span></span></li>
                        <li><a href="/quat-dien.html">Quạt điện</a><span></span></li>
                        <li><a href="/tu-vai-hop-dung-do.html">Tủ vải - Hộp đựng đồ</a><span></span></li>
                        <li><a href="/may-phun-suong.html">Máy phun sương</a><span></span></li>
                        <li><a href="/ngan-ke-tu-va-dung-cu-sua-chua.html">Ngăn, kệ, tủ và dụng cụ sữa chữa</a><span></span></li>
                        <li><a href="/trang-tri-nha-cua.html">Trang trí nhà cửa</a><span></span></li>
                        <li><a href="/do-dung-phong-ngu.html">Đồ dùng phòng ngủ</a><span></span></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li class="cat-header">
            <div class="cate_icon">
                <span>
                    <img src="/data/categories/885/xate_suckhoe.png" alt=""></span></div>
            <a href="/suc-khoe-sac-dep.html" class="idCatSubcat">Sức khỏe - Sắc đẹp</a><span
                class="close"></span>
            <ul style="display: none;">
                <li><a href="/cham-soc-sac-dep.html" class="idCatSubcat">Chăm sóc sắc đẹp</a><span
                    class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/may-say-toc.html">Máy sấy tóc</a><span></span></li>
                        <li><a href="/may-kep-uon-duoi.html">Máy kẹp - uốn - duỗi</a><span></span></li>
                        <li><a href="/may-xong-hoi-mat.html">Máy xông hơi mặt</a><span></span></li>
                        <li><a href="/may-lam-san-co-mat.html">Máy Làm Săn Cơ Mặt</a><span></span></li>
                        <li><a href="/khac.html">Khác</a><span></span></li>
                    </ul>
                </li>
                <li><a href="/cham-soc-suc-khoe.html" class="idCatSubcat">Chăm sóc sức khỏe</a><span
                    class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/may-dai-massage.html">Máy/Đai massage</a><span></span></li>
                        <li><a href="/may-tap-the-duc.html">Máy tập thể dục</a><span></span></li>
                        <li><a href="/may-loc-khong-khi.html">Máy lọc không khí</a><span></span></li>
                        <li><a href="/can-dien-tu.html">Cân điện tử</a><span></span></li>
                        <li><a href="/thuc-pham-chuc-nang.html">Thực phẩm chức năng</a><span></span></li>
                        <li><a href="/may-tri-lieu.html">Máy trị liệu</a><span></span></li>
                        <li><a href="/may-do-huyet-ap.html">Máy đo huyết áp</a><span></span></li>
                        <li><a href="/may-do-duong-huyet.html">Máy đo đường huyết</a><span></span></li>
                    </ul>
                </li>
                <li><a href="/the-duc-the-thao.html">Thể dục - Thể thao</a><span></span> </li>
            </ul>
        </li>
        <li class="cat-header">
            <div class="cate_icon">
                <span>
                    <img src="/data/categories/901/cate7.png" alt=""></span></div>
            <a href="/cong-nghe-phu-kien.html" class="idCatSubcat">Công nghệ - Phụ kiện</a><span
                class="close"></span>
            <ul style="display: none;">
                <li><a href="/may-tinh-de-ban.html">Máy Tính Để Bàn</a><span></span> </li>
                <li><a href="/phu-kien-dien-thoai.html" class="idCatSubcat">Phụ kiện điện thoại</a><span
                    class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/pin-sac-du-phong.html">Pin sạc dự phòng</a><span></span></li>
                        <li><a href="/the-nho.html">Thẻ nhớ</a><span></span></li>
                        <li><a href="/vo-bao-da-dien-thoai.html">Vỏ - Bao da điện thoại</a><span></span></li>
                        <li><a href="/tai-nghe-danh-cho-dien-thoai.html">Tai nghe dành cho điện thoại</a><span></span></li>
                        <li><a href="/coc-sac-cap-sac.html">Cóc sạc / Cáp sạc</a><span></span></li>
                    </ul>
                </li>
                <li><a href="/phu-kien-may-tinh-laptop.html" class="idCatSubcat">Phụ kiện máy tính -
                    Laptop</a><span class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/o-cung-di-dong-usb-the-nho.html">Ổ Cứng di động - USB - Thẻ nhớ</a><span></span></li>
                        <li><a href="/chuot-ban-phim.html">Chuột - Bàn phím</a><span></span></li>
                        <li><a href="/thiet-bi-am-thanh-tai-nghe.html">Thiết bị âm thanh - Tai nghe</a><span></span></li>
                        <li><a href="/gia-do-de.html">Giá đỡ - đế</a><span></span></li>
                    </ul>
                </li>
                <li><a href="/thiet-bi-mang.html" class="idCatSubcat">Thiết bị mạng</a><span class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/thu-phat-wifi.html">Thu - Phát Wifi</a><span></span></li>
                        <li><a href="/modem-usb-3g.html">Modem - USB 3G</a><span></span></li>
                        <li><a href="/hub-switch.html">Hub/Switch</a><span></span></li>
                        <li><a href="/thiet-bi-giai-tri.html">Thiết bị giải trí</a><span></span></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li class="cat-header">
            <div class="cate_icon">
                <span>
                    <img src="/data/categories/917/cate_dungcu.png" alt=""></span></div>
            <a href="/dung-cu-thiet-bi.html" class="idCatSubcat">Dụng cụ - Thiết bị</a><span
                class="close"></span>
            <ul style="display: none;">
                <li><a href="/thang-nhom.html" class="idCatSubcat">Thang nhôm</a><span class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/thang-nhom-chu-a.html">Thang nhôm chữ A</a><span></span></li>
                        <li><a href="/thang-nhom-rut.html">Thang nhôm rút</a><span></span></li>
                        <li><a href="/thang-nhom-gap.html">Thang nhôm gấp</a><span></span></li>
                        <li><a href="/thang-nhom-truot.html">Thang nhôm trượt</a><span></span></li>
                        <li><a href="/thang-ghe.html">Thang ghế</a><span></span></li>
                        <li><a href="/thang-nhom-rut-chu-a.html">Thang nhôm rút chữ A</a><span></span></li>
                    </ul>
                </li>
                <li><a href="/thiet-bi-do-dien.html" class="idCatSubcat">Thiết bị đo điện</a><span
                    class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/ampe-kim.html">Ampe kìm</a><span></span></li>
                        <li><a href="/dong-ho-van-nang.html">Đồng hồ vạn năng</a><span></span></li>
                        <li><a href="/do-dien-tro-cach-dien.html">Đo điện trở cách điện</a><span></span></li>
                        <li><a href="/do-dien-tro-dat.html">Đo điện trở đất</a><span></span></li>
                        <li><a href="/but-thu-dien.html">Bút thử điện</a><span></span></li>
                        <li><a href="/thiet-bi-do-pha.html">Thiết bị dò pha</a><span></span></li>
                        <li><a href="/do-cuong-do-anh-sang.html">Đo cường độ ánh sáng</a><span></span></li>
                        <li><a href="/do-nhiet-do.html">Đo nhiệt độ</a><span></span></li>
                    </ul>
                </li>
                <li><a href="/thiet-bi-nang-do.html" class="idCatSubcat">Thiết bị nâng đỡ</a><span
                    class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/con-doi.html">Con đội</a><span></span></li>
                        <li><a href="/pa-lang-xich-keo-tay.html">Pa lăng xích kéo tay</a><span></span></li>
                        <li><a href="/xe-day.html">Xe đẩy</a><span></span></li>
                        <li><a href="/kich-cang-cap.html">Kích căng cáp</a><span></span></li>
                    </ul>
                </li>
                <li><a href="/thiet-bi-bao-quan.html" class="idCatSubcat">Thiết bị bảo quản</a><span
                    class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/thung-dung-do-nghe.html">Thùng đựng đồ nghề</a><span></span></li>
                        <li><a href="/tui-dung-do-nghe.html">Túi đựng đồ nghề</a><span></span></li>
                        <li><a href="/hop-bao-quan.html">Hộp bảo quản</a><span></span></li>
                        <li><a href="/o-khoa-hop-dung-chia.html">Ổ khóa - Hộp đựng chìa</a><span></span></li>
                    </ul>
                </li>
                <li><a href="/dung-cu-cam-tay.html" class="idCatSubcat">Dụng cụ cầm tay</a><span
                    class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/kem-cam-tay.html">Kềm cầm tay</a><span></span></li>
                        <li><a href="/dung-cu-cat.html">Dụng cụ cắt</a><span></span></li>
                        <li><a href="/bua-cam-tay.html">Búa cầm tay</a><span></span></li>
                        <li><a href="/can-bong-lan.html">Cán bông lăn</a><span></span></li>
                        <li><a href="/can-chinh-luc.html">Cân chỉnh lực</a><span></span></li>
                        <li><a href="/bo-dong-so-va-chu.html">Bộ đóng số và chữ</a><span></span></li>
                        <li><a href="/bo-dung-cu.html">Bộ dụng cụ</a><span></span></li>
                        <li><a href="/ong-dieu.html">Ống điếu</a><span></span></li>
                        <li><a href="/thiet-bi-kep.html">Thiết bị kẹp</a><span></span></li>
                        <li><a href="/co-le-mo-let.html">Cờ lê mỏ lết</a><span></span></li>
                        <li><a href="/tuoc-no-vit.html">Tuốc nơ vít</a><span></span></li>
                        <li><a href="/tuyp-cam-tay.html">Tuýp cầm tay</a><span></span></li>
                        <li><a href="/luc-giac.html">Lục giác</a><span></span></li>
                    </ul>
                </li>
                <li><a href="/dung-cu-dung-dien.html" class="idCatSubcat">Dụng cụ dùng điện</a><span
                    class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/may-cha-nham.html">Máy chà nhám</a><span></span></li>
                        <li><a href="/may-khoan.html">Máy khoan</a><span></span></li>
                        <li><a href="/may-cua.html">Máy cưa</a><span></span></li>
                        <li><a href="/may-cat.html">Máy cắt</a><span></span></li>
                        <li><a href="/may-mai.html">Máy mài</a><span></span></li>
                        <li><a href="/may-phay.html">Máy phay</a><span></span></li>
                        <li><a href="/may-van-oc.html">Máy văn ốc</a><span></span></li>
                        <li><a href="/may-van-vit.html">Máy vặn vít</a><span></span></li>
                        <li><a href="/may-thoi-hoi-nong.html">Máy thổi hơi nóng</a><span></span></li>
                        <li><a href="/may-ban-keo.html">Máy bắn keo</a><span></span></li>
                        <li><a href="/may-xit-rua.html">Máy xịt rửa</a><span></span></li>
                        <li><a href="/mo-han.html">Mỏ hàn</a><span></span></li>
                        <li><a href="/may-tien.html">Máy tiện</a><span></span></li>
                        <li><a href="/motor.html">Motor</a><span></span></li>
                        <li><a href="/may-cat-co-cam-tay.html">Máy cắt cỏ cầm tay</a><span></span></li>
                        <li><a href="/dung-cu-da-nang.html">Dụng cụ đa năng</a><span></span></li>
                        <li><a href="/may-hut-bui.html">Máy hút bụi</a><span></span></li>
                        <li><a href="/may-nen-khi.html">Máy nén khí</a><span></span></li>
                        <li><a href="/may-bao.html">Máy bào</a><span></span></li>
                        <li><a href="/may-danh-bong.html">Máy đánh bóng</a><span></span></li>
                        <li><a href="/may-duc-be-tong.html">Máy đục bê tông</a><span></span></li>
                    </ul>
                </li>
                <li><a href="/thiet-bi-nganh-hang.html" class="idCatSubcat">Thiết bị ngành hàng</a><span
                    class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/may-han-que.html">Máy hàn que</a><span></span></li>
                        <li><a href="/may-han-mig.html">Máy hàn MIG</a><span></span></li>
                        <li><a href="/may-han-tig.html">Máy hàn TIG</a><span></span></li>
                        <li><a href="/may-bien-the-han.html">Máy biến thế hàn</a><span></span></li>
                        <li><a href="/may-han-cat.html">Máy hàn cắt</a><span></span></li>
                        <li><a href="/may-bam-han.html">Máy bấm hàn</a><span></span></li>
                        <li><a href="/que-han.html">Que hàn</a><span></span></li>
                        <li><a href="/kem-han.html">Kềm hàn</a><span></span></li>
                        <li><a href="/kinh-han.html">Kính hàn</a><span></span></li>
                    </ul>
                </li>
                <li><a href="/dung-cu-dung-xang.html" class="idCatSubcat">Dụng cụ dùng xăng</a><span
                    class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/may-cua-xich.html">Máy cưa xích</a><span></span></li>
                        <li><a href="/may-cat-be-tong.html">Máy cắt bê tông</a><span></span></li>
                        <li><a href="/may-tia-hang-rao.html">Máy tỉa hàng rào</a><span></span></li>
                        <li><a href="/may-cat-co-chay-xang.html">Máy cắt cỏ chạy xăng</a><span></span></li>
                        <li><a href="/may-chay-xang-khac.html">Máy chạy xăng khác</a><span></span></li>
                    </ul>
                </li>
                <li><a href="/dung-cu-dung-pin.html" class="idCatSubcat">Dụng cụ dùng pin</a><span
                    class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/may-khoan-pin.html">Máy khoan pin</a><span></span></li>
                        <li><a href="/may-van-vit-pin.html">Máy vặn vít pin</a><span></span></li>
                        <li><a href="/may-cat-co-chay-pin.html">Máy cắt cỏ chạy pin</a><span></span></li>
                        <li><a href="/dung-cu-khac.html">Dụng cụ khác</a><span></span></li>
                    </ul>
                </li>
                <li><a href="/dung-cu-do-chinh-xac.html" class="idCatSubcat">Dụng cụ đo chính xác</a><span
                    class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/thuoc-cam-tay.html">Thước cầm tay</a><span></span></li>
                        <li><a href="/dung-cu-so.html">Dụng cụ so</a><span></span></li>
                        <li><a href="/thuoc-kep-caliper.html">Thước kẹp caliper</a><span></span></li>
                        <li><a href="/thuoc-panme.html">Thước panme</a><span></span></li>
                        <li><a href="/thuoc-thuy.html">Thước thủy</a><span></span></li>
                        <li><a href="/thuoc-do-lo.html">Thước đo lỗ</a><span></span></li>
                        <li><a href="/thuoc-do-do-sau.html">Thước đo độ sâu</a><span></span></li>
                        <li><a href="/thuoc-do-do-day.html">Thước đo độ dày</a><span></span></li>
                        <li><a href="/thuoc-do-do-cao.html">Thước đo độ cao</a><span></span></li>
                        <li><a href="/thiet-bi-do-do-am.html">Thiết bị đo độ ẩm</a><span></span></li>
                        <li><a href="/thiet-bi-do-nhiet-do.html">Thiết bị đo nhiệt độ</a><span></span></li>
                        <li><a href="/thiet-bi-do-khoang-cach.html">Thiết bị đo khoảng cách</a><span></span></li>
                        <li><a href="/thiet-bi-do-kim-loai.html">Thiết bị dò kim loại</a><span></span></li>
                        <li><a href="/thiet-bi-can-bang-laser.html">Thiết bị cân bằng laser</a><span></span></li>
                        <li><a href="/duong-do-ban-kinh.html">Dưỡng đo bán kính</a><span></span></li>
                        <li><a href="/thiet-bi-bat-muc.html">Thiết bị bật mực</a><span></span></li>
                        <li><a href="/duong-do-ren.html">Dượng đo ren</a><span></span></li>
                        <li><a href="/chan-de-gia-do.html">Chân đế giá đỡ</a><span></span></li>
                        <li><a href="/thuoc-lan-duong.html">Thước lăn đường</a><span></span></li>
                    </ul>
                </li>
                <li><a href="/dung-cu-dung-khi-nen.html" class="idCatSubcat">Dụng cụ dùng khí nén</a><span
                    class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/thiet-bi-bom-mo.html">Thiết bị bơm mỡ</a><span></span></li>
                        <li><a href="/thiet-bi-go-ri.html">Thiết bị gõ rĩ</a><span></span></li>
                        <li><a href="/day-hoi-tu-rut.html">Dây hơi tự rút</a><span></span></li>
                        <li><a href="/sung-rut-rive.html">Súng rút rive</a><span></span></li>
                        <li><a href="/may-cha-nham-hoi.html">Máy chà nhám hơi</a><span></span></li>
                        <li><a href="/may-danh-bong-hoi.html">Máy đánh bóng hơi</a><span></span></li>
                        <li><a href="/may-khoan-hoi.html">Máy khoan hơi</a><span></span></li>
                        <li><a href="/may-mai-hoi.html">Máy mài hơi</a><span></span></li>
                        <li><a href="/may-van-oc-vit.html">Máy vặn ốc vít</a><span></span></li>
                        <li><a href="/thiet-bi-phun-suong.html">Thiết bị phun sương</a><span></span></li>
                        <li><a href="/may-ban-dinh.html">Máy bắn đinh</a><span></span></li>
                        <li><a href="/dung-cu-tuoi-cay.html">Dụng cụ tưới cây</a><span></span></li>
                        <li><a href="/may-cua-kiem-khi.html">Máy cưa kiếm khí</a><span></span></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li class="cat-header">
            <div class="cate_icon">
                <span>
                    <img src="/data/categories/1037/cate2.png" alt=""></span></div>
            <a href="/thoi-trang-phu-kien.html" class="idCatSubcat">Thời trang - Phụ kiện</a><span
                class="close"></span>
            <ul style="display: none;">
                <li><a href="/qua-tang-luu-niem.html">Quà tặng - Lưu niệm</a><span></span> </li>
                <li><a href="/thoi-trang-nam.html">Thời trang nam</a><span></span> </li>
                <li><a href="/thoi-trang-nu.html">Thời trang nữ</a><span></span> </li>
                <li><a href="/thoi-trang-cho-me-be.html">Thời trang cho mẹ &amp; bé</a><span></span>
                </li>
                <li><a href="/phu-kien-thoi-trang.html">Phụ kiện thời trang</a><span></span> </li>
            </ul>
        </li>
        <li class="cat-header">
            <div class="cate_icon">
                <span>
                    <img src="/data/categories/1043/cate_balotuixach.png" alt=""></span></div>
            <a href="/ba-lo-tui-xach.html" class="idCatSubcat">Ba lô - Túi xách</a><span class="close"></span>
            <ul style="display: none;">
                <li><a href="/ba-lo-tui-xach-du-lich.html">Ba lô, túi xách du lịch</a><span></span>
                </li>
                <li><a href="/ba-lo-tui-dung-laptop.html">Ba lô, túi đựng laptop</a><span></span>
                </li>
                <li><a href="/ba-lo-mam-non.html">Ba lô mầm non</a><span></span> </li>
                <li><a href="/ba-lo-tieu-hoc.html">Ba lô tiểu học</a><span></span> </li>
                <li><a href="/cap-tui-xach-cong-so.html">Cặp, túi xách công sở</a><span></span>
                </li>
            </ul>
        </li>
        <li class="cat-header">
            <div class="cate_icon">
                <span>
                    <img src="/data/categories/1049/cate_yensao.png" alt=""></span></div>
            <a href="/yen-sao-to-yen.html" class="idCatSubcat">Yến sào - Tổ yến</a><span class="close"></span>
            <ul style="display: none;">
                <li><a href="/to-yen-sao-nguyen-to.html" class="idCatSubcat">Tổ yến sào nguyên tổ</a><span
                    class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/to-yen-nha-nguyen-to.html">Tổ yến nhà nguyên tổ</a><span></span></li>
                        <li><a href="/to-yen-dao-trang-nguyen-to.html">Tổ yến đảo trắng nguyên tổ</a><span></span></li>
                        <li><a href="/to-yen-dao-huyet-nguyen-to.html">Tổ yến đảo huyết nguyên tổ</a><span></span></li>
                    </ul>
                </li>
                <li><a href="/to-yen-sao-tinh-che.html" class="idCatSubcat">Tổ yến sào tinh chế</a><span
                    class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/to-yen-nha-tinh-che.html">Tổ yến nhà tinh chế</a><span></span></li>
                        <li><a href="/to-yen-dao-trang-tinh-che.html">Tổ yến đảo trắng tinh chế</a><span></span></li>
                        <li><a href="/to-yen-dao-huyet-tinh-che.html">Tổ yến đảo huyết tinh chế</a><span></span></li>
                    </ul>
                </li>
                <li><a href="/yen-hu-yen-nuoc-chung-san.html" class="idCatSubcat">Yến hũ, yến nước chưng
                    sẵn</a><span class="close"></span>
                    <ul style="display: none;">
                        <li><a href="/yen-hu-chung-duong-phen.html">Yến hũ chưng đường phèn</a><span></span></li>
                        <li><a href="/yen-hu-chung-khong-duong.html">Yến hũ chưng không đường</a><span></span></li>
                        <li><a href="/yen-hu-chung-nhan-sam.html">Yến hũ chưng nhân sâm</a><span></span></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li class="cat-header">
            <div class="cate_icon">
                <span>
                    <img src="/data/categories/1085/cate_vanphongpham.png" alt=""></span></div>
            <a href="/van-phong-pham.html" class="idCatSubcat">Văn phòng phẩm</a><span class="close"></span>
            <ul style="display: none;">
                <li><a href="/sach-nhac-cu.html">Sách &amp; Nhạc cụ</a><span></span> </li>
                <li><a href="/tre-so-sinh-tre-em-do-choi.html">Trẻ sơ sinh, Trẻ em &amp; Đồ chơi </a>
                    <span></span></li>
                <li><a href="/dung-cu-viet-lach.html">Dụng cụ viết lách</a><span></span> </li>
            </ul>
        </li>
    </ul>
</div>
<!--end List All Categories-->
