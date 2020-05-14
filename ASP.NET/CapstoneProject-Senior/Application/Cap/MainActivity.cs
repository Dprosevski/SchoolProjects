using Android;
using Android.App;
using Android.Graphics;
using Android.OS;
using Android.Runtime;
using Android.Support.V7.App;
using Android.Widget;
using Plugin.Media;
using System;
using System.Data.SqlClient;

namespace Cap
{
    [Activity(Label = "@string/app_name", Theme = "@style/AppTheme", MainLauncher = true)]
    public class MainActivity : AppCompatActivity
    {
        Button captureButton;
        Button uploadButton;

        ImageView theImageView;

        readonly string[] permissionGroup =
        {
            Manifest.Permission.ReadExternalStorage,
            Manifest.Permission.WriteExternalStorage,
            Manifest.Permission.Camera
        };
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.activity_main);

            captureButton = (Button)FindViewById(Resource.Id.captureButton);
            uploadButton = (Button)FindViewById(Resource.Id.uploadButton);

            theImageView = (ImageView)FindViewById(Resource.Id.theImageView);


            captureButton.Click += CaptureButton_Click;
            uploadButton.Click += UploadButton_Click;

            RequestPermissions(permissionGroup, 0);

        }

        private void UploadButton_Click(object sender, EventArgs e)
        {
            UploadPhoto();
        }

        async void UploadPhoto()
        {
            await CrossMedia.Current.Initialize();

            if (!CrossMedia.Current.IsPickPhotoSupported)
            {
                Toast.MakeText(this, "Upload is not supported", ToastLength.Short).Show();
                return;
            }

            var file = await CrossMedia.Current.PickPhotoAsync(new Plugin.Media.Abstractions.PickMediaOptions
            {
                PhotoSize = Plugin.Media.Abstractions.PhotoSize.Full,
                CompressionQuality = 40
            });

            byte[] imageArray = System.IO.File.ReadAllBytes(file.Path);
            Android.Graphics.Bitmap bitmap = BitmapFactory.DecodeByteArray(imageArray, 0, imageArray.Length);
            theImageView.SetImageBitmap(bitmap);

            string cs = @"Data Source=in-csci-aspnet.ads.iu.edu\SQL2017,11433;Initial Catalog=dprosev;User ID=dprosev;Password=d9130pro";

            SqlConnection con = new SqlConnection(cs);
            string sql; //statemenet to to manipulate
            sql = "";
            SqlCommand cmd = new SqlCommand(sql, con);

            try
            {
                sql = "UPDATE cap.Person SET imgData = @imgData;"; //WHERE email = @email;";
                cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add(new SqlParameter("@imgData", imageArray));
                //cmd.Parameters.Add(new MySqlParameter("@email", Session["email"]));
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception err)
            {
                con.Close();
            }
            finally
            {
                con.Close();
            }


        }

        private void CaptureButton_Click(object sender, System.EventArgs e)
        {
            TakePhoto();
        }

        async void TakePhoto()
        {
            await CrossMedia.Current.Initialize();
            var file = await CrossMedia.Current.TakePhotoAsync(new Plugin.Media.Abstractions.StoreCameraMediaOptions
            {

                PhotoSize = Plugin.Media.Abstractions.PhotoSize.Medium,
                CompressionQuality = 40,
                Name = "test.jpg",
                Directory = "test"

            });

            if (file == null)
            {
                return;
            }

            byte[] imageArray = System.IO.File.ReadAllBytes(file.Path);
            Android.Graphics.Bitmap bitmap = BitmapFactory.DecodeByteArray(imageArray, 0, imageArray.Length);
            theImageView.SetImageBitmap(bitmap);

            // "server=ip ;uid=username;port=3306;pwd=password;database=dbname;"

            string cs = @"Data Source=in-csci-aspnet.ads.iu.edu\SQL2017,11433;Initial Catalog=dprosev;User ID=dprosev;Password=d9130pro";

            SqlConnection con = new SqlConnection(cs);
            string sql; 
            sql = "";
            SqlCommand cmd = new SqlCommand(sql, con);

            try
            {
                sql = "UPDATE cap.Person SET imgData = @imgData;";
                cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add(new SqlParameter("@imgData", imageArray));
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception err)
            {
                con.Close();
            }
            finally
            {
                con.Close();
            }



            /*using (Image image = Image.FromFile(file.Path))
            {
                using (MemoryStream m = new MemoryStream())
                {
                    image.Save(m, image.RawFormat);
                    byte[] imageBytes = m.ToArray();

                        HttpPostedFile postedFile = imgUploadID.PostedFile;
                        string filename = Path.GetFileName(postedFile.FileName);
                        string fileExtension = Path.GetExtension(filename);
                        int fileSize = postedFile.ContentLength;


                        Stream stream = postedFile.InputStream;
                        BinaryReader binaryReader = new BinaryReader(stream);
                        Byte[] imgBytes = binaryReader.ReadBytes((int)stream.Length);

                    // Convert byte[] to Base64 String
                    string base64String = Convert.ToBase64String(imageBytes);

                    
                }
            }*/
        }

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
}