using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public string connectionstring = "Data Source=MEHMETALI-PC;Initial Catalog=dbgau;Integrated Security=True";

        protected void Button1_Click(object sender, EventArgs e)
        {
            
             SqlConnection connection = new SqlConnection(connectionstring);
            connection.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO courselecturer " + " VALUES('" + DropDownList1.SelectedItem.Text + "','" + DropDownList2.SelectedItem.Text + "','" + DropDownList3.SelectedItem.Text + "')", connection);
        cmd.ExecuteNonQuery();
        connection.Close();
        Response.Redirect("assignemnt.aspx", true);
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}