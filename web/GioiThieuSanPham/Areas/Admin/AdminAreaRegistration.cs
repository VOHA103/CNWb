using System.Web.Mvc;

namespace GioiThieuSanPham.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Login",
                "dang-nhap",
                new { action = "Login", controller = "Accounts", id = UrlParameter.Optional },
                namespaces: new[] { "GioiThieuSanPham.Areas.Admin.Controllers" }
            );
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                defaults:new { action = "Index",controller="SANPHAMs", id = UrlParameter.Optional },
                namespaces:new[] { "GioiThieuSanPham.Areas.Admin.Controllers" }
            );
        }
    }
}