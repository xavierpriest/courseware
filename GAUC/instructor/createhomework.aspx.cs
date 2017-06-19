using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GAUC.db_layer;

namespace GAUC.instructor
{
    public partial class createhomework : System.Web.UI.Page
    {
        int id;
        dbgauDataContext db = new dbgauDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            int.TryParse((Request.QueryString["ID"]), out id);

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            bool st = true;
            if (chkStatus.Checked)
                st = true;
            else
                st = false;
            homework hw = new homework
            {
                course_id = drpCourse.SelectedValue.ToString(),
                title = txtTitle.Text,
                description = txtDescription.Text,
                startdate = Convert.ToDateTime(txtStart.Text),
                duedate = Convert.ToDateTime(txtDue.Text),
                status = st

            };
            db.homeworks.InsertOnSubmit(hw);
            try
            {
                db.SubmitChanges();
                Response.Write("<script>alert('Homework Created')</script>");
                Response.Redirect("index.aspx?ID=" + id);
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}