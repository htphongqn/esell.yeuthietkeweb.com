<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.Master" AutoEventWireup="true"
    CodeBehind="feedback.aspx.cs" Inherits="MVC_Kutun.vi_vn.feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {

            $(".tab_content").hide();
            $(".tab_content:first").show();

            $("ul.tabs li").click(function () {
                $("ul.tabs li").removeClass("active");
                $(this).addClass("active");
                $(".tab_content").hide();
                var activeTab = $(this).attr("rel");
                $("#" + activeTab).fadeIn();
            });
        });
	
    </script>
    <div class="path">
        <a href="/trang-chu.html">Trang chủ</a>» <a href="#">Liên hệ</a></div>
    <!--Contact-->
    <div class="box">
        <div class="box_ct" id="phan_hoi">
            <ul class="tabs">
                <li class="active" rel="tab1">Gửi phản hồi</li>
                <li rel="tab2">Gửi tin nhắn</li>
            </ul>
            <div class="tab_container">
                <div id="tab1" class="tab_content">
                    <textarea id="txtcontent_feed" runat="server">
        
        
        </textarea>
                </div>
                <!-- #tab1 -->
                <div id="tab2" class="tab_content">
                    <textarea id="txtcontent_email" runat="server">
        
        
        </textarea>
                </div>
                <!-- #tab2 -->
            </div>
            <!-- .tab_container -->
            <table class="sender">
                <tr>
                    <td>
                        Người gửi / điện thoại
                    </td>
                    <td>
                        <input name="" type="text" id="txtname" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Email
                    </td>
                    <td>
                        <input name="" type="text" id="txtemail" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnSend" runat="server" Text="Gửi" OnClick="btnSend_Click" />
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            <ul class="tin_nhan">
                <asp:Repeater ID="Rptinnhan" runat="server">
                    <ItemTemplate>
                        <li>
                            <div class="anh_dai_dien fl">
                                <img src="../vi-vn/Images/logo_default.gif" /></div>
                            <div class="nguoi_gui fl">
                                <b><a href="#">
                                    <%#Eval("CONTACT_NAME")%></a> </b><span>
                                        <%#getDate(Eval("CONTACT_PUBLISHDATE"))%></span></div>
                            <div class="nd_tin_nhan">
                                <%#Eval("CONTACT_CONTENT")%>
                            </div>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
</asp:Content>
