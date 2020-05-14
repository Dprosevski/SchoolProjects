<%@ Page Language="C#" maintainscrollpositiononpostback="true" AutoEventWireup="true" CodeBehind="EditProgram1.aspx.cs" Inherits="Capstone2nd.EditProgram1" %>
<%@ Register TagPrefix="general" TagName="Nav" Src="Navigation.ascx" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Edit Program Page</title>

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
    <general:Nav ID="naviation" runat="server" />

    
    <!-- Header -->
    <header class="masthead">
        <div class="container d-flex h-100 align-items-center">
            <div class="mx-auto text-center">
            </div>
        </div>
    </header>

    <form id="form1" runat="server">

        <!--Error Message-->
        <asp:Label id="lblMessage" Height="40px" Font-Size="18px" ForeColor="Red" runat="server" /><br />
        
        <!--Text Box for Program Name-->
        <p> Program name. Name of program for which you will enter program details. If you are affiliated with multiple programs,</p> 
        <p> please enter them separately so that information provided here is specific to only one program.</p>
        <asp:TextBox ID="pname" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>

        <br />
        <br />
            
        <!--Acronym Box-->
        <p>Acronym or abbreviated program name. IF your program is known by an acronym (example SEED, MEPI, HCOP) please</p> 
        <p>enter it here to enable students and parents to search for your group by an acronym they have heard. You may leave this blank.</p>
        <asp:TextBox ID="acnym" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
          
            <br />
            <br /> 

        <!--Text Box for Program Contact Name-->
        <asp:Label ID="lbcontact" runat="server" Text="Program Contact Name" ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="proContact" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
        <asp:RequiredFieldValidator ID="proContactControl" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" ControlToValidate="proContact">*Required</asp:RequiredFieldValidator><br /><br />
            
        <!--Text Box for Program Contact Email-->
        <asp:Label ID="lbcontactemail" runat="server" Text="Program Contact Email" ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="proContactEmail" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
        <asp:RequiredFieldValidator ID="proContactControlEmail" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" ControlToValidate="proContactEmail">*Required</asp:RequiredFieldValidator><br /><br />
            
        <!--Text Box for Program Contact Phone-->
        <asp:Label ID="lbcontactphone" runat="server" Text="Program Contact Phone" ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="proContactPhone" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
        <asp:RequiredFieldValidator ID="proContactControlPhone" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" ControlToValidate="proContactPhone">*Required</asp:RequiredFieldValidator><br /><br />

        <!--Text Box for FieldOfStudy-->
        <asp:Label ID="lblSubject" runat="server" Text="Which fields of study does the program include?" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:CheckBoxList ID="subject" runat="server" Font-Size="10" Font-Strikeout="False" ForeColor="Black" TextAlign="Left">
        </asp:CheckBoxList>
        <asp:Label ID="lbother" runat="server" Text="Other: please describe <br />" ForeColor="Black" Font-Size="12pt" Visible="true"></asp:Label>
        <asp:TextBox ID="other" runat="server" BackColor="White" onfocus="this.select()" Visible="true"></asp:TextBox><br /><br />
            
        <!--Text Box for Grades-->
        <asp:Label ID="lbGrade" runat="server" Text="Eligible grades" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:CheckBoxList ID="grade" runat="server" Font-Size="10" Font-Strikeout="False" ForeColor="Black" TextAlign="Left">
        </asp:CheckBoxList>
            
        <!--Text Box for Residency-->
        <asp:Label ID="lblProgDescription" runat="server" Text="Is this program residential?" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:DropDownList ID="Progdescription" runat="server">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="residentValidator" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" 
        ControlToValidate="Progdescription">*Required</asp:RequiredFieldValidator><br />
        <asp:Label ID="lbresidentother" runat="server" Text="What are the eligibility requirements to live on-site? <br />" ForeColor="Black" Font-Size="12pt" Visible="true"></asp:Label>
        <asp:TextBox ID="residentother" runat="server" BackColor="White" onfocus="this.select()" Visible="true"></asp:TextBox><br />
            
       <!--Text Box for Program Cost-->
        <asp:Label ID="lbcost" runat="server" Text="Program Cost" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:RadioButtonList ID="radioCost" runat="server" Font-Size="10" Font-Strikeout="False" ForeColor="Black" TextAlign="Left">   
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="costValidator" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" 
        ControlToValidate="radioCost">*Required</asp:RequiredFieldValidator>
        
        <!--Text Box for Stipend-->
        <asp:Label ID="lblstipend" runat="server" Text="Program Stipend" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:RadioButtonList ID="stipendlist" runat="server" Font-Size="10" Font-Strikeout="False" ForeColor="Black" TextAlign="Left">
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="stipendValidator" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" 
        ControlToValidate="stipendlist">*Required</asp:RequiredFieldValidator>
        <asp:Label ID="stipendlabel1" runat="server" Text="Who is eligible to receive a stipend <br />" ForeColor="Black" Font-Size="12pt" Visible="true"></asp:Label>
        <asp:TextBox ID="stipendinput1" runat="server" BackColor="White" onfocus="this.select()" Visible="true"></asp:TextBox><br /><br />
        <asp:Label ID="stipendlabel2" runat="server" Text="How much is the stipend? <br />" ForeColor="Black" Font-Size="12pt" Visible="true"></asp:Label>
        <asp:TextBox ID="stipendinput2" runat="server" BackColor="White" onfocus="this.select()" Visible="true"></asp:TextBox><br /><br />
        
       <!--Text Box for Duration-->
        <asp:Label ID="lblduration" runat="server" Text="What is the duration of the program?" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:RadioButtonList ID="Progduration" runat="server">
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="durationValidator" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" 
        ControlToValidate="Progduration">*Required</asp:RequiredFieldValidator>
            
        <!--Text Box for Season-->
        <asp:Label ID="lblseason" runat="server" Text="Season in which the program operates" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:RadioButtonList ID="Season" runat="server">              
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="seasonValidator" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" 
        ControlToValidate="Season">*Required</asp:RequiredFieldValidator>
              
        <!--Text Box for Start Date-->
        <asp:Label ID="lbstartdate" runat="server" Text="Program start date" ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="StartDate" runat="server" BackColor="White" onfocus="this.select()" TextMode="Date"></asp:TextBox>
        <asp:RequiredFieldValidator ID="StartDateControl" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" ControlToValidate="StartDate">*Required</asp:RequiredFieldValidator><br /><br />
            
        <!--Text Box for App Deadline-->
        <asp:Label ID="lbAppDealine" runat="server" Text="Application Dealine" ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="AppDeadline" runat="server" BackColor="White" onfocus="this.select()" TextMode="Date"></asp:TextBox>
        <asp:RequiredFieldValidator ID="AppDeadlineControl" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" ControlToValidate="AppDeadline">*Required</asp:RequiredFieldValidator><br /><br />
            
        <!--Text Box for Affiliations-->
        <asp:Label ID="lbluniaff" runat="server" Text="Is the program affiliated with a company or university?" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:RadioButtonList ID="UniAff" runat="server">
            <asp:ListItem value="Yes"></asp:ListItem>
            <asp:ListItem value="No"></asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="affiliationValidator" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" 
        ControlToValidate="UniAff">*Required</asp:RequiredFieldValidator>
        <asp:Label runat="server" ID="unilabel" Text="Name of institution with which the program is affiliated <br />" Visible="true">
            <asp:TextBox ID="uni" runat="server" BackColor="White" onfocus="this.select()" Visible="true"></asp:TextBox>
        </asp:Label><br /><br />

        <!--Text Box for Eligibility Restrictions-->
        <asp:Label ID="eligibilitylabel" runat="server" Text="Are there other eligibility restrictions that applicants should be aware of?" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:RadioButtonList ID="eligibility" runat="server">
            <asp:ListItem value="Yes"></asp:ListItem>
            <asp:ListItem value="No"></asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="eligibilityValidator" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" 
        ControlToValidate="eligibility">*Required</asp:RequiredFieldValidator>
        <asp:Label ID="lbelig" runat="server" Text="Describe additional restrictions" ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="elig" runat="server" BackColor="White" onfocus="this.select()"/>
        <br>
        <br>
            
        <!--Text Box for Street Address-->
        <asp:Label ID="lbstreetaddress" runat="server" Text="Street address of program headquarters" ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="StreetAddress" runat="server" BackColor="White" onfocus="this.select()" TextMode="MultiLine" Rows="10" />
        <asp:RequiredFieldValidator ID="addressValidator" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" 
        ControlToValidate="StreetAddress">*Required</asp:RequiredFieldValidator>
        <br>
        <br>
            
        <!-- Search by State  -->
        <asp:Label ID="lblState" runat="server">Search by State :</asp:Label>
        <asp:DropDownList ID="stateList" AppendDataBoundItems="False" AutoPostBack="true" runat="server" OnSelectedIndexChanged="stateList_SelectedIndexChanged"></asp:DropDownList>
        <asp:RequiredFieldValidator ID="stateValidator" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" 
        ControlToValidate="stateList">*Required</asp:RequiredFieldValidator><hr />


        <!-- Search by County -->
        <asp:Label ID="lblCounty" runat="server">Search by County:</asp:Label>
        <asp:DropDownList ID="countyList" AppendDataBoundItems="False" AutoPostBack="true" runat="server" OnSelectedIndexChanged="countyList_SelectedIndexChanged"></asp:DropDownList>
        <asp:RequiredFieldValidator ID="countyValidator" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" 
        ControlToValidate="countyList">*Required</asp:RequiredFieldValidator><hr />


        <!-- Search by City -->
        <asp:Label ID="lblCity" runat="server">Search by City:</asp:Label>
        <asp:DropDownList ID="cityList" AppendDataBoundItems="False" AutoPostBack="true" runat="server"></asp:DropDownList>
        <asp:RequiredFieldValidator ID="cityValidator" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" 
        ControlToValidate="cityList">*Required</asp:RequiredFieldValidator><hr />

        <!--Text Box for Zipcode-->
        <asp:Label ID="lbProgramZip" runat="server" Text="Program Zip " ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="ProgramZip" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
        <asp:RequiredFieldValidator ID="zipcodeValidator" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" 
        ControlToValidate="ProgramZip">*Required</asp:RequiredFieldValidator>
        <br>
        <br>
            
        <!--Text Box for Service Area-->
        <asp:Label ID="lblserviceArea" runat="server" Text="Service area from where you want to draw candidates" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <asp:DropDownList ID="ServiceArea" runat="server">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="serviceAreaValidator" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" 
        ControlToValidate="ServiceArea">*Required</asp:RequiredFieldValidator><br /><br />
        <asp:Label runat="server" ID="serviceareaotherlabel" Text="Describe service area or geographical limitations from where you want to draw candidates <br />" Visible="true">
            <asp:TextBox ID="serviceareaother" runat="server" BackColor="White" onfocus="this.select()" Visible="true"></asp:TextBox>
        </asp:Label><br /><br />
            
        <!--Text Box for Website-->
        <asp:Label ID="lbProgSite" runat="server" Text="Program Website " ForeColor="Black" Font-Size="12pt"></asp:Label><br />
        <asp:TextBox ID="ProgramSite" runat="server" BackColor="White" onfocus="this.select()"></asp:TextBox>
        <asp:RequiredFieldValidator ID="websiteValidator" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" 
        ControlToValidate="ProgramSite">*Required</asp:RequiredFieldValidator>
        <br>
        <br>
            
        <!--Text Box for Program Description-->    
        <p>Program description. Please use this space to write about any details not previously entered</p> 
        <p>morning? Is it 2-3 hours, or 5+ hours? Are your daily events morning only, or is participation for the full day?</p>    
        <asp:TextBox ID="ProgDes" runat="server" BackColor="White" onfocus="this.select()" TextMode="MultiLine" Rows="10" />
        <asp:RequiredFieldValidator ID="descriptionValidator" runat="server" ForeColor="Red" ErrorMessage="required Field" Display="Dynamic" 
        ControlToValidate="ProgDes">*Required</asp:RequiredFieldValidator>
        <br>
        <br>
      
        <!--Validation Summary-->
        <asp:ValidationSummary ID="validSummary" DisplayMode="List" runat="server" ForeColor="Red"/>
        <!--Button for Submitting the Form-->
        <asp:Label ID="lblSubmit" runat="server" ForeColor="Blue" Font-Size="18pt"></asp:Label><br />
        <asp:Button ID="BtnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click"/>
    </form>

    <!--Confirmation Form-->
    <form id="form2" runat="server">
        <asp:Label ID="output" runat="server" ForeColor="Black" Font-Size="14pt"></asp:Label><br />
        <br />
        <asp:Button ID="Confirm" runat="server" Text="Confirm" UseSubmitBehavior="true" OnClick="Confirm_Click" />
    </form>

    
		<!-- Footer -->
    <footer class="bg-black small text-center text-white-50">
        <div class="container">
            Copyright &copy; Your Website 2019
        </div>
    </footer>

    
		<!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    
		<!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    
		<!-- Custom scripts for this template -->
    <script src="js/grayscale.min.js"></script>

</body>

</html>