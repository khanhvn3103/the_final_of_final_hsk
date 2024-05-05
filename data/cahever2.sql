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

-----------
create table SANPHAM
	(maSanPham nvarchar(50) Not Null primary key,
	tenSanPham nvarchar(50) Not Null,
	soLuong int not null)
------------
create table BAN
	(maBan nvarchar(50) not null primary key,
	tinhTrang nvarchar(50))
--------------
create table HOADON
	(maHoaDon nvarchar(50) not null primary key,
	tongTien float not null,
	ngayBan Date,
	maNhanVien nvarchar(50) not null,
	maBan nvarchar(50) not null,
	foreign key (maNhanVien) references NHANVIEN(maNhanVien),
	foreign key (maBan) references BAN(maBan)
	)

-------------------------------
create table KHACHHANG
	(maKhachHang nvarchar(50) not null primary key,
	tenKhachHang nvarchar(50),
	diaChi nvarchar(50),
	soDienThoai nvarchar(50),
	chiTieu float,
	
	)
-------------------
create table DOUONG
	(maDoUong nvarchar(50) not null primary key,
	tenDoUong nvarchar(50) not null,
	giaTien Money not null,
	loaiDoUong nvarchar(50) not null,
	)
-------------------


----------------------

create table CHITIETHOADON 
	(maHoaDon nvarchar(50) not null,
	maKhachHang nvarchar(50) not null,
	maDoUong nvarchar(50) not null,
	soLuong Smallint check (soluong>0),
	donGia Money,
	primary key(maKhachHang,maDoUong,maHoaDon),
	foreign key (maHoaDon) references HOADON (maHoaDon),
	foreign key (maKhachHang) references KHACHHANG (maKhachHang),
	foreign key (maDoUong) references DOUONG (maDoUong),
	)

create table CHITIETDOUONG
	(maSanPham NVARCHAR(50) NOT NULL,
    maDoUong NVARCHAR(50) NOT NULL,
    soLuong INT NOT NULL,
    PRIMARY KEY (maSanPham, maDoUong),
    FOREIGN KEY (maSanPham) REFERENCES SANPHAM (maSanPham),
    FOREIGN KEY (maDoUong) REFERENCES DOUONG (maDoUong))
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




-- Insert data into TAIKHOAN
INSERT INTO TAIKHOAN (tenTK, matKhau) VALUES
('user1', 'password1'),
('user2', 'password2'),
('user3', 'password3'),
('user4', 'password4'),
('user5', 'password5');

-- Insert data into NHANVIEN
INSERT INTO NHANVIEN (maNhanVien, tenNhanVien, diaChi, soDienThoai, luong, chucVu, tenTK) VALUES
('NV001', 'Nguyen Van A', '123 ABC Street', '0123456789', 10000000, 'Quan ly', 'user1'),
('NV002', 'Tran Thi B', '456 XYZ Street', '0987654321', 8000000, 'Nhan vien', 'user2'),
('NV003', 'Le Van C', '789 DEF Street', '0369852147', 12000000, 'Thu ngan', 'user3'),
('NV004', 'Pham Thi D', '111 GHI Street', '0321456987', 9000000, 'Nhan vien', 'user4'),
('NV005', 'Hoang Van E', '222 JKL Street', '0987456123', 11000000, 'Quan ly', 'user5');

-- Insert data into SANPHAM
INSERT INTO SANPHAM (maSanPham, tenSanPham, soLuong) VALUES
('SP001', 'San Pham 1', 50),
('SP002', 'San Pham 2', 100),
('SP003', 'San Pham 3', 75),
('SP004', 'San Pham 4', 30),
('SP005', 'San Pham 5', 80);

-- Insert data into BAN
INSERT INTO BAN (maBan, tinhTrang) VALUES
('B001', 'Trong'),
('B002', 'Da dat truoc'),
('B003', 'Dang su dung'),
('B004', 'Trong'),
('B005', 'Da dat truoc');

-- Insert data into KHACHHANG
INSERT INTO KHACHHANG (maKhachHang, tenKhachHang, diaChi, soDienThoai, chiTieu) VALUES
('KH001', 'Nguyen Van Khach 1', '123 ABC Street', '0123456789', 500000),
('KH002', 'Tran Thi Khach 2', '456 XYZ Street', '0987654321', 700000),
('KH003', 'Le Van Khach 3', '789 DEF Street', '0369852147', 300000),
('KH004', 'Pham Thi Khach 4', '111 GHI Street', '0321456987', 900000),
('KH005', 'Hoang Van Khach 5', '222 JKL Street', '0987456123', 1100000);

-- Insert data into DOUONG
INSERT INTO DOUONG (maDoUong, tenDoUong, giaTien, loaiDoUong, maSanPham) VALUES
('DU001', 'Cafe Sua', 25000, 'Coffee', 'SP001'),
('DU002', 'Tra Da', 15000, 'Tea', 'SP002'),
('DU003', 'Nuoc Cam', 20000, 'Juice', 'SP003'),
('DU004', 'Sinh To Bo', 35000, 'Smoothie', 'SP004'),
('DU005', 'Nuoc Suoi', 10000, 'Water', 'SP005');

-- Insert data into HOADON
INSERT INTO HOADON (maHoaDon, maBan, maNhanVien,ngayBan, tongTien) VALUES
('HD001', 'B001', 'NV001', GETDATE(), 100000),
('HD002', 'B002', 'NV002', GETDATE(), 45000*3),
('HD003', 'B003', 'NV003', GETDATE(), 20000),
('HD004', 'B004', 'NV004', GETDATE(), 70000*2),
('HD005', 'B005', 'NV005', GETDATE(), 40000*4);

-- Insert data into CHITIETHOADON
INSERT INTO CHITIETHOADON (maHoaDon, maKhachHang, maDoUong, soLuong, donGia) VALUES
('HD001', 'KH001', 'DU001', 2, 50000),
('HD002', 'KH002', 'DU002', 3, 45000),
('HD003', 'KH003', 'DU003', 1, 20000),
('HD004', 'KH004', 'DU004', 2, 70000),
('HD005', 'KH005', 'DU005', 4, 40000);


