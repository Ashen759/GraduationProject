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

            //菜品2
            var foodsList = db.Food.ToList();
            ViewBag.foodsList = foodsList;


            List<Food> answers = db.Food.OrderByDescending(p => p.FoodID).ToList();

            //当前页码  
            // ?? 空合并运算符，用于为可为空的值类型和引用类型定义默认值。
            //如果不为空，则返回左侧操作数；否则返回右侧操作数。
            int pageNum = page ?? 1;

            //每页显示多少条
            int pageSize = 5;

            //通过ToPagedList扩展方法进行分页
            //参数：当前页、每页显示的页数
            IPagedList<Food> answerPagedList = answers.ToPagedList(pageNum, pageSize);
            return View(answerPagedList);
        }
    }
}