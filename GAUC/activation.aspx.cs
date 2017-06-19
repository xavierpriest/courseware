using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class activation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = Request.QueryString["email"];
            bool stat = Convert.ToBoolean(Request.QueryString["status"]);



            using (SqlConnection con = new SqlConnection(@"Data Source=WIN-HR1LMBESRET;Initial Catalog=GAUCourseware;Integrated Security=True"))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("UPDATE users SET STATUS=@stat WHERE email = @email", con);
                cmd.Parameters.AddWithValue("@stat", stat);
                cmd.Parameters.AddWithValue("@email", email);

                try
                {
                    cmd.ExecuteNonQuery();
                    Response.Redirect("login.aspx");
                }
                catch (SqlException ex)
                {

                    Response.Write(ex.Message);
                }


            }
        }
    }
}