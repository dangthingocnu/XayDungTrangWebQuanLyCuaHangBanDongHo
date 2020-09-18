CREATE DATABASE QL_ShopDongHo 
Use QL_ShopDongHo

Go
CREATE TABLE NHOM
(
MaNhom int IDENTITY(1,1),
TenNhom nvarchar(50),
Constraint pk_NHOM Primary Key(MaNhom)
)



CREATE TABLE LOAI
(
MaLoai int IDENTITY(1,1),
TenLoai nvarchar(50),
MaNhom int,
Constraint pk_LOAI Primary Key(MaLoai),
Constraint fk_LOAI_NHOM Foreign Key(MaNhom) references NHOM(MaNhom)
)


CREATE TABLE SANPHAM
(
MaSP int IDENTITY(1,1),
TenSP nvarchar(50),
GiaBan int,
MoTa nvarchar(max),
NgayCapNhat datetime,
AnhBia nvarchar(50),
SoLuongTon int ,
MaLoai int,
MaNhom int,
Constraint pk_SANPHAM Primary Key(MaSP),
Constraint fk_SANPHAM_LOAI Foreign Key(MaLoai) references LOAI(MaLoai),
Constraint fk_SANPHAM_NHOM Foreign Key(MaNhom) references NHOM(MaNhom)
)


CREATE TABLE KHACHHANG
(
MaKH int IDENTITY(1,1),
HoTen nvarchar(50),
NgaySinh datetime,
GioiTinh nvarchar(3),
DienThoai char(20),
TaiKhoan  nvarchar(50),
MatKhau nvarchar(50),
Email nvarchar(50),
DiaChi nvarchar(50),
Constraint pk_KHACHHANG Primary Key(MaKH)
)


CREATE TABLE DONHANG
(
MaDonHang int IDENTITY(1,1),
NgayGiao datetime,
NgayDat datetime,
DaThanhToan nvarchar(50),
TinhTrangGiaoHang nvarchar(50),
MaKH int,
Constraint pk_DONHANG Primary Key(MaDonHang),
Constraint fk_DONHANG_KHACHHANG Foreign Key(MaKH) references KHACHHANG(MaKH)
)


CREATE TABLE CHITIETDONHANG
(
MaDonHang int,
MaSP int,
SoLuong int,
DonGia int,
Constraint pk_CHITIETDONHANG Primary Key(MaDonHang,MaSP),
Constraint fk_CHITIETDONHANG_DONHANG Foreign Key(MaDonHang) references DONHANG(MaDonHang),
Constraint fk_CHITIETDONHANG_SANPHAM Foreign Key(MaSP) references SANPHAM(MaSP)
)
CREATE TABLE QUANLYADMIN
(
MaSo INT,
HoTen nvarchar(50),
TenDangNhap nvarchar(50),
MatKhau nvarchar(50),
SoDienThoai nvarchar(50),
Constraint PK_QUANLYADMIN Primary Key(MaSo)

)



--Nhap lieu--
--------------Nhóm----------------
INSERT INTO NHOM
VALUES(N'Đồng hồ thời trang'),
(N'Đồng hồ thông minh')
select * from NHOM

--------------Loại----------------
INSERT INTO LOAI
VALUES(N'Đồng hồ thời trang dành cho nam',1),
(N'Đồng hồ thời trang dành cho nữ',1),
(N'Apple',2),
(N'Samsung',2),
(N'Xiaomi',2),
(N'Huawei',2),
(N'Zeblaze',2),
(N'H2X',1),
(N'JULIUS',1),
(N'WEiDE',1),
(N'TIMEX',1)
select * from LOAI

--------------Sản phẩm----------------
set dateformat DMY
INSERT INTO SANPHAM
VALUES(N'Orient RASP0004L10B - Nam',3048000,N'Đường kính mặt: 39.8mm. Chất liệu mặt: kính cứng. Độ dày mặt: 9.6mm.Tiện ích: Lịch ngày','23/10/2019','h1.jpg',100,1,1),
(N'Fossil FS5501 - Nam',2391000,N'Đường kính mặt: 44mm. Chất liệu mặt: kính cứng. Độ dày mặt: 11mm.Chất liệu dây: Da','23/10/2019','h2.jpg',100,1,1),
(N'ICE 015773 - Nam',2400000,N'Đường kính mặt: 44mm. Chất liệu mặt: kính cứng. Độ dày mặt: 14.2mm.Chất liệu dây: Sillicon.','23/10/2019','h3.jpg',100,1,1),
(N'Kenneth Cole KC50585505 - Nam',2147000,N'Đường kính mặt: 43mm. Chất liệu mặt: kính cứng. Độ dày mặt: 11mm.Chất liệu dây: Hợp kim.','23/10/2019','h4.jpg',100,1,1),
(N'Fossil FS5415 - Nam',2391000,N'Đường kính mặt: 44mm. Chất liệu mặt: kính cứng. Độ dày mặt: 11.3mm. Chất liệu dây: Da.','23/10/2019','h5.jpg',100,1,1),
(N'ICE 016227 - Nam',1300000,N'Đường kính mặt: 41mm. Chất liệu mặt: kính cứng. Độ dày mặt: 6.3mm.Chất liệu dây: Da. Chống nước: rửa tay, đi mưa, tắm','23/10/2019','h6.jpg',100,1,1),
(N'Casio MRW-200H-2B3VDFB - Nam',776000,N'Đường kính mặt: 43mm. Chất liệu mặt: nhựa. Độ dày mặt: 11.8mm.Chất liệu dây: nhựa','23/10/2019','h7.jpg',100,1,1),
(N'Citizen EL3040-80A - Nữ',2120000,N'Đường kính mặt: 31.2mm. Chất liệu mặt: kính cứng. Độ dày mặt: 7.5mm.Chất liệu dây: thép không gỉ.','23/10/2019','h8.jpg',100,2,1),
(N'Fossil ES4313 - Nữ',2167000,N'Đường kính mặt: 33.5mm. Chất liệu mặt: kính cứng. Độ dày mặt: 8.4mm. Chất liệu dây: thép không gỉ.','23/10/2019','h9.jpg',100,2,1),
(N'MVMT D-MR01-SGR - Nữ',3200000,N'Đường kính mặt: 40mm. Chất liệu mặt: kính cứng. Độ dày mặt: 11mm. Chất liệu dây: da','23/10/2019','h10.jpg',100,2,1),
(N'Fossil ES3843 - Nữ',2488000,N'Đường kính mặt: 35.8mm. Chất liệu mặt: kính cứng. Độ dày mặt: 7.5mm. Chất liệu dây: thép không gỉ','23/10/2019','h11.jpg',100,2,1),
(N'Kenneth Cole KC50256003 - Nữ',1468000,N'Đường kính mặt: 28mm. Chất liệu mặt: kính cứng. Độ dày mặt: 7.7mm. Chất liệu dây: hợp kim.','23/10/2019','h12.jpg',100,2,1),
(N'Michael Kors MK2734 - Nữ',3240000,N'Đường kính mặt:28mm. Chất liệu mặt: kính cứng. Độ dày mặt: 7.7mm. Chất liệu dây: hợp kim','23/10/2019','h13.jpg',100,2,1),
(N'Casio LTP-1191A-7ADF - Nữ',1034000,N'Đường kính mặt: 25.6mm. Chất liệu mặt: kính cứng. Độ dày mặt: 9mm. Chất liệu dây: hợp kim.','23/10/2019','h14.jpg',100,2,1),
(N'Casio LTP-1183A-1ADF - Nữ',1034000,N'Đường kính mặt: 25.6mm. Chất liệu mặt: kính cứng. Độ dày mặt: 9mm. Chất liệu dây: hợp kim.','23/10/2019','h15.jpg',100,2,1),
(N'MVMT D-MB01-RGBL - Nữ',2640000,N'Đường kính mặt: 37.8mm. Chất liệu mặt: kính cứng. Độ dày mặt: 6.6mm. Chất liệu dây: thép không gỉ.','23/10/2019','h16.jpg',100,2,1),
(N'Apple Watch viền nhôm xám dây cao su',6640000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân, Nghe nhạc với tai nghe Bluetooth','23/10/2019','h17.jpg',100,3,2),
(N'Apple Watch viền nhôm dây cao su',6990000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân, Nghe nhạc với tai nghe Bluetooth','23/10/2019','h18.jpg',100,3,2),
(N'Apple Watch viền nhôm, dây cao su',5990000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân, Nghe nhạc với tai nghe Bluetooth','23/10/2019','h19.jpg',100,3,2),
(N'Apple Watch viền nhôm, dây cao su trắng',6640000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân, Nghe nhạc với tai nghe Bluetooth','23/10/2019','h20.jpg',100,3,2),
(N'Apple Watch viền nhôm dây vải',5990000,N'Tiện ích: Đo nhịp tim, Đếm số bước châ, Nghe nhạc với tai nghe Bluetooth','23/10/2019','h21.jpg',100,3,2),
(N'Apple Watch Viền Nhôm dây cao su',5990000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân, Nghe nhạc với tai nghe Bluetooth','23/10/2019','h22.jpg',100,3,2),
(N'Samsung Galaxy Watch 42mm',6640000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân, Chế độ luyện tập, Thay mặt đồng hồ...','23/10/2019','h23.jpg',100,4,2),
(N'Samsung Galaxy watch 46mm',6640000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân, Nghe nhạc với tai nghe Bluetooth, Thay mặt đồng hồ...','23/10/2019','h24.jpg',100,4,2),
(N'Samsung Gear Fit2 Pro',3790000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân, Nghe nhạc với tai nghe Bluetooth, Thay mặt đồng hồ...','23/10/2019','h25.jpg',100,4,2),
(N'Samsung Galaxy Watch Active R500',5215000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân, Nghe nhạc với tai nghe Bluetooth','23/10/2019','h26.jpg',100,4,2),
(N'Samsung Galaxy Fit e',940000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân,  Nghe nhạc với tai nghe Bluetooth, Thay mặt đồng hồ...','23/10/2019','h27.jpg',100,4,2),
(N'Mi Band 3',560000,N'Công nghệ màn hình: OLED. Kích thước màn hình: 0.78 inch.Tiện ích: Đếm số bước chân','23/10/2019','h28.jpg',100,5,2),
(N'Xiaomi Amazfit Pace GPS',3400000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân, Nghe nhạc với tai nghe Bluetooth','23/10/2019','h29.jpg',100,5,2),
(N'Xiaomi Amazfit Bip',1520000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân Nghe nhạc với tai nghe Bluetooth, Thay mặt đồng hồ...','23/10/2019','h30.jpg',100,5,2),
(N'Huawei Watch GT Active Edition',3790000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân, Nghe nhạc với tai nghe Bluetooth','23/10/2019','h31.png',100,6,2),
(N'Huawei Watch GT2 42mm dây da',5490000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân, Nghe nhạc với tai nghe Bluetooth','23/10/2019','h32.jpg',100,6,2),
(N'Huawei Watch GT2 42mm ',6390000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân, Nghe nhạc với tai nghe Bluetooth','23/10/2019','h33.jpg',100,6,2),
(N'Huawei Watch GT2 46mm dây Silicone ',5490000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân, Nghe nhạc với tai nghe Bluetooth,','23/10/2019','h34.jpg',100,6,2),
(N'Colmi CY7 đen',655000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân, Nghe nhạc với tai nghe Bluetooth, Thay mặt đồng hồ...','23/10/2019','h35.jpg',100,7,2),
(N'Colmi S9 Plus',750000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân, Nghe nhạc với tai nghe Bluetooth, Thay mặt đồng hồ...','23/10/2019','h36.jpg',100,7,2),
(N'Zeblaze VIBE 3 HR',560000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân, Nghe nhạc với tai nghe Bluetooth, Thay mặt đồng hồ...','23/10/2019','h37.jpg',100,7,2),
(N'Zeblaze Crystal 2',560000,N'Tiện ích: Đo nhịp tim, Đếm số bước chân, Nghe nhạc với tai nghe Bluetooth, Thay mặt đồng hồ...','23/10/2019','h38.jpg',100,7,2),
(N'H2X P-SA430UA1',880000,N'Đường kính mặt: 42 mm. Chất liệu mặt: Kính khoáng (Mineral). Chất liệu dây: Cao su.','23/10/2019','h39.jpg',100,8,1),
(N'H2X P-SB430UB6',880000,N'Đường kính mặt: 42 mm. Chất liệu mặt: Kính khoáng (Mineral). Chất liệu dây: Cao su.','23/10/2019','h40.jpg',100,8,1),
(N'H2X P-SY430UN2',880000,N'Đường kính mặt: 42 mm. Chất liệu mặt: Kính khoáng (Mineral). Chất liệu dây: Cao su.','23/10/2019','h41.jpg',100,8,1),
(N'H2X P-SO430DO2',880000,N'Đường kính mặt: 42 mm. Chất liệu mặt: Kính khoáng (Mineral). Chất liệu dây: Cao su.','23/10/2019','h42.jpg',100,8,1),
(N'Weide WH6103-3C-Nam',1408000,N'Đường kính mặt: 50 mm. Chất liệu mặt: Kính khoáng (Mineral). Chất liệu dây: Vải','23/10/2019','h43.jpg',100,10,1),
(N'Weide WH6903-2C-Nam',1480000,N'Đường kính mặt: 50 mm. Chất liệu mặt: Kính khoáng (Mineral).. Chất liệu dây: Vải','23/10/2019','h44.jpg',100,10,1),
(N'Julius Start JS-027C-Nữ',1599000,N'Đường kính mặt: 37 mm. Chất liệu mặt: Kính khoáng (Mineral), Chất liệu khung viền: Hợp kim.','23/10/2019','h45.jpg',100,9,1),
(N'Julius Start JS-009LD-Nữ',1225000,N'Đường kính mặt: 37 mm. Chất liệu mặt:	Kính khoáng (Mineral), Chất liệu khung viền: Hợp kim.','23/10/2019','h46.jpg',100,9,1),
(N'Julius Start JS-031D-Nữ',1759000,N'Đường kính mặt: 37 mm. Chất liệu mặt: Kính khoáng (Mineral), Chất liệu khung viền: Hợp kim.','23/10/2019','h47.jpg',100,9,1),
(N'Julius Start JS-063C-Nữ',1599000,N'Đường kính mặt: 37 mm. Chất liệu mặt: Kính khoáng (Mineral), Chất liệu khung viền: Hợp kim.','23/10/2019','h48.jpg',100,9,1),
(N'Timex TW2T29700 - Unisex',3984000,N'Đường kính mặt: 42 mm. Chất liệu mặt:	Kính Acrylic (thủy tinh hữu cơ).','23/10/2019','h49.jpg',100,11,1),
(N'Timex TW2R81300 - Unisex',3760000,N'Đường kính mặt: 42 mm. Chất liệu mặt:	Kính Acrylic (thủy tinh hữu cơ).','23/10/2019','h50.jpg',100,11,1),
(N'Timex TW2T10600 - Unisex',3488000,N'Đường kính mặt: 42 mm. Chất liệu mặt:	Kính Acrylic (thủy tinh hữu cơ).','23/10/2019','h51.jpg',100,11,1)
select * from SANPHAM
SET IDENTITY_INSERT LOAI OFF
SET IDENTITY_INSERT SANPHAM ON
--------------Khách Hàng----------------
set dateformat DMY
INSERT INTO KHACHHANG
VALUES(N'Nguyễn Võ Minh Hiền','03/08/1998',N'Nam','0987567931','minhin','123','mh@gmail.com',N'Q4,TPHCM'),
(N'Vũ Trung Ninh','10/06/1992',N'Nam','0987545631','trungninh','456','tn@gmail.com',N'Lăng Cô,Huế'),
(N'Nguyễn Quang Đạt','11/03/1991',N'Nam','0977667931','datiway','789','qd@gmail.com',N'Q1,TPHCM'),
(N'Nguyễn Thị Thu Hoài','20/11/1979',N'Nữ','0987566661','thuhoai','12345','th@gmail.com',N'Q2,TPHCM'),
(N'Nguyễn Vi Thịnh','22/11/1999',N'Nam','0987699931','vithinh','98765','vt@gmail.com',N'Q7,TPHCM')

select * from KHACHHANG

--------------Đơn hàng----------------

INSERT INTO DONHANG
VALUES('25/10/2019','24/10/2019',null,null,1),
(N'26/10/2018','25/10/2019',null,null,2),
(N'25/10/2019','24/10/2019',null,null,3),
(N'1/11/2019','24/10/2019',null,null,4),
(N'2/11/2019','25/10/2019',null,null,5)

select * from DONHANG

--------------Chi Tiết đơn Hàng----------------

INSERT INTO CHITIETDONHANG
VALUES(1,1,1,3048000),
(1,2,1,2391000),
(3,4,1,2147000),
(4,5,1,2391000),
(4,4,1,2147000)

select * from CHITIETDONHANG


--------------Admin------------------------------
INSERT INTO QUANLYADMIN
VALUES(1,N'Vũ Anh Tuấn Tú',N'anhtu',N'anhtu123',N'093457579')

select * from	QUANLYADMIN
