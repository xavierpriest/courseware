using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using GAUC.db_layer;



namespace GAUC.Admin
{



    public partial class Instructors : System.Web.UI.Page
    {
        DbFunctions funcs = new DbFunctions();
        dbgauDataContext dc = new  dbgauDataContext();
        public bool st;
        private int myid;
        public int index;
        protected void Page_Load(object sender, EventArgs e)
        {
            String hiddenFieldValue = hidLastTab.Value;
            StringBuilder js = new StringBuilder();
            js.Append("<script type='text/javascript'>");
            js.Append("var previouslySelectedTab = ");
            js.Append(hiddenFieldValue);
            js.Append(";</script>");
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "acttab", js.ToString());
            //this.Header.Controls.Add(new LiteralControl(js.ToString()));

            GridView1.DataSource = funcs.GetAllMin();

            GridView1.DataBind();
            
            
            GridView2.DataSource = funcs.GetCoursesByInstructor(1);
            GridView2.DataBind();
            GridView2.EmptyDataText = "No Courses assigned to this Instructor";

            DetailsView1.DataSource = funcs.GetAll(1);
            DetailsView1.DataBind();
            DetailsView1.EmptyDataText = "No Personal Details";

            DetailsView2.DataSource = funcs.GetQouta(1);
            DetailsView2.DataBind();
            DetailsView2.EmptyDataText = "No Information Available";

            st = funcs.InstructorStatus(1);

            if (st == true)
            {
                lblStatus.Text = "This account is Active";
                btnActivate.Text = "Deactivate Instructor Account";
                btnActivate.CssClass = "btn btn-medium btn-red";
            }
            else
            {
                lblStatus.Text = "This account is Inactive";
                btnActivate.Text = "Activate Instructor Account";
                btnActivate.CssClass = "btn btn-medium btn-blue";
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            GridView1.DataSource = funcs.GetAllMin();
            GridView1.DataBind();

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            int dep_id;
            int.TryParse(DropDownList1.SelectedValue, out dep_id);
            GridView1.DataSource = funcs.GetByDepartment(dep_id);
            GridView1.DataBind();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            int id;
            int.TryParse(GridView1.SelectedRow.Cells[2].Text, out id);
            myid = id;
            Session["ID"] = id;
            GridView2.DataSource = funcs.GetCoursesByInstructor(id);
            GridView2.DataBind();
            GridView2.EmptyDataText = "No Courses assigned to this Instructor";

            DetailsView1.DataSource = funcs.GetAll(id);
            DetailsView1.DataBind();
            DetailsView1.EmptyDataText = "No Personal Details";

            DetailsView2.DataSource = funcs.GetQouta(id);
            DetailsView2.DataBind();
            DetailsView2.EmptyDataText = "No Information Available";

            st = funcs.InstructorStatus(id);
            
            if (st == true)
            {
                lblStatus.Text = "This account is Active";
                btnActivate.Text = "Deactivate Instructor Account";
                btnActivate.CssClass = "btn btn-medium btn-red";
            }
            else
            {
                lblStatus.Text = "This account is Inactive";
                btnActivate.Text = "Activate Instructor Account";
                btnActivate.CssClass = "btn btn-medium btn-blue";
            }


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string queryString = "createinstructor.aspx";
            string newWin = "window.open('" + queryString + "');";
            ClientScript.RegisterStartupScript(this.GetType(), "pop", newWin, true);
        }

        protected void btnEditDetails_Click(object sender, EventArgs e)
        {
            string id = GridView1.SelectedRow.Cells[2].Text;
            Response.Redirect("editpersonal.aspx?ID=" + id);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = funcs.GetAllMin();
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id;
            int.TryParse(GridView1.SelectedRow.Cells[2].Text, out id);
            if (funcs.DeleteInstructor(id) == "success")
            {
                lblMsg.Text = "Row Deleted Successfully";
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                lblMsg.CssClass = "color-red";
                lblMsg.Text = "Error";
            }



        }

        protected void btnActivate_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["ID"]);
            var lecturer = dc.lecturers.Single(l => l.id == id);
            lecturer.status = !lecturer.status;

            try
            {

                dc.SubmitChanges();
                Response.Redirect(Request.RawUrl);

            }
            catch (Exception ex)
            {

                throw;
            }


        }
        

        protected void btnApproval_Click(object sender, EventArgs e)
        {
            Response.Redirect("courseapproval.aspx");
        }

        protected void btnBackUp_Click(object sender, EventArgs e)
        {
            int id;
            int.TryParse(GridView1.SelectedRow.Cells[2].Text, out id);
            Response.Redirect("backupinstructor.aspx?LID=" + id);
        }

        protected void btnUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("Superadmin%20users%20control%20.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("courseapproval.aspx");
        }
    }
}