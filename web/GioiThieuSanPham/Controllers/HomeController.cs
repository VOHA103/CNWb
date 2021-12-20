using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GioiThieuSanPham.Models;

namespace GioiThieuSanPham.Controllers
{
    public class HomeController : Controller
    {
        QLSANPHAMEntities db = new QLSANPHAMEntities();
       public ActionResult Index()
        {
            index idx = new index();
            idx.sanpham = db.SANPHAMs.Where(x=>x.TRANGTHAI==true&&x.SANPHAMBANCHAY==true).ToList();
            idx.danhmuc = db.DANHMUCs.Where(x=>x.noibat==1).ToList();

            return View(idx);
        }
        public ActionResult Navbar()
        {
            Layout lo = new Layout();
            var danhmuc = db.DANHMUCs.ToList();
            var hangsx = db.SANPHAMs.Select(x => x.HANGSX).Distinct().ToList();
            lo.danhmuc = danhmuc;
            lo.hangsx = hangsx;
            return View(lo);
        }
    }
}
