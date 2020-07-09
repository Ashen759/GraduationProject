using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CodeFirstSystem1.Models;

namespace CodeFirstSystem1.Controllers
{
    public class DietNousController : Controller
    {
        FoodieWebsiteEntities db = new FoodieWebsiteEntities();
        // GET: DietNous
        /// <summary>
        /// 饮食健康小知识列表
        /// </summary>
        /// <returns></returns>
        [Authorize]
        public ActionResult Index()
        {
            List<DietNous> list = db.DietNous.ToList();
            return View(list);
        }/// <summary>
         /// 知识添加
         /// </summary>
         /// <returns></returns>
        public ActionResult Add()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Add(DietNous nous, HttpPostedFileBase file)
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
                        file.SaveAs(Server.MapPath("~/images/diet/" + file.FileName));
                        //获取上传文件名，用于后期拿图片
                        ViewBag.img = file.FileName;
                        //存入数据库字段中
                        nous.NousPic = file.FileName;
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


            db.DietNous.Add(nous);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        /// <summary>
        /// 知识删除
        /// </summary>
        /// <param name="typeId"></param>
        /// <returns></returns>
        public ActionResult Del(int id)
        {
            var nous = db.DietNous.Find(id);
            db.DietNous.Remove(nous);
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
            ViewBag.nous = db.DietNous.Find(id);
            return View();
        }
        public ActionResult Edit(DietNous nous)
        {
            db.Entry(nous).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}