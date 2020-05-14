using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//must include this namespace
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Capstone2nd
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if not logged in
            if (Session["email"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            //if regular user
            if (Session["userType"].ToString() == "user")
            {
                Response.Redirect("Default.aspx");
            }

            //if super admin
            if (Session["userType"].ToString() == "super")
            {
                //options for admin modification
                addNewAdminID.Visible = true;
                lblAdminList.Visible = true;
                pnlAdmin.Visible = true;
            }

            if (Session["message"] != null)
            {
                lblMessage.ForeColor = System.Drawing.Color.Blue;
                lblMessage.Text = Session["message"].ToString();
                Session["message"] = null;
            }

            if (!IsPostBack)
            {
                //SQL
                string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
                string sql; //statemenet to to manipulate
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd;
                //for admin
                sql = "SELECT email FROM cap.Person WHERE type = 'admin';";
                con.Open();

                adminList.Items.Clear();
                using (cmd = new SqlCommand(sql, con))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ListItem newItem = new ListItem(reader["email"].ToString());
                            adminList.Items.Add(newItem);
                        }
                    }
                }


                //for user
                sql = "SELECT email FROM cap.Person WHERE type = 'user';";

                userList.Items.Clear();
                using (cmd = new SqlCommand(sql, con))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ListItem newItem = new ListItem(reader["email"].ToString());
                            userList.Items.Add(newItem);
                        }
                    }
                }
                con.Close();
            }
        }


        protected void editAdminID_Click(object sender, EventArgs e)
        {
            Session["adminToEdit"] = adminList.SelectedItem.Text;
            Response.Redirect("EditAdmin.aspx");
        }

        protected void editUserID_Click(object sender, EventArgs e)
        {
            Session["userToEdit"] = userList.SelectedItem.Text;
            Response.Redirect("EditUser.aspx");
        }
    }
}