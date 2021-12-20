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
    public class CHITIETSANPHAMsController : Controller
    {
        QLSANPHAMEntities db = new QLSANPHAMEntities();

        // GET: Admin/CHITIETSANPHAMs
        public ActionResult Index()
        {
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            var cHITIETSANPHAMs = db.CHITIETSANPHAMs.Include(c => c.SANPHAM);
            return View(cHITIETSANPHAMs.ToList());
        }

        // GET: Admin/CHITIETSANPHAMs/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CHITIETSANPHAM cHITIETSANPHAM = db.CHITIETSANPHAMs.Find(id);
            if (cHITIETSANPHAM == null)
            {
                return HttpNotFound();
            }
            return View(cHITIETSANPHAM);
        }

        // GET: Admin/CHITIETSANPHAMs/Create
        public ActionResult Create()
        {
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            ViewBag.IDSANPHAM = new SelectList(db.SANPHAMs, "ID", "TENSANPHAM");
            return View();
        }

        // POST: Admin/CHITIETSANPHAMs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,IDSANPHAM,HINHANH,STT")] CHITIETSANPHAM cHITIETSANPHAM)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var file = Request.Files["files"];
                    if (file.ContentLength > 0)
                    {
                        file.SaveAs(Server.MapPath("~/Content/assets/Images/" + file.FileName));
                        cHITIETSANPHAM.HINHANH = file.FileName;
                    }
                    db.CHITIETSANPHAMs.Add(cHITIETSANPHAM);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }catch(Exception ex)
                {
                    ViewBag.IDSANPHAM = new SelectList(db.SANPHAMs, "ID", "TENSANPHAM", cHITIETSANPHAM.IDSANPHAM);
                    return View(cHITIETSANPHAM);
                }
            }

            ViewBag.IDSANPHAM = new SelectList(db.SANPHAMs, "ID", "TENSANPHAM", cHITIETSANPHAM.IDSANPHAM);
            return View(cHITIETSANPHAM);
        }

        // GET: Admin/CHITIETSANPHAMs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CHITIETSANPHAM cHITIETSANPHAM = db.CHITIETSANPHAMs.Find(id);
            if (cHITIETSANPHAM == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDSANPHAM = new SelectList(db.SANPHAMs, "ID", "TENSANPHAM", cHITIETSANPHAM.IDSANPHAM);
            return View(cHITIETSANPHAM);
        }

        // POST: Admin/CHITIETSANPHAMs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,IDSANPHAM,HINHANH,STT")] CHITIETSANPHAM cHITIETSANPHAM)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var file = Request.Files["files"];
                    if (file.ContentLength > 0)
                    {
                        file.SaveAs(Server.MapPath("~/Content/assets/images/" + file.FileName));
                        cHITIETSANPHAM.HINHANH = file.FileName;
                    }
                    db.Entry(cHITIETSANPHAM).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }catch(Exception ex)
                {
                    ViewBag.error = ex.InnerException;
                    ViewBag.IDSANPHAM = new SelectList(db.SANPHAMs, "ID", "TENSANPHAM", cHITIETSANPHAM.IDSANPHAM);
                    return View(cHITIETSANPHAM);
                }
            }
            ViewBag.IDSANPHAM = new SelectList(db.SANPHAMs, "ID", "TENSANPHAM", cHITIETSANPHAM.IDSANPHAM);
            return View(cHITIETSANPHAM);
        }

        // GET: Admin/CHITIETSANPHAMs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CHITIETSANPHAM cHITIETSANPHAM = db.CHITIETSANPHAMs.Find(id);
            if (cHITIETSANPHAM == null)
            {
                return HttpNotFound();
            }
            return View(cHITIETSANPHAM);
        }

        // POST: Admin/CHITIETSANPHAMs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CHITIETSANPHAM cHITIETSANPHAM = db.CHITIETSANPHAMs.Find(id);
            db.CHITIETSANPHAMs.Remove(cHITIETSANPHAM);
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
