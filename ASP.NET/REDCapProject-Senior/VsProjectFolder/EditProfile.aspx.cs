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
    public partial class EditProfile : System.Web.UI.Page
    {
        string cs;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("login.aspx");
            }

            cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            con = new SqlConnection(cs);

            try
            {
                SqlCommand cmd3 = new SqlCommand("SELECT * FROM " + Session["userType"] + " WHERE email = '" + Session["email"] + "';", con);
                con.Open();
                SqlDataReader reader = cmd3.ExecuteReader();

                if (!IsPostBack)
                {
                    while (reader.Read())
                    {
                        Phone_Number.Text = new ListItem(reader["phone"].ToString()).ToString();

                        First_Name.Text = new ListItem(reader["firstName"].ToString()).ToString();
                        middleName.Text = new ListItem(reader["middleName"].ToString()).ToString();
                        Last_Name.Text = new ListItem(reader["lastName"].ToString()).ToString();

                        altEmail.Text = new ListItem(reader["altEmail"].ToString()).ToString();
                    }
                }
                reader.Close();
            }
            catch (Exception wrong)
            {

            }

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                //check if the email already exist, email must be unique as this is the username
                string currPassForm = currPass.Text;
                string newPassForm = newPass.Text;
                string FirstNameForm = First_Name.Text;
                string MiddleNameForm = middleName.Text;
                string LastNameForm = Last_Name.Text;
                string altEmailForm = altEmail.Text;
                string PhoneForm = Phone_Number.Text;


                //run search for a match
                string sql = "SELECT COUNT(*) FROM " + Session["userType"] + " WHERE email = '" + Session["email"] + "' and password = '" + currPassForm + "'";
                SqlCommand cmd = new SqlCommand(sql, con);
                int thisCount1 = (int)cmd.ExecuteScalar();

                if (thisCount1 != 0)
                {

                    sql = "UPDATE " + Session["userType"] + " SET password = @password, firstName = @firstName, middleName = @middleName, lastName = @lastName, altEmail = @altemail, phone= @phone WHERE email = @email;";
                    SqlCommand cmd1 = new SqlCommand(sql, con);
                    //cmd1.Parameters.Add(new SqlParameter("@user", Session["userType"]));
                    cmd1.Parameters.Add(new SqlParameter("@firstName", FirstNameForm));
                    cmd1.Parameters.Add(new SqlParameter("@middleName", MiddleNameForm));
                    cmd1.Parameters.Add(new SqlParameter("@lastName", LastNameForm));

                    cmd1.Parameters.Add(new SqlParameter("@password", newPassForm));
                    cmd1.Parameters.Add(new SqlParameter("@phone", PhoneForm.Replace("+", "").Replace(" ", "").Replace("(", "").Replace(")", "").Replace("-", "")));

                    cmd1.Parameters.Add(new SqlParameter("@altemail", altEmailForm));
                    cmd1.Parameters.Add(new SqlParameter("@email", Session["email"]));
                    cmd1.ExecuteNonQuery();

                }
                else
                {
                    lblMessage.Text = "Username or password are incorrect. Please try again.";
                    con.Close();
                }
            }
            catch (Exception err)
            {
                lblMessage.Text = err.ToString();

            }
            finally //must make sure the connection is properly closed
            { //the finally block will always run whether there is an error or not
                con.Close();
                Session["message"] = "Changes successfully applied!";
                Response.Redirect("Logout.aspx", true);
            }
        }
    }
}