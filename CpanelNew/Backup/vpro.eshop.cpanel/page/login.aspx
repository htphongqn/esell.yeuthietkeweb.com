<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="vpro.eshop.cpanel.page.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign in</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <!-- Bootstrap core CSS -->
    <link href="../Styles/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Custom styles for this template -->
    <link href="../Styles/signin.css" rel="stylesheet" type="text/css" />
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="form-signin">
            <h2 class="form-signin-heading">
                Đăng nhập</h2>
            <div class="form-group has-success">
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                    <input type="text" class="form-control" id="txtUN" placeholder="Tên đăng nhập" runat="server">
                </div>
            </div>
            <div class="form-group has-success">
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-star"></span></span>
                    <input type="password" class="form-control" id="txtPW" placeholder="Mật khẩu" runat="server">
                </div>
            </div>
            <div class="form-group has-success">
                <asp:Button ID="lbtLogin" runat="server" class="btn btn-lg btn-primary btn-block"
                    Text="Đăng nhập" OnClick="lbtLogin_Click" />
            </div>
            <div class="form-group has-success text-center">
                <asp:Label ID="lblError" runat="server" EnableViewState="False" CssClass="label label-danger"></asp:Label>
            </div>
        </div>
    </div>
    <!-- /container -->
    <footer class="footer">
        <div class="container">
             © Copyright by Dang Cap Viet JSC
        </div>
    </footer>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    </form>
</body>
</html>
