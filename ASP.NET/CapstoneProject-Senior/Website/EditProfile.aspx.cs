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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            form2.Visible = false;

            //variables
            string prefixCurr = "";
            string firstNameCurr = "";
            string middleNameCurr = "";
            string lastNameCurr = "";
            string sufixCurr = "";
            string altEmailCurr = "";
            string altPasswordCurr = "";
            string phoneCurr = "";
            string addressCurr = "";
            string genderCurr = "";
            string dobCurr = "";
            string typeCurr = "";
            string parentPassCurr = "";
            string heighFtCurr = "";
            string heightInCurr = "";
            string weightCurr = "";
            string bloodTypeCurr = "";
            string allergiesCurr = "";

            //SQL
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM cap.Person WHERE email = @email;", con);
            cmd.Parameters.Add(new SqlParameter("@email", Session["email"]));
            SqlDataReader reader = cmd.ExecuteReader();

            if (!IsPostBack)
            {
                while (reader.Read())
                {
                    ListItem NewItem = new ListItem(reader["type"].ToString());
                    typeCurr = NewItem.ToString();
                    prefixCurr = new ListItem(reader["prefix"].ToString()).ToString();
                    firstNameCurr = new ListItem(reader["firstName"].ToString()).ToString();
                    middleNameCurr = new ListItem(reader["middleName"].ToString()).ToString();
                    lastNameCurr = new ListItem(reader["lastName"].ToString()).ToString();
                    sufixCurr = new ListItem(reader["sufix"].ToString()).ToString();
                    altEmailCurr = new ListItem(reader["altEmail"].ToString()).ToString();
                    altPasswordCurr = new ListItem(reader["altPassword"].ToString()).ToString();
                    genderCurr = new ListItem(reader["gender"].ToString()).ToString();
                    dobCurr = new ListItem(reader["DOB"].ToString()).ToString();
                    phoneCurr = new ListItem(reader["phone"].ToString()).ToString();
                    addressCurr = new ListItem(reader["address"].ToString()).ToString();
                    parentPassCurr = new ListItem(reader["parentPassword"].ToString()).ToString();
                    heighFtCurr = new ListItem(reader["heightFt"].ToString()).ToString();
                    heightInCurr = new ListItem(reader["heightIn"].ToString()).ToString();
                    weightCurr = new ListItem(reader["weight"].ToString()).ToString();
                    bloodTypeCurr = new ListItem(reader["bloodType"].ToString()).ToString();
                    allergiesCurr = new ListItem(reader["allergies"].ToString()).ToString();
                }
                reader.Close();
                con.Close();

                //if user is an admin
                if (typeCurr == "admin")
                {
                    Session["message"] = "The user is an admin.";
                    Response.Redirect("AdminPage.aspx");
                }

                //if email not found
                if (firstNameCurr == "")
                {
                    Session["message"] = "Email not found, try a different one.";
                    Response.Redirect("AdminPage.aspx");
                }

                //populate fields
                prefix.Text = prefixCurr;
                first.Text = firstNameCurr;
                middle.Text = middleNameCurr;
                last.Text = lastNameCurr;
                sufix.Text = sufixCurr;
                altEmail.Text = altEmailCurr;
                altPass.Text = altPasswordCurr;
                phone.Text = phoneCurr;
                address.Text = addressCurr;
                radioGender.Text = genderCurr;
                dob.Text = dobCurr;
                parentPass.Text = parentPassCurr;
                heightFt.Text = heighFtCurr;
                heightIn.Text = heightInCurr;
                weight.Text = weightCurr;
                bloodType.Text = bloodTypeCurr;
                allergies.Text = allergiesCurr;
            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            Session["emailAltPass"] = altPass.Text;
            Session["emailParentPass"] = parentPass.Text;

            if (Page.IsValid)
            {
                form1.Visible = false;
                output.Text =
                    "Prefix: " + prefix.Text +
                    "<br />First name: " + first.Text +
                    "<br />Middle name: " + middle.Text +
                    "<br />Last name: " + last.Text +
                    "<br />Sufix: " + sufix.Text +
                    "<br />Alternative Email: " + altEmail.Text +
                    "<br />Phone: " + phone.Text +
                    "<br />Address: " + address.Text +
                    "<br />Date of Birth: " + dob.Text +
                    "<br />Gender: " + radioGender.Text +
                    "<br />Height (Ft): " + heightFt.Text +
                    "<br />Height (In): " + heightIn.Text +
                    "<br />Weight (Ib): " + weight.Text +
                    "<br />Blood Type: " + bloodType.Text +
                    "<br />Allergies: " + allergies.Text +
                    "<br />Terms accepted.";
                form2.Visible = true;
            }
        }

        protected void Confirm_Click(object sender, EventArgs e)
        {
            //variables
            string emailCurr = Session["email"].ToString();
            string prefixForm = prefix.Text;
            string firstNameForm = first.Text;
            string middleNameForm = middle.Text;
            string lastNameForm = last.Text;
            string sufixForm = sufix.Text;
            string altEmailForm = altEmail.Text;
            string altPassForm = Session["emailAltPass"].ToString();
            string phoneForm = phone.Text;
            string addressForm = address.Text;
            string genderForm = radioGender.Text;
            string dobForm = dob.Text;
            string parentPassForm = Session["emailParentPass"].ToString();
            string heighFtForm = heightFt.Text;
            string heightInForm = heightIn.Text;
            string weightForm = weight.Text;
            string bloodTypeForm = bloodType.Text;
            string allergiesForm = allergies.Text;

            //SQL
            string sql; //statemenet to to manipulate
            string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            //always use try/catch for db connecitons
            try
            {
                form1.Visible = false;
                form2.Visible = true;

                con.Open();
                sql = "UPDATE cap.Person SET prefix = @prefix, firstName = @firstName, middleName = @middleName, lastName = @lastName, " +
                    "sufix = @sufix, altEmail = @altEmail, altPassword = @altPassword, phone = @phone," +
                    "address = @address, gender = @gender, DOB = @dob, parentPassword = @parentPass, heightFt = @heightFt, heightIn = @heightIn, " +
                    "weight = @weight, bloodType = @bloodType, allergies = @allergies WHERE email = @email;";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add(new SqlParameter("@prefix", prefixForm));
                cmd.Parameters.Add(new SqlParameter("@firstName", firstNameForm));
                cmd.Parameters.Add(new SqlParameter("@middleName", middleNameForm));
                cmd.Parameters.Add(new SqlParameter("@lastName", lastNameForm));
                cmd.Parameters.Add(new SqlParameter("@sufix", sufixForm));
                cmd.Parameters.Add(new SqlParameter("@altEmail", altEmailForm));
                cmd.Parameters.Add(new SqlParameter("@altPassword", altPassForm));
                cmd.Parameters.Add(new SqlParameter("@phone", phoneForm.Replace("+", "").Replace(" ", "").Replace("(", "").Replace(")", "").Replace("-", "")));
                cmd.Parameters.Add(new SqlParameter("@address", addressForm));
                cmd.Parameters.Add(new SqlParameter("@gender", genderForm));
                cmd.Parameters.Add(new SqlParameter("@dob", dobForm));
                cmd.Parameters.Add(new SqlParameter("@email", emailCurr));
                cmd.Parameters.Add(new SqlParameter("@parentPass", parentPassForm));
                cmd.Parameters.Add(new SqlParameter("@heightFt", heighFtForm));
                cmd.Parameters.Add(new SqlParameter("@heightIn", heightInForm));
                cmd.Parameters.Add(new SqlParameter("@weight", weightForm));
                cmd.Parameters.Add(new SqlParameter("@bloodType", bloodTypeForm));
                cmd.Parameters.Add(new SqlParameter("@allergies", allergiesForm));

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
                con.Close();
            }
            Session["message"] = "Changes successfully applied!";
            Response.Redirect("AdminPage.aspx?UserEdited", true);
        }
    }
}