using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GAUC.Admin;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace GAUC.Instructor
{
    public partial class Instructor : System.Web.UI.Page
    {
        DbFunctions fs = new DbFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            String hiddenFieldValue = hidLastTab.Value;
            StringBuilder js = new StringBuilder();
            js.Append("<script type='text/javascript'>");
            js.Append("var previouslySelectedTab = ");
            js.Append(hiddenFieldValue);
            js.Append(";</script>");
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "acttab", js.ToString());
            //this.Header.Controls.Add(new LiteralControl(js.ToString()));

            int id ;
            int.TryParse(Request.QueryString["ID"], out id);
            if (fs.CheckStatus(id) != true)
                Response.Redirect("inactive.aspx");

            detailsInfo.DataSource = fs.GetAll(id);
            detailsInfo.DataBind();

            gridUploads.DataSource = fs.GetUploads(id);
            gridUploads.DataBind();

            gridCourses.DataSource = fs.GetCourse(id);
            gridCourses.DataBind();

            gridStudents.DataSource = fs.LectureViewUsers(id);
            gridStudents.DataBind();

            gridVideos.DataSource = fs.GetVideosByLecturer(id);
            gridVideos.DataBind();

            

        }
        public void griddoldur()
        {
            //database deki tabloları doldurmak için kullanırız.
            DataTable dt;
            SqlConnection baglanti = new SqlConnection(@"Data Source=WIN-HR1LMBESRET;Initial Catalog=dbgau;Integrated Security=True");
            baglanti.Open();

            string komut = "Select id,name,user_id,course_id,date from assignment";
            //bağlantıyla beraber sorguları çalıştırmaya yarar.
            SqlDataAdapter dAdapter = new SqlDataAdapter(komut, baglanti);
            //verileri tablolara set ediyorum.
            DataSet ds = new DataSet();
            //set ettiğim verilerle gridviewi doldurur.
            dAdapter.Fill(ds);
            //tabloları 0. satırda doldurmaya başlar.
            dt = ds.Tables[0];
            //tabloya doldurulan verileri datagridview e çekeriz.
            GridView1.DataSource = dt;
            //verilerde değişiklik olduğunda yeniler.******
            GridView1.DataBind();


            baglanti.Close();
        }
        protected void DownloadFile(object sender, EventArgs e)
        {
            //tanımladığımız link butonuna ek bilgi vermek için kullanırız(commandArgument).
            int id = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select * from assignment where id=@id";
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        //database deki file ın boyutunu byte tipinde bytes değişkenine atar. 
                        bytes = (byte[])sdr["data"];
                        //uzantısını content type ın içerisine atarız.
                        contentType = sdr["ContentType"].ToString();
                        fileName = sdr["name"].ToString();
                    }
                    con.Close();
                }
            }
            //datagridview i temizleriz.
            Response.Clear();
            //belleği aktif hale getiririz.
            Response.Buffer = true;
            //karakterleri temziler.
            Response.Charset = "";
            //tarayıcı da bir problem oluştuğunda bize geri gönderir.(hatayı gösterir.)
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //içeriğini contentType a atar.
            Response.ContentType = contentType;
            //dosyalarını isimlerini burada gösterir.
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            //dosya boyutunu binary olarak yazar.
            Response.BinaryWrite(bytes);
            //bellekte bulunan verirleri tarayıcıya atarız.
            Response.Flush();
            //bundan sonra sonuç beklenen işlemleri kapatır.
            Response.End();
        }

        protected void btnInfo_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnCourse_Click(object sender, EventArgs e)
        {
            int id;
            int.TryParse(Request.QueryString["ID"], out id);

            Response.Redirect("courserequest.aspx?ID=" + id);
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            Response.Redirect("InsertUpload.aspx");
        }

        protected void btnHw_Click(object sender, EventArgs e)
        {
            Response.Redirect("createhomework.aspx");
        }

        protected void gridCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            string course_id = gridCourses.SelectedRow.Cells[1].Text;
            if (fs.GetCourseOwner(course_id) == 0)
            {
                enrollPanel.Visible = false;
                enrollMsg.Text = "Enrollment is controlled by Administrator";
            }
            else if (fs.GetCourseOwner(course_id) == 1)
            {
                enrollPanel.Visible = true;
                enrollMsg.Text = "Enrollment is controlled by Instructor";
            }
            else
            {
                enrollPanel.Visible = false;
                enrollMsg.Text = "Error in getting enrollment settings!";
            }
        }

        protected void btnSaveEnroll_Click(object sender, EventArgs e)
        {
            string course_id = gridCourses.SelectedRow.Cells[1].Text;
            int type = Convert.ToInt32(enrollList.SelectedValue);

            if (fs.SetEnrollment(course_id, type) == true)
                Response.Redirect(Request.RawUrl);
        }

        protected void btnAddVideo_Click(object sender, EventArgs e)
        {
            Response.Redirect("documents.aspx");
        }
    }
}