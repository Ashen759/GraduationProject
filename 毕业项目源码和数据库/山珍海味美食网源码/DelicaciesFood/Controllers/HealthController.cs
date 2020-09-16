using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DelicaciesFood.Model;

namespace DelicaciesFood.Controllers
{
    public class HealthController : Controller
    {
        FoodieWebsiteEntities db = new FoodieWebsiteEntities();
        // GET: Health
        [Authorize]
        public ActionResult Index()
        {
            var dietList = db.DietNous.ToList();
            ViewBag.dietList = dietList;

            //月份
            ViewBag.time = DateTime.Now.Month.ToString();

            //判断当前月份并显示相对应的时蔬表
            int month = int.Parse(DateTime.Now.Month.ToString());
            List<Sfav> sfavs = db.Sfav.Where(p => p.MatureSeason == month).ToList();
            ViewBag.sfavsList = sfavs;

            return View();
        }
        public ActionResult DietNous(int? nous,int? num)
        {
            List<DietNous> dietnous = db.DietNous.Where(p => p.NousID == nous).ToList();
            ViewBag.dietnous = dietnous;

            List<Sfav>sfavs  = db.Sfav.Where(p => p.SfavID == num).ToList();
            ViewBag.sfavs = sfavs;

            return View();
        }
    }
}