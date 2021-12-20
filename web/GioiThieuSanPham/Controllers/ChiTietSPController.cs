using GioiThieuSanPham.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GioiThieuSanPham.Controllers
{
    public class ChiTietSPController : Controller
    {
        // GET: ChiTietSP
        QLSANPHAMEntities db = new QLSANPHAMEntities();
        public ActionResult Index(string alias, string alia)
        {
            ChiTietSP ctsp = new ChiTietSP();
            if (alia == null || alias == null)
                return RedirectToAction("Index", "Home");
            ctsp.sanPham = db.SANPHAMs.Where(x => x.TENKHONGDAU.Equals(alia)).FirstOrDefault();
            ctsp.lstChiTietSP = db.CHITIETSANPHAMs.Where(x => x.IDSANPHAM == ctsp.sanPham.ID).ToList();
            ctsp.danhMuc = db.DANHMUCs.Where(x => x.tenkhongdau.Equals(alias)).FirstOrDefault();
            ctsp.sanPhamCungDanhMuc = db.SANPHAMs.Where(x => x.MADM == ctsp.danhMuc.MADM).Take(4).ToList();
            return View(ctsp);
        }
    }
}