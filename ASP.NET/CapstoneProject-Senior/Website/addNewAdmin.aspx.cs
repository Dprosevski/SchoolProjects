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
    public partial class addNewAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            form2.Visible = false;
            //if not logged in or usertype is user redirect to login
            if (Session["email"] == null || Session["userType"].ToString() == "user")
            {
                Response.Redirect("Login.aspx");
            }


            if (Session["userType"].ToString() == "admin")
            {
                Response.Redirect("AdminPage.aspx");
            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            //variables
            Session["prefixRegForm"] = prefix.Text;
            Session["firstRegForm"] = first.Text;
            Session["middleRegForm"] = middle.Text;
            Session["lastRegForm"] = last.Text;
            Session["sufixRegForm"] = sufix.Text;
            Session["emailRegForm"] = email.Text;
            Session["passRegForm"] = password.Text;
            Session["altEmailRegForm"] = altEmail.Text;
            Session["altPassRegForm"] = altPass.Text;
            Session["genderRegForm"] = radioGender.Text;
            Session["dobRegForm"] = dob.Text;
            Session["phoneRegForm"] = phone.Text.Replace("(", "").Replace(")", "").Replace("-", "");
            Session["addressRegForm"] = address.Text;
            Session["heightFtRegForm"] = heightFt.Text;
            Session["heightInRegForm"] = heightIn.Text;
            Session["weightRegForm"] = weight.Text;
            Session["bloodTypeRegForm"] = bloodType.Text;
            Session["allergiesRegForm"] = allergies.Text;

            if (Page.IsValid)
            {
                form1.Visible = false;
                form2.Visible = true;
                output.Text =
                    "Prefix: " + Session["prefixRegForm"] +
                    "<br />First name: " + Session["firstRegForm"] +
                    "<br />Middle name: " + Session["middleRegForm"] +
                    "<br />Last name: " + Session["lastRegForm"] +
                    "<br />Sufix: " + Session["sufixRegForm"] +
                    "<br />Email: " + Session["emailRegForm"] +
                    "<br />Alternative Email: " + Session["altEmailRegForm"] +
                    "<br />Phone: " + Session["phoneRegForm"] +
                    "<br />Address: " + Session["addressRegForm"] +
                    "<br />Date of Birth: " + Session["dobRegForm"] +
                    "<br />Gender: " + Session["genderRegForm"] +
                    "<br />Height (Ft): " + Session["heightFtRegForm"] +
                    "<br />Height (In): " + Session["heightInRegForm"] +
                    "<br />Weight (Ib): " + Session["weightRegForm"] +
                    "<br />Blood Type: " + Session["bloodTypeRegForm"] +
                    "<br />Allergies: " + Session["allergiesRegForm"] +
                    "<br />Terms accepted.";
            }


            //SQL
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            string sql; //statemenet to to manipulate
            SqlConnection con = new SqlConnection(cs);
            sql = "";
            SqlCommand cmd = new SqlCommand(sql, con);

            try
            {
                //check if the email already exist, email must be unique as this is the username
                con.Open();

                //check for cap.Person
                sql = "SELECT COUNT(*) FROM cap.Person WHERE email=@email;";
                cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add(new SqlParameter("@email", Session["emailRegForm"]));

                int count = (int)cmd.ExecuteScalar();
                if (count != 0)
                {//email already exisits
                    form2.Visible = false;
                    form1.Visible = true;
                    lblMessage.Text = "The email you entered already exists in the database. Please try a different email address.";
                }

                else
                {
                    form1.Visible = false;
                    form2.Visible = true;
                }
            }
            catch (Exception err)
            {
                form2.Visible = false;
                form1.Visible = true;
                lblMessage.Text = null;
                lblMessage.Text = "Cannot submit information now. Please try again later.";
                con.Close();
            }
            finally
            {
                con.Close();
            }
        }

        protected void Confirm_Click(object sender, EventArgs e)
        {
            //SQL
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            string sql; //statemenet to to manipulate
            SqlConnection con = new SqlConnection(cs);
            sql = "";
            SqlCommand cmd = new SqlCommand(sql, con);

            //variables
            string currentTime = DateTime.Now.ToString(); //for register date
            string strCodeForm = rndGenString();

            try
            {
                //check if the email already exist, email must be unique as this is the username
                con.Open();
                sql = "INSERT INTO  cap.Person ([type], [email], [password], [prefix], [firstName], [middleName], [lastName], [sufix], [gender], [DOB]," +
                    "[altEmail], [altPassword], [phone], [address], [registerDate], [approved], [currLoggedIN], [rndCode]," +
                    " [heightFt], [heightIn], [weight], [bloodType], [allergies])" +
                        "values('admin', @email, @password, @prefix, @first, @middle, @last, @sufix, @gender, @dob, @altEmail, @altPassword," +
                        "@phone, @address, @currentTime, 'no', 'no', @strCodeForm, @heightFt, @heightIn, @weight, @bloodType, @allergies);";
                cmd = new SqlCommand(sql, con);

                cmd.Parameters.Add(new SqlParameter("@email", Session["emailRegForm"]));
                cmd.Parameters.Add(new SqlParameter("@password", Session["passRegForm"]));
                cmd.Parameters.Add(new SqlParameter("@prefix", Session["prefixRegForm"]));
                cmd.Parameters.Add(new SqlParameter("@first", Session["firstRegForm"]));
                cmd.Parameters.Add(new SqlParameter("@middle", Session["middleRegForm"]));
                cmd.Parameters.Add(new SqlParameter("@last", Session["lastRegForm"]));
                cmd.Parameters.Add(new SqlParameter("@sufix", Session["sufixRegForm"]));
                cmd.Parameters.Add(new SqlParameter("@gender", Session["genderRegForm"]));
                cmd.Parameters.Add(new SqlParameter("@dob", Session["dobRegForm"]));
                cmd.Parameters.Add(new SqlParameter("@altEmail", Session["altEmailRegForm"]));
                cmd.Parameters.Add(new SqlParameter("@altPassword", Session["altPassRegForm"]));
                cmd.Parameters.Add(new SqlParameter("@phone", Session["phoneRegForm"]));
                cmd.Parameters.Add(new SqlParameter("@address", Session["addressRegForm"]));
                cmd.Parameters.Add(new SqlParameter("@currentTime", currentTime));
                cmd.Parameters.Add(new SqlParameter("@strCodeForm", strCodeForm));
                cmd.Parameters.Add(new SqlParameter("@heightFt", Session["heightFtRegForm"]));
                cmd.Parameters.Add(new SqlParameter("@heightIn", Session["heightInRegForm"]));
                cmd.Parameters.Add(new SqlParameter("@weight", Session["weightRegForm"]));
                cmd.Parameters.Add(new SqlParameter("@bloodType", Session["bloodTypeRegForm"]));
                cmd.Parameters.Add(new SqlParameter("@allergies", Session["allergiesRegForm"]));

                cmd.ExecuteNonQuery();
                con.Close();
                Session["message"] = "Admin Successfuly created";
                Response.Redirect("AdminPage.aspx", true);
            }
            catch (Exception err)
            {
                form2.Visible = false;
                form1.Visible = true;
                lblMessage.Text = null;
                lblMessage.Text = "Cannot submit information now. Please try again later.";
                con.Close();
            }
            finally
            {
                con.Close();
            }
        }

        protected string rndGenString()
        {
            int length = 50;
            char letter;

            Random random = new Random();
            string myStr = "";
            for (int i = 0; i < length; i++)
            {
                double flt = random.NextDouble();
                int shift = Convert.ToInt32(Math.Floor(25 * flt));
                letter = Convert.ToChar(shift + 65);
                myStr = myStr + letter;
            }
            return myStr;
        }
    }
}
