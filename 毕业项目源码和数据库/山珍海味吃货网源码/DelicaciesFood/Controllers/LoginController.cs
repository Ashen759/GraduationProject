using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DelicaciesFood.Model;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Web.Security;

namespace DelicaciesFood.Controllers
{
    public class LoginController : Controller
    {
        FoodieWebsiteEntities db = new FoodieWebsiteEntities();
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
        public ActionResult Index(string UserName, string UserPwd)
        {
            string uname = Request["UserName"];//传入文本框name名
            string upwd = Request["UserPwd"];//传入文本框name名
            User user = db.User.FirstOrDefault(t => t.UserName == uname && t.UserPwd == upwd);
            if (user != null)
            {
                Session["user"] = user;
                FormsAuthentication.SetAuthCookie(user.UserName, false); //添加通行证
                return RedirectToAction("Index","FoodWeb");
            }
            else
            {
                return Content("<script>alert('用户账户或密码输入错误！');history.go(-1);</script>");
            }
        }

        /// <summary>
        /// 退出登录
        /// </summary>
        /// <returns></returns>
        public ActionResult TLogout()
        {
            Session["user"] = null;
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
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
        public ActionResult Register(string UserName, string UserPwd, string confirmPwd)
        {
            if (UserName != "" && UserPwd != "" && confirmPwd != "")
            {
                if (UserPwd == confirmPwd)
                {
                    User user = new User();
                    user.UserName = UserName;
                    user.UserPwd = UserPwd;
                    db.User.Add(user);
                    db.SaveChanges();
                    return RedirectToAction("Index", "Login");
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
    }
}