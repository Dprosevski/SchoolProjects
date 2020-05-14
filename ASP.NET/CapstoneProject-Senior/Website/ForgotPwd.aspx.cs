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
    public partial class ForgotPwd : System.Web.UI.Page
    {
        string cs;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            con = new SqlConnection(cs);
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                //check if the email already exist, email must be unique as this is the username
                string emailForm = email.Text.Trim();

                string sql = "SELECT COUNT(*) FROM cap.Person WHERE email = @email;";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add(new SqlParameter("@email", emailForm));
                con.Open();
                int count = (int)cmd.ExecuteScalar();

                //if success
                if (count != 0)
                {
                    lblMessage.Text = "A confirmation link is sent to your email address!";
                    //send email
                }
                else
                {
                    lblMessage.Text = "Email does not exist. Please try again.";
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