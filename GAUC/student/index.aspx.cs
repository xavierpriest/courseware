using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using GAUC.Admin;

namespace GAUC.student
{
    public partial class index : System.Web.UI.Page
    {
        DbFunctions fs = new DbFunctions();
        public string username;
        protected int studentID;
        protected void Page_Load(object sender, EventArgs e)
        {
            username = (string)(Session["username"]);
            string sid = Request.QueryString["ID"];
            Session["SID"] = 1;
            
            int.TryParse((Request.QueryString["SID"]), out studentID);
            DataBind();

            String hiddenFieldValue = hidLastTab.Value;
            StringBuilder js = new StringBuilder();
            js.Append("<script type='text/javascript'>");
            js.Append("var previouslySelectedTab = ");
            js.Append(hiddenFieldValue);
            js.Append(";</script>");
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "acttab", js.ToString());
            //this.Header.Controls.Add(new LiteralControl(js.ToString()));

            int dep_id = fs.GetUserDepartment(1);

            
           
        }
    }
}