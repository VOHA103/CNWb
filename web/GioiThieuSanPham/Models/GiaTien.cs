using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GioiThieuSanPham.Models
{
    public class GiaTien
    {
        string ten;
        int giamin;
        int giamax;
        string tenkhongdau;
        public string Ten { get; set; }
        public int Giamin { get; set; }
        public int Giamax { get; set; }
        public string Tenkhongdau { get; set; }
        public static List<GiaTien> getGiaTien()
        {
            List<GiaTien> lst = new List<GiaTien>();
            lst.Add(new GiaTien
            {
                Ten = "Dưới 1 triệu",
                Tenkhongdau = "duoi-1-trieu",
                Giamin=0,
                Giamax=1000000
            });
            lst.Add(new GiaTien
            {
                Ten = "1 triệu đến 5 triệu",
                Tenkhongdau = "1-trieu-den-5-trieu",
                Giamin = 1000000,
                Giamax = 5000000
            });
            lst.Add(new GiaTien
            {
                Ten = "5 triệu đến 10 triệu",
                Tenkhongdau = "5-trieu-den-10-trieu",
                Giamin = 5000000,
                Giamax = 10000000
            });
            lst.Add(new GiaTien
            {
                Ten = "Trên 10 triệu",
                Tenkhongdau = "tren-10-trieu",
                Giamin = 10000000,
                Giamax = 0
            });
            return lst;
        }
    }
}