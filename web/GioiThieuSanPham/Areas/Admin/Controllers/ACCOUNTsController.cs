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
    public class ACCOUNTsController : Controller
    {
        private QLSANPHAMEntities db = new QLSANPHAMEntities();

        // GET: Admin/ACCOUNTs
        public ActionResult Index()
        {
            if(Session["CHUADMIN"]==null)
            {
                return RedirectToAction("/", "../");
            }    
            return View(db.ACCOUNTs.ToList());
        }
        public ActionResult Login()
        {
            if(Session["ID"]!=null&&Session["CHUADMIN"]==null)
                return RedirectToAction("/", "../");
            if (Session["CHUADMIN"] != null)
                    return RedirectToAction("Index", "SANPHAM");
            return View();

        }
        [HttpPost]
        public ActionResult Login(ACCOUNT objUser)
        {
            if (ModelState.IsValid)
            {
                using (QLSANPHAMEntities db = new QLSANPHAMEntities())
                {
                    objUser.MATKHAU = GioiThieuSanPham.Models.ThuVien.EncodeMD5(objUser.MATKHAU);
                    var obj = db.ACCOUNTs.Where(a => a.EMAIL.Equals(objUser.EMAIL) && a.MATKHAU.Equals(objUser.MATKHAU)).FirstOrDefault();
                    if (obj != null)
                    {
                        if (obj.CHUADMIN ==true)
                        {
                            Session["EMAIL"] = obj.EMAIL.ToString();
                            Session["ID"] = obj.ID.ToString();
                            Session["CHUADMIN"] = obj.CHUADMIN;
                            Session["TRANGTHAI"] = obj.TRANGTHAI;
                            return RedirectToAction("Index", "SANPHAMs");
                        }
                        else
                        {
                            Session["EMAIL"] = obj.EMAIL.ToString();
                            Session["ID"] = obj.ID.ToString();
                            Session["TRANGTHAI"] = obj.TRANGTHAI;
                            return RedirectToAction("/", "../");
                        }
                    }
                    else
                    {
                        ViewBag.check = "Sai tài khoản hoặc mật khẩu.";
                    }
                }
            }

            return View(objUser);
        }
        public void Logout()
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/");
        }

        // GET: Admin/ACCOUNTs/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ACCOUNT aCCOUNT = db.ACCOUNTs.Find(id);
            if (aCCOUNT == null)
            {
                return HttpNotFound();
            }
            return View(aCCOUNT);
        }

        // GET: Admin/ACCOUNTs/Create
        public ActionResult Create()
        {
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            return View();
        }

        // POST: Admin/ACCOUNTs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,EMAIL,MATKHAU,TRANGTHAI,CHUADMIN")] ACCOUNT aCCOUNT)
        {
            if (ModelState.IsValid)
            {
                aCCOUNT.MATKHAU = ThuVien.EncodeMD5(aCCOUNT.MATKHAU);
                db.ACCOUNTs.Add(aCCOUNT);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(aCCOUNT);
        }

        // GET: Admin/ACCOUNTs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ACCOUNT aCCOUNT = db.ACCOUNTs.Find(id);
            if (aCCOUNT == null)
            {
                return HttpNotFound();
            }
            return View(aCCOUNT);
        }

        // POST: Admin/ACCOUNTs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,EMAIL,MATKHAU,TRANGTHAI,CHUADMIN")] ACCOUNT aCCOUNT)
        {
            if (ModelState.IsValid)
            {
                if (aCCOUNT.MATKHAU!=null)
                {

                    aCCOUNT.MATKHAU = ThuVien.EncodeMD5(aCCOUNT.MATKHAU);
                    db.Entry(aCCOUNT).State = EntityState.Modified;
                }
                else
                {
                    db.Entry(aCCOUNT).State = EntityState.Modified;
                    db.Entry(aCCOUNT).Property(x => x.MATKHAU).IsModified = false;
                }
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(aCCOUNT);
        }

        // GET: Admin/ACCOUNTs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["CHUADMIN"] == null)
                return RedirectToAction("/", "../");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ACCOUNT aCCOUNT = db.ACCOUNTs.Find(id);
            if (aCCOUNT == null)
            {
                return HttpNotFound();
            }
            return View(aCCOUNT);
        }

        // POST: Admin/ACCOUNTs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ACCOUNT aCCOUNT = db.ACCOUNTs.Find(id);
            db.ACCOUNTs.Remove(aCCOUNT);
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
