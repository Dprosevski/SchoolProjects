<%@ page language="C#" maintainscrollpositiononpostback="true" autoeventwireup="true" codebehind="Update.aspx.cs" inherits="Capstone2nd.Update" %>

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

    <title>Update Page</title>


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
            <!-- FORM 1 -->
            <form id="form1" runat="server">
                <asp:ScriptManager runat="server"></asp:ScriptManager>
                <!--Error Message-->
                <asp:Label ID="lblMessage" Height="40px" Font-Size="18px" ForeColor="Red" runat="server" /><br />

                <!--Drop down list for Activities-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label ID="lblActID" CssClass="input-group-text" runat="server" Text="Activities name:" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
                        <asp:DropDownList ID="actNameID" runat="server" AutoPostBack="true"></asp:DropDownList><br />
                    </div>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Textbox for Activities amount-->
                        <asp:Label ID="lblActTimeID" CssClass="input-group-text" runat="server" Text="Activities time (minutes):" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
                        <asp:TextBox ID="actTimeID" runat="server" Width="40px"></asp:TextBox><br />
                    </div>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Button to push Activities-->
                        <asp:Button ID="pushActID" runat="server" Text="Push Activities" UseSubmitBehavior="false" OnClick="pushActID_Click" /><br />
                        <asp:Label ID="lblPushActMsg" Height="40px" Font-Size="14px" ForeColor="Blue" runat="server" /></asp:Label>
                    </div>
                </div>
                <hr />

                <!--Drop down list for Consumables-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label ID="lblConsID" runat="server" CssClass="input-group-text" Text="Consumed name:" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
                        <asp:DropDownList ID="consNameID" runat="server" AutoPostBack="true"></asp:DropDownList><br />
                    </div>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Textbox for Consumables amount-->
                        <br />
                        <asp:Label ID="lblconsAmountID" CssClass="input-group-text" runat="server" Text="Consumed amount:" ForeColor="Black" Font-Size="10pt"></asp:Label><br />
                        <asp:TextBox ID="consAmountID" runat="server" Width="40px"></asp:TextBox><br />
                    </div>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Button to push Consumables-->
                        <asp:Button ID="pushConsID" runat="server" Text="Push Consumables" UseSubmitBehavior="false" OnClick="pushConsID_Click" /><br />
                        <asp:Label ID="lblPushConsMsg" Height="40px" Font-Size="14px" ForeColor="Blue"
                            runat="server" /></asp:Label>
                    </div>
                </div>
                <!--Button for Reseting the Form-->
                <asp:HyperLink CssClass="smallLink" ID="linkToImageUpload" runat="server" NavigateUrl="~/PictureUpload.aspx">
                To upload an image click here!</asp:HyperLink><hr />



                <!--Button for Reseting the Form-->
                <asp:Button ID="BtnReset" runat="server" CssClass="btn btn-secondary" Text="Reset" UseSubmitBehavior="false" OnClick="BtnReset_Click" />
                <!--Button for Submitting the Form-->
                <asp:Button ID="BtnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" UseSubmitBehavior="true" OnClick="BtnSubmit_Click" Visible="false" /><br />
            </form>


            <!--Confirmation Form-->
            <form id="form2" runat="server">
                <asp:Label ID="output" runat="server" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
                <br />
                <asp:Button ID="Confirm" CssClass="btn btn-primary" runat="server" Text="Confirm" UseSubmitBehavior="true" OnClick="Confirm_Click" />
            </form>
        </div>

        <div class="col-xl-2 col-lg-2">
        </div>

    </div>


    <!-- Footer -->
    <general:footer id="footer" runat="server" />

</body>

</html>
