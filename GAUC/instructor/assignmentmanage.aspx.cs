using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace gau
{
    public partial class assignmentmanage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //eğer database e herhangi bir veri gönderiliyorsa(Ispostback ile)
            //griddoldur fonksiyonuyla database yeniden bağlanılır(refresh işlemi gibidir)
            if (!IsPostBack)
            {
                griddoldur();
            }

        }
        private void griddoldur()
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("home.aspx");
        }
    }
}