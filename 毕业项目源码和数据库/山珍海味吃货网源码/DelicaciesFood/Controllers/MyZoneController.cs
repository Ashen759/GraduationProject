using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DelicaciesFood.Model;
using System.IO;

namespace DelicaciesFood.Controllers
{
    public class MyZoneController : Controller
    {
        FoodieWebsiteEntities db = new FoodieWebsiteEntities();
        /// <summary>
        /// 我的空间页面
        /// </summary>
        /// <returns></returns>
        [Authorize]
        public ActionResult Index()
        {
            User user = Session["user"] as User;

            List<Food> foods = db.Food.Where(p => p.Foodissuer == user.UserID).ToList();
            ViewBag.foods = foods;

            //菜品类别下拉框
            List<SelectListItem> Typelist = db.RecipeType.Where(a => a.PID != null).Select(p => new SelectListItem()
            {
                Text = p.TypeName,
                Value = p.TypeID.ToString()
            }).ToList();
            ViewBag.Typelist = Typelist;
            //菜品难度下拉框
            List<SelectListItem> Difficultylist = new List<SelectListItem>() {
                new SelectListItem(){Text="容易",Value="0"},
                new SelectListItem(){Text="普通",Value="1"},
                new SelectListItem(){Text="困难",Value="2"}
            }.ToList();
            ViewBag.Difficultylist = Difficultylist;
            //菜品口味下拉框
            List<SelectListItem> Flavorlist = new List<SelectListItem>()
            {
                 new SelectListItem() {  Text="辣",  Value="辣"},
                 new SelectListItem() {  Text="酸",  Value="酸"},
                 new SelectListItem() {  Text="甜",  Value="甜"},
                 new SelectListItem() {  Text="苦",  Value="苦"},
                 new SelectListItem() {  Text="咸",  Value="咸"}
            }.ToList();
            ViewBag.Flavorlist = Flavorlist;
            return View();
        }
        [HttpPost]
        public ActionResult Index(Food f, HttpPostedFileBase file, List<string> CookingUtensils, List<string> CookingStyle)
        {
            if (file != null)
            {
                //判断文件大小
                if (file.ContentLength > 0 && file.ContentLength < 4194304)
                {

                    //获取上传文件路径
                    string fileName = Path.GetFileName(file.FileName);
                    //获取文件后缀名【两种方式-------截取==jpg，，，GetExtension== .jpg】
                    //string suff = fileName.Substring(fileName.LastIndexOf(".")+1);
                    string suff = Path.GetExtension(fileName);


                    //判断文件格式
                    if (suff == ".gif" || suff == ".jpg" || suff == ".png")
                    {
                        //保存上传文件的路径
                        file.SaveAs(Server.MapPath("~/images/food/" + file.FileName));
                        //获取上传文件名，用于后期拿图片
                        ViewBag.img = file.FileName;
                        //存入数据库字段中
                        f.FoodPicture = file.FileName;
                    }
                    else
                    {
                        ViewBag.Message = "文件格式不正确！";
                    }
                }
                else
                {
                    ViewBag.Message = "文件大小不符合要求！";
                }
            }
            else
            {
                ViewBag.Message = "请上传文件！";
            }

            //烹饪餐具和烹饪方法
            string Cooking = "";
            string CookStyle = "";
            foreach (var item in CookingUtensils)
            {
                Cooking += item + "&nbsp;";
            }
            foreach (var item in CookingStyle)
            {
                CookStyle += item + "&nbsp;";
            }


            User user = Session["user"] as User;
            f.CookingUtensils = Cooking;
            f.CookingStyle = CookStyle;
            f.Foodissuer = user.UserID;
            db.Food.Add(f);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        /// <summary>
        /// 修改-详情页
        /// </summary>
        /// <returns></returns>
        public ActionResult Dteail(int stuID)
        {
            db.Configuration.LazyLoadingEnabled = false;
            Food foods = db.Food.Find(stuID);
            var json = Json(foods);
            return json;
        }
        public ActionResult Edit(Food foods)
        {
            db.Entry(foods).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Del(int id)
        {
            //创建删除对象
            Food foods = new Food();
            foods.FoodID = id;
            //将删除对象添加到EF 对象管理容器
            db.Food.Attach(foods);
            //将对象包装类的状态标识为删除状态
            db.Food.Remove(foods);
            //更新到数据库
            db.SaveChanges();
            //更新成功后，页面跳转到Index页面
            return RedirectToAction("Index", "MyZone");
        }

    }
}