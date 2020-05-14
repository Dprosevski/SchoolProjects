using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone2nd
{
    public partial class Navbar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null) //if user is not logged in
            {
                adminPageID.Visible = false;
                loginID.Visible = true;
                logoutID.Visible = false;
                changePwdID.Visible = false;
                updateID.Visible = false;
                editProfileID.Visible = false;
            }
            else //if user is logged in
            {
                if (Session["userType"].ToString() == "admin" || Session["userType"].ToString() == "super")
                {
                    adminPageID.Visible = true;
                }
                if (Session["userType"].ToString() == "user")
                {
                    adminPageID.Visible = false;
                }
                loginID.Visible = false;
                logoutID.Visible = true;
                changePwdID.Visible = true;
            }
        }
    }
}