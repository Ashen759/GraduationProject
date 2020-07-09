using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DelicaciesFood.Model;
using System.IO;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Web.Security;

namespace DelicaciesFood.Controllers
{
    public class FoodWebController : Controller
    {
        FoodieWebsiteEntities db = new FoodieWebsiteEntities();
        /// <summary>
        /// 首页
        /// </summary>
        /// <returns></returns>
        //[Authorize]
        [AllowAnonymous]
        public ActionResult Index()
        {

            //食谱大全
            var typeList= db.RecipeType.ToList();
            ViewBag.typeList = typeList;


            //月份
            ViewBag.time = DateTime.Now.Month.ToString();

            //判断当前月份并显示相对应的时蔬表
            int month = int.Parse(DateTime.Now.Month.ToString());
            List<Sfav> sfavs = db.Sfav.Where(p => p.MatureSeason == month).ToList();
            ViewBag.sfavsList = sfavs;

            //显示饮食健康小知识
            List<DietNous> dietNous = db.DietNous.ToList();
            ViewBag.dietnousList = dietNous;

            //显示排行榜
            var foodrank = db.Database.SqlQuery<Food>("select top 5 * from Food where 1=1 order by ThumbNumber desc");
            ViewBag.foodsList = foodrank.ToList();
            
            
            return View();

        }
        
    }
        
    }