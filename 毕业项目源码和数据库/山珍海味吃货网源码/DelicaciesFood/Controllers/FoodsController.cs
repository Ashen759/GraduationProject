using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DelicaciesFood.Model;
using PagedList;

namespace DelicaciesFood.Controllers
{
    public class FoodsController : Controller
    {
        FoodieWebsiteEntities db = new FoodieWebsiteEntities();
        [Authorize]
        // GET: Foods
        public ActionResult Index(int? page = null)
        {

            //类别
            var typeList = db.RecipeType.ToList();
            ViewBag.typeList = typeList;

            //菜品
            var foodsList = db.Food.ToList();
            ViewBag.foodsList = foodsList;



            
            return View();
        }
        public ActionResult Detail(int? id)
        {
            ViewBag.foods = db.Food.Find(id);
            return View();
        }

    }
}