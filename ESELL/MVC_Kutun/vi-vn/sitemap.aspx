<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="sitemap.aspx.cs" Inherits="MVC_Kutun.vi_vn.sitemap" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="path">
        <a href="/trang-chu.html">Trang chủ</a> » Sitemap
    </div>
    <!--Detail Products-->
    <div class="box contactus">
        <dx:ASPxTreeList ID="ASPxTreeList1" runat="server" Theme="Default" KeyFieldName="CAT_ID"
            ParentFieldName="CAT_PARENT_ID" AutoGenerateColumns="False">
            <Settings ShowColumnHeaders="False" />
            <SettingsBehavior DisablePartialUpdate="True" AutoExpandAllNodes="True" />
            <Columns>
                <dx:TreeListTextColumn>
                    <DataCellTemplate>
                        <a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                            <%#Eval("CAT_NAME") %></a>
                    </DataCellTemplate>
                </dx:TreeListTextColumn>
            </Columns>
        </dx:ASPxTreeList>
    </div>
</asp:Content>
