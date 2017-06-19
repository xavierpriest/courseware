using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GAUC.Admin;

namespace GAUC.Instructor
{
    public partial class courserequest : System.Web.UI.Page
    {
        DbFunctions fs = new DbFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string code = txtCode.Text;
            string name = txtName.Text;
            string desc = txtDescription.Text;
            int dep_id;
            int.TryParse((listDepartment.SelectedValue), out dep_id);
            int lect_id;
            int.TryParse(Request.QueryString["ID"], out lect_id);
               
            string r = fs.RequestCourse(code, name, lect_id, desc, dep_id);
            if (r == "success")
            {
                lblMsg.Text = "Course request was successful.";
                ClearTextBoxes(Page);
                //Response.Redirect("Instructor.aspx");
            }
            else
            {
                lblMsg.Text = r;
            }
            
        }


        protected void ClearTextBoxes(Control p1)
        {
            foreach (Control ctrl in p1.Controls)
            {
                if (ctrl is TextBox)
                {
                    TextBox t = ctrl as TextBox;

                    if (t != null)
                    {
                        t.Text = String.Empty;
                    }
                }
                else
                {
                    if (ctrl.Controls.Count > 0)
                    {
                        ClearTextBoxes(ctrl);
                    }
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string lect_id = Request.QueryString["ID"];
            Response.Redirect("index.aspx?ID=" + lect_id);
        }

        protected void listDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}