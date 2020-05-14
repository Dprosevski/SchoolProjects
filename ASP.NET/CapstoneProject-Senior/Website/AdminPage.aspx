<%@ page language="C#" maintainscrollpositiononpostback="true" autoeventwireup="true" codebehind="AdminPage.aspx.cs" inherits="Capstone2nd.AdminPage" %>

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
    <title>Admin Page</title>

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
                <!--Error Message-->
                <asp:Label ID="lblMessage" Height="25px" Font-Size="18px" ForeColor="Red" runat="server" />

                <!-- New Admin -->
                <asp:HyperLink CssClass="nav-link js-scroll-trigger" ID="addNewAdminID" runat="server" NavigateUrl="~/addNewAdmin.aspx"
                    Visible="false">To add a new admin click here!</asp:HyperLink>


                <!-- Find and Edit Admin -->
                <asp:Panel ID="pnlAdmin" runat="server" Visible="false">
                    <hr />
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <asp:Label ID="lblAdminList" CssClass="input-group-text" runat="server" Text="Choose an admin to edit:" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
                            <asp:DropDownList ID="adminList" AppendDataBoundItems="False" AutoPostBack="true" runat="server">
                            </asp:DropDownList>
                            <br />
                        </div>
                    </div>
                    <br /><asp:Button ID="editAdminID" CssClass="btn btn-secondary" runat="server" Text="Edit Admin" UseSubmitBehavior="false"
                        OnClick="editAdminID_Click" /><br /><br /><hr />
                </asp:Panel>
              

                <!-- Find and Edit User -->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label ID="lblUserList" CssClass="input-group-text" runat="server" Text="Choose a user to edit:" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
                        <asp:DropDownList ID="userList" AppendDataBoundItems="False" AutoPostBack="true" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <br /><asp:Button ID="editUserID" CssClass="btn btn-secondary" runat="server" Text="Edit User" UseSubmitBehavior="false"
                    OnClick="editUserID_Click" /><br />

            </form>
        </div>

        <div class="col-xl-2 col-lg-2">
        </div>

    </div>

    <!-- Footer -->
    <general:footer id="footer" runat="server" />
</body>
</html>
