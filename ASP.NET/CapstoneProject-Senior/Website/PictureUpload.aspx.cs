using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

//must include this namespace
using System.Data.SqlClient;
using System.Web.Configuration;


namespace Capstone2nd
{
    public partial class PictureUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if not logged in
            if (Session["email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }


        protected void UploadButton_Click(object sender, EventArgs e)
        {
            lblMessage.Text = null;
            if (imgUploadID.HasFile == false)
            {
                lblUploadDetails.Text = "Please first select a file to upload.";
            }
            else
            {
                string FileName = imgUploadID.FileName;
                string extension = System.IO.Path.GetExtension(imgUploadID.FileName);

                if (extension == ".JPG" || extension == ".JPEG" || extension == ".PNG" || extension == ".jpg" || extension == ".jpeg" || extension == ".png")
                {
                    lblUploadDetails.Text = string.Format(
                          @"Uploaded file: {0}<br />
                          File size (in bytes): {1:N0}<br />
                          Content-type: {2}",
                              FileName,
                              imgUploadID.FileBytes.Length,
                              imgUploadID.PostedFile.ContentType);

                    // Save the file on the local server
                    string filePath = Server.MapPath("~/ConsumablesUploads/" + imgUploadID.FileName);
                    imgUploadID.SaveAs(filePath);


                    //SQL
                    string cs = WebConfigurationManager.ConnectionStrings["localConnection"].ConnectionString;
                    string sql; //statemenet to to manipulate
                    SqlConnection con = new SqlConnection(cs);
                    sql = "";
                    SqlCommand cmd = new SqlCommand(sql, con);

                    try
                    {
                        HttpPostedFile postedFile = imgUploadID.PostedFile;
                        string filename = Path.GetFileName(postedFile.FileName);
                        string fileExtension = Path.GetExtension(filename);
                        int fileSize = postedFile.ContentLength;


                        Stream stream = postedFile.InputStream;
                        BinaryReader binaryReader = new BinaryReader(stream);
                        Byte[] imgBytes = binaryReader.ReadBytes((int)stream.Length);


                        /* if needed extra information
                         cmd = new SqlCommand("spUploadImage", con);
                         cmd.CommandType = CommandType.StoredProcedure;

                         cmd.Parameters.Add(new SqlParameter("@Name", filename));
                         cmd.Parameters.Add(new SqlParameter("@Size", fileSize));

                         cmd.Parameters.Add(new SqlParameter("@NewId", -1));*/


                        sql = "UPDATE cap.Person SET imgData = @imgData WHERE email = @email;";
                        cmd = new SqlCommand(sql, con);
                        cmd.Parameters.Add(new SqlParameter("@imgData", imgBytes));
                        cmd.Parameters.Add(new SqlParameter("@email", Session["email"]));
                        con.Open();
                        cmd.ExecuteNonQuery();

                        lblMessage.Text = null;
                        lblMessage.ForeColor = System.Drawing.Color.Blue;
                        lblMessage.Text = "Upload Successful";
                    }
                    catch (Exception err)
                    {
                        lblMessage.Text = null;
                        lblMessage.Text = "Cannot submit information now. Please try again later.";
                        con.Close();
                    }
                    finally
                    {
                        con.Close();
                    }
                }
                else
                {
                    lblMessage.Text = null;
                    lblMessage.Text = "Only .jpg .jpeg .png .gif .tiff allowed";
                }
            }
        } //end upload button click
    }
}