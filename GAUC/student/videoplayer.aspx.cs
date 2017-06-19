using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GAUC.Admin;
using GAUC.db_layer;
using System.Data.SqlClient;

namespace GAUC.student
{
    public partial class videoplayer : System.Web.UI.Page
    {
        
        public int vid;
        public string videourl;
        public string videotitle;
        public string description;
        public int views;
        public string connString = "Data Source=WIN-HR1LMBESRET;Initial Catalog=dbgau;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            int.TryParse((Request.QueryString["v"]), out vid);
            SqlConnection conn = new SqlConnection(connString);
            
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM videos WHERE id = @id", conn);
            cmd.Parameters.AddWithValue("@id", vid);
            cmd.Connection = conn;
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            
            while (dr.Read())
            {
                videourl = dr["path"].ToString();
                videotitle = dr["title"].ToString();
                description = dr["description"].ToString();
                views = (Int32)dr["views"];
            }
            conn.Close();

            SqlCommand cmd2 = new SqlCommand("UPDATE videos SET views = @view WHERE id=@id", conn);
            cmd2.Parameters.AddWithValue("@id", vid);
            cmd2.Parameters.AddWithValue("@view", views + 1);
            conn.Open();
            cmd2.Connection = conn;
            cmd2.ExecuteNonQuery();
            conn.Close();




            Panel1.Visible = true;

        }
    }
}