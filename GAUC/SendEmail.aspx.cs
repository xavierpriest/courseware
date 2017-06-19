using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GAUC.db_classes;

namespace GAUC
{
    public partial class SendEmail : System.Web.UI.Page
    {
        EmailSend es = new EmailSend();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string body = "<html><body>";
            body += "<h3>Email Activation</h3>";
            body += "<p>Welcome to GAU Courseware. <a href=\"http://localhost:1051/student/index.aspx\">Click Here to activate your account</a></p>";
            body+= "</body></html>";
           
            es.ESend(txtFrom.Text, txtTo.Text, txtSub.Text, body);
        }
    }
}