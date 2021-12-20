using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GioiThieuSanPham.Models;
using PagedList;

namespace GioiThieuSanPham.Controllers
{
    public class DanhMucSPController : Controller
    {
        QLSANPHAMEntities db = new QLSANPHAMEntities();
        public ActionResult Search(string search,int? page)
        {
            if (page == null)
                page = 1;
            int pagesize = 12;
            int pagenumber = (page ?? 1);
            var sanpham = db.SANPHAMs.Where(x => x.TENSANPHAM.Contains(search) || x.HANGSX.Equals(search) || x.ID.ToString().Equals(search)).OrderByDescending(x=>x.ID);

            return View(sanpham.ToPagedList(pagenumber,pagesize));
        }
        // GET: DanhMucSP
        public ActionResult Index(string alias,string hangsx,int? page,string gia)
        {
            DanhMucSanPham dmsp = new DanhMucSanPham();
            if (page == null)
                page = 1;
            int pagesize = 12;
            int pagenumber = (page ?? 1);
            dmsp.danhmuc = db.DANHMUCs.ToList();
            dmsp.danhmucsp = db.DANHMUCs.Where(x => x.tenkhongdau.Equals(alias)).FirstOrDefault();
            dmsp.hangsx = db.SANPHAMs.Where(x => x.MADM == dmsp.danhmucsp.MADM).Select(x => x.HANGSX).Distinct().ToList();
            var sp = db.SANPHAMs.Where(x => x.MADM == dmsp.danhmucsp.MADM).OrderByDescending(x => x.ID);
            if (hangsx != null)
            {
                //sp = db.SANPHAMs.Where(x => x.HANGSX.Contains(hangsx)).OrderByDescending(x => x.ID);
                sp = (from s in db.SANPHAMs where hangsx.Contains(s.HANGSX) select s).OrderByDescending(x => x.ID);
                if (gia != null)
                {
                    var listTien = GiaTien.getGiaTien().Where(x => x.Tenkhongdau.Equals(gia)).FirstOrDefault();
                    if (gia.Equals("tren-10-trieu"))
                    {
                        sp = (from s in db.SANPHAMs where hangsx.Contains(s.HANGSX) && s.GIABAN >= listTien.Giamin select s).OrderByDescending(x => x.ID);
                    }
                    else
                    {
                        sp = (from s in db.SANPHAMs where hangsx.Contains(s.HANGSX) && s.GIABAN >= listTien.Giamin && s.GIABAN < listTien.Giamax select s).OrderByDescending(x => x.ID);
                    }
                }
            }
            else
            {
                if (gia != null)
                {
                    var listTien = GiaTien.getGiaTien().Where(x => x.Tenkhongdau.Equals(gia)).FirstOrDefault();
                    if (gia.Equals("tren-10-trieu"))
                    {
                        sp = db.SANPHAMs.Where(x => x.GIABAN >= listTien.Giamin).OrderByDescending(x => x.ID);
                    }
                    else
                    {
                        sp = db.SANPHAMs.Where(x => x.GIABAN >= listTien.Giamin && x.GIABAN < listTien.Giamax).OrderByDescending(x => x.ID);
                    }
                }
            }
            dmsp.sanpham = sp.ToPagedList(pagenumber, pagesize);
            return View(dmsp);
        }
    }
}