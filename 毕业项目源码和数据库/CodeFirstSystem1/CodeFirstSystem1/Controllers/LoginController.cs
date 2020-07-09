using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using CodeFirstSystem1.Models;

namespace CodeFirstSystem1.Controllers
{
    
    public class LoginController : Controller
    {
        FoodieWebsiteEntities db = new FoodieWebsiteEntities();
        // GET: Login
        /// <summary>
        /// 登录
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }
        [AllowAnonymous]
        [HttpPost]
        public ActionResult Index(string AdminName, string AdminPwd)
        {
            string name = Request["AdminName"];//传入文本框name名
            string pwd = Request["AdminPwd"];//传入文本框name名
            Admin admin = db.Admin.FirstOrDefault(t => t.AdminName == name && t.AdminPwd == pwd);
            if (admin != null)
            {
                Session["admin"] = admin;
                FormsAuthentication.SetAuthCookie(admin.AdminName, false); //添加通行证
                return RedirectToAction("Index", "Type");
            }
            else
            {
                return Content("<script>alert('管理员账户或密码输入错误！');history.go(-1);</script>");
            }
        }
        /// <summary>
        /// 注册
        /// </summary>
        /// <returns></returns>
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(string AdminName,string AdminPwd,string checkPwd)
        {
            //注册
            if (AdminName != "" && AdminPwd != "" && checkPwd != "")
            {
                if (AdminPwd == checkPwd)
                {
                    Admin admin = new Admin();
                    admin.AdminName = AdminName;
                    admin.AdminPwd = AdminPwd;
                    db.Admin.Add(admin);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    return Content("<script>alert('两次密码输入错误！');history.go(-1);</script>");
                }
            }
            else
            {
                return Content("<script>alert('用户名，密码，确认密码不能为空！');history.go(-1);</script>");
            }
        }
        /// <summary>
        /// 退出登录
        /// </summary>
        /// <returns></returns>
        public ActionResult TLogout()
        {
            Session["admin"] = null;
            FormsAuthentication.SignOut();
            return RedirectToAction("Index");
        }
    }
}