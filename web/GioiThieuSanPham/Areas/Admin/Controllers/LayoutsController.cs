using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GioiThieuSanPham.Models;

namespace GioiThieuSanPham.Areas.Admin.Controllers
{
    public class LayoutsController : Controller
    {
        QLSANPHAMEntities db = new QLSANPHAMEntities();
        // GET: Admin/Layouts
        public ActionResult _NavBar()
        {
                var id = Convert.ToInt32(Session["id"].ToString());
                var accounts = db.ACCOUNTs.FirstOrDefault(x => x.ID == id);
                return PartialView(accounts);
        }
    }
}