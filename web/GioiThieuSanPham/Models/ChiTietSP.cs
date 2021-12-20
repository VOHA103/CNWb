using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GioiThieuSanPham.Models
{
        public class ChiTietSP
        {
            public SANPHAM sanPham { get; set; }
            public DANHMUC danhMuc { get; set; }
            public List<CHITIETSANPHAM> lstChiTietSP { get; set; }
            public List<SANPHAM> sanPhamCungDanhMuc { get; set; }
        }
}