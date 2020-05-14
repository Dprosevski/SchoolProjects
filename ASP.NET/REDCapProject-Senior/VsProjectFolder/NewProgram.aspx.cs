﻿using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

//must include this namespace

namespace Capstone2nd
{
    public partial class NewProgram : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            form2.Visible = false;

            //prevent unauthorized entry
            if (Session["email"] == null)
            {
                Response.Redirect("login.aspx");
            }

            //connect to the database as soon as the page loads so that security questions can be loaded
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            //always use try/catch for db connections
            try
            {
                //prevent program managers from seeing this page if they are either inactive or unapproved
                SqlCommand cmd = new SqlCommand("SELECT * FROM ProgramManager WHERE email = @username", con);
                cmd.Parameters.Add(new SqlParameter("@username", Session["email"].ToString()));
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    String approved = reader["approved"].ToString();
                    String active = reader["status"].ToString();
                    if (approved == "no" || active == "inactive")
                    {
                        form1.Visible = false;
                        form2.Visible = true;

                        output.Text = "You are not authorized to view this page.";
                    }
                }
                con.Close();

                //get a list of security questions, create list items and add to the drop down list
                //See below using a data access component to replace repetitive codes

                if (!IsPostBack)
                {
                    cmd = new SqlCommand("SELECT * FROM FieldofStudy", con);
                    con.Open();

                    reader = cmd.ExecuteReader();

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
            lbother.Visible = false;
            other.Visible = false;
            lbresidentother.Visible = false;
            residentother.Visible = false;
            stipendlabel1.Visible = false;
            stipendlabel2.Visible = false;
            stipendinput1.Visible = false;
            stipendinput2.Visible = false;
            unilabel.Visible = false;
            uni.Visible = false;
            serviceareaotherlabel.Visible = false;
            serviceareaother.Visible = false;
            lbelig.Visible = false;
            elig.Visible = false;
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            string uname = Session["email"].ToString();

            //establish connection as soon as possible
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            //always use try/catch for db connections
            try
            {
                con.Open();
                SqlCommand cmd;
                int findUserID = 0;

                //find program manager id to associate the program with the correct manager
                if (Session["userType"].ToString() == "ProgramManager")
                {
                    cmd = new SqlCommand("SELECT progManagerID FROM ProgramManager WHERE email = @ManagerEmail;", con);
                    cmd.Parameters.Add(new SqlParameter("@ManagerEmail", uname));
                    findUserID = (int)cmd.ExecuteScalar();
                }

                if (Session["userType"].ToString() == "Admin")
                {
                    cmd = new SqlCommand("SELECT adminID FROM Admin WHERE email = @adminEmail;", con);
                    cmd.Parameters.Add(new SqlParameter("@adminEmail", uname));
                    findUserID = (int)cmd.ExecuteScalar();
                }

                //input contact data while also preventing duplicates
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

                //find value of drop downs. this is important because what's on the form might not line up with database IDS thanks to active/inactive fields
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

                //insert statements
                String sql = "INSERT INTO Program (progManagerID, name, acronym, contactID, progLocID, fieldDescription, resiID, " +
                    "residentalDescription, programCostID, durationID, seasonID, serviceAreaID, serviceAreaDescription, stipendID, stipendEligibility, " +
                    "stipendAmount, startDate, appDeadline, affiliation, affiliationDescription, restrictions, restrictionsDescription, streetAddress, " +
                    "progWebsite, ProgDescription, lastUpdated, fieldID, gradesID, approved, status, zipcode) VALUES" +
                    "(@findUserID, @progname, @acronym, @progContact, @progLocID, @subjectOther, @resident, @residentOther, @cost, " +
                    "@duration, @season, @serviceArea, @serviceOther, @stipend, @stipendElig, @stipendCost, " +
                    "@startdate, @deadline, @uniAff, @affiliation, @restriction, @eligibility, @address, @website, @description, @date, @subject, @grade," +
                    "@approved, @status, @zipcode);";


                cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add(new SqlParameter("@findUserID", findUserID));
                cmd.Parameters.Add(new SqlParameter("@progname", pname.Text));
                cmd.Parameters.Add(new SqlParameter("@acronym", acnym.Text));
                cmd.Parameters.Add(new SqlParameter("@progContact", contactID));
                cmd.Parameters.Add(new SqlParameter("@progLocID", progLocID));
                cmd.Parameters.Add(new SqlParameter("@subjectOther", other.Text)).IsNullable = true;
                cmd.Parameters.Add(new SqlParameter("@resident", findResiID));
                cmd.Parameters.Add(new SqlParameter("@residentOther", residentother.Text)).IsNullable = true;
                cmd.Parameters.Add(new SqlParameter("@cost", findCostID));
                cmd.Parameters.Add(new SqlParameter("@duration", findDurationID));
                cmd.Parameters.Add(new SqlParameter("@season", findSeasonID));
                cmd.Parameters.Add(new SqlParameter("@serviceArea", findServiceAreaID));
                cmd.Parameters.Add(new SqlParameter("@serviceOther", serviceareaother.Text)).IsNullable = true;
                cmd.Parameters.Add(new SqlParameter("@stipend", findStipendID));
                cmd.Parameters.Add(new SqlParameter("@stipendElig", stipendinput1.Text)).IsNullable = true;
                cmd.Parameters.Add(new SqlParameter("@stipendCost", stipendinput2.Text)).IsNullable = true;
                cmd.Parameters.Add(new SqlParameter("@startdate", StartDate.Text));
                cmd.Parameters.Add(new SqlParameter("@deadline", AppDeadline.Text));
                cmd.Parameters.Add(new SqlParameter("@uniAff", UniAff.SelectedValue));
                cmd.Parameters.Add(new SqlParameter("@affiliation", uni.Text)).IsNullable = true;
                cmd.Parameters.Add(new SqlParameter("@restriction", eligibility.SelectedValue));
                cmd.Parameters.Add(new SqlParameter("@eligibility", elig.Text)).IsNullable = true;
                cmd.Parameters.Add(new SqlParameter("@address", StreetAddress.Text));
                cmd.Parameters.Add(new SqlParameter("@website", ProgramSite.Text));
                cmd.Parameters.Add(new SqlParameter("@description", ProgDes.Text));
                cmd.Parameters.Add(new SqlParameter("@date", TextBox1.Text));
                cmd.Parameters.Add(new SqlParameter("@subject", findSubjectID));
                cmd.Parameters.Add(new SqlParameter("@grade", findGradeID));
                cmd.Parameters.Add(new SqlParameter("@approved", "unapproved"));
                cmd.Parameters.Add(new SqlParameter("@status", "active"));
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

                output.Text = "Program Information Submitted Successfully!";

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
            Response.Redirect("Default.aspx");
        }

        protected void list_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (subject.Text == "Other")
            {   //If Program Manager is selected prompt role field and label
                lbother.Visible = true;
                other.Visible = true;
            }

            if (Progdescription.Text == "Yes, for some students")
            {   //If Program Manager is selected prompt role field and label
                lbresidentother.Visible = true;
                residentother.Visible = true;
            }

            if (stipendlist.Text == "Some participants receive a stipend")
            {   //If Program Manager is selected prompt role field and label
                stipendlabel1.Visible = true;
                stipendlabel2.Visible = true;
                stipendinput1.Visible = true;
                stipendinput2.Visible = true;
            }

            if (stipendlist.Text == "All participants receive a stipend")
            {   //If Program Manager is selected prompt role field and label
                stipendlabel2.Visible = true;
                stipendinput2.Visible = true;
            }

            if (UniAff.Text == "Yes")
            {   //If Program Manager is selected prompt role field and label
                unilabel.Visible = true;
                uni.Visible = true;
            }

            if (eligibility.Text == "Yes")
            {   //If Program Manager is selected prompt role field and label
                lbelig.Visible = true;
                elig.Visible = true;
            }

            if (ServiceArea.Text == "Other")
            {   //If Program Manager is selected prompt role field and label
                serviceareaother.Visible = true;
                serviceareaotherlabel.Visible = true;
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
    }
}