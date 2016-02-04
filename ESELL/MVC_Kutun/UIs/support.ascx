<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="support.ascx.cs" Inherits="MVC_Kutun.UIs.support" %>
<%@ Register Src="Ads-right-top.ascx" TagName="Ads" TagPrefix="uc1" %>
<!--Support-->
<div class="support_head">
    <span class="title_support"></span>
    <div class="support_bg">
        <p class="optionSupport">
            <a href="/lien-he.html" title="Liên hệ với thangnhom.org">Liên hệ với thangnhom.org</a>
        </p>
        <div class="infoSupport">
            <span class="icoSupport"></span>
            <p class="hotLine">
                <asp:Repeater ID="Rphotline" runat="server">
                    <ItemTemplate>
                        <span>
                            <%# Eval("ONLINE_DESC")%></span><br />
                    </ItemTemplate>
                </asp:Repeater>
            </p>
            <p class="timeSupport">
                <strong>Thời gian làm việc:</strong></p>
            <p class="timeSupport">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8h - 17h30 từ thứ 2 đến thứ 6</p>
            <p class="timeSupport">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8h - 12h ngày thứ 7</p>
            <span class="icoMail"></span>
            <p class="mailSupport">
                <asp:HyperLink ID="Hpemail" runat="server"></asp:HyperLink></p>
            <div class="yahoo">
                <asp:Repeater ID="Rphotro" runat="server">
                    <ItemTemplate>
                        <%# Bind_Online(Eval("ONLINE_TYPE"), Eval("ONLINE_DESC"), Eval("ONLINE_NICKNAME"))%>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <!--Ads Right Fixed-->
</div>
<!--End Support-->
<div class="ads ads_fixed_side cf">
    <uc1:Ads ID="Ads1" runat="server" />
</div>
