using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GAUC.Admin
{
    public partial class CreateInstructor : System.Web.UI.Page
    {
        DbFunctions fs = new DbFunctions();
        
        protected void Page_Load(object sender, EventArgs e)
        {

           
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string n = txtName.Text;
            string em = txtEmail.Text;
            string t = txtTitle.Text;
            double size = Convert.ToDouble(txtQouta.Text);
            string pwd = txtPassword.Text;
            int dep_id = listDepartment.SelectedIndex;
            string country = listCountry.SelectedValue;

            
                
            string result = fs.InsertInstructor(n, em, t, pwd, dep_id, country, size);

            if (result == "sucess")
            {
                
                lblMsg.Text = "Instructor account created successfully";
                ClearTextBoxes(Page);
            }
            
                
            

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "Close", "window.close()", true);
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
    }
}