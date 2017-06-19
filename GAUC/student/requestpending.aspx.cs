using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GAUC.student
{
    public partial class requestpending : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int sid;
            int.TryParse((Request.QueryString["SID"]), out sid);
            Response.Redirect("index.aspx?SID=" + sid);
        }
    }
}