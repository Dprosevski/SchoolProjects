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
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if not logged in
             if (Session["email"] == null)
             {
                 Response.Redirect("Login.aspx");
             }

            form2.Visible = false;
            //reset variables
            if (!IsPostBack)
            {
                lblMessage.Text = null;
                lblPushActMsg = null;
                lblPushConsMsg = null;
                Session["inputCons"] = "";
                Session["inputAct"] = "";
            }

            //SQL
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            //fill in consumables
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT name FROM cap.Consumables;", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (!IsPostBack)
                {
                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["name"].ToString());
                        consNameID.Items.Add(NewItem);
                    }
                    reader.Close();
                }
                con.Close();
            }
            catch (Exception err)
            {
                lblMessage.Text = null;
                lblMessage.Text = "Cannot submit information now. Please try again later.";
            }
            finally
            {
                con.Close();
            }

            //fill in activities
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT name FROM cap.Activities;", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (!IsPostBack)
                {
                    while (reader.Read())
                    {
                        ListItem NewItem = new ListItem(reader["name"].ToString());
                        actNameID.Items.Add(NewItem);
                    }
                    reader.Close();
                }
                con.Close();
            }
            catch (Exception err)
            {
                lblMessage.Text = null;
                lblMessage.Text = "Cannot submit information now. Please try again later.";
            }
            finally
            {
                con.Close();
            }
        }


        protected void pushConsID_Click(object sender, EventArgs e)
        {
            if (consAmountID.Text != "")
            {
                Session["inputCons"] += consNameID.Text + ", " + consAmountID.Text + ", ";
                lblPushConsMsg.Text = Session["inputCons"].ToString();
                BtnSubmit.Visible = true;
                lblMessage.Text = null;
            }
            else
            {
                lblMessage.Text = null;
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Consumed amount is required.";
            }
        }


        protected void pushActID_Click(object sender, EventArgs e)
        {
            if (actTimeID.Text != "")
            {
                Session["inputAct"] += actNameID.Text + ", " + actTimeID.Text + ", ";
                lblPushActMsg.Text = Session["inputAct"].ToString();
                BtnSubmit.Visible = true;
                lblMessage.Text = null;
            }
            else
            {
                lblMessage.Text = null;
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Activity time is required.";
            }
        }


        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                form1.Visible = false;
                output.Text = "Consumed: " + Session["inputCons"].ToString()
                    + "<br />Activities: " + Session["inputAct"].ToString();
                form2.Visible = true;
            }
        }


        protected void Confirm_Click(object sender, EventArgs e)
        {
            //SQL
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd;

            try
            {
                form1.Visible = false;
                form2.Visible = true;

                con.Open();
                cmd = new SqlCommand("UPDATE cap.Person SET  inputCons = @inputCons WHERE email = @email;", con);
                cmd.Parameters.Add(new SqlParameter("@email", Session["email"]));
                cmd.Parameters.Add(new SqlParameter("@inputCons", Session["inputCons"]));
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE cap.Person SET  inputAct = @inputAct WHERE email = @email;", con);
                cmd.Parameters.Add(new SqlParameter("@email", Session["email"]));
                cmd.Parameters.Add(new SqlParameter("@inputAct", Session["inputAct"]));
                cmd.ExecuteNonQuery();

                con.Close();
            }
            catch (Exception err)
            {
                lblMessage.Text = null;
                lblMessage.Text = "Cannot submit information now. Please try again later.";
            }
            finally
            {
                lblMessage.Text = null;
                lblMessage.ForeColor = System.Drawing.Color.Blue;
                lblMessage.Text = "Information updated successfully!";
                Session["inputAct"] = null;
                Session["inputCons"] = null;
                lblPushActMsg.Text = null;
                lblPushConsMsg.Text = null;
                form2.Visible = false;
                form1.Visible = true;
                con.Close();
            }
        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("Update.aspx");
        }
    }//partial class
}//namespace