using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;

namespace GAUC.db_classes
{
    public class EmailSend
    {
        SmtpClient sm = new SmtpClient();

       

        public void ESend(string f, string t, string s, string b)
        {
            MailMessage msg = new MailMessage(f, t, s, b);
            msg.IsBodyHtml = true;
            sm.UseDefaultCredentials = false;
            sm.Host = "smtp.gmail.com";
            sm.Port = 587;
            sm.Credentials = new NetworkCredential("paul.yhwh@gmail.com", "thanks2jesus");
            sm.EnableSsl = true;
            sm.Send(msg);
        }
    }
}