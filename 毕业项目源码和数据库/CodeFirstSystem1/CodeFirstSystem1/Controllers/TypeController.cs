using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CodeFirstSystem1.Models;

namespace CodeFirstSystem1.Controllers
{
    public class TypeController : Controller
    {
        FoodieWebsiteEntities db = new FoodieWebsiteEntities();
        /// <summary>
        /// 大类列表
        /// </summary>
        /// <returns></returns>
        // GET: Type
        [Authorize]
        public ActionResult Index()
        {
            List<RecipeType> list = db.RecipeType.Where(p => p.PID == null).ToList();
            return View(list);
        }
        /// <summary>
        /// 大类添加
        /// </summary>
        /// <returns></returns>
        public ActionResult Add()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Add(RecipeType type)
        {
            db.RecipeType.Add(type);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        /// <summary>
        /// 大类删除
        /// </summary>
        /// <param name="typeId"></param>
        /// <returns></returns>
        public ActionResult Del(int id)
        {
            var check = db.RecipeType.Where(p => p.PID == id).Count();
            if (check>0)
            {
                return Content("<script>alert('改大类中有包含小类，无法删除，请先删除小类！');history.go(-1)</script>");
            }
            else
            {
                var type = db.RecipeType.Find(id);
                db.RecipeType.Remove(type);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            
        }
        /// <summary>
        /// 编辑
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Detail(int?id)
        {
            ViewBag.type= db.RecipeType.Find(id);
            return View();
        }
        public ActionResult Edit(RecipeType types)
        {
            db.Entry(types).State=System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}