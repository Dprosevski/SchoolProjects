<%@ page language="C#" maintainscrollpositiononpostback="true" autoeventwireup="true" codebehind="ChangePwd.aspx.cs" inherits="Capstone2nd.ChangePwd" %>

<%@ register tagprefix="general" tagname="Navbar" src="Navbar.ascx" %>
<%@ register tagprefix="general" tagname="Header" src="Header.ascx" %>
<%@ register tagprefix="general" tagname="Footer" src="Footer.ascx" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Change Password Page</title>

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
            <form id="form1" runat="server">

                <!--Text Box for Email Address-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label ID="lblEmail" runat="server" CssClass="input-group-text" Text="Email Address*" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="email" CssClass="form-control" runat="server" BackColor="White"></asp:TextBox>
                    </div>
                </div>
                <asp:RequiredFieldValidator ID="reqEmail" runat="server" ForeColor="Red" ErrorMessage="Email is a required field."
                    Display="Dynamic" ControlToValidate="email">*Required</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexEmail" ForeColor="Red" runat="server"
                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email"
                    ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>

                <!--Text Box for Current Password-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label ID="lblCurPass" runat="server" CssClass="input-group-text" Text="Current Password*" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="currPass" CssClass="form-control" BackColor="White" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <asp:RequiredFieldValidator ID="reqCurPass" runat="server" ForeColor="Red" ErrorMessage="Current Password is a required field."
                    Display="Dynamic" ControlToValidate="currPass">*Required</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexCurrPass" runat="server" ControlToValidate="currPass"
                    ErrorMessage="Password must contain: Min length 10; Characters, signs and numbers;" ForeColor="Red"
                    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{10,}$" />

                <!--Text Box for New Password-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label ID="lblNewPass" runat="server" CssClass="input-group-text" Text="New Password*" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="newPass" CssClass="form-control" BackColor="White" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <asp:RequiredFieldValidator ID="reqNewPass" runat="server" ForeColor="Red" ErrorMessage="New Password is a required field."
                    Display="Dynamic" ControlToValidate="newPass">*Required</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexNewPass" runat="server" ControlToValidate="newPass"
                    ErrorMessage="Password must contain: Min length 10; Characters, signs and numbers;" ForeColor="Red"
                    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{10,}$" />

                <!--Text Box for Password confirmation-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label ID="lblConfirmPassword" CssClass="input-group-text" runat="server" Text="Confirm Password*" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="confirmPassword" CssClass="form-control" BackColor="White" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <asp:RequiredFieldValidator ID="reqConfPassword" runat="server" ForeColor="Red" ErrorMessage="Confirm Password is a required field."
                    Display="Dynamic" ControlToValidate="confirmPassword">*Required</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="compPass" runat="server" ForeColor="Red" ErrorMessage="Passwords do not match!"
                    ControlToValidate="confirmPassword" ControlToCompare="newPass"></asp:CompareValidator>

                <!--Button for Submitting the Form-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Button ID="BtnSubmit" CssClass="btn btn-secondary" runat="server" Text="Submit" UseSubmitBehavior="true" OnClick="BtnSubmit_Click" />
                    </div>
                </div>
                <!--Message-->
                <asp:Label ID="lblMessage" Font-Size="16px" ForeColor="Red" Height="20px" runat="server"></asp:Label>
            </form>
        </div>

        <div class="col-xl-2 col-lg-2">
        </div>

    </div>

    <!-- Footer -->
    <general:footer id="footer" runat="server" />

</body>
</html>
