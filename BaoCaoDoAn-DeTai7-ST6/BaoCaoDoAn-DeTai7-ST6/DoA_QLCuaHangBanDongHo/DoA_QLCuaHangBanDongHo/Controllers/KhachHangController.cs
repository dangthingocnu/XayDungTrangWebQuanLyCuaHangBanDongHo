using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoA_QLCuaHangBanDongHo.Models;
namespace DoA_QLCuaHangBanDongHo.Controllers
{
    public class KhachHangController : Controller
    {
        //
        // GET: /KhachHang/
        QuanLyDongHoDataContext dh = new QuanLyDongHoDataContext();
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(FormCollection c, KHACHHANG kh)
        {
             if (String.IsNullOrEmpty(c["txthoten"]))
            {
                ViewData["Loi1"] = "Họ tên không được để trống";
            }
            if (String.IsNullOrEmpty(c["txttendn"]))
            {
                ViewData["Loi2"] = "Phải nhập tên đăng nhập";
            }
            if (String.IsNullOrEmpty(c["txtmatkhau"]))
            {
                ViewData["Loi3"] = "Phải nhập mật khẩu";
            }
            if (String.IsNullOrEmpty(c["txtdiachi"]))
            {
                ViewData["Loi4"] = "Phải nhập Địa chỉ";
            }
            if (String.IsNullOrEmpty(c["txtemail"]))
            {
                ViewData["Loi5"] = "Email không được để trống";
            }
            if (String.IsNullOrEmpty(c["txtdienthoai"]))
            {
                ViewData["Loi6"] = "Phải nhập điện thoại";
            }
            if (String.IsNullOrEmpty(c["txtngaysinh"]))
            {
                ViewData["Loi7"] = "Phải nhập ngày sinh";
            }
            else
            {
              
                kh.HoTen = c["txthoten"];
                var ngaysinh = String.Format("{0:MM/dd/yyyy}", c["txtngaysinh"]);
                kh.NgaySinh = DateTime.Parse(ngaysinh);
                kh.GioiTinh = c["txtgioitinh"];
                kh.DienThoai = c["txtdienthoai"];
                kh.TaiKhoan = c["txttendn"];
                kh.MatKhau = c["txtmatkhau"];
                kh.Email = c["txtemail"];
                kh.DiaChi = c["txtdiachi"];


                dh.KHACHHANGs.InsertOnSubmit(kh);
                dh.SubmitChanges();
                return RedirectToAction("DangNhap");
            }
            return this.DangKy();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection c)
        {
            var a = c["txttendn"];
            var b = c["txtmatkhau"];
            if (String.IsNullOrEmpty(a))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            }
            if (String.IsNullOrEmpty(b))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu";
            }
            else
            {
                KHACHHANG k = dh.KHACHHANGs.SingleOrDefault(t => t.TaiKhoan == a && t.MatKhau == b);
                if (k != null)
                {
                    Session["luu"] = k;
                    Session["dn"] = k.HoTen;
                    return RedirectToAction("Index", "Home");
                }
                else
                    ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return View();
        }
        public ActionResult DangXuat()
        {
            if (((Session["luu"]== null) || (Session["luu"].ToString() == "")) && ((Session["dn"] == null) || (Session["dn"].ToString() == "")))
            {
                return RedirectToAction("DangNhap", "KhachHang");
            }
            Session["luu"] = null;
            Session["dn"] = null;
            Session["gh"] = null;
            return RedirectToAction("Index", "Home");
        }
    }
}
