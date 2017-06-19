using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.IO;
using System.Text;

namespace WebApplication1
{
    public partial class forget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           try
            {
                if (TextBox1.Text != "" && DropDownList1.SelectedItem.ToString() != "" && TextBox2.Text != "" && TextBox3.Text != "")
                {
                    SqlConnection connect = new SqlConnection(@"Data Source=WIN-HR1LMBESRET;Initial Catalog=GAUCourseware;Integrated Security=True");
                    
                        connect.Open();

                           SqlCommand cmd1 = new SqlCommand("UPDATE users SET password=(@password) where email='" + TextBox1.Text + "' AND question='" + DropDownList1.SelectedItem + "' AND answer='" + TextBox2.Text + "' AND status=1", connect);

                           cmd1.Parameters.AddWithValue("@password", TextBox3.Text);
                           
                            int x = cmd1.ExecuteNonQuery();
                    if(x>0)
                           Response.Write("Your new password has been created");
                    else
                        Response.Write("Password Not Changed");
                           connect.Close();
                           connect.Dispose();
                       }
                       else
                       {
                           Response.Write("check your fields");
                       }

                                       

                   }
            catch (Exception ex)
            {
                Response.Write(ex.Message);

               
            }
                       
                       

                       TextBox1.Text = null;
                       TextBox2.Text = null;
                       TextBox3.Text = null;

                       
                      
                       
                      
                       
                       
                      
                   }

                   


                }
             }
            

      

            




       




