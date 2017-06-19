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
using System.Data;


namespace WebApplication1
{
    public partial class Registration : System.Web.UI.Page
    {
        EmailSend es = new EmailSend();
       
      
        protected void Page_Load(object sender, EventArgs e)
        {
                  
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBoxUN.Text != "" && TextBoxEA.Text != "" && DropDownList3.SelectedItem.ToString() != "" && DropDownCountry.SelectedItem.ToString() != "" && TextBoxPass.Text != "" && DropDownList2.SelectedItem.ToString() != "" && TextBoxA.Text != "")
                {
                    using (SqlConnection con = new SqlConnection(@"Data Source=WIN-HR1LMBESRET;Initial Catalog=dbgau;Integrated Security=True"))
                    {
                        con.Open();

                        SqlCommand cmd = new SqlCommand("INSERT INTO users (name_surname,email,department_id,country,password,question,answer,status) VALUES(@name_surname,@email,@department_id,@country,@password,@question,@answer,@status)", con);


                        cmd.Parameters.AddWithValue("@name_surname", TextBoxUN.Text);
                        cmd.Parameters.AddWithValue("@email", TextBoxEA.Text);
                        cmd.Parameters.AddWithValue("@department_id",DropDownList3.SelectedValue);                      
                        cmd.Parameters.AddWithValue("@country", DropDownCountry.SelectedItem.ToString());
                        cmd.Parameters.AddWithValue("@password", TextBoxPass.Text);
                        cmd.Parameters.AddWithValue("@question", DropDownList2.SelectedItem.ToString());
                        cmd.Parameters.AddWithValue("@answer", TextBoxA.Text);
                        cmd.Parameters.AddWithValue("@status", 0);

                        string msgFrom = "gaucourseguide@gmail.com";
                        string msgSubject = "Email Activations";
                        string msgTo = TextBoxEA.Text;
                        string msgBody = "<a href=\"http://localhost:1051/activation.aspx?x=" + "&status=" +true+ "&email=" + TextBoxEA.Text + "\"" + ">Please click to login account and go to login page</a>";


                        TextBoxUN.Text = null;
                        TextBoxEA.Text = null;
                        TextBoxPass.Text = null;
                        TextBoxA.Text = null;

                        cmd.ExecuteNonQuery();
                        con.Close();
                        con.Dispose();
                        cmd.Dispose();
                        es.ESend(msgFrom, msgTo, msgSubject, msgBody);
                        Response.Write("Go to your mail and click activete link");

                    }
                }

                else
                {
                    Response.Write("These records available");
                    
                }
            }

            catch (SqlException ex)
            {
                if (ex.Number == 2627)    
                Response.Write("<script>alert('Email address is already in use')</script>");
                
                
            }
           
        }




      

      
    }
}


