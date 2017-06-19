using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GAUC.student
{
    public partial class student : System.Web.UI.MasterPage
    {
        public int sid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
                Response.Redirect("../Login.aspx");
            sid = (int)(Session["id"]);
        }
    }
}