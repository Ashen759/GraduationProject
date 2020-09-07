using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CodeFirstSystem1.Models;
using System.IO;

namespace CodeFirstSystem1.Controllers
{
    public class SfavController : Controller
    {
        FoodieWebsiteEntities db = new FoodieWebsiteEntities();
        // GET: Sfav
        /// <summary>
        /// 时蔬列表
        /// </summary>
        /// <returns></returns>
        [Authorize]
        public ActionResult Index()
        {
            var list = db.Database.SqlQuery<Sfav>("select* from Sfav where 1=1 order by MatureSeason ");
            ViewBag.list = list.ToList();
            return View();
        }
        /// <summary>
         /// 时蔬添加
         /// </summary>
         /// <returns></returns>
        public ActionResult Add()
        {
            List<SelectListItem> monthList = new List<SelectListItem>()
            {
                 new SelectListItem() {  Text="1月",  Value="1"},
                 new SelectListItem() {  Text="2月",  Value="2"},
                 new SelectListItem() {  Text="3月",  Value="3"},
                 new SelectListItem() {  Text="4月",  Value="4"},
                 new SelectListItem() {  Text="5月",  Value="5"},
                 new SelectListItem() {  Text="6月",  Value="6"},
                 new SelectListItem() {  Text="7月",  Value="7"},
                 new SelectListItem() {  Text="8月",  Value="8"},
                 new SelectListItem() {  Text="9月",  Value="9"},
                 new SelectListItem() {  Text="10月",  Value="10"},
                 new SelectListItem() {  Text="11月",  Value="11"},
                 new SelectListItem() {  Text="12月",  Value="12"}
            }.ToList();
            ViewBag.monthList = monthList;
            return View();
        }
        [HttpPost]
        public ActionResult Add(Sfav sfav, HttpPostedFileBase SfavPic)
        {

            if (SfavPic != null)
            {
                //判断文件大小
                if (SfavPic.ContentLength > 0 && SfavPic.ContentLength < 4194304)
                {

                    //获取上传文件路径
                    string fileName = Path.GetFileName(SfavPic.FileName);
                    //获取文件后缀名【两种方式-------截取==jpg，，，GetExtension== .jpg】
                    //string suff = fileName.Substring(fileName.LastIndexOf(".")+1);
                    string suff = Path.GetExtension(fileName);


                    //判断文件格式
                    if (suff == ".gif" || suff == ".jpg" || suff == ".png")
                    {
                        //保存上传文件的路径
                        SfavPic.SaveAs(Server.MapPath("~/images/sfav/" + SfavPic.FileName));
                        //获取上传文件名，用于后期拿图片
                        ViewBag.img = SfavPic.FileName;
                        //存入数据库字段中
                        sfav.SfavPic = SfavPic.FileName;
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
            db.Sfav.Add(sfav);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        /// <summary>
        /// 时蔬删除
        /// </summary>
        /// <param name="typeId"></param>
        /// <returns></returns>
        public ActionResult Del(int id)
        {
            var sfav = db.Sfav.Find(id);
            db.Sfav.Remove(sfav);
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
            Sfav sfav = db.Sfav.Find(id);
            List < SelectListItem > monthList = new List<SelectListItem>()
            {
                 new SelectListItem() {  Text="1月",  Value="1"},
                 new SelectListItem() {  Text="2月",  Value="2"},
                 new SelectListItem() {  Text="3月",  Value="3"},
                 new SelectListItem() {  Text="4月",  Value="4"},
                 new SelectListItem() {  Text="5月",  Value="5"},
                 new SelectListItem() {  Text="6月",  Value="6"},
                 new SelectListItem() {  Text="7月",  Value="7"},
                 new SelectListItem() {  Text="8月",  Value="8"},
                 new SelectListItem() {  Text="9月",  Value="9"},
                 new SelectListItem() {  Text="10月",  Value="10"},
                 new SelectListItem() {  Text="11月",  Value="11"},
                 new SelectListItem() {  Text="12月",  Value="12"}
            }.ToList();
            ViewBag.monthList = monthList;
            return View(sfav);
        }
        public ActionResult Edit(Sfav sfavs)
        {
            db.Entry(sfavs).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}