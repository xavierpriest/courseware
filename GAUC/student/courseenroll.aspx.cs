using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GAUC.db_layer;
using GAUC.Admin;
using System.Text;

namespace GAUC.student
{
    public partial class courseenroll : System.Web.UI.Page
    {
        dbgauDataContext db = new dbgauDataContext();
        DbFunctions fs = new DbFunctions();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string course_id = Request.QueryString["CID"];
            int student_id;
            int.TryParse((Request.QueryString["SID"]), out student_id);

          



        }
        private void MessageBox(string msg)
        {
            Label lbl = new Label();
            lbl.Text = string.Format(@"<script type='text/javascript'>alert('{0}');</script>", msg);
            Page.Controls.Add(lbl);
        }

        protected void btnEnroll_Click(object sender, EventArgs e)
        {
            string course_id = Request.QueryString["CID"];
            int student_id;
            int.TryParse((Request.QueryString["SID"]), out student_id);

            int cs = (from c in db.courses
                      where c.id == course_id
                      select Convert.ToInt32(c.enroll_type)).Single();

            if (cs == 1)
            {
                fs.EnrollMe(student_id, course_id, true);
                 Response.Redirect("coursepage.aspx?CID=" + course_id + "&SID=" + student_id);
            }
            else if (cs == 2)
            {
                fs.EnrollMe(student_id, course_id, false);
                Panel1.Visible = false;
                Panel2.Visible = true;
            
            }
           

        }

        protected void btnHome(object sender, EventArgs e)
        {
            int student_id;
            int.TryParse((Request.QueryString["SID"]), out student_id);
            Response.Redirect("index.aspx?SID=" + student_id);
        }

        }



        
    }
