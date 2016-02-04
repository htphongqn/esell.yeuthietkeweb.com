<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="checkorderPayment.ascx.cs"
    Inherits="MVC_Kutun.UIs.checkorderPayment" %>
<link type="text/css" rel="stylesheet" href="../vi-vn/Styles/process_payment.css">
<style>
.cell.name a {
	color: #666666;
	font-size: 13px;
	font-weight: 700;
	line-height: 69px;
	text-align: center;
}
.item_cart .cell.unit .new {
	color: #666666;
	font-size: 13px;
	font-weight: 700;
	line-height: 69px;
	text-align: center;
}
.item_cart .quantity {
	color: #000000;
	font: normal 13px Arial, Helvetica, sans-serif;
	height: 28px;
	padding: 2px;
	margin-top: 25px;
	text-align: center;
}
</style>
<div style="text-align: center; margin: 10px" id="div_error" runat="server">
  <asp:Label ID="Lberrors" runat="server" Text="" ForeColor="Red"></asp:Label>
</div>
<div id="div_checkorder" runat="server">
  <table cellspacing="0" cellpadding="4" style="color: #0066FF; width: 100%; border-collapse: collapse" class="tdGridTable">
    <tbody>
      <tr style="color: #000333; background-color: #F3F3F3; font-size: Small; font-weight: bold;"
                class="cl">
        <td></td>
        <td> Mã đơn hàng </td>
        <td> Ngày đặt hàng </td>
        <td> Địa chỉ giao hàng </td>
        <td> Hình thức thanh toán </td>
        <td> Tình trạng </td>
        <td> Tổng tiền </td>
      </tr>
      <asp:Repeater ID="Rphistory" runat="server">
        <ItemTemplate>
          <tr class="box_order" style="cursor: pointer">
            <td><img src="../vi-vn/Images/icon_order.png" width="20px"></td>
            <td><%#Eval("ORDER_CODE") %></td>
            <td><%#getPublishDate(Eval("ORDER_PUBLISHDATE"))%></td>
            <td><%#Eval("ORDER_ADDRESS")%></td>
            <td><%#getOrderPayment(Eval("ORDER_PAYMENT"))%></td>
            <td><%#getOrderStatus(Eval("ORDER_STATUS"))%></td>
            <td><%#GetMoney(Eval("ORDER_TOTAL_AMOUNT"))%></td>
          </tr>
          <tr class="box_orderitem" style="display: none">
            <td colspan="7"><asp:Repeater ID="Rpgiohang" runat="server" DataSource='<%#loadOrderItem(Eval("ORDER_ID")) %>'>
                <ItemTemplate>
                  <div id="cart_page_user">
                    <div class="row_th_cart">
                      <h3 style="width: 15%; font-size: 14px;" class="th_table_cart fl"> Hình ảnh </h3>
                      <h3 style="width: 38%; font-size: 14px;" class="th_table_cart fl"> Tên sản phẩm </h3>
                      <h3 style="width: 16%; font-size: 14px;" class="th_table_cart fl"> Giá bán </h3>
                      <h3 style="width: 10%; font-size: 14px;" class="th_table_cart fl"> Số lượng </h3>
                      <h3 style="width: 20%; font-size: 14px;" class="th_table_cart fl"> Thành tiền </h3>
                    </div>
                  </div>
                  <!--Item Cart-->
                  <div class="item_cart fl"> <a class="img_cart fl" target="_parent" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>"> <img width="100" height="100" alt="" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"></a>
                    <div class="cell name">
                      <div> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>"> <%# Eval("NEWS_TITLE") %></a> </div>
                    </div>
                    <div class="cell unit"> <span id="soldprice_1757" class="new"> <%# GetMoney(Eval("ITEM_PRICE"))%></span></div>
                    <div class="cell amount">
                      <!-- so luong -->
                      <div class="quantity"> <%#Eval("ITEM_QUANTITY")%> </div>
                      <!-- -->
                    </div>
                    <div id="dealtotal_1757" class="cell total"> <%# GetMoney(Eval("ITEM_SUBTOTAL"))%></div>
                  </div>
                  <!--end Item Cart-->
                </ItemTemplate>
              </asp:Repeater>
              <div class="foo-cart">
                <div class="total-cart">
                  <p> Tổng cộng:<span id="total-sum"> <%#GetMoney(Eval("ORDER_TOTAL_ALL"))%></span></p>
                  <p> Phí vận chuyển:<span id="total-sum"> <%#getship(Eval("ORDER_SHIPPING_FEE"))%></span></p>
                  <p class="all_total"> Thành tiền:<span id="total-money"> <%#GetMoney(Eval("ORDER_TOTAL_AMOUNT"))%></span></p>
                </div>
              </div></td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
    </tbody>
  </table>
</div>
<script>
    $(function () {
        $('.box_order').click(function () {
            $(this).next(".box_orderitem:first").slideToggle();
        });
    });
</script>
