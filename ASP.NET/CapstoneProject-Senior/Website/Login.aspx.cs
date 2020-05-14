using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//must include this namespace
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net.Mail;

namespace Capstone2nd
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //if not logged in or usertype is user redirect to login
            if (Session["email"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            try
            {
                //check if the email exists, if so, check if matches the pass
                Session["email"] = userName.Text;
                Session["pass"] = password.Text;

                //run search for PM
                string sql = "SELECT COUNT(*) FROM cap.Person WHERE email = @email and password = @pass;";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add(new SqlParameter("@email", Session["email"]));
                cmd.Parameters.Add(new SqlParameter("@pass", Session["pass"]));
                con.Open();

                int thisCount = (int)cmd.ExecuteScalar();
                if (thisCount != 0) //a match in PM
                {
                    //get access level
                    cmd = new SqlCommand("SELECT type FROM cap.Person WHERE email = @email;", con);
                    cmd.Parameters.Add(new SqlParameter("@email", Session["email"]));
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["type"].ToString());
                        Session["userType"] = NewItem;
                    }
                    reader.Close();
               
                    lblMessage.Text = "Login successful! ";
                    Session["sessionStart"] = DateTime.Now.ToString();

                    //update user login time and active
                    cmd = new SqlCommand("UPDATE cap.Person SET lastLogin = @sessionStart, currLoggedIn = 'yes' WHERE email = @email;", con);
                    cmd.Parameters.Add(new SqlParameter("@email", Session["email"]));
                    cmd.Parameters.Add(new SqlParameter("@sessionStart", Session["sessionStart"]));
                    cmd.ExecuteNonQuery();

                    //get first middle and last name
                    cmd = new SqlCommand("SELECT firstName, middleName, lastName FROM cap.Person WHERE email = @email;", con);
                    cmd.Parameters.Add(new SqlParameter("@email", Session["email"]));
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        //get full name
                        ListItem NewItem = new ListItem(reader["firstName"].ToString());
                        Session["firstName"] = NewItem;
                        Session["middleName"] = new ListItem(reader["middleName"].ToString());
                        Session["lastName"] = new ListItem(reader["lastName"].ToString()); ;
                    }

                    //con close and redirect
                    reader.Close();
                    con.Close();
                    Response.Redirect("Default.aspx?fn =" + Session["firstName"] + "&em=" + Session["lastName"], true);
                }
                else
                {
                    Session["email"] = null;
                    Session["pass"] = null;
                    lblMessage.Text = null;
                    lblMessage.Text = "Record doesn't match with our database. Please try again.";
                }
            }
            catch (Exception err)
            {
                lblMessage.Text = null;
                lblMessage.Text = lblMessage.Text + "Cannot submit information now. Please try again later.";
            }
            finally
            { 
                con.Close();
            }
        }
    }
}