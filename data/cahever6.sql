create database QLCP

------------------
use QLCP

create table TAIKHOAN 
	(tenTK nvarchar(50) not null primary key,
	matKhau nvarchar(50) not null)

----------------
create table NHANVIEN
	(maNhanVien nvarchar(50) not null primary key,
	tenNhanVien nvarchar(50) not null,
	diaChi nvarchar(50),
	soDienThoai nvarchar(50),
	luong float not null,
	chucVu nvarchar(50) not null,
	tenTK nvarchar(50) not null
	foreign key (tenTK) references TAIKHOAN(tenTK)
	)
-------------------------------
create table KHACHHANG
	(maKhachHang nvarchar(50) not null primary key,
	tenKhachHang nvarchar(50),
	diaChi nvarchar(50),
	soDienThoai nvarchar(50),
	diemTichLuy float,
	
	)
	--Chi tieu thanh diem tich luy
-----------
create table NGUYENLIEU
	(maNguyenLieu nvarchar(50) Not Null primary key,
	tenNguyenLieu nvarchar(50) Not Null,
	soLuong int not null,
	donVi nvarchar(50) constraint CK_DonVi check (donVi IN('Kg', 'chai', 'lít', 'thùng' ))

	)
------------
create table THE
	(soThe int not null primary key,
	tinhTrang nvarchar(50))
--------------
create table HOADON
	(maHoaDon nvarchar(50) not null primary key,
	tongTien float not null,
	ngayBan Date,
	maNhanVien nvarchar(50) not null,
	maKhachHang nvarchar(50),
	soThe int not null,
	foreign key (maNhanVien) references NHANVIEN(maNhanVien),
	foreign key (soThe) references THE(soThe),
	foreign key (maKhachHang) references KHACHHANG (maKhachHang)
	)


-------------------
create table DOUONG
	(maDoUong nvarchar(50) not null primary key,
	tenDoUong nvarchar(50) not null,
	giaTien Money not null,
	loaiDoUong nvarchar(50) not null,	
	)
-------------------
create table CHITIETDOUONG
	(soLuong int,
	maDoUong nvarchar(50) not null,
	maNguyenLieu nvarchar(50) not null,
	primary key (maDoUong,maNguyenLieu),
	foreign key (maDoUong) references DOUONG(maDoUong),
	foreign key (maNguyenLieu) references NGUYENLIEU(maNguyenLieu)
	)
		
----------------------

create table CHITIETHOADON 
	(maHoaDon nvarchar(50) not null,
	maDoUong nvarchar(50) not null,
	soLuong int check (soluong>0),
	donGia Money,
	primary key(maDoUong,maHoaDon),
	foreign key (maHoaDon) references HOADON (maHoaDon),
	foreign key (maDoUong) references DOUONG (maDoUong),
	)
-------------
--create table NHACUNGCAP 
--	(maNhaCungCap nvarchar(50) Not Null primary key,
--	TenNCC nvarchar(50) Not Null,
--	DiaChi nvarchar(50),
--	Phone nvarchar(50),
--	DMail nvarchar(50))

----------

--create table PHIEUDAT 
--	(maPhieuDat nvarchar(50) not null,
--	maNhanVien nvarchar(50) not null,
--	maNhaCungCap nvarchar(50) not null,
--	maSanPham nvarchar(50) not null,
--	soLuong Smallint check (soluong>0),
--	donGia Money,
--	ngaNhap Date,
--	primary key(maPhieuDat),
--	foreign key (maNhanVien) references NHANVIEN (maNhanVien),
--	foreign key (maNhaCungCap) references NHACUNGCAP (maNhaCungCap),
--	foreign key (maSanPham) references SANPHAM (maSanPham))



-- Tạo dữ liệu cho bảng TAIKHOAN
INSERT INTO TAIKHOAN (tenTK, matKhau)
VALUES 
    ('user1', 'password1'),
    ('user2', 'password2'),
    ('admin', 'adminpassword');

-- Tạo dữ liệu cho bảng NHANVIEN
INSERT INTO NHANVIEN (maNhanVien, tenNhanVien, diaChi, soDienThoai, luong, chucVu, tenTK)
VALUES 
    ('NV001', 'Nguyen Van A', '123 ABC Street', '0123456789', 10000000, 'Nhan vien', 'user1'),
    ('NV002', 'Tran Thi B', '456 XYZ Street', '0987654321', 12000000, 'Nhan vien', 'user2'),
    ('NV003', 'Le Van C', '789 DEF Street', '0123456789', 15000000, 'Quan ly', 'admin');

-- Tạo dữ liệu cho bảng KHACHHANG
INSERT INTO KHACHHANG (maKhachHang, tenKhachHang, diaChi, soDienThoai, diemTichLuy)
VALUES 
    ('KH001', 'Customer 1', '123 ABC Street', '0123456789', 50),
    ('KH002', 'Customer 2', '456 XYZ Street', '0987654321', 100),
    ('KH003', 'Customer 3', '789 DEF Street', '0123456789', 200);

-- Tạo dữ liệu cho bảng NGUYENLIEU

INSERT INTO NGUYENLIEU (maNguyenLieu, tenNguyenLieu, soLuong, donVi) VALUES 
		('NL001', N'Đường', 20, 'Kg'),
       ('NL002', N'Sữa', 100, 'chai'),
       ('NL003', N'Cream', 50, 'chai'),
       ('NL004', N'Nước Ngọt', 30, 'thùng');

-- Tạo dữ liệu cho bảng THE
INSERT INTO THE (soThe, tinhTrang)
VALUES 
    (1, 'Trong'),
    (2, 'Trong'),
    (3, 'Da co khach'),
	(4, 'Trong');

-- Tạo dữ liệu cho bảng DOUONG
INSERT INTO DOUONG (maDoUong, tenDoUong, giaTien, loaiDoUong)
VALUES 
    ('DU001', 'Cappuccino', 30000, 'Coffee'),
    ('DU002', 'Latte', 35000, 'Coffee'),
    ('DU003', 'Smoothie', 40000, 'Non-coffee');

-- Tạo dữ liệu cho bảng CHITIETDOUONG
INSERT INTO CHITIETDOUONG (soLuong, maDoUong, maNguyenLieu)
VALUES 
    (1, 'DU001', 'NL001'),
    (2, 'DU001', 'NL002'),
    (1, 'DU002', 'NL001'),
    (1, 'DU002', 'NL002'),
    (1, 'DU002', 'NL003'),
    (1, 'DU003', 'NL002'),
    (2, 'DU003', 'NL003');

-- Tạo dữ liệu cho bảng HOADON
INSERT INTO HOADON (maHoaDon, tongTien, ngayBan, maNhanVien, maKhachHang, soThe)
VALUES 
    ('HD001', 100000, '2024-04-01', 'NV001', 'KH001', 1),
    ('HD002', 150000, '2024-04-02', 'NV002', 'KH002', 2),
    ('HD003', 200000, '2024-04-03', 'NV003', 'KH003', 3);

-- Tạo dữ liệu cho bảng CHITIETHOADON
INSERT INTO CHITIETHOADON (maHoaDon, maDoUong, soLuong, donGia)
VALUES 
    ('HD001', 'DU001', 2, 60000),
    ('HD001', 'DU002', 1, 35000),
    ('HD002', 'DU001', 1, 30000),
    ('HD002', 'DU002', 1, 35000),
    ('HD002', 'DU003', 1, 40000),
    ('HD003', 'DU002', 2, 70000),
    ('HD003', 'DU003', 1, 40000);

