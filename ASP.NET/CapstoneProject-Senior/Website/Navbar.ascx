<%@ control language="C#" autoeventwireup="true" codebehind="Navbar.ascx.cs" inherits="Capstone2nd.Navbar" %>

<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
                <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="Default.aspx">Home Page</a>
                </li>
                <li class="nav-item">
                    <asp:HyperLink CssClass="nav-link js-scroll-trigger" ID="loginID" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>
                </li>

                <li class="nav-item">
                    <asp:HyperLink CssClass="nav-link js-scroll-trigger" ID="updateID" runat="server" NavigateUrl="~/Update.aspx">Update</asp:HyperLink>
                </li>

                <li class="nav-item">
                    <asp:HyperLink CssClass="nav-link js-scroll-trigger" ID="registerID" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
                </li>

                <li class="nav-item">
                    <asp:HyperLink CssClass="nav-link js-scroll-trigger" ID="changePwdID" runat="server" NavigateUrl="~/ChangePwd.aspx">Change Password</asp:HyperLink>
                </li>

                <li class="nav-item">
                    <asp:HyperLink CssClass="nav-link js-scroll-trigger" ID="editProfileID" runat="server" NavigateUrl="~/EditProfile.aspx">Edit Profile</asp:HyperLink>
                </li>

                <li class="nav-item">
                    <asp:HyperLink CssClass="nav-link js-scroll-trigger" ID="adminPageID" runat="server" NavigateUrl="~/AdminPage.aspx">Admin Page</asp:HyperLink>
                </li>

                <li class="nav-item">
                    <asp:HyperLink CssClass="nav-link js-scroll-trigger" ID="logoutID" runat="server" NavigateUrl="~/Logout.aspx">Logout</asp:HyperLink>
                </li>
            </ul>
        </div>
    </div>
</nav>
