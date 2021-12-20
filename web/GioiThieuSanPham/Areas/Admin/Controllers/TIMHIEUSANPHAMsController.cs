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
    public class TIMHIEUSANPHAMsController : Controller
    {
        private QLSANPHAMEntities db = new QLSANPHAMEntities();

        // GET: Admin/TIMHIEUSANPHAMs
        public ActionResult Index()
        {
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            var tIMHIEUSANPHAMs = db.TIMHIEUSANPHAMs.ToList();
            return View(tIMHIEUSANPHAMs);
        }

        // GET: Admin/TIMHIEUSANPHAMs/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TIMHIEUSANPHAM tIMHIEUSANPHAM = db.TIMHIEUSANPHAMs.Find(id);
            if (tIMHIEUSANPHAM == null)
            {
                return HttpNotFound();
            }
            return View(tIMHIEUSANPHAM);
        }

        // GET: Admin/TIMHIEUSANPHAMs/Create
        public ActionResult Create()
        {
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            ViewBag.MASP = new SelectList(db.SANPHAMs, "ID", "TENSANPHAM");
            return View();
        }

        // POST: Admin/TIMHIEUSANPHAMs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,MASP,hoten,sdt,EMAIL,NOTE,NGAYTAO")] TIMHIEUSANPHAM tIMHIEUSANPHAM)
        {
            if (ModelState.IsValid)
            {
                db.TIMHIEUSANPHAMs.Add(tIMHIEUSANPHAM);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MASP = new SelectList(db.SANPHAMs, "ID", "TENSANPHAM", tIMHIEUSANPHAM.MASP);
            return View(tIMHIEUSANPHAM);
        }

        // GET: Admin/TIMHIEUSANPHAMs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TIMHIEUSANPHAM tIMHIEUSANPHAM = db.TIMHIEUSANPHAMs.Find(id);
            if (tIMHIEUSANPHAM == null)
            {
                return HttpNotFound();
            }
            ViewBag.MASP = new SelectList(db.SANPHAMs, "ID", "TENSANPHAM", tIMHIEUSANPHAM.MASP);
            return View(tIMHIEUSANPHAM);
        }

        // POST: Admin/TIMHIEUSANPHAMs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,MASP,hoten,sdt,EMAIL,NOTE,NGAYTAO")] TIMHIEUSANPHAM tIMHIEUSANPHAM)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tIMHIEUSANPHAM).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MASP = new SelectList(db.SANPHAMs, "ID", "TENSANPHAM", tIMHIEUSANPHAM.MASP);
            return View(tIMHIEUSANPHAM);
        }

        // GET: Admin/TIMHIEUSANPHAMs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TIMHIEUSANPHAM tIMHIEUSANPHAM = db.TIMHIEUSANPHAMs.Find(id);
            if (tIMHIEUSANPHAM == null)
            {
                return HttpNotFound();
            }
            return View(tIMHIEUSANPHAM);
        }

        // POST: Admin/TIMHIEUSANPHAMs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TIMHIEUSANPHAM tIMHIEUSANPHAM = db.TIMHIEUSANPHAMs.Find(id);
            db.TIMHIEUSANPHAMs.Remove(tIMHIEUSANPHAM);
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
