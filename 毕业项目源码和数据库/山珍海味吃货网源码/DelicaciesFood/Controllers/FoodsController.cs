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

            //粤菜
            var CantoneseCuisine = db.Food.Where(p => p.FoodType == 2).ToList();
            ViewBag.CantoneseCuisine = CantoneseCuisine;
            //川菜
            var SichuanCuisine = db.Food.Where(p => p.FoodType == 3).ToList();
            ViewBag.SichuanCuisine = SichuanCuisine;
            //湘菜
            var HunanCuisine = db.Food.Where(p => p.FoodType == 4).ToList();
            ViewBag.HunanCuisine = HunanCuisine;
            //鲁菜
            var ShandongCuisine = db.Food.Where(p => p.FoodType == 5).ToList();
            ViewBag.ShandongCuisine = ShandongCuisine;
            //浙菜
            var ZhejiangCuisine = db.Food.Where(p => p.FoodType == 6).ToList();
            ViewBag.ZhejiangCuisine = ZhejiangCuisine;
            //新疆菜
            var XinjiangCuisine = db.Food.Where(p => p.FoodType == 7).ToList();
            ViewBag.XinjiangCuisine = XinjiangCuisine;
            //台湾美食
            var TaiwanCuisine = db.Food.Where(p => p.FoodType == 8).ToList();
            ViewBag.TaiwanCuisine = TaiwanCuisine;
            //香港美食
            var HongKongCuisine = db.Food.Where(p => p.FoodType == 9).ToList();
            ViewBag.HongKongCuisine = HongKongCuisine;
            //澳门美食
            var MacaoCuisine = db.Food.Where(p => p.FoodType == 10).ToList();
            ViewBag.MacaoCuisine = MacaoCuisine;

            //日本料理
            var JapaneseCuisine = db.Food.Where(p => p.FoodType == 12).ToList();
            ViewBag.JapaneseCuisine = JapaneseCuisine;
            //韩国料理
            var KoreanCuisine = db.Food.Where(p => p.FoodType == 13).ToList();
            ViewBag.KoreanCuisine = KoreanCuisine;
            //泰国菜
            var ThailandCuisine = db.Food.Where(p => p.FoodType == 14).ToList();
            ViewBag.ThailandCuisine = ThailandCuisine;
            //越南菜
            var VietnameseCuisine = db.Food.Where(p => p.FoodType == 15).ToList();
            ViewBag.VietnameseCuisine = VietnameseCuisine;
            //法国菜
            var FrenchCuisine = db.Food.Where(p => p.FoodType == 16).ToList();
            ViewBag.FrenchCuisine = FrenchCuisine;
            //意大利菜
            var ItalyCuisine = db.Food.Where(p => p.FoodType == 17).ToList();
            ViewBag.ItalyCuisine = ItalyCuisine;


            //蛋糕
            var Cake = db.Food.Where(p => p.FoodType == 19).ToList();
            ViewBag.Cake = Cake;
            //面包
            var bread = db.Food.Where(p => p.FoodType == 20).ToList();
            ViewBag.bread = bread;
            //马卡龙
            var Macaroon = db.Food.Where(p => p.FoodType == 21).ToList();
            ViewBag.Macaroon = Macaroon;
            //法棍
            var Baguette = db.Food.Where(p => p.FoodType == 22).ToList();
            ViewBag.Baguette = Baguette;
            //曲奇
            var Cookies = db.Food.Where(p => p.FoodType == 23).ToList();
            ViewBag.Cookies = Cookies;


            //披萨
            var Pizza = db.Food.Where(p => p.FoodType == 25).ToList();
            ViewBag.Pizza = Pizza;
            //油炸物
            var FriedFood = db.Food.Where(p => p.FoodType == 26).ToList();
            ViewBag.FriedFood = FriedFood;



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