using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using GioiThieuSanPham.Models;

namespace GioiThieuSanPham.Areas.Admin.Controllers
{
    public class SANPHAMsController : Controller
    {
        private QLSANPHAMEntities db = new QLSANPHAMEntities();

        // GET: Admin/SANPHAMs
        public ActionResult Index()
        {
            if (Session["ID"] == null)
                return RedirectToAction("Login", "Accounts");
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            var sANPHAMs = db.SANPHAMs.Include(s => s.DANHMUC);
            return View(sANPHAMs.ToList());
        }

        // GET: Admin/SANPHAMs/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SANPHAM sANPHAM = db.SANPHAMs.Find(id);
            if (sANPHAM == null)
            {
                return HttpNotFound();
            }
            return View(sANPHAM);
        }

        // GET: Admin/SANPHAMs/Create
        public ActionResult Create()
        {
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            ViewBag.MADM = new SelectList(db.DANHMUCs, "MADM", "TEN");
            return View();
        }

        // POST: Admin/SANPHAMs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,TENSANPHAM,MADM,HANGSX,MOTA,MOTA2,HINHDAIDIEN,GIABAN,GIAKHUYENMAI,SOLUONG,SANPHAMMOI,SANPHAMBANCHAY,TRANGTHAI,TENKHONGDAU")] SANPHAM sANPHAM)
        {
            if (ModelState.IsValid)
            {
                var file = Request.Files["files"];
                if (file.ContentLength > 0)
                {
                    file.SaveAs(Server.MapPath("~/Content/assets/Images/" + file.FileName));
                    sANPHAM.HINHDAIDIEN = file.FileName;
                }
                sANPHAM.TENKHONGDAU = ThuVien.convertToUnSign3(sANPHAM.TENSANPHAM);
                db.SANPHAMs.Add(sANPHAM);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MADM = new SelectList(db.DANHMUCs, "MADM", "TEN", sANPHAM.MADM);
            return View(sANPHAM);
        }

        // GET: Admin/SANPHAMs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SANPHAM sANPHAM = db.SANPHAMs.Find(id);
            if (sANPHAM == null)
            {
                return HttpNotFound();
            }
            ViewBag.MADM = new SelectList(db.DANHMUCs, "MADM", "TEN", sANPHAM.MADM);
            return View(sANPHAM);
        }

        // POST: Admin/SANPHAMs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,TENSANPHAM,MADM,HANGSX,MOTA,MOTA2,HINHDAIDIEN,GIABAN,GIAKHUYENMAI,SOLUONG,SANPHAMMOI,SANPHAMBANCHAY,TRANGTHAI,TENKHONGDAU")] SANPHAM sANPHAM)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var file = Request.Files["files"];
                    if (file.ContentLength > 0)
                    {
                        file.SaveAs(Server.MapPath("~/Content/assets/Images/" + file.FileName));
                        sANPHAM.HINHDAIDIEN = file.FileName;
                    }
                    sANPHAM.TENKHONGDAU = ThuVien.convertToUnSign3(sANPHAM.TENSANPHAM);
                    db.Entry(sANPHAM).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }catch(Exception ex)
                {
                    return View(sANPHAM);
                }
            }
            ViewBag.MADM = new SelectList(db.DANHMUCs, "MADM", "TEN", sANPHAM.MADM);
            return View(sANPHAM);
        }

        // GET: Admin/SANPHAMs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SANPHAM sANPHAM = db.SANPHAMs.Find(id);
            if (sANPHAM == null)
            {
                return HttpNotFound();
            }
            return View(sANPHAM);
        }

        // POST: Admin/SANPHAMs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SANPHAM sANPHAM = db.SANPHAMs.Find(id);
            db.SANPHAMs.Remove(sANPHAM);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
