using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;

namespace GioiThieuSanPham.Models
{
    public class DanhMucSanPham
    {
        public PagedList.IPagedList<SANPHAM> sanpham { get; set; }
        public List<DANHMUC> danhmuc { get; set; }
        public List<string> hangsx { get; set; }
        public DANHMUC danhmucsp { get; set; }
    }
}