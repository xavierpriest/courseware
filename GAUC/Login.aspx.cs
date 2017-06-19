using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;


namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (TextBox1.Text != "" && TextBox2.Text != "")
            {
                SqlConnection connect = new SqlConnection(@"Data Source=WIN-HR1LMBESRET;Initial Catalog=dbgau;Integrated Security=True");

                connect.Open();

                SqlCommand cmd = new SqlCommand("SELECT * from users where email='" + TextBox1.Text + "' AND password='" + TextBox2.Text + "' AND status=1 ", connect);

                SqlDataReader dr = cmd.ExecuteReader();
               

                    if (dr.Read())
                    {
                        int id = (int)dr["id"];
                        Session["id"] = (int)dr["id"];
                        Session["email"] = dr["email"].ToString();
                        Session["password"] = dr["password"].ToString();
                        Session["username"] = dr["name_surname"];
                        Response.Redirect("student/index.aspx?SID="+id);
                    }
                        
                
                else
                {
                    Response.Write("Check Email,Password or You are not click activete link");
                }

               


                TextBox1.Text = null;
                TextBox2.Text = null;                
                dr.Close();
                connect.Close();

            }
            else
            {
                Response.Write("Please fill email and Password field");
            }

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("forget.aspx");
        }

       

     
    }
}
     


