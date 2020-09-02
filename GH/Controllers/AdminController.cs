using GH.Models;
using System.Linq;
using System.Web.Mvc;

namespace GH.Controllers
{
    public class AdminController : Controller
    {
        //////////////////// REGISTER ADMIN ////////////////////////////////

        public ActionResult AdminReg()
        {

            return View();
        }

        [HttpPost]
        public ActionResult AdminReg(AdminAccount account)
        {
            if (ModelState.IsValid)
            {
                using (MyDbContext db = new MyDbContext())
                {
                    db.Admins.Add(account);
                    db.SaveChanges();

                    // Clear Controls 
                    ModelState.Clear();
                    // Display notification to the user
                    ViewBag.Message = account.FirstName + " Account Successfully Registered.";
                }
            }
            return View();
        }

        //////////////////// END OF REGISTER ADMIN //////////////////////////





        ////////////  ADMIN- LOGIN    /////////////////
        public ActionResult AdminLogin()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AdminLogin(AdminAccount admin)
        {
            using (MyDbContext AdminDB = new MyDbContext())
            {
                try
                {
                    var adm = AdminDB.Admins.Single(u => u.Username == admin.Username && u.Password == admin.Password);
                    if (adm != null)
                    {
                        Session["AdminId"] = adm.AdminId.ToString();
                        Session["Username"] = adm.Username.ToString();
                        Session["PhoneNumber"] = adm.PhoneNumber.ToString();
                        Session["FirstName"] = adm.FirstName.ToString();

                        // Redirect user to Dashboard
                        return RedirectToAction("AdminPage");
                    }
                }

                catch
                {
                    ModelState.AddModelError("", "Input the Correct Username and Password!");
                }

            }
            return View();
        }

        //////// END OF ADMIN - LOGIN //////////







        ///////////// LOG-OUT //////////////
        public ActionResult Logout()
        {
            Session.Clear();

            return RedirectToAction("AdminLogin");
        }




        ///////////// ADMIN PAGE ////////////////

        public ActionResult AdminPage()
        {
           return View();
        }

        /////// END OF ADMIN PAGE////////


        ///////////// MAINTENANCE BLOG ////////////////

        public ActionResult Maintenance()
        {
            return View();
        }

        /////// END OF MAINTENANCE BLOG////////

    }



}



