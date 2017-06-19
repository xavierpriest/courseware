using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Common;
using System.Data;
using System.Configuration;

namespace gau
{
    public partial class ManageUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { //eğer database e herhangi bir veri gönderiliyorsa(Ispostback ile)
            //griddoldur fonksiyonuyla database yeniden bağlanılır(refresh işlemi gibidir)
            if (!IsPostBack)
            {
                griddoldur();
            }

        }
        private void griddoldur()
        {//database deki tabloları doldurmak için kullanırız.
            DataTable dt;
            SqlConnection baglanti = new SqlConnection(@"Data Source=TOSHIBA-PC\SQLEXPRESS;Initial Catalog=coursedb;Integrated Security=True");
            baglanti.Open();
           
            string komut = "Select id,name from upload";
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
               

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //0.sütundaki yani (id) yi no değişkenine atadım.
            int No = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string conString = @"Data Source=TOSHIBA-PC\SQLEXPRESS;Initial Catalog=coursedb;Integrated Security=True";
            SqlConnection connection = new SqlConnection(conString);
            connection.Open();
            SqlCommand command = new SqlCommand("Delete from upload where id = " + No.ToString(), connection);
            command.ExecuteReader();
            griddoldur();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("home.aspx");
        }


    }
}