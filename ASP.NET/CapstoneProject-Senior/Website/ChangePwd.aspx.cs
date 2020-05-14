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
    public partial class ChangePwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            try
            {
                //check if the email already exist, email must be unique as this is the username
                string emailForm = email.Text.Trim();
                string currPassForm = currPass.Text.Trim();
                string newPassForm = newPass.Text.Trim();

                //run search for a match
                string sql = "SELECT COUNT(*) FROM cap.Person WHERE email = @email and password = @currPass;";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add(new SqlParameter("@email", emailForm));
                cmd.Parameters.Add(new SqlParameter("@currPass", currPassForm));

                con.Open();
                int thisCount1 = (int)cmd.ExecuteScalar();

                if (thisCount1 != 0)
                {
                    sql = "UPDATE cap.Person SET password = @newPass WHERE email =  @email;";
                    cmd = new SqlCommand(sql, con);
                    cmd.Parameters.Add(new SqlParameter("@newPass", newPassForm));
                    cmd.Parameters.Add(new SqlParameter("@email", emailForm));

                    cmd.ExecuteNonQuery();
                    Response.Redirect("Logout.aspx", true);
                }
                else
                {
                    lblMessage.Text = null;
                    lblMessage.Text = "Username or password are incorrect. Please try again.";
                    con.Close();
                }
            }
            catch (Exception err)
            {
                lblMessage.Text = "Cannot submit information now. Please try again later.";
            }
            finally
            {
                con.Close();
            }
        }
    }
}