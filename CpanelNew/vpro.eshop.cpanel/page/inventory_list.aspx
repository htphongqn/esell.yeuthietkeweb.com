<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="inventory_list.aspx.cs" Inherits="vpro.eshop.cpanel.page.inventory_list" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v12.1.Export, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row page-header">
        <a href="#" onclick="javascript:document.location.reload(true);" class="btn btn-default btn-sm">
            <span class="glyphicon glyphicon-random" aria-hidden="true"></span>&nbsp;Refresh</a>
    </div>
    <div class="row page-header">
        <div class="form-inline">
            <div class="form-group">
                <input type="text" class="form-control col-sm-6" id="txtKeyword" placeholder="Từ khóa"
                    runat="server">
            </div>
            <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" class="btn btn-default"
                OnClick="btnSearch_Click" />
        </div>
    </div>
    <div class="row">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">
                    Thống kê tồn kho</h3>
            </div>
            <div class="panel-body table-responsive">
                <dx:ASPxGridView ID="ASPxGridView_inventory" runat="server" AutoGenerateColumns="False"
                    Width="100%" KeyFieldName="NEWS_ID" Theme="DevEx">
                    <Columns>
                        <dx:GridViewDataTextColumn VisibleIndex="1" Caption="Mã sản phẩm" FieldName="NEWS_CODE">
                            <DataItemTemplate>
                                <asp:HiddenField ID="Hdid" runat="server" Value='<%#Eval("NEWS_ID") %>' />
                                <%#Eval("NEWS_CODE")%>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn VisibleIndex="1" Caption="Tên sản phẩm" FieldName="NEWS_TITLE">
                            <DataItemTemplate>
                                <%# Eval("NEWS_TITLE")%>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn VisibleIndex="1" Caption="Giá nhập" FieldName="NEWS_PRICE1">
                            <DataItemTemplate>
                                <%#formatMoney(Eval("NEWS_PRICE1"))%>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn VisibleIndex="1" Caption="Giá bán" FieldName="NEWS_PRICE2">
                            <DataItemTemplate>
                                <%#formatMoney(Eval("NEWS_PRICE2"))%>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn VisibleIndex="1" Caption="Tổng SL nhập" FieldName="NEWS_QUANTITY">
                            <DataItemTemplate>
                                <%#getSl(Eval("NEWS_ID"),0)%>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn VisibleIndex="1" Caption="Tổng SL xuất" FieldName="NEWS_QUANTITY">
                            <DataItemTemplate>
                                <%#getSl(Eval("NEWS_ID"),1)%>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn VisibleIndex="1" Caption="Tồn kho" FieldName="NEWS_INVENTORY">
                            <DataItemTemplate>
                                <asp:TextBox ID="txtInventory" runat="server" Text='<%#Eval("NEWS_INVENTORY") %>'
                                    Width="50"></asp:TextBox>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn VisibleIndex="1" Caption="Đặt hàng">
                            <DataItemTemplate>
                                <%# getCountBuy(Eval("NEWS_ID"))%>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowFooter="true" ShowFilterRow="True" />
                    <TotalSummary>
                        <dx:ASPxSummaryItem FieldName="NEWS_INVENTORY" SummaryType="Sum" />
                    </TotalSummary>
                    <SettingsPager PageSize="30">
                    </SettingsPager>
                </dx:ASPxGridView>
                <dx:ASPxGridViewExporter ID="ASPxGridViewExporter_export" runat="server" GridViewID="ASPxGridView_inventory">
                </dx:ASPxGridViewExporter>
            </div>
        </div>
    </div>
</asp:Content>
