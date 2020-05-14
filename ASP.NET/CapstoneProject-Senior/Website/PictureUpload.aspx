﻿<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="PictureUpload.aspx.cs" Inherits="Capstone2nd.PictureUpload" %>
<%@ Register TagPrefix="general" TagName="Navbar" Src="Navbar.ascx" %>
<%@ Register TagPrefix="general" TagName="Header" Src="Header.ascx" %>
<%@ Register TagPrefix="general" TagName="Footer" Src="Footer.ascx" %>

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
    <general:Navbar ID="navbar" runat="server" />
    <!-- Header -->
    <general:Header ID="header" runat="server" />

    <!-- FORM 1 -->
    <form id="form1" runat="server">

        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <!--Error Message-->
        <asp:Label id="lblMessage" Height="40px" Font-Size="18px" ForeColor="Red" runat="server" /><br />


        <!--Image upload for Consumables-->
        <asp:UpdatePanel ID="updatePanelID" UpdateMode="Always" runat="server">
            <ContentTemplate>
                <asp:FileUpload ID="imgUploadID" runat="server"  AllowMultiple="true" CssClass="btn btn-secondary" /><br /><br />
                <asp:Button ID="btnUploadID" runat="server" Text="Upload Selected File" OnClick="UploadButton_Click" UseSubmitBehavior="false"
                    CssClass="btn btn-primary"/>
                <asp:Label ID="lblUploadDetails" runat="server" Text=""></asp:Label>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnUploadID" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
    
    <!-- Footer -->
    <general:Footer ID="footer" runat="server" />

</body>

</html>