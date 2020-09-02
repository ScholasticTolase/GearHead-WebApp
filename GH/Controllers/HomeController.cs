using System.Linq;
using System.Web.Mvc;
using System.Net;
using System.Net.Mail;
using GH.Models;
using SmtpClassLib;
using System.Threading;


namespace GH.Controllers
{
    public class HomeController : Controller
    {

        ///////////////////////Landing- Page////////////////

        public ActionResult LandPage()
        {

            return View();
        }


        //////////////////// GET: SIGN-UP ////////////////////////////////
/*
        public ActionResult Registration()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Registration(UserAccount account)
        {
            if (ModelState.IsValid)
            {
                using (MyDbContext db = new MyDbContext())
                {
                    db.Users.Add(account);
                    db.SaveChanges();
                    // Clear Controls 
                    ModelState.Clear();
                    // Display notification to the user
                    ViewBag.Message = account.FirstName + " Account Successfully Registered.";
                }
                    
            }
            return View();
        }*/

        //////////////////// END OF SIGN-UP //////////////////////////




        ////////////  USER- CHECK  /////////////////

        [HttpPost]
        public JsonResult CheckUser(UserAccount user)
        {
            using (MyDbContext db = new MyDbContext())
            {
                Thread.Sleep(1500);
                string result = "Fail";
                var usr = db.Users.Single(u => u.Username == user.Username && u.Password == user.Password);
                if (usr != null)
                {
                    Session["UserId"] = usr.UserId.ToString();
                    Session["Username"] = usr.Username.ToString();
                    Session["PhoneNumber"] = usr.PhoneNumber.ToString();
                    Session["FirstName"] = usr.FirstName.ToString();
                    result = "Success";
                }
                return Json(result, JsonRequestBehavior.AllowGet);
            }
        }

        //////// END OF USER - CHECK //////////
        [HttpPost]
        public JsonResult CreateUser(UserAccount user)
        {
            using (MyDbContext db = new MyDbContext())
            {
                string response = "Fail";
                if (ModelState.IsValid)
                {
                    db.Users.Add(user);
                    db.SaveChanges();
                    // Clear Controls 
                    ModelState.Clear();
                    /*// Display notification to the user
                    ViewBag.Message = user.FirstName + " Account Successfully Registered.";*/
                    response = "Success";
                    Thread.Sleep(3000);
                }
                 return Json(response, JsonRequestBehavior.AllowGet);
            }
        }



        ////////////  USER- LOGIN    /////////////////

        /*        public ActionResult UserLogin()
                {
                    if (Session["UserID"] != null)
                    {
                        return View();
                    }
                    else
                    {
                        return RedirectToAction("UserPage");
                    }
                }
        */
        //////// END OF USER - LOGIN //////////





        ///////////// LOG-OUT //////////////
        public ActionResult Logout()
        {
            Session.Clear();
            Session.Abandon();

            return RedirectToAction("LandPage");
        }




    ///////////// USER PAGE ////////////////

        public ActionResult UserPage()
        {
            /* to check if the user is logged in*/

            if (Session["UserId"] == null)
            {
                return RedirectToAction("LandPage");
            }
            return View();
        }

        ///////============================ END OF USER PAGE ============================////////







        /////================================= ABOUT US PAGE ============================ //////
        public ActionResult About()
        {
            return View();
        }





        /////============================  CONTACT US VIA EMAIL ===================================/////
        public ActionResult Contact()
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("LandPage");
            }
            else
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult Contact(EmailModel model)
        {
            // If all the parameters required in the form is filled correctly
            if (ModelState.IsValid)
            {
                using (MailMessage client = new MailMessage())
                {
                    client.From = new MailAddress(Connection.senderEmail,Connection.senderName);
                    client.To.Add(model.UserEmail);
                    client.Subject = Connection.senderSubject;
                    client.Body = "You have a message from  <br><b>Fullname:</b>" +
                        model.FullName + "<br><b>Email:</b>" + model.UserEmail + "<br><b>Message</b>" + model.Message;
                    client.Priority = MailPriority.High;
                    client.IsBodyHtml = true;

     /*---------------------- Calling my smtp method from the class library created-------------------------------*/

                    Connection.MySmtp(client);
                }// end using
            }

            ViewBag.Feedback = "Message has been sent.";
            // Clear Controls
            ModelState.Clear();

            return View();
        }

    /////// END OF CONTACT US VIA EMAIL ////////




        /////////// MAINTENANCE ARCHIVES ////////
        public ActionResult Maintenance()
        {
            /* to check if the user is logged in*/

            if (Session["UserId"] == null)
            {
                return RedirectToAction("LandPage");
            }
            return View();
        }



        /////// KNOW- HOW GUIDES////
        public ActionResult Guides()
        {
            /* to check if the user is logged in*/

            if (Session["UserId"] == null)
            {
                return RedirectToAction("LandPage");
            }
            return View();
        }

        public ActionResult Error()
        {
            return View();
        }


    }
}