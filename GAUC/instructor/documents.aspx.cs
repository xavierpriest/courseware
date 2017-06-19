using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class documents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime tarih = DateTime.Now;
            Label6.Text = tarih.ToLongDateString();
        }
        byte[] buffer;
        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime tarih = DateTime.Now;
            //seçili dosyanın varlığı kontrolü
            if (FileUpload1.HasFile && FileUpload1.PostedFile != null)
            {
              
                //bir video dosyası seçildiğinden emin olduktan sonra, dosyayı stream nesnesi olarak alıp byte dizisi olarak veri tabanına kaydediyoruz.
                HttpPostedFile yuklenecekDosya = FileUpload1.PostedFile;
                buffer = new byte[yuklenecekDosya.ContentLength];
                int okunanDeger = yuklenecekDosya.InputStream.Read(buffer, 0, FileUpload1.PostedFile.ContentLength);

                //byte dizide okunacak değer kontrolü
                if (okunanDeger > 0)
                {
                    string filePaths = "videos/"+FileUpload1.FileName;
                    
                    SqlConnection cn = new SqlConnection(@"Data Source=WIN-HR1LMBESRET;Initial Catalog=dbgau;Integrated Security=True");
                    SqlCommand cmd = new SqlCommand("insert into videos values (@title,@DocumentName,@course_id,@submit_date, @description,@status,@size,@path,@views)", cn);
                
                    cmd.Parameters.AddWithValue("@title", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@DocumentName", FileUpload1.FileName);
                    cmd.Parameters.AddWithValue("@course_id", DropDownList1.SelectedItem.ToString());
                    Label6.Text = tarih.ToLongDateString();

                    cmd.Parameters.AddWithValue("@submit_date", Label6.Text);
                    cmd.Parameters.AddWithValue("@description", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@path",filePaths);
                    cmd.Parameters.AddWithValue("@views",0);

                    if (CheckBox1.Checked == true)
                        cmd.Parameters.AddWithValue("@status", 1);
                    else
                        cmd.Parameters.AddWithValue("@status", 0);
                    cmd.Parameters.AddWithValue("@size", okunanDeger);


                    FileUpload1.SaveAs(Server.MapPath("videos/") + FileUpload1.FileName);//inen
                    try
                    {
                        cn.Open();
                        cmd.ExecuteNonQuery();
                         
                        lblSonuc.Text = string.Format("{0} adlı video başarıyla yüklenmiştir.", FileUpload1.PostedFile.FileName);
                        cn.Close();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "')</script>");
                       
                    }
                }
            }
            else
            {
                lblSonuc.Text = "Please Select a video.";
            }
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
        }
    }
}