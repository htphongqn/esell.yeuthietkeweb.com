<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="cartInfoFinal.ascx.cs"
    Inherits="MVC_Kutun.UIs.cartInfoFinal" %>

<div class="box_payment_ct">
  <div class="tt_payment_step"> Thông tin đơn hàng </div>
  <div class="order_sum" style="padding:10px">
    <div class="order_scrollable">
      <table class="order_scroll_table" width="100%" cellpadding="2">
        <tbody>
          <tr>
            <th class="left_align" width="50%"> Sản phẩm </th>
            <th class="qty" width="17%"> Số lượng </th>
            <th class="right_align" width="33%"> Giá </th>
          </tr>
          <asp:Repeater ID="Rpgiohang" runat="server">
            <ItemTemplate>
              <tr>
                <td colspan="3" style="border-top: 1px dotted #dddddd"></td>
              </tr>
              <tr>
                <asp:HiddenField ID="Hdnews_id" runat="server" Value='<%#Eval("NEWS_ID") %>' />
                <td class="left_align"><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL")) %>" target="_parent"> <%# Eval("NEWS_TITLE") %></a></td>
                <td class="qty" valign="top"><%#Eval("ITEM_QUANTITY")%></td>
                <td class="right_align" valign="top"><%# String.Format("{0:0,0 VNĐ}", Eval("ITEM_PRICE")).Replace(",", ".")%></td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </tbody>
      </table>
    </div>
    <table class="total_item" width="100%">
      <tbody>
        <tr class="total_item">
          <td class="subtotal"> Tổng tiền </td>
          <td class="right_align" colspan="2"><asp:Label ID="lbtotalmoney" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr class="total_item" id="div_ship" runat="server">
          <td class="subtotal"> Phí vận chuyển </td>
          <td class="right_align" colspan="2"><asp:Label ID="Lbship" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr class="total_item">
          <td><strong>Thành tiền</strong></td>
          <td class="total right_align" colspan="2"><asp:Label ID="Lbtotal" runat="server" Text=""></asp:Label></td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
