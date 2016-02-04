<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="cart.ascx.cs" Inherits="MVC_Kutun.UIs.cart" %>

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
          <asp:Repeater ID="Rpgiohang" runat="server" OnItemCommand="Rpgiohang_ItemCommand">
            <ItemTemplate>
              <tr>
                <td colspan="3" style="border-top: 1px dotted #dddddd"></td>
              </tr>
              <tr>
                <asp:HiddenField ID="Hdnews_id" runat="server" Value='<%#Eval("NEWS_ID") %>' />
                <td class="left_align"><%# Eval("NEWS_TITLE") %></td>
                <td class="qty"  valign="top"><asp:DropDownList ID="Drquan" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drSoLuong_SelectedIndexChanged">
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
                  <br />
                  <asp:LinkButton ID="LinkXoa" class="close" runat="server" CommandName="delete" CommandArgument='<%# Eval("news_id") %>' style="color:Blue" >Xóa</asp:LinkButton></td>
                <td class="right_align" valign="top"><%# String.Format("{0:0,0 VNĐ}", Eval("Basket_Price")).Replace(",",".")%></td>
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
