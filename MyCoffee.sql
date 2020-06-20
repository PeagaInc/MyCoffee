use master;
create database MyCoffee;
use MyCoffee;

create table TaiKhoan
(
	TenDangNhap char(5) primary key,
	MatKhau nvarchar(50),
	VaiTro bool
);

create table TheLoai
(
	MaLoai char(5) primary key,
	TenLoai nvarchar(50)
);


create table NhanVien
(
	TenDangNhap varchar(30) primary key,
	MatKhau varchar(30),
	HoTen nvarchar(50),
	SoDT varchar(10) unique,
	Email varchar(50) unique,
	DiaChi nvarchar(50),
    ChucVu nvarchar(50)
)


create table SanPham
(
	MaSP char(5) primary key,
	TenSP nvarchar(50),
	Gia float default 0,
	MoTa nvarchar(50),
	Hinh varchar(50),
	MaLoai char(5) foreign key references TheLoai (MaLoai)
);




create table GioHang
(
	MaGH char(5) primary key,
	MaKH int foreign key references KhachHang (MaKH),
	NgayLap date default getdate(),
)
go

create table CT_GioHang
(
	MaGH char(5) foreign key references GioHang (MaGH),
	MaSP char(5) foreign key references SanPham (MaSP),
	SoLuong int default 0,
	primary key (MaGH, MaSP)
)
go

-- The loai
insert into TheLoai values('SS', N'SamSung')
insert into TheLoai values('AP', N'Apple')
insert into TheLoai values('OP', N'Oppo')
insert into TheLoai values('XM', N'Xiaomi')
insert into TheLoai values('HW', N'Huawei')

-- San Pham
set dateformat DMY
insert into SanPham values('SP01', N'Galaxy S10', 1447, N'SamSung Galaxy S10 128GB', 'SamSungGalaxyS10.png', 'SS')
insert into SanPham values('SP02', N'Galaxy A50', 580, N'SamSung Galaxy A50 màn hình 6.8"', 'GalaxyA50.png', 'SS')
insert into SanPham values('SP03', N'Note 5 ', 1127, N'SamSung  Note 5 siêu rẻ', 'Note5.png', 'SS')

insert into SanPham values('SP04', N'Iphone Xs Max', 1230, N'Iphone Xs Max 64GB', 'IphoneXsMax.png', 'AP')
insert into SanPham values('SP05', N'Iphone 8', 1980, N'Iphone 8 siểu rẻ', 'Iphone8.png', 'AP')
insert into SanPham values('SP06', N'Iphone 11', 2690, N'Iphone 11 có 3 camare', 'Iphone11.png', 'AP')

insert into SanPham values('SP07', N'OPPO R17 Pro', 1110, N'OPPO R17 Pro', 'OPPOR17Pro.png', 'OP')
insert into SanPham values('SP08', N'OPPO F9', 690, N'OPPO F9', 'OPPOF9.png', 'OP')
insert into SanPham values('SP09', N'OPPO K3', 590, N'OPPO K3', 'OPPOK3.png', 'OP')

insert into SanPham values('SP10', N'Xiaomi Mi 9 SE', 890, N'Xiaomi Mi 9 SE', 'XiaomiMi9SE.png', 'XM')
insert into SanPham values('SP11', N'Xiaomi Redmi Note 7', 590, N'Xiaomi Redmi Note 7', 'XiaomiRedmiNote7.png', 'XM')
insert into SanPham values('SP12', N'Xiaomi Mi A3', 690, N'Xiaomi Mi A3', 'XiaomiMiA3.png', 'XM')

insert into SanPham values('SP13', N'Huawei P30 Pro', 2300, N'Huawei P30 Pro', 'HuaweiP30Pro.png', 'HW')
insert into SanPham values('SP14', N'Huawei Y9 Prime', 690, N'Huawei Y9 Prime', 'HuaweiY9Prime.png', 'HW')
insert into SanPham values('SP15', N'Huawei Nova 3i', 590, N'Huawei Nova 3i', 'HuaweiNova3i.png', 'HW')

--Tài khoản
insert into TaiKhoan values('test7', '123', 1)
insert into TaiKhoan values('test8', '123', 0)
insert into TaiKhoan values('test9', '123', 0)
insert into TaiKhoan values('test10', '123', 0)
insert into TaiKhoan values('test11', '123', 0)
insert into TaiKhoan values('test12', '123', 0)
--Khach Hang
insert into KhachHang values('123', N'Ngô Tuấn Đức', '0334255377', 'ducntps10576@fpt.edu.vn', N'74 Hàn Hải Nguyên F.8 Q.11 TPHCM')
insert into KhachHang values('123', N'Đoàn Quốc Trung', '0123456789', 'trung123@fpt.edu.vn', N'45 Nguyễn Thi Minh Khai Q.1 TPHCM')
insert into KhachHang values('123', N'Hồ Hoàng Tông', '0147852369', 'tong123@fpt.edu.vn', N'135 Trang Tử Q.5 TPHCM')
insert into KhachHang values('123', N'Phạm Thị Thanh Hằng', '0369258147', 'hang123@fpt.edu.vn', N'64 Châu Văn Liêm Q5 F.8 Q.11 TPHCM')
insert into KhachHang values('123', N'Nguyễn Minh Ý', '0951753258', 'minhy123@fpt.edu.vn', N'12 Phan Anh Q.Tân PhúTPHCM')

--Gio Hang
insert into GioHang values('GH01', 5, '25/08/2019')
insert into GioHang values('GH02', 4, '20/07/2018')
insert into GioHang values('GH03', 3, '15/06/2019')
insert into GioHang values('GH04', 2, '10/05/2017')
insert into GioHang values('GH05', 1, '05/04/2015')

-- CT Gio Hang
insert into CT_GioHang values('GH01', 'SP05', 1)
insert into CT_GioHang values('GH01', 'SP10', 3)

insert into CT_GioHang values('GH02', 'SP02', 1)
insert into CT_GioHang values('GH02', 'SP04', 2)
insert into CT_GioHang values('GH02', 'SP06', 3)

insert into CT_GioHang values('GH03', 'SP08', 5)

insert into CT_GioHang values('GH04', 'SP01', 15)

insert into CT_GioHang values('GH05', 'SP01', 5)
insert into CT_GioHang values('GH05', 'SP03', 10)
insert into CT_GioHang values('GH05', 'SP07', 15)
insert into CT_GioHang values('GH05', 'SP09', 20)
