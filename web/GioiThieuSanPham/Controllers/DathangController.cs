using GioiThieuSanPham.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace GioiThieuSanPham.Controllers
{
    public class DatHangController : Controller
    {
        QLSANPHAMEntities db = new QLSANPHAMEntities();
        // GET: Dathang
        bool sendMail(string emailKH, string tenSP)
        {
            // //đăng nhập mail để gửi
            string email = ConfigurationManager.AppSettings["mail"].ToString();
            string pass = ConfigurationManager.AppSettings["pass"].ToString();

            //gán thông tin
            var mess = new MailMessage(email, emailKH);
            mess.Subject = "Đây là mail tự động.";
            string text = string.Empty;
            int i = 1;
            text = String.Format(@"Chúc mừng bạn đã đặt hàng sản phẩm: {0} thành công vào lúc {1}.Xin cảm ơn.", tenSP, DateTime.Now);
            mess.Body = text;
            //cho gửi định dạng html
            mess.IsBodyHtml = true;
            //cấu hình mail
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            //gửi mail đi
            NetworkCredential net = new NetworkCredential(email, pass);
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = net;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            try
            {
                smtp.Send(mess);
            }
            catch (SmtpException ex)
            {
                return false;
            }
            return true;
        }
        [HttpPost]
        public JsonResult Index(int masp, string email)
        {
            try
            {
                SANPHAM sp = db.SANPHAMs.Where(x => x.ID == masp).FirstOrDefault();
                if (sp.TRANGTHAI == false)
                    return Json(-1);
                if (sendMail(email, sp.TENSANPHAM))
                {
                    TIMHIEUSANPHAM thsp = new TIMHIEUSANPHAM();
                    
                    thsp.MASP = masp;
                    thsp.NGAYTAO =DateTime.Parse(DateTime.Now.ToShortDateString());
                    thsp.EMAIL = email;
                    db.TIMHIEUSANPHAMs.Add(thsp);
                    db.SaveChanges();
                    return Json(1);
                }
            }
            catch (Exception ex)
            {
                return Json(0);
            }
            return Json(0);

        }

    }
}