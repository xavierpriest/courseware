using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.IO;
using System.Data.SqlClient;
using GAUC.db_layer;
using LINQtoCSV;

namespace GAUC.admin
{
    public partial class backupinstructor : System.Web.UI.Page
    {
        dbgauDataContext dc = new dbgauDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string mypath = System.AppDomain.CurrentDomain.BaseDirectory;
            int id; 
            int.TryParse(Request.QueryString["LID"], out id);
           var lecturerdata = (from l in dc.lecturers
                                           join d in dc.departments on l.department_id equals d.id
                                           
                                           where l.id == id
                                           select new {Name=l.name_surname, Email=l.email,Depatment=d.name});

            CsvFileDescription outputFileDescription = new CsvFileDescription
            {
                SeparatorChar = '\t', 
                FirstLineHasColumnNames = true, 
                FileCultureName = "nl-NL" 
            };

            CsvContext cc = new CsvContext();
            string finalPath = mypath + "usr" +id+ ".csv";
            cc.Write(
                lecturerdata,
                finalPath,
                outputFileDescription);
        }
    }
}