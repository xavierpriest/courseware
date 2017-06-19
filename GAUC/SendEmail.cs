using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Data;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace WebApplication1
{
    public class EmailSend
    {
        SmtpClient sm = new SmtpClient();
     
            
        public void ESend(string F, string T, string S, string B)
        {

            MailMessage msg = new MailMessage(F,T,S,B);
            msg.IsBodyHtml = true;
            sm.UseDefaultCredentials = false;
            sm.Host = "smtp.gmail.com";
            sm.Port = 587;
            sm.Credentials = new NetworkCredential("gaucourseguide@gmail.com", "melekates");
            sm.EnableSsl = true;
            sm.Send(msg);
        }
    }
}