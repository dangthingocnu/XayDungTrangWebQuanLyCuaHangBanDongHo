using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoA_QLCuaHangBanDongHo.Models;
namespace DoA_QLCuaHangBanDongHo.Controllers
{
    public class ThongKeController : Controller
    {
        //
        // GET: /ThongKe/
        QuanLyDongHoDataContext db = new QuanLyDongHoDataContext();
        public ActionResult Index()
        {         
            ViewBag.ThongKeDoanhThu = ThongKeDoanhThu();// thống kê doanh thu
            ViewBag.ThongKeDonHang = ThongKeDonHang(); // thống kê đơn hàng
            ViewBag.ThongKeSanPham = ThongKeSanPham(); // thống kê số lượng sản phẩm tồn
          
            ViewBag.ThongKeLoaiSanPham = ThongKeLoaiSanPham();
            return View();
        }
        public decimal ThongKeDoanhThu()
        {

            decimal TongDoanhThu =decimal.Parse( db.CHITIETDONHANGs.Sum(n =>n.SoLuong* n.DonGia).Value.ToString());
            return TongDoanhThu; // thống kê tổng doanh thu
        }
        public double ThongKeDonHang()
        {
            // đếm đơn đặt hàng
            double slddh = db.DONHANGs.Count();
            return slddh;
        }


        public double ThongKeLoaiSanPham()
        {
            // đếm đơn đặt hàng
            double slncc = db.LOAIs.Count();
            return slncc;
        }
        public int ThongKeSanPham()
        {
            // đếm số lượng sản phẩm
            int sanpham = db.SANPHAMs.Sum(n => n.SoLuongTon).Value;
            return sanpham;
        }


        public decimal ThongKeDoanhThuTheoThang(int Thang, int Nam)
        {
            //thống kê tất cả doanh thu
            // list ra don dat hang có ngày tháng năm tương ứng
            var lstDDH = db.DONHANGs.Where(n => n.NgayDat.Value.Month == Thang && n.NgayDat.Value.Year == Nam);
            decimal TongTien = 0;
            foreach (var item in lstDDH)
            {
                TongTien += decimal.Parse(item.CHITIETDONHANGs.Sum(n => n.SoLuong * n.DonGia).Value.ToString());
            }
            return TongTien;
        }
	}
}