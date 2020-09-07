using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CodeFirstSystem1.Models;

namespace CodeFirstSystem1.Controllers
{
    public class TypeminController : Controller
    {
        FoodieWebsiteEntities db = new FoodieWebsiteEntities();
        // GET: Typemin
        /// <summary>
        /// 小类列表
        /// </summary>
        /// <returns></returns>
        [Authorize]
        public ActionResult Index()
        {
            List<RecipeType> list = db.RecipeType.Where(p => p.PID != null).ToList();
            return View(list);
        }
        /// <summary>
        /// 小类添加
        /// </summary>
        /// <returns></returns>
        public ActionResult Add()
        {
            //菜品类别下拉框
            List<SelectListItem> Tminlist = db.RecipeType.Where(a => a.PID == null).Select(p => new SelectListItem()
            {
                Text = p.TypeName,
                Value = p.TypeID.ToString()
            }).ToList();
            ViewBag.Tminlist = Tminlist;
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
        /// 小类删除
        /// </summary>
        /// <param name="typeId"></param>
        /// <returns></returns>
        public ActionResult Del(int id)
        {
            var type = db.RecipeType.Find(id);
            db.RecipeType.Remove(type);
            db.SaveChanges();
            return RedirectToAction("Index");

        }
        /// <summary>
        /// 编辑
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Detail(int? id)
        {
            RecipeType typemin = db.RecipeType.Find(id);
            List<SelectListItem> Tminlist = db.RecipeType.Where(a => a.PID == null).Select(p => new SelectListItem()
            {
                Text = p.TypeName,
                Value = p.TypeID.ToString()
            }).ToList();
            ViewBag.Tminlist = Tminlist;
            return View(typemin);
        }
        public ActionResult Edit(RecipeType types)
        {
            db.Entry(types).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}