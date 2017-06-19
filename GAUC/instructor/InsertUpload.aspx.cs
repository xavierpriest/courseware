using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace GAUC.Instructor
{
    public partial class InsertUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {// o günü otomatik label da gösteriyorum.
            DateTime tarih = DateTime.Now;
            Label6.Text = tarih.ToLongDateString();
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
                    //yukarıdaki connection stringi kullanarak database e bağlanıyorum.
                            using (SqlConnection con = new SqlConnection(constr))
                            {
                                string query = "insert into upload values (@title,@name, @ContentType,@course_id,@date,@status,@data)select * from upload where not name=@name";
                                using (SqlCommand cmd = new SqlCommand(query))
                                {
                                    //connectiona bağlanıyorum.
                                    cmd.Connection = con;
                                    cmd.Parameters.AddWithValue("@title", TextBox1.Text);
                                    cmd.Parameters.AddWithValue("@name", filename);
                                    cmd.Parameters.AddWithValue("@ContentType", contentType);
                                    cmd.Parameters.AddWithValue("@course_id", DropDownList1.SelectedItem.ToString());
                                    Label6.Text = tarih.ToLongDateString();

                                    cmd.Parameters.AddWithValue("@date", Label6.Text);
                                    if (CheckBox1.Checked == true)
                                        cmd.Parameters.AddWithValue("@status", 1);
                                    else
                                        cmd.Parameters.AddWithValue("@status", 0);
                                    cmd.Parameters.AddWithValue("@Data", bytes);
                                    //bağlantıyı açıyorum.
                                    con.Open();
                                    try
                                    {
                                        cmd.ExecuteNonQuery();
                                        con.Close();
                                        Response.Write("<script>alert('File Upload Success')</script>");
                                        //tetxtbox ın içini temizler.
                                        TextBox1.Text = "";
                                        CheckBox1.Checked = false;
                                    }
                                    catch (SqlException ex)
                                    {
                                        if(ex.Number == 2627)
                                            Response.Write("<script>alert('You can not at same file :(')</script>");
                                        //tetxtbox ın içini temizler.
                                        TextBox1.Text = "";
                                        CheckBox1.Checked = false;
                                    }
                                       
                                    
                                  
                                    
                                }
                            }
                        
                }
            }
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("ManageUpload.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("home.aspx");
        }
    }
}