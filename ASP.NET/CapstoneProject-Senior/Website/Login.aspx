<%@ page language="C#" maintainscrollpositiononpostback="true" autoeventwireup="true" codebehind="Login.aspx.cs" inherits="Capstone2nd.Login" %>

<%@ register tagprefix="general" tagname="Navbar" src="Navbar.ascx" %>
<%@ register tagprefix="general" tagname="Header" src="Header.ascx" %>
<%@ register tagprefix="general" tagname="Footer" src="Footer.ascx" %>


<!DOCTYPE html>
<html lang="en">

<head runat="server">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login Page - Diabetes Decision System</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/grayscale.min.css" rel="stylesheet">
    <link href="css/myCss.css" rel="stylesheet">
</head>

<body id="page-top">
    <!-- Navigation -->
    <general:navbar id="navbar" runat="server" />
    <!-- Header -->
    <general:header id="header" runat="server" />



    <div class="row">

        <div class="col-xl-2 col-lg-2">
        </div>

        <div class="col-xl-8 col-lg-8">
            <!--Error Message-->
            <asp:Label ID="lblMessage" Height="40px" Font-Size="18px" ForeColor="Red" runat="server" /><br />
            <!-- FORM 1 -->
            <form id="form1" runat="server">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Box for user Name-->
                        <asp:Label ID="lbluser" runat="server" CssClass="input-group-text" Text="Username" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
                        <asp:TextBox ID="userName" runat="server" CssClass="form-control" TextMode="SingleLine" BackColor="White" onfocus="this.select()"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqUsername" runat="server" ForeColor="Red" ErrorMessage="Username is required."
                            Display="Dynamic" ControlToValidate="userName">*Required</asp:RequiredFieldValidator><br />
                    </div>
                </div>

                <!--Text Box for Password-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label ID="lblPassword" runat="server" CssClass="input-group-text" Text="Password" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
                        <asp:TextBox ID="password" CssClass="form-control" TextMode="Password" BackColor="White" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqPass" runat="server" ErrorMessage="Password is required"
                            Display="dynamic" ControlToValidate="password">*Required</asp:RequiredFieldValidator><br />
                    </div>
                </div>

                <!--Link to forgot pwd page-->
                <asp:HyperLink ID="forgotID" runat="server" CssClass="smallLink" NavigateUrl="~/ForgotPwd.aspx" Visible="true">Forgot password?</asp:HyperLink><br />

                <!--Link to register page-->
                <asp:HyperLink ID="registerID" runat="server" CssClass="smallLink" NavigateUrl="~/Register.aspx" Visible="true">Don't have an account yet?</asp:HyperLink>

                <!--Button for Submitting the Form-->
                <asp:Label ID="lblSubmit" runat="server" ForeColor="Blue" Font-Size="14pt"></asp:Label><br />
                <asp:Button ID="BtnSubmit" CssClass="btn btn-secondary" runat="server" Text="Submit" UseSubmitBehavior="true" OnClick="BtnSubmit_Click" />

                <!--Message-->
                <asp:Label ID="Label1" Height="40px" Font-Size="18px" ForeColor="Red" runat="server" />
            </form>
        </div>

        <div class="col-xl-2 col-lg-2">
        </div>

    </div>

    <!-- Footer -->
    <general:footer id="footer" runat="server" />


</body>
</html>
