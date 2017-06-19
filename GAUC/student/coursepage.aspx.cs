using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GAUC.db_layer;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

namespace GAUC.student
{
    public partial class coursepage : System.Web.UI.Page
    {
        dbgauDataContext db = new dbgauDataContext();
        protected int student_id;
        protected string course_id;
        protected string name;
        protected string id;
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

            int.TryParse((Request.QueryString["SID"]), out student_id);
           course_id = Request.QueryString["CID"];
           Session["SID"] = student_id;
           Session["CID"] = course_id;

           int es = (from er in db.enrolls
                     where er.user_id == student_id && er.course_id == course_id && er.status == false
                     select er).Count();
           if (es == 1)
           {
               Response.Redirect("requestpending.aspx?SID=" + student_id);
           }

           int cs = (from c in db.courses
                     where c.id == course_id
                     select (int)c.enroll_type).First();
           if (cs == 1 || cs == 2)
           {
               if (!IsEnrolled(student_id, course_id))
                   Response.Redirect("courseenroll.aspx?SID=" + student_id + "&CID=" + course_id);
           }

          

            var i = (from c in db.courses
                     join cl in db.courselecturers on c.id equals cl.course_id
                     where c.id == course_id
                     select new { id = c.id, name = c.name }).First();
              name = i.name;
              id = i.id;

             this.DataBind();
            
        }

        public bool IsEnrolled(int sid, string cid)
        {
            var enroll = (from e in db.enrolls
                          where e.course_id == cid && e.user_id == sid && e.status==true
                          select e).Count();

            if (enroll == 1)
                return true;
            else
                return false;
        }

        public void CourseName(string cid)
        {

            
                
            
        }

        protected void btnUnenroll_Click(object sender, EventArgs e)
        {
            var enroll = (from er in db.enrolls
                          where er.course_id == course_id && er.user_id == student_id
                          select er).First();

            db.enrolls.DeleteOnSubmit(enroll);
            try
            {
                db.SubmitChanges();
                Response.Redirect("index.aspx?SID=" + student_id + "&CID=" + course_id);
            }
            catch (Exception)
            {
                
                throw;
            }
           


        }
        protected void DownloadFile(object sender, EventArgs e)
        { //tanımladığımız link butonuna ek bilgi vermek için kullanırız(commandArgument).
            
            int id = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;
            string constr = ConfigurationManager.ConnectionStrings["dbgauConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select * from upload where id=@id";
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        //database deki file ın boyutunu byte tipinde bytes değişkenine atar. 
                        bytes = (byte[])sdr["Data"];
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
    }
}