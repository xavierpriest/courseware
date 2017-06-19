using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GAUC.db_layer;

namespace GAUC.Admin
{
    public partial class editcourses : System.Web.UI.Page
    {
        DbFunctions fs = new DbFunctions();
        dbgauDataContext dc = new dbgauDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            int id;
            int.TryParse(Request.QueryString["ID"], out id);

            editDetails(id);
            txtPassword.Attributes["type"] = "password";

            
        }
        public void editDetails(int id)
        {
            var lecturer = (from l in dc.lecturers
                           join d in dc.departments on l.department_id equals d.id
                           where l.id == id
                           select new { ID = l.id, Name = l.name_surname, Email = l.email, Department = d.name, Country = l.country, Title = l.title, l.password }).First();

            if (!Page.IsPostBack)
            {
                txtEmail.Text = lecturer.Email;
                txtName.Text = lecturer.Name;
                txtPassword.Text = lecturer.password;
                txtTitle.Text = lecturer.Title;
                listCountry.Text = lecturer.Country;
                //listDepartment.Text = lecturer.Department;
                
            }
            
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            
           

        }
        public string updatedetails(int id)
        {
            var lecturer = (from l in dc.lecturers
                            where l.id == id
                            select l).First();

            
            lecturer.email = txtEmail.Text;
            lecturer.name_surname = txtName.Text;
            lecturer.password = txtPassword.Text;
            lecturer.department_id = listDepartment.SelectedIndex;
            lecturer.country = listCountry.SelectedItem.ToString();
            lecturer.title = txtTitle.Text;

             try {
                 dc.SubmitChanges();
                return "success";
             }
            catch(Exception ex)
             {
                 return "error "+ex.Message;
            }
               

           // lecturer.
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int id;
            int.TryParse(Request.QueryString["ID"], out id);
            string result = updatedetails(id);

            if (result == "success")
                Response.Redirect("Instructors.aspx");
        }
    }
}