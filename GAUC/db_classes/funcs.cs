using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Linq;
using GAUC.db_layer;

namespace GAUC.Admin
{
    public class DbFunctions
    {
        dbgauDataContext db = new dbgauDataContext();
        

        public DbFunctions()
        {

        }
        public void VideoViews(int vid)
        {
            
            var vv = (from v in db.videos
                       where v.id == vid
                       select v).First();
            int x = vv.views;
            x = x + 1;
            
            db.SubmitChanges();
           
            
            
        }
        public IQueryable ListVideos(string cid)
        {
            var vids = from v in db.videos
                       where v.course_id == cid
                       select v;

            return vids;
        }


        public bool SetEnrollment(string cid, int tp)
        {
            var cs = (from c in db.courses
                      where c.id == cid
                      select c).First();

            cs.enroll_type = tp;

            try
            {
                
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                
                return false;
            }
        }

        //Get User Department ID
        public int GetUserDepartment(int sid)
        {
            int dep = (from u in db.users
                          where u.id == sid
                          select u.department_id).First();
            return dep;
           
        }
        //List Courses based on Departments
        public IQueryable CourseList(int did)
        {
            var courselist = (from c in db.courses
                                  where c.department_id == did
                                  select new {name=c.name} );

            return courselist;
        }
        //Check if Instructor is Active or Not
        public bool InstructorStatus(int id)
        {
            var status = (from l in db.lecturers
                          where l.id == id
                          select Convert.ToBoolean(l.status)).FirstOrDefault();

            return status;
        }
        //Course Request
        public string RequestCourse(string cid, string name, int instr_id, string desc, int dep_id)
        {
            course c = new course
            {
                id = cid,
                name = name,
                description = desc,
                department_id = dep_id,
                status = false,
                enroll_type = 1,
                enroll_owner = 0
                
            };
            db.courses.InsertOnSubmit(c);


            courselecturer cl = new courselecturer
            {
                course_id = cid,
                lecturer_id = instr_id,
                status = false
            };
            db.courselecturers.InsertOnSubmit(cl);

            try
            {
                db.SubmitChanges();
                return "success";

            }
            catch (Exception ex)
            {
                return ex.Message;
                throw;
            }
        }
        public int GetCourseOwner(string cid)
        {
            int owner = (from c in db.courses
                         where c.id == cid
                         select c.enroll_owner).FirstOrDefault();
            return owner;
        }

        public bool CheckStatus(int lid)
        {
            bool stat = (from l in db.lecturers
                         where l.id == lid
                         select Convert.ToBoolean(l.status)).Single();

            return stat;

        }
        public string DeleteInstructor(int id)
        {

            var quo = (from q in db.quotas
                       join l in db.lecturers on q.id equals l.quotaid
                       where l.id == id
                       select q).First();
            db.quotas.DeleteOnSubmit(quo);

            var ins = (from i in db.lecturers
                      where i.id == id
                      select i).First();
            db.lecturers.DeleteOnSubmit(ins);

            try
            {
                db.SubmitChanges();
                return "success";
            }
            catch (Exception ex)
            {
                return "error" + ex.Message;
                
            }
        }
        //List Videos for Each Lecturer
        public IQueryable GetVideosByLecturer(int id)
        {
            var videos = from v in db.videos
                         join cl in db.courselecturers on v.course_id equals cl.course_id
                         join l in db.lecturers on cl.lecturer_id equals l.id
                         where l.id == id
                         select new
                         {
                             Title = v.title,
                             Description = v.description,
                             Views = v.views,
                             Path = v.path,
                             DateAdded = v.submit_date,
                             Course = v.course_id,
                             Status = Convert.ToBoolean(v.status) ? "Visible" : "Hidden"
                         };
            return videos;
        }
        //Lecturer's enrolled students
        public IQueryable LectureViewUsers(int id)
        {
            var users = from u in db.users
                        join e in db.enrolls on u.id equals e.user_id
                        join cl in db.courselecturers on e.course_id equals cl.course_id
                        where cl.lecturer_id == id
                        
                        join c in db.courses on cl.course_id equals c.id
                        
                        select new
                        {
                            Name = u.name_surname,
                            Email = u.email,
                            Department = (from d in db.departments 
                                          where u.department_id == d.id 
                                          select d.name).First(),
                            Course = c.name,
                            Desciption = c.description
                        };
            return users;
        }
        public string ReturnEnrollment(int er)
        {
            if (er == 0)
                return "Not Set";
            else if (er == 1)
                return "Automatic";
            else
                return "Manual";

        }
        public IQueryable GetCourse(int id)
        {
            var courses = from cl in db.courselecturers
                          join c in db.courses on cl.course_id equals c.id
                          where cl.lecturer_id == id
                          select new {Code = c.id, Course = c.name, Description = c.description,
                            Status = Convert.ToBoolean(c.status) ? "Approved" : "Pending",
                            Role = Convert.ToBoolean(cl.status) ? "Editing" : "Non-Editing", Enrollment = ReturnEnrollment((int)c.enroll_type)};
            return courses;
                          

        }
        public IQueryable GetUploads(int id)
        {
            var uploads = from u in db.uploads
                          join c in db.courses on u.course_id equals c.id
                          join cl in db.courselecturers on c.id equals cl.course_id
                          where cl.lecturer_id == id
                          select new
                          {
                              Title = u.title,
                              Document=u.name,
                              Course = u.course_id,
                              DateAdded = u.date,

                              Status = Convert.ToBoolean(u.status) ? "Visible" : "Not Visible"
                          };

            return uploads;
        }
        public IQueryable GetAll(int id)
        {
            IQueryable lecturer = from l in db.lecturers
                           join d in db.departments on l.department_id equals d.id
                           where l.id == id
                           select new { ID= l.id, Name = l.name_surname, Email = l.email, Department = d.name, Country = l.country, Title = l.title, l.password };

            return lecturer;
        }


        public IQueryable GetAllMin()
        {
            var lecturer = from l in db.lecturers
                           join d in db.departments on l.department_id equals d.id
                           select new { ID = l.id, Name = l.name_surname, Department = d.name };

            return lecturer;
        }

        public IQueryable GetByDepartment(int dep_ID)
        {
            var lecturer = from l in db.lecturers
                           join d in db.departments on l.department_id equals d.id
                           where l.department_id == dep_ID
                           select new { ID = l.id, Name = l.name_surname, Department = d.name, Country = l.country, Title = l.title };

            return lecturer;
        }
        public IQueryable GetCoursesByInstructor(int id)
        {
            var courses = from c in db.courses
                          join cl in db.courselecturers on c.id equals cl.course_id
                          where cl.lecturer_id == id
                          select new {Name = c.name, Description=c.description, 
                              Enrollment= c.enroll_type, 
                              Status = Convert.ToBoolean(cl.status) ? "Editing" : "Non-Editing"};
            
            return courses;
        }

        public IQueryable GetQouta(int id)
        {
            var quota = from q in db.quotas
                        join l in db.lecturers on q.id equals l.quotaid
                        where l.id == id
                        select new { Allocated = q.assign, Used = q.used, Remianing = q.remain };

            return quota;

        }

        public bool EnrollMe(int sid, string cid, bool st)
        {
           enroll e = new enroll
            {
                user_id = sid,
                course_id = cid,
                status = st,
            };
           db.enrolls.InsertOnSubmit(e);
            try
            {
                
                db.SubmitChanges();
                return true;
                
            }
            catch (Exception ex)
            {
                return false;
                
            }
        }

        public string InsertInstructor(string name, string email, string title, string pwd, int d_id,
            string country,  double size)
        {
            
            
            lecturer l = new lecturer
            {
               
               name_surname = name,
               email = email,
               title = title,
               password = pwd,
               department_id = d_id,
 
            };
            db.lecturers.InsertOnSubmit(l);

            
            try 
	        {	        
		       db.SubmitChanges();
                return "sucess";
	        }
	        catch (Exception ex)
	        {
		        return ex.Message;
	        }
        }
        
             
        
    }
}