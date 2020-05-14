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
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if not logged in
            if (Session["email"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            //update status to not active
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE cap.Person SET lastLogin = @sessionStart, currLoggedIn = 'no' WHERE email = @email;", con);
            cmd.Parameters.Add(new SqlParameter("@sessionStart", Session["sessionStart"]));
            cmd.Parameters.Add(new SqlParameter("@email", Session["email"]));
            cmd.ExecuteNonQuery();

            //clear session close and redirect
            Session.Abandon();
            con.Close();
            Response.Redirect("Login.aspx");
        }
    }
}