<%@ page language="C#" maintainscrollpositiononpostback="true" autoeventwireup="true" codebehind="Register.aspx.cs" inherits="Capstone2nd.Register" %>

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

    <title>Register Page - Diabetes Decision System</title>

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
                <!--Error Message-->
                <asp:Label ID="lblMessage" Height="40px" Font-Size="18px" ForeColor="Red" runat="server" />


                <asp:Label ID="lblName" Font-Size="18px" ForeColor="Black" Text="Name" Font-Bold="true" runat="server" />
                <!--Text Box for Prefix-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <asp:Label ID="lblPrefix" runat="server" CssClass="input-group-text" Text="Prefix:" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="prefix" CssClass="form-control" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
                    </div>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Box for First Name-->
                        <asp:Label ID="lblFirst" CssClass="input-group-text" runat="server" Text="First Name" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="first" CssClass="form-control" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="firstNameValid" runat="server" ForeColor="Red" ErrorMessage="First name is a required field." Display="Dynamic"
                            ControlToValidate="first">Required</asp:RequiredFieldValidator>
                    </div>
                </div>


                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Box for Middle Name-->
                        <asp:Label ID="lblMiddle" CssClass="input-group-text" runat="server" Text="Middle Name" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="middle" CssClass="form-control" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
                    </div>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Box for Last Name-->
                        <asp:Label ID="lblLast" CssClass="input-group-text" runat="server" Text="Last Name" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="last" runat="server" CssClass="form-control" BackColor="White" onfocus="this.select()"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="lastNameValid" runat="server" ForeColor="Red" ErrorMessage="Last name is a required field."
                            Display="Dynamic" ControlToValidate="last">Required</asp:RequiredFieldValidator>
                    </div>
                </div>


                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Box for Sufix-->
                        <asp:Label ID="lblSufix" CssClass="input-group-text" runat="server" Text="Sufix:" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="sufix" CssClass="form-control" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
                    </div>
                </div>

                <hr />
                <asp:Label ID="lblContact" Font-Size="18px" ForeColor="Black" Text="Contact and Verification" Font-Bold="true" runat="server" />
                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Box for Phone-->
                        <asp:Label ID="lblPhone" CssClass="input-group-text" runat="server" Text="Phone number:" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="phone" CssClass="form-control" TextMode="Phone" BackColor="White" runat="server"></asp:TextBox>
                    </div>
                </div>
                <br />

                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Box for Email Address-->
                        <asp:Label ID="lblEmail" CssClass="input-group-text" runat="server" Text="Email Address" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="email" CssClass="form-control" runat="server" TextMode="Email" BackColor="White"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqEmail" runat="server" ForeColor="Red" ErrorMessage="Email is a required field." Display="Dynamic"
                            ControlToValidate="email">Required</asp:RequiredFieldValidator>
                    </div>
                </div>
                <asp:RegularExpressionValidator ID="regexEmail" ForeColor="Red" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ControlToValidate="email" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>



                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Box for Email Address confirmation-->
                        <asp:Label ID="lblConfirmEmail" CssClass="input-group-text" runat="server" Text="Confirm Email Address" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="confirmEmail" CssClass="form-control" runat="server" BackColor="White"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqConfEmail" runat="server" ForeColor="Red" ErrorMessage="Confirm Email is a required field." Display="Dynamic"
                            ControlToValidate="confirmEmail">Required</asp:RequiredFieldValidator>
                    </div>
                </div>
                <asp:CompareValidator ID="compEmail" runat="server" ForeColor="Red" ErrorMessage="Emails do not match!" ControlToValidate="confirmEmail"
                    ControlToCompare="email"></asp:CompareValidator>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Box for Password-->
                        <asp:Label ID="lblPassword" CssClass="input-group-text" runat="server" Text="Password" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="password" CssClass="form-control" BackColor="White" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqPassword" runat="server" ForeColor="Red" ErrorMessage="Password is a required field." Display="Dynamic"
                            ControlToValidate="password">Required</asp:RequiredFieldValidator>
                    </div>
                </div>
                <asp:RegularExpressionValidator ID="regexPassword" runat="server" ControlToValidate="password"
                    ErrorMessage="Password must contain: Min length 10; Characters, signs and numbers;" ForeColor="Red"
                    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{10,}$" />

                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Box for Password confirmation-->
                        <asp:Label ID="lblConfirmPassword" CssClass="input-group-text" runat="server" Text="Confirm Password" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="confirmPassword" CssClass="form-control" BackColor="White" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqConfPassword" runat="server" ForeColor="Red" ErrorMessage="Confirm Password is a required field." Display="Dynamic"
                            ControlToValidate="confirmPassword">Required</asp:RequiredFieldValidator>
                    </div>
                </div>
                <asp:CompareValidator ID="compPass" runat="server" ForeColor="Red" ErrorMessage="Passwords do not match!" ControlToValidate="confirmPassword"
                    ControlToCompare="password"></asp:CompareValidator>



                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Box for Alt Email Address-->
                        <asp:Label ID="lblAltEmail" CssClass="input-group-text" runat="server" Text="Alternative Email Address:" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="altEmail" CssClass="form-control" runat="server" BackColor="White"></asp:TextBox>
                    </div>
                </div>
                <asp:RegularExpressionValidator ID="regexAltEmail" ForeColor="Red" runat="server"
                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="altEmail"
                    ErrorMessage="Invalid Alternative Email Format"></asp:RegularExpressionValidator>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Box for Alt Password-->
                        <asp:Label ID="lblAltPass" CssClass="input-group-text" runat="server" Text="Alternative Email's Password:" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="altPass" CssClass="form-control" BackColor="White" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <asp:RegularExpressionValidator ID="regexAltPass" runat="server" ControlToValidate="altPass"
                    ErrorMessage="Alternative Email's Password must contain: Min length 10; Characters, signs and numbers;" ForeColor="Red"
                    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{10,}$" />

                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Box for Parent's Password-->
                        <asp:Label ID="lblParentPass" CssClass="input-group-text" runat="server" Text="Parent's Verification Password:" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="parentPass" CssClass="form-control" BackColor="White" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <asp:RegularExpressionValidator ID="regexParentPass" runat="server" ControlToValidate="parentPass"
                    ErrorMessage="Parent's Verification Password must contain: Min length 10; Characters, signs and numbers;" ForeColor="Red"
                    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{10,}$" />

                <hr />
                <asp:Label ID="lblPersonal" Font-Size="18px" ForeColor="Black" Text="Personal Information" Font-Bold="true" runat="server" />
                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Box for Address-->
                        <asp:Label ID="lblAddress" CssClass="input-group-text" runat="server" Text="Address:" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="address" CssClass="form-control" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
                    </div>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Box for DOB-->
                        <asp:Label ID="lblDob" CssClass="input-group-text" runat="server" Text="Date of Birth:" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="dob" CssClass="form-control" runat="server" TextMode="Date" BackColor="White" onfocus="this.select()"></asp:TextBox>
                    </div>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Radio Button List for Gender-->
                        <asp:Label ID="lblGender" CssClass="input-group-text" runat="server" Text="Gender" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:RadioButtonList ID="radioGender" runat="server" Font-Size="8" Font-Strikeout="False" ForeColor="Black" TextAlign="Left">
                            <asp:ListItem Value="Male"></asp:ListItem>
                            <asp:ListItem Value="Female"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Boxes for Height FT-->
                        <asp:Label ID="lblHeightFt" CssClass="input-group-text" runat="server" Text="Height (Feet):" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="heightFt" CssClass="form-control" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
                    </div>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Boxes for Height IN-->
                        <asp:Label ID="lblHeightIn" CssClass="input-group-text" runat="server" Text="Height (Inches):" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="heightIn" CssClass="form-control" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
                    </div>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Box for Weight-->
                        <asp:Label ID="lblWeight" CssClass="input-group-text" runat="server" Text="Weight (Pounds):" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="weight" CssClass="form-control" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
                    </div>
                </div>

                <hr />
                <asp:Label ID="lblMedical" Font-Size="18px" ForeColor="Black" Text="Medical Information" Font-Bold="true" runat="server" />
                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Box for BloodType-->
                        <asp:Label ID="lblBloodType" CssClass="input-group-text" runat="server" Text="Blood type:" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="bloodType" CssClass="form-control" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
                    </div>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Text Box for Allergies-->
                        <asp:Label ID="lblAllergies" CssClass="input-group-text" runat="server" Text="Allergies:" ForeColor="Black" Font-Size="10pt"></asp:Label>
                        <asp:TextBox ID="allergies" CssClass="form-control" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
                    </div>
                </div>

                <hr />
                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Check Box for Accepting Terms-->
                        <asp:CheckBox runat="server" ID="terms" />
                        <asp:Label ID="lblTerms" runat="server" Text="I agree to terms and policies." ForeColor="Black" Font-Size="14pt"></asp:Label>

                    </div>
                </div>
                <asp:CustomValidator runat="server" ID="reqTerms" ForeColor="Red" OnServerValidate="CheckBoxRequired_ServerValidate"
                    ErrorMessage="You must accept terms and conditions to proceed."></asp:CustomValidator>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <!--Button for Submitting the Form-->
                        <asp:Label ID="lblSubmit" runat="server" ForeColor="Blue" Font-Size="18pt"></asp:Label>
                        <asp:Button ID="BtnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" UseSubmitBehavior="true" OnClick="BtnSubmit_Click" />
                    </div>
                </div>

            </form>
            <!--End of FORM 1-->

            <!--Confirmation Form-->
            <form id="form2" runat="server">
                <asp:Label ID="output" runat="server" ForeColor="Black" Font-Size="14pt"></asp:Label></br>
        <asp:Button ID="Confirm" CssClass="btn btn-success" runat="server" Text="Confirm" UseSubmitBehavior="true" OnClick="Confirm_Click" />
            </form>

        </div>

        <div class="col-xl-2 col-lg-2">
        </div>

    </div>


    <!-- Footer -->
    <general:footer id="footer" runat="server" />

</body>
</html>
