using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;

namespace gau
{
    public partial class assignmentupload : System.Web.UI.Page
    {
         int hid;
        protected string cid;
        int sid;
        protected void Page_Load(object sender, EventArgs e)
        {
            // label3 un icine sunkı tarıhı atıyoruz
            DateTime tarih = DateTime.Now;
            Label1.Text = tarih.ToLongDateString();
            int.TryParse((Request.QueryString["HID"]), out hid);
            int.TryParse((Request.QueryString["SID"]), out sid);
            cid = Request.QueryString["CID"];
        }
       

        protected void Button1_Click(object sender, EventArgs e)
        {
            //fileupload ta seçtiğimiz dosyanın ismini ve yolunu alıyorum.
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            //fileupload ta seçilen dosyanın uzantısını alıyorum.
            string contentType = FileUpload1.PostedFile.ContentType;
            //seçilen dosyayı post (göndermeye) yarar.
            using (Stream fs = FileUpload1.PostedFile.InputStream)
            {
                //post ettiği dosyayı binaryreader tipinde br adında değişken tanımladım.
                using (BinaryReader br = new BinaryReader(fs))
                {
                    DateTime tarih = DateTime.Now;
                    //dosyanın uzunluğunu byte tipindeki array e atar.
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    //webconfig te tanımladığımız connection stringi burada çağırıyorum.
                    string constr = ConfigurationManager.ConnectionStrings["dbgauConnectionString"].ConnectionString;

                    //file uploadda  secılı bır dosya var mı dıye control edıyor
                    if (FileUpload1.HasFile)
                    {
                        //gonderilen dosyanın boyutunu 4 mb uzun buyuk olup olmadıgnı kontrol edıyor 
                        if (FileUpload1.PostedFile.ContentLength > 4096000)
                        {
                            Label2.Text = "File size too big";
                        }
                        else
                        {
                            //yukarıdaki connection stringi kullanarak database e bağlanıyorum.
                            using (SqlConnection con = new SqlConnection(constr))
                            {
                                string query = "insert into assignment values (@name, @ContentType,@user_id,@date,@course_id,@data,@hid)";
                                using (SqlCommand cmd = new SqlCommand(query))
                                {
                                    //connectiona bağlanıyorum.
                                    cmd.Connection = con;
                                    cmd.Parameters.AddWithValue("@name", filename);
                                    cmd.Parameters.AddWithValue("@ContentType", contentType);
                                    Label1.Text = tarih.ToLongDateString();
                                    cmd.Parameters.AddWithValue("@user_id",sid );
                                    cmd.Parameters.AddWithValue("@date", tarih.ToShortDateString());
                                    cmd.Parameters.AddWithValue("@hid", hid);
                                    cmd.Parameters.AddWithValue("@course_id", cid);
                                    cmd.Parameters.AddWithValue("@data", bytes);
                                    //bağlantıyı açıyorum.
                                    con.Open();
                                    cmd.ExecuteNonQuery();
                                    con.Close();
                                    Response.Write("<script>alert('File Upload Success')</script>");
                                    
                                }
                            }
                        }
                    }
                    else
                        Label2.Text = "Select a File";

                      
                }

                                           
                }
            }
                

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            Page.Response.Redirect("assignmentmanage.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("home.aspx");
        }

        public string ErrorMessage { get; set; }
    }
}