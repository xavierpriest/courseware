using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class courseapproval : System.Web.UI.Page
    {
        public string connectionstring = "Data Source=WIN-HR1LMBESRET;Initial Catalog=dbgau;Integrated Security=True";

       
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(connectionstring);
            connection.Open();

            if (DropDownList2.Items.Count>0) 
            {
                SqlCommand cmd = new SqlCommand("Update  course set status =1 where status= '" + DropDownList1.SelectedValue + "' and id= '" + DropDownList2.SelectedItem.Text + "' ", connection);

                cmd.ExecuteNonQuery();
                connection.Close();
                Response.Redirect("courseapproval.aspx", true);
                Accept.Visible = true;
            }
        }
      

        protected void DropDownList2_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void Button6_Click1(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(connectionstring);
            connection.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO quota (assign, used) " + " VALUES('" + DropDownList4.SelectedItem.Text + "','" + 0 + "')", connection);
            SqlCommand cmd2 = new SqlCommand("UPDATE lecturer SET quotaid = (SELECT SCOPE_IDENTITY() ) WHERE id =" + DropDownList3.SelectedValue, connection);

            cmd.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();
            connection.Close();
            Response.Redirect("courseapproval.aspx", true);
        }

        protected void Pending_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        
    }
}