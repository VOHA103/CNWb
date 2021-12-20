using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace GioiThieuSanPham
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
  name: "DatHang",
  url: "dat-hang",
  defaults: new { controller = "DatHang", action = "Index" },
  namespaces: new[] { "GioiThieuSanPham.Controllers" }
  );
            routes.MapRoute(
name: "Search",
url: "tim-kiem",
defaults: new { controller = "DanhMucSP", action = "Search" },
 namespaces: new[] { "GioiThieuSanPham.Controllers" }
);
            routes.MapRoute(
name: "ChiTietSP",
url: "{alias}/{alia}",
defaults: new { controller = "ChiTietSP", action = "Index" },
 namespaces: new[] { "GioiThieuSanPham.Controllers" }
);
            routes.MapRoute(
                name: "DanhMucSP",
                url: "{alias}",
                defaults: new { controller = "DanhMucSP", action = "Index", id = UrlParameter.Optional },
                 namespaces: new[] { "GioiThieuSanPham.Controllers" }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                 namespaces: new[] { "GioiThieuSanPham.Controllers" }
            );
        }
    }
}
