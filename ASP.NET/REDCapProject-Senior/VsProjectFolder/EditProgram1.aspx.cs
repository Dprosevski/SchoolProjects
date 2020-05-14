using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone2nd
{
    public partial class EditProgram1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            form2.Visible = false;

            //preventing unauthorized access
            if (Session["email"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (Session["programToEdit"] == null)
            {
                Response.Redirect("EditProgram.aspx");
            }

            //connect to the database as soon as the page loads so that security questions can be loaded
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            //always use try/catch for db connections
            try
            {
                //checking for post back will make sure fields don't populate multiple times
                if (!IsPostBack)
                {
                    //filling the drop downs
                    SqlCommand cmd = new SqlCommand("SELECT * FROM FieldofStudy", con);
                    con.Open();

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            subject.Items.Add(NewItem);
                        }
                    }
                    con.Close();

                    cmd = new SqlCommand("SELECT * FROM Grades", con);
                    con.Open();

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            grade.Items.Add(NewItem);
                        }
                    }
                    con.Close();

                    cmd = new SqlCommand("SELECT * FROM Residental", con);
                    con.Open();

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            Progdescription.Items.Add(NewItem);
                        }
                    }
                    con.Close();

                    cmd = new SqlCommand("SELECT * FROM ProgramCost", con);
                    con.Open();

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            radioCost.Items.Add(NewItem);
                        }
                    }
                    con.Close();

                    cmd = new SqlCommand("SELECT * FROM Stipend", con);
                    con.Open();

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            stipendlist.Items.Add(NewItem);
                        }
                    }
                    con.Close();

                    cmd = new SqlCommand("SELECT * FROM Duration", con);
                    con.Open();

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            Progduration.Items.Add(NewItem);
                        }
                    }
                    con.Close();

                    cmd = new SqlCommand("SELECT * FROM Season", con);
                    con.Open();

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            Season.Items.Add(NewItem);
                        }
                    }
                    con.Close();

                    cmd = new SqlCommand("SELECT * FROM ServiceArea", con);
                    con.Open();

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        String active = reader["status"].ToString();
                        if (active == "active")
                        {
                            ListItem NewItem = new ListItem(reader["value"].ToString());
                            ServiceArea.Items.Add(NewItem);
                        }
                    }
                    reader.Close();

                    //populate state dropdown
                    stateList.Items.Clear();
                    cmd = new SqlCommand("SELECT name FROM State", con);
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["name"].ToString());
                        stateList.Items.Add(NewItem);
                    }
                    reader.Close();

                    //populate county dropdown
                    countyList.Items.Clear();
                    cmd = new SqlCommand("SELECT county FROM ProgLoc", con);
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["county"].ToString());
                        countyList.Items.Add(NewItem);
                    }
                    reader.Close();

                    //populate city dropdown
                    cityList.Items.Clear();
                    cmd = new SqlCommand("SELECT city FROM ProgLoc", con);
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["city"].ToString());
                        cityList.Items.Add(NewItem);
                    }
                    reader.Close();

                    //initialize values for prefilling form
                    string programToEdit = Session["programToEdit"].ToString();
                    string progAcronym = "";
                    int contactID = 0;
                    int progLocID = 0;
                    string fieldDescription = "";
                    int resiID = 0;
                    string residentalDescription = "";
                    int progCostID = 0;
                    int durationID = 0;
                    int seasonID = 0;
                    int serviceAreaID = 0;
                    string serviceAreaDescripton = "";
                    int stipendID = 0;
                    string stipendElig = "";
                    string stipendAmount = "";
                    string startDate = "";
                    string appDeadline = "";
                    string affiliation = "";
                    string affiliationDescription = "";
                    string restrictions = "";
                    string restrictionDescription = "";
                    string streetAddress = "";
                    string progWebsite = "";
                    string progDescription = "";
                    int fieldID = 0;
                    int gradesID = 0;
                    string zipcode = "";

                    //go through the program and grab the prefilled data
                    cmd = new SqlCommand("SELECT * FROM Program WHERE name = @name", con);
                    cmd.Parameters.Add(new SqlParameter("@name", programToEdit));

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        progAcronym = new ListItem(reader["acronym"].ToString()).ToString();

                        //some will need special instructions, such as parse int, parse datetime, and checking for nulls to make sure it displays correctly
                        string contactString = new ListItem(reader["contactID"].ToString()).ToString();
                        contactID = Int32.Parse(contactString);

                        string locationString = new ListItem(reader["progLocID"].ToString()).ToString();
                        progLocID = Int32.Parse(locationString);

                        if (!reader.IsDBNull(6))
                        {
                            fieldDescription = new ListItem(reader["fieldDescription"].ToString()).ToString();
                        }

                        string resiString = new ListItem(reader["resiID"].ToString()).ToString();
                        resiID = Int32.Parse(resiString);

                        if (!reader.IsDBNull(8))
                        {
                            residentalDescription = new ListItem(reader["residentalDescription"].ToString()).ToString();
                        }

                        string costString = new ListItem(reader["programCostID"].ToString()).ToString();
                        progCostID = Int32.Parse(costString);

                        string durationString = new ListItem(reader["durationID"].ToString()).ToString();
                        durationID = Int32.Parse(costString);

                        string seasonString = new ListItem(reader["seasonID"].ToString()).ToString();
                        seasonID = Int32.Parse(costString);

                        string serviceAreaString = new ListItem(reader["serviceAreaID"].ToString()).ToString();
                        serviceAreaID = Int32.Parse(serviceAreaString);

                        if (!reader.IsDBNull(13))
                        {
                            serviceAreaDescripton = new ListItem(reader["serviceAreaDescription"].ToString()).ToString();
                        }

                        string stipendString = new ListItem(reader["stipendID"].ToString()).ToString();
                        stipendID = Int32.Parse(stipendString);

                        if (!reader.IsDBNull(15))
                        {
                            stipendElig = new ListItem(reader["stipendEligibility"].ToString()).ToString();
                        }

                        if (!reader.IsDBNull(16))
                        {
                            stipendAmount = new ListItem(reader["stipendAmount"].ToString()).ToString();
                        }

                        String startString = new ListItem(reader["startDate"].ToString()).ToString();
                        DateTime startParse = DateTime.Parse(startString);
                        startDate = startParse.ToString("yyyy-MM-dd");

                        String deadlineString = new ListItem(reader["appDeadline"].ToString()).ToString();
                        DateTime deadlineParse = DateTime.Parse(deadlineString);
                        appDeadline = deadlineParse.ToString("yyyy-MM-dd");

                        affiliation = new ListItem(reader["affiliation"].ToString()).ToString();

                        if (!reader.IsDBNull(20))
                        {
                            affiliationDescription = new ListItem(reader["affiliationDescription"].ToString()).ToString();
                        }

                        restrictions = new ListItem(reader["restrictions"].ToString()).ToString();

                        if (!reader.IsDBNull(22))
                        {
                            restrictionDescription = new ListItem(reader["restrictionsDescription"].ToString()).ToString();
                        }

                        streetAddress = new ListItem(reader["streetAddress"].ToString()).ToString();
                        progWebsite = new ListItem(reader["progWebsite"].ToString()).ToString();
                        progDescription = new ListItem(reader["progDescription"].ToString()).ToString();
                        string fieldString = new ListItem(reader["fieldID"].ToString()).ToString();
                        fieldID = Int32.Parse(fieldString);

                        string gradesString = new ListItem(reader["gradesID"].ToString()).ToString();
                        gradesID = Int32.Parse(gradesString);

                        zipcode = new ListItem(reader["zipcode"].ToString()).ToString();
                    }
                    reader.Close();

                    //go through the contact table to get contact data
                    string contactName = "";
                    string contactEmail = "";
                    string contactPhone = "";

                    cmd = new SqlCommand("SELECT * FROM ContactPerson WHERE contactID = @contactID", con);
                    cmd.Parameters.Add(new SqlParameter("@contactID", contactID));

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        contactName = new ListItem(reader["firstName"].ToString()).ToString();
                        contactEmail = new ListItem(reader["email"].ToString()).ToString();
                        contactPhone = new ListItem(reader["phone"].ToString()).ToString();
                    }
                    reader.Close();

                    //prepopulate state/city/county dropdowns
                    int stateID = 0;
                    string city = "";
                    string county = "";

                    cmd = new SqlCommand("SELECT * FROM ProgLoc WHERE progLocID = @progLocID", con);
                    cmd.Parameters.Add(new SqlParameter("@progLocID", progLocID));

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        string stateString = new ListItem(reader["stateID"].ToString()).ToString();
                        stateID = Int32.Parse(stateString);

                        city = new ListItem(reader["city"].ToString()).ToString();
                        county = new ListItem(reader["county"].ToString()).ToString();
                    }
                    reader.Close();

                    string state = "";

                    cmd = new SqlCommand("SELECT * FROM State WHERE stateID = @stateID", con);
                    cmd.Parameters.Add(new SqlParameter("@stateID", stateID));

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        state = new ListItem(reader["name"].ToString()).ToString();
                    }
                    reader.Close();

                    string progSubject = "";

                    //go through the maintenance tables and get values so that the right values are checked
                    cmd = new SqlCommand("SELECT * FROM FieldOfStudy WHERE fieldID = @fieldID", con);
                    cmd.Parameters.Add(new SqlParameter("@fieldID", fieldID));

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        progSubject = new ListItem(reader["value"].ToString()).ToString();
                    }
                    reader.Close();

                    string progGrade = "";

                    cmd = new SqlCommand("SELECT * FROM Grades WHERE gradesID = @gradesID", con);
                    cmd.Parameters.Add(new SqlParameter("@gradesID", gradesID));

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        progGrade = new ListItem(reader["value"].ToString()).ToString();
                    }
                    reader.Close();

                    string progResi = "";

                    cmd = new SqlCommand("SELECT * FROM Residental WHERE resiID = @resiID", con);
                    cmd.Parameters.Add(new SqlParameter("@resiID", resiID));

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        progResi = new ListItem(reader["value"].ToString()).ToString();
                    }
                    reader.Close();

                    string progCost = "";

                    cmd = new SqlCommand("SELECT * FROM ProgramCost WHERE programCostID = @costID", con);
                    cmd.Parameters.Add(new SqlParameter("@costID", progCostID));

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        progCost = new ListItem(reader["value"].ToString()).ToString();
                    }
                    reader.Close();

                    string progDuration = "";

                    cmd = new SqlCommand("SELECT * FROM Duration WHERE durationID = @durationID", con);
                    cmd.Parameters.Add(new SqlParameter("@durationID", durationID));

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        progDuration = new ListItem(reader["value"].ToString()).ToString();
                    }
                    reader.Close();

                    string progSeason = "";

                    cmd = new SqlCommand("SELECT * FROM Season WHERE seasonID = @seasonID", con);
                    cmd.Parameters.Add(new SqlParameter("@seasonID", seasonID));

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        progSeason = new ListItem(reader["value"].ToString()).ToString();
                    }
                    reader.Close();

                    string progServiceArea = "";

                    cmd = new SqlCommand("SELECT * FROM ServiceArea WHERE serviceAreaID = @serviceAreaID", con);
                    cmd.Parameters.Add(new SqlParameter("@serviceAreaID", serviceAreaID));

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        progServiceArea = new ListItem(reader["value"].ToString()).ToString();
                    }
                    reader.Close();

                    string progStipend = "";

                    cmd = new SqlCommand("SELECT * FROM Stipend WHERE stipendID = @stipendID", con);
                    cmd.Parameters.Add(new SqlParameter("@stipendID", stipendID));

                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        progStipend = new ListItem(reader["value"].ToString()).ToString();
                    }
                    reader.Close();

                    //prefill values
                    pname.Text = programToEdit;
                    acnym.Text = progAcronym;
                    proContact.Text = contactName;
                    proContactEmail.Text = contactEmail;
                    proContactPhone.Text = contactPhone;

                    foreach (ListItem li in subject.Items)
                    {
                        if (li.Text == progSubject)
                        {
                            li.Selected = true;
                        }
                    }

                    other.Text = fieldDescription;

                    foreach (ListItem li in grade.Items)
                    {
                        if (li.Text == progGrade)
                        {
                            li.Selected = true;
                        }
                    }

                    foreach (ListItem li in Progdescription.Items)
                    {
                        if (li.Text == progResi)
                        {
                            Progdescription.SelectedValue = li.Text;
                        }
                    }

                    residentother.Text = residentalDescription;

                    foreach (ListItem li in radioCost.Items)
                    {
                        if (li.Text == progCost)
                        {
                            li.Selected = true;
                        }
                    }

                    foreach (ListItem li in stipendlist.Items)
                    {
                        if (li.Text == progStipend)
                        {
                            li.Selected = true;
                        }
                    }

                    stipendinput1.Text = stipendElig;
                    stipendinput2.Text = stipendAmount;

                    foreach (ListItem li in Progduration.Items)
                    {
                        if (li.Text == progDuration)
                        {
                            li.Selected = true;
                        }
                    }

                    foreach (ListItem li in Season.Items)
                    {
                        if (li.Text == progSeason)
                        {
                            li.Selected = true;
                        }
                    }

                    StartDate.Text = startDate;
                    AppDeadline.Text = appDeadline;

                    foreach (ListItem li in UniAff.Items)
                    {
                        if (li.Text == affiliation)
                        {
                            li.Selected = true;
                        }
                    }

                    uni.Text = affiliationDescription;

                    foreach (ListItem li in eligibility.Items)
                    {
                        if (li.Text == restrictions)
                        {
                            li.Selected = true;
                        }
                    }

                    elig.Text = restrictionDescription;
                    StreetAddress.Text = streetAddress;

                    //prefill state
                    foreach (ListItem li in stateList.Items)
                    {
                        if (li.Text == state)
                        {
                            stateList.SelectedValue = li.Text;

                            cmd = new SqlCommand("SELECT stateID FROM State WHERE name = @state", con);
                            cmd.Parameters.Add(new SqlParameter("@state", state));
                            int findStateID = (int)cmd.ExecuteScalar();

                            cmd = new SqlCommand("SELECT DISTINCT county FROM ProgLoc WHERE stateID = @stateID and county != ''", con);
                            cmd.Parameters.Add(new SqlParameter("@stateID", findStateID));

                            reader = cmd.ExecuteReader();
                            countyList.Items.Clear();
                            while (reader.Read())
                            {
                                ListItem NewItem = new ListItem(reader["county"].ToString());
                                countyList.Items.Add(NewItem);
                            }
                            reader.Close();
                        }
                    }

                    //prefill county
                    foreach (ListItem li in countyList.Items)
                    {
                        if (li.Text == county)
                        {
                            countyList.SelectedValue = li.Text;

                            cmd = new SqlCommand("SELECT stateID FROM State WHERE name = @state", con);
                            cmd.Parameters.Add(new SqlParameter("@state", state));
                            int findStateID = (int)cmd.ExecuteScalar();


                            cmd = new SqlCommand("SELECT city FROM ProgLoc WHERE stateID = @stateID AND county = @county", con);
                            cmd.Parameters.Add(new SqlParameter("@stateID", findStateID));
                            cmd.Parameters.Add(new SqlParameter("@county", li.Value));

                            reader = cmd.ExecuteReader();
                            cityList.Items.Clear();
                            while (reader.Read())
                            {
                                ListItem NewItem = new ListItem(reader["city"].ToString());
                                cityList.Items.Add(NewItem);
                            }
                            reader.Close();
                        }
                    }

                    //prefill city
                    foreach (ListItem li in cityList.Items)
                    {
                        if (li.Text == city)
                        {
                            cityList.SelectedValue = li.Text;
                        }
                    }

                    ProgramZip.Text = zipcode;

                    foreach (ListItem li in ServiceArea.Items)
                    {
                        if (li.Text == progServiceArea)
                        {
                            ServiceArea.SelectedValue = li.Text;
                        }
                    }

                    serviceareaother.Text = serviceAreaDescripton;
                    ProgramSite.Text = progWebsite;
                    ProgDes.Text = progDescription;
                }

            }
            catch (Exception err)
            {
                Response.Write("<script>alert(\"" + err.Message + "\");</script>");
                Response.Write(err.Message);
                lblMessage.Text = "Cannot submit information now. Please try again later.";

            }
            finally //must make sure the connection is properly closed
            { //the finally block will always run whether there is an error or not
                con.Close();
            }

        }

        protected void stateList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlDataReader reader;
            SqlCommand cmd;
            con.Open();
            foreach (ListItem li in stateList.Items)
            {
                if (li.Selected)
                {

                    String state = li.Value;
                    cmd = new SqlCommand("SELECT stateID FROM State WHERE name = @state", con);
                    cmd.Parameters.Add(new SqlParameter("@state", state));
                    int findStateID = (int)cmd.ExecuteScalar();

                    cmd = new SqlCommand("SELECT DISTINCT county FROM ProgLoc WHERE stateID = @stateID and county != ''", con);
                    cmd.Parameters.Add(new SqlParameter("@stateID", findStateID));

                    reader = cmd.ExecuteReader();
                    countyList.Items.Clear();
                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["county"].ToString());
                        countyList.Items.Add(NewItem);
                    }
                    reader.Close();
                    break;
                }
            }
            con.Close();
        }

        protected void countyList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlDataReader reader;
            SqlCommand cmd;
            con.Open();
            foreach (ListItem li in countyList.Items)
            {
                if (li.Selected)
                {

                    String State = stateList.SelectedValue;
                    cmd = new SqlCommand("SELECT stateID FROM State WHERE name = @state", con);
                    cmd.Parameters.Add(new SqlParameter("@state", State));
                    int findStateID = (int)cmd.ExecuteScalar();


                    cmd = new SqlCommand("SELECT city FROM ProgLoc WHERE stateID = @stateID AND county = @county", con);
                    cmd.Parameters.Add(new SqlParameter("@stateID", findStateID));
                    cmd.Parameters.Add(new SqlParameter("@county", li.Value));

                    reader = cmd.ExecuteReader();
                    cityList.Items.Clear();
                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["city"].ToString());
                        cityList.Items.Add(NewItem);
                    }
                    reader.Close();
                    break;
                }
            }
            con.Close();
        }//county list
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            //initialize everything right away
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            //always use try/catch for db connections
            try
            {
                con.Open();
                SqlCommand cmd;
                int findProgramID = 0;

                //find program id so that 
                cmd = new SqlCommand("SELECT progID FROM Program WHERE name = @name;", con);
                cmd.Parameters.Add(new SqlParameter("@name", Session["programToEdit"].ToString()));
                findProgramID = (int)cmd.ExecuteScalar();

                //an extended version of inputting contact info so no duplicate contacts are put in
                cmd = new SqlCommand("SELECT COUNT (*) FROM ContactPerson WHERE firstName = @firstname AND email = @email AND phone = @phone;", con);
                cmd.Parameters.Add(new SqlParameter("@firstname", proContact.Text));
                cmd.Parameters.Add(new SqlParameter("@email", proContactEmail.Text));
                cmd.Parameters.Add(new SqlParameter("@phone", proContactPhone.Text.Replace("+", "").Replace(" ", "").Replace("(", "").Replace(")", "").Replace("-", "")));

                int findContact = (int)cmd.ExecuteScalar();

                if (findContact == 0)
                {
                    cmd = new SqlCommand("INSERT INTO ContactPerson (firstName, email, phone) VALUES (@firstname, @email, @phone);", con);
                    cmd.Parameters.Add(new SqlParameter("@firstname", proContact.Text));
                    cmd.Parameters.Add(new SqlParameter("@email", proContactEmail.Text));
                    cmd.Parameters.Add(new SqlParameter("@phone", proContactPhone.Text.Replace("+", "").Replace(" ", "").Replace("(", "").Replace(")", "").Replace("-", "")));
                    cmd.ExecuteNonQuery();
                }

                cmd = new SqlCommand("Select contactID FROM ContactPerson WHERE firstName = @contactname;", con);
                cmd.Parameters.Add(new SqlParameter("@contactname", proContact.Text));

                int contactID = (int)cmd.ExecuteScalar();

                //find program location
                cmd = new SqlCommand("Select stateID FROM State WHERE name = @state;", con);
                cmd.Parameters.Add(new SqlParameter("@state", stateList.SelectedValue));

                int stateID = (int)cmd.ExecuteScalar();

                cmd = new SqlCommand("Select progLocID FROM ProgLoc WHERE stateID = @stateID AND city = @city AND county = @county;", con);
                cmd.Parameters.Add(new SqlParameter("@stateID", stateID));
                cmd.Parameters.Add(new SqlParameter("@county", countyList.SelectedValue));
                cmd.Parameters.Add(new SqlParameter("@city", cityList.SelectedValue));

                int progLocID = (int)cmd.ExecuteScalar();

                //find values of maintenance tables, this is important b/c the radio buttons might not allign w/ database b/c of active/inactive
                cmd = new SqlCommand("SELECT fieldID FROM FieldOfStudy WHERE value = @subject", con);
                cmd.Parameters.Add(new SqlParameter("@subject", subject.SelectedValue));

                int findSubjectID = (int)cmd.ExecuteScalar();

                cmd = new SqlCommand("SELECT gradesID FROM Grades WHERE value = @grade", con);
                cmd.Parameters.Add(new SqlParameter("@grade", grade.SelectedValue));

                int findGradeID = (int)cmd.ExecuteScalar();

                cmd = new SqlCommand("SELECT resiID FROM Residental WHERE value = @residental", con);
                cmd.Parameters.Add(new SqlParameter("@residental", Progdescription.SelectedValue));

                int findResiID = (int)cmd.ExecuteScalar();

                cmd = new SqlCommand("SELECT programCostID FROM ProgramCost WHERE value = @cost", con);
                cmd.Parameters.Add(new SqlParameter("@cost", radioCost.SelectedValue));

                int findCostID = (int)cmd.ExecuteScalar();

                cmd = new SqlCommand("SELECT durationID FROM Duration WHERE value = @duration", con);
                cmd.Parameters.Add(new SqlParameter("@duration", Progduration.SelectedValue));

                int findDurationID = (int)cmd.ExecuteScalar();

                cmd = new SqlCommand("SELECT seasonID FROM Season WHERE value = @season", con);
                cmd.Parameters.Add(new SqlParameter("@season", Season.SelectedValue));

                int findSeasonID = (int)cmd.ExecuteScalar();

                cmd = new SqlCommand("SELECT serviceAreaID FROM ServiceArea WHERE value = @servicearea", con);
                cmd.Parameters.Add(new SqlParameter("@servicearea", ServiceArea.SelectedValue));

                int findServiceAreaID = (int)cmd.ExecuteScalar();

                cmd = new SqlCommand("SELECT stipendID FROM Stipend WHERE value = @stipend", con);
                cmd.Parameters.Add(new SqlParameter("@stipend", stipendlist.SelectedValue));

                int findStipendID = (int)cmd.ExecuteScalar();

                //update statement
                String sql = "UPDATE Program SET name = @name, acronym = @acronym, contactID = @contactID, progLocID = @progLocID, " +
                    "fieldDescription = @fieldDescription, resiID = @resiID, residentalDescription = @residentalDescription, programCostID = @programCostID, " +
                    "durationID = @durationID, seasonID = @seasonID, serviceAreaID = @serviceAreaID, serviceAreaDescription = @serviceAreaDescription, stipendID = @stipendID, " +
                    "stipendEligibility = @stipendEligibility, stipendAmount = @stipendAmount, startDate = @startDate, appDeadline = @appDeadline, " +
                    "affiliation = @affiliation, affiliationDescription = @affiliationDescription, restrictions = @restrictions, restrictionsDescription = @restrictionsDescription, " +
                    "streetAddress = @streetAddress, progWebsite = @progWebsite, ProgDescription = @ProgDescription, " +
                    "fieldID = @fieldID, gradesID = @gradesID, zipcode = @zipcode WHERE progID = @progID;";

                cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add(new SqlParameter("@progID", findProgramID));
                cmd.Parameters.Add(new SqlParameter("@name", pname.Text));
                cmd.Parameters.Add(new SqlParameter("@acronym", acnym.Text));
                cmd.Parameters.Add(new SqlParameter("@contactID", contactID));
                cmd.Parameters.Add(new SqlParameter("@progLocID", progLocID));
                cmd.Parameters.Add(new SqlParameter("@fieldDescription", other.Text)).IsNullable = true;
                cmd.Parameters.Add(new SqlParameter("@resiID", findResiID));
                cmd.Parameters.Add(new SqlParameter("@residentalDescription", residentother.Text)).IsNullable = true;
                cmd.Parameters.Add(new SqlParameter("@programCostID", findCostID));
                cmd.Parameters.Add(new SqlParameter("@durationID", findDurationID));
                cmd.Parameters.Add(new SqlParameter("@seasonID", findSeasonID));
                cmd.Parameters.Add(new SqlParameter("@serviceAreaID", findServiceAreaID));
                cmd.Parameters.Add(new SqlParameter("@serviceAreaDescription", serviceareaother.Text)).IsNullable = true;
                cmd.Parameters.Add(new SqlParameter("@stipendID", findStipendID));
                cmd.Parameters.Add(new SqlParameter("@stipendEligibility", stipendinput1.Text)).IsNullable = true;
                cmd.Parameters.Add(new SqlParameter("@stipendAmount", stipendinput2.Text)).IsNullable = true;
                cmd.Parameters.Add(new SqlParameter("@startDate", StartDate.Text));
                cmd.Parameters.Add(new SqlParameter("@appDeadline", AppDeadline.Text));
                cmd.Parameters.Add(new SqlParameter("@affiliation", UniAff.SelectedValue));
                cmd.Parameters.Add(new SqlParameter("@affiliationDescription", uni.Text)).IsNullable = true;
                cmd.Parameters.Add(new SqlParameter("@restrictions", eligibility.SelectedValue));
                cmd.Parameters.Add(new SqlParameter("@restrictionsDescription", elig.Text)).IsNullable = true;
                cmd.Parameters.Add(new SqlParameter("@streetAddress", StreetAddress.Text));
                cmd.Parameters.Add(new SqlParameter("@progWebsite", ProgramSite.Text));
                cmd.Parameters.Add(new SqlParameter("@ProgDescription", ProgDes.Text));
                cmd.Parameters.Add(new SqlParameter("@fieldID", findSubjectID));
                cmd.Parameters.Add(new SqlParameter("@gradesID", findGradeID));
                cmd.Parameters.Add(new SqlParameter("@zipcode", ProgramZip.Text));

                //account for nulls
                foreach (SqlParameter parameter in cmd.Parameters)
                {
                    if (parameter.Value.Equals(""))
                    {
                        parameter.Value = DBNull.Value;
                    }
                }

                cmd.ExecuteNonQuery();

                form1.Visible = false;
                form2.Visible = true;

                output.Text = "Program Information Updated Successfully!";

                con.Close();

            }

            catch (Exception err)
            {
                Response.Write("<script>alert(\"" + err.Message + "\");</script>");
                Response.Write(err.Message);
                lblMessage.Text = "Cannot submit information now. Please try again later.";

            }
            finally //must make sure the connection is properly closed
            { //the finally block will always run whether there is an error or not
                con.Close();
            }

        }

        protected void Confirm_Click(object sender, EventArgs e)
        {
            //go back to default page when done
            Response.Redirect("Default.aspx");
        }
    }
}