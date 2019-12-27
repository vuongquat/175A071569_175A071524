-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 27, 2019 lúc 03:46 PM
-- Phiên bản máy phục vụ: 10.4.10-MariaDB
-- Phiên bản PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `baitaplon_conngheweb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diem`
--

CREATE TABLE `diem` (
  `MaMon` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MaSV` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DiemQT` float NOT NULL,
  `DiemThi` float NOT NULL,
  `DiemTongKet` float DEFAULT NULL,
  `DiemChu` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `diem`
--

INSERT INTO `diem` (`MaMon`, `MaSV`, `DiemQT`, `DiemThi`, `DiemTongKet`, `DiemChu`) VALUES
('01', '175A071000', 6, 4, 4.8, 'D');

--
-- Bẫy `diem`
--
DELIMITER $$
CREATE TRIGGER `Insert_Diem` BEFORE INSERT ON `diem` FOR EACH ROW SET NEW.DiemTongKet = NEW.DiemQT * 0.4 + NEW.DiemThi * 0.6,
NEW.DiemChu = CASE
WHEN NEW.DiemTongKet >= 4 AND NEW.DiemTongKet < 5.5 THEN "D"
WHEN NEW.DiemTongKet >= 5.5 AND NEW.DiemTongKet < 7 THEN "C"
WHEN NEW.DiemTongKet >= 7 AND NEW.DiemTongKet < 8.5 THEN "B"
WHEN NEW.DiemTongKet >= 8.5 AND NEW.DiemTongKet < 10 THEN "A"
ELSE "F"
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giangvien`
--

CREATE TABLE `giangvien` (
  `MaGV` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MaKhoa` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MaMon` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HoTen` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GioiTinh` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NgaySinh` date NOT NULL,
  `SDT` int(20) NOT NULL,
  `Email` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giangvien`
--

INSERT INTO `giangvien` (`MaGV`, `MaKhoa`, `MaMon`, `HoTen`, `GioiTinh`, `NgaySinh`, `SDT`, `Email`) VALUES
('GV01', 'CNTT', '01', 'Nguyễn Văn Nam', 'nam', '1980-10-25', 984562514, 'vannam@gmail.com'),
('GV02', 'CT', '02', 'Nguyễn Thị Hạnh', 'nữ', '1986-10-01', 987456123, 'hanhnguyen@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoa`
--

CREATE TABLE `khoa` (
  `MaKhoa` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TenKhoa` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khoa`
--

INSERT INTO `khoa` (`MaKhoa`, `TenKhoa`) VALUES
('CNTT', 'Công nghệ thông tin'),
('CT', 'Công trình'),
('KT', 'Kinh tế');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lop`
--

CREATE TABLE `lop` (
  `MaLop` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MaKhoa` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TenLop` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SiSo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lop`
--

INSERT INTO `lop` (`MaLop`, `MaKhoa`, `TenLop`, `SiSo`) VALUES
('CNTT01', 'CNTT', '59TH1', NULL),
('CNTT02', 'CNTT', '59TH2', NULL),
('CT01', 'CT', '59CT1', NULL),
('KT01', 'KT', '59KT1', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `monhoc`
--

CREATE TABLE `monhoc` (
  `MaMon` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MaGV` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TenMon` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SoTinChi` int(5) NOT NULL,
  `HocKy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `monhoc`
--

INSERT INTO `monhoc` (`MaMon`, `MaGV`, `TenMon`, `SoTinChi`, `HocKy`) VALUES
('01', 'GV01', 'Toán 1', 3, 1),
('02', 'GV02', 'Tin Đại Cương', 3, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinhvien`
--

CREATE TABLE `sinhvien` (
  `MaSV` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MaKhoa` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MaLop` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HoTen` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GioiTinh` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NgaySinh` date NOT NULL,
  `QueQuan` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sinhvien`
--

INSERT INTO `sinhvien` (`MaSV`, `MaKhoa`, `MaLop`, `HoTen`, `GioiTinh`, `NgaySinh`, `QueQuan`) VALUES
('175A071000', 'CNTT', 'CNTT01', 'Hoàng Thế Anh', 'nam', '1999-01-01', 'Nghệ An'),
('175A071001', 'CNTT', 'CNTT01', 'Trương Vương Quát', 'nam', '1999-12-18', 'Bắc Ninh');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `diem`
--
ALTER TABLE `diem`
  ADD PRIMARY KEY (`MaMon`,`MaSV`),
  ADD KEY `MaSV` (`MaSV`);

--
-- Chỉ mục cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  ADD PRIMARY KEY (`MaGV`),
  ADD KEY `MaKhoa` (`MaKhoa`);

--
-- Chỉ mục cho bảng `khoa`
--
ALTER TABLE `khoa`
  ADD PRIMARY KEY (`MaKhoa`);

--
-- Chỉ mục cho bảng `lop`
--
ALTER TABLE `lop`
  ADD PRIMARY KEY (`MaLop`),
  ADD KEY `MaKhoa` (`MaKhoa`);

--
-- Chỉ mục cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  ADD PRIMARY KEY (`MaMon`),
  ADD KEY `MaGV` (`MaGV`);

--
-- Chỉ mục cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`MaSV`),
  ADD KEY `MaKhoa` (`MaKhoa`),
  ADD KEY `MaLop` (`MaLop`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `diem`
--
ALTER TABLE `diem`
  ADD CONSTRAINT `diem_ibfk_1` FOREIGN KEY (`MaSV`) REFERENCES `sinhvien` (`MaSV`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diem_ibfk_2` FOREIGN KEY (`MaMon`) REFERENCES `monhoc` (`MaMon`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  ADD CONSTRAINT `giangvien_ibfk_1` FOREIGN KEY (`MaKhoa`) REFERENCES `khoa` (`MaKhoa`);

--
-- Các ràng buộc cho bảng `lop`
--
ALTER TABLE `lop`
  ADD CONSTRAINT `lop_ibfk_1` FOREIGN KEY (`MaKhoa`) REFERENCES `khoa` (`MaKhoa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  ADD CONSTRAINT `monhoc_ibfk_1` FOREIGN KEY (`MaGV`) REFERENCES `giangvien` (`MaGV`);

--
-- Các ràng buộc cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD CONSTRAINT `sinhvien_ibfk_1` FOREIGN KEY (`MaLop`) REFERENCES `lop` (`MaLop`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sinhvien_ibfk_2` FOREIGN KEY (`MaKhoa`) REFERENCES `khoa` (`MaKhoa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
