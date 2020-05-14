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
    public partial class EditProgram : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //prevent unauthorized entry into page
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

                if (!IsPostBack)
                {
                    con.Open();
                    if (Session["userType"].ToString() == "ProgramManager")
                    {
                        //prevent program managers from seeing this page if they are either inactive or unapproved
                        SqlCommand cmd = new SqlCommand("SELECT * FROM ProgramManager WHERE email = @username", con);
                        cmd.Parameters.Add(new SqlParameter("@username", Session["email"].ToString()));

                        SqlDataReader reader = cmd.ExecuteReader();

                        String approved = "";
                        String active = "";
                        while (reader.Read())
                        {
                            approved = reader["approved"].ToString();
                            active = reader["status"].ToString();
                        }
                        reader.Close();

                        if (approved == "no" || active == "inactive")
                        {
                            ProgDescription.Visible = false;
                            ProgList.Visible = false;
                            lblApproved.Visible = false;
                            lblSubmit.Visible = false;
                            BtnSubmit.Visible = false;

                            lblMessage.Text = "You are not authorized to view this page.";
                        }
                        else
                        {
                            //autofill programs that the specific manager has submitted
                            cmd = new SqlCommand("SELECT progManagerID FROM ProgramManager WHERE email = @ManagerEmail;", con);
                            cmd.Parameters.Add(new SqlParameter("@ManagerEmail", Session["email"]));
                            int findUserID = (int)cmd.ExecuteScalar();

                            cmd = new SqlCommand("SELECT name FROM Program WHERE progManagerID = @manager", con);
                            cmd.Parameters.Add(new SqlParameter("@manager", findUserID));

                            reader = cmd.ExecuteReader();
                            ProgList.Items.Clear();
                            while (reader.Read())
                            {
                                ListItem NewItem = new ListItem(reader["name"].ToString());
                                ProgList.Items.Add(NewItem);
                            }
                            reader.Close();
                        }
                    }

                    if (Session["userType"].ToString() == "Admin")
                    {
                        //admin should see all programs
                        SqlCommand cmd = new SqlCommand("SELECT name FROM Program", con);

                        SqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            ListItem NewItem = new ListItem(reader["name"].ToString());
                            ProgList.Items.Add(NewItem);
                        }
                        reader.Close();
                    }
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

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            //this info will need to be carried over so that program can be edited
            String uname = Session["email"].ToString();

            Session["programToEdit"] = ProgList.SelectedValue;
            Session["email"] = uname;
            Response.Redirect("EditProgram1.aspx");
        }

        protected void ProgList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            //always use try/catch for db connections
            try
            {
                //find approval status
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT approved FROM Program WHERE name = @ProgList", con);
                cmd.Parameters.Add(new SqlParameter("@ProgList", ProgList.SelectedValue.ToString()));
                string approved = "";
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    ListItem NewItem = new ListItem(reader["approved"].ToString());
                    approved = NewItem.ToString();
                }

                //if a program is unapproved, the user should get a message saying that they will get a message once the program has been approved. otherwise just display status
                if (approved == "unapproved")
                {
                    lblApproved.Text = "Currently: " + approved + "\n You will receive a message once your program has been approved.";
                }
                else
                {
                    lblApproved.Text = "Currently: " + approved;
                }
                reader.Close();

                //set last updated
                string currentTime = DateTime.Now.ToString();
                cmd = new SqlCommand("UPDATE Program SET lastUpdated = @lastUpdated WHERE name = @ProgList", con);
                cmd.Parameters.Add(new SqlParameter("@ProgList", ProgList.SelectedValue.ToString()));
                cmd.Parameters.Add(new SqlParameter("@lastUpdated", currentTime));
                cmd.ExecuteNonQuery();
            }


            catch (Exception err)
            {
                Response.Write("<script>alert(\"" + err.Message + "\");</script>");
                Response.Write(err.Message);
                lblMessage.Text = "Cannot submit information now. Please try again later.";

            }
            finally
            {
                con.Close();
            }
        }
    }
}