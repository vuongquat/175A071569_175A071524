-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 11, 2020 lúc 06:26 AM
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
-- Cơ sở dữ liệu: `quanlysinhvien`
--

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `danhsachlop1`
-- (See below for the actual view)
--
CREATE TABLE `danhsachlop1` (
`idlop` int(11)
,`tenlop` varchar(255)
,`idsinhvien` int(11)
,`masv` varchar(255)
,`ten` varchar(255)
,`gioitinh` varchar(255)
,`ngaysinh` date
,`quequan` varchar(255)
,`idkhoa` int(11)
,`tenkhoa` varchar(255)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `danhsachlop2`
-- (See below for the actual view)
--
CREATE TABLE `danhsachlop2` (
`idlop` int(11)
,`tenlop` varchar(255)
,`idsinhvien` int(11)
,`masv` varchar(255)
,`ten` varchar(255)
,`gioitinh` varchar(255)
,`ngaysinh` date
,`quequan` varchar(255)
,`idkhoa` int(11)
,`tenkhoa` varchar(255)
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diem`
--

CREATE TABLE `diem` (
  `iddiem` int(11) NOT NULL,
  `idmon` int(11) NOT NULL,
  `idsinhvien` int(11) NOT NULL,
  `diemquatrinh` float NOT NULL,
  `diemthi` float NOT NULL,
  `diemtongket` float DEFAULT NULL,
  `diemchu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `diem`
--

INSERT INTO `diem` (`iddiem`, `idmon`, `idsinhvien`, `diemquatrinh`, `diemthi`, `diemtongket`, `diemchu`) VALUES
(1, 3, 1, 10, 8, 8.8, 'A'),
(2, 3, 2, 10, 10, 10, 'A'),
(3, 4, 4, 5, 7, 6.2, 'C'),
(5, 4, 18, 8, 10, 9.2, 'A'),
(7, 4, 2, 10, 10, 10, 'A'),
(10, 4, 20, 10, 8, 8.8, 'A'),
(11, 3, 27, 10, 10, 10, 'A'),
(13, 4, 1, 5, 10, 8, 'B'),
(15, 3, 28, 4.5, 6.5, 5.7, 'C'),
(16, 3, 4, 7.5, 9, 8.4, 'B'),
(20, 5, 1, 1, 1, 1, 'F'),
(21, 5, 29, 10, 5, 7, 'B'),
(23, 3, 29, 10, 10, 10, 'A'),
(24, 4, 28, 10, 10, 10, 'A');

--
-- Bẫy `diem`
--
DELIMITER $$
CREATE TRIGGER `Inert_Diem` BEFORE INSERT ON `diem` FOR EACH ROW SET NEW.diemtongket = NEW.diemquatrinh * 0.4 + NEW.diemthi * 0.6,
NEW.diemchu = CASE
WHEN NEW.diemtongket >= 4 AND NEW.diemtongket < 5.5 THEN "D"
WHEN NEW.diemtongket >= 5.5 AND NEW.diemtongket < 7 THEN "C"
WHEN NEW.diemtongket >= 7 AND NEW.diemtongket < 8.5 THEN "B"
WHEN NEW.diemtongket >= 8.5 AND NEW.diemtongket <= 10 THEN "A"
ELSE "F"
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update_Diem` BEFORE UPDATE ON `diem` FOR EACH ROW SET NEW.diemtongket = NEW.diemquatrinh * 0.4 + NEW.diemthi * 0.6,
NEW.diemchu = CASE
WHEN NEW.diemtongket >= 4 AND NEW.diemtongket < 5.5 THEN "D"
WHEN NEW.diemtongket >= 5.5 AND NEW.diemtongket < 7 THEN "C"
WHEN NEW.diemtongket >= 7 AND NEW.diemtongket < 8.5 THEN "B"
WHEN NEW.diemtongket >= 8.5 AND NEW.diemtongket <= 10 THEN "A"
ELSE "F"
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giangvien`
--

CREATE TABLE `giangvien` (
  `idgiangvien` int(11) NOT NULL,
  `idkhoa` int(11) NOT NULL,
  `tengv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngaysinh` date NOT NULL,
  `sdt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giangvien`
--

INSERT INTO `giangvien` (`idgiangvien`, `idkhoa`, `tengv`, `ngaysinh`, `sdt`, `email`) VALUES
(7, 1, 'Nguyễn Văn Nam', '1990-01-24', '0981453628', 'nam@tlu.edu.vn'),
(9, 2, 'Nguyễn Thị Hương', '1988-02-01', '098456321', 'huong@tlu.edu.vn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoa`
--

CREATE TABLE `khoa` (
  `idkhoa` int(11) NOT NULL,
  `makhoa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenkhoa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khoa`
--

INSERT INTO `khoa` (`idkhoa`, `makhoa`, `tenkhoa`) VALUES
(1, 'CNTT', 'Công nghệ thông tin'),
(2, 'KT', 'Kinh Tế');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lop`
--

CREATE TABLE `lop` (
  `idlop` int(11) NOT NULL,
  `idkhoa` int(11) NOT NULL,
  `tenlop` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lop`
--

INSERT INTO `lop` (`idlop`, `idkhoa`, `tenlop`) VALUES
(1, 1, 'CNTT01'),
(2, 1, 'CNTT02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `monhoc`
--

CREATE TABLE `monhoc` (
  `idmon` int(11) NOT NULL,
  `idgiangvien` int(11) NOT NULL,
  `tenmon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sotinchi` int(11) NOT NULL,
  `hocky` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `monhoc`
--

INSERT INTO `monhoc` (`idmon`, `idgiangvien`, `tenmon`, `sotinchi`, `hocky`) VALUES
(3, 7, 'Toán 1', 3, 1),
(4, 7, 'Toán 2', 3, 2),
(5, 7, 'Toán 3', 3, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinhvien`
--

CREATE TABLE `sinhvien` (
  `idsinhvien` int(11) NOT NULL,
  `idkhoa` int(11) NOT NULL,
  `idlop` int(11) NOT NULL,
  `masv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ten` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gioitinh` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngaysinh` date NOT NULL,
  `quequan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sinhvien`
--

INSERT INTO `sinhvien` (`idsinhvien`, `idkhoa`, `idlop`, `masv`, `ten`, `gioitinh`, `ngaysinh`, `quequan`) VALUES
(1, 1, 1, ' SVCNTT01', 'Hoàng Thế Anh', 'Gay', '1999-12-24', ' Nghệ An'),
(2, 1, 1, 'SVCNTT02', 'Trương Vương Quát', 'nam', '1999-12-18', 'Bắc Ninh'),
(4, 1, 1, 'SVCNTT04', 'Đỗ Cảnh Dương', 'Nam', '1995-08-16', 'Nam Định'),
(18, 1, 2, 'SVCNTT07', 'Phạm Thế Sơn', 'Nam', '1999-07-07', 'Nam Định'),
(20, 1, 2, 'SVCNTT08', 'Nguyễn Khắc Diêm', 'Nam', '1999-11-11', 'Thái Bình'),
(27, 1, 2, 'SVCNTT10', 'Nguyễn Thành Dự', 'Nam', '1996-02-16', 'Nam Định'),
(28, 1, 2, 'SVCNTT11', 'Đỗ Mạnh Tuấn', 'Gay', '1999-05-05', 'Chương Mĩ'),
(29, 1, 1, 'SVCNTT12', 'Lê Tuấn Mạnh', 'Nam', '1999-12-12', 'Chương Mĩ');

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `thongtingiangvien`
-- (See below for the actual view)
--
CREATE TABLE `thongtingiangvien` (
`idgiangvien` int(11)
,`idkhoa` int(11)
,`tengv` varchar(255)
,`ngaysinh` date
,`sdt` text
,`email` varchar(255)
,`tenkhoa` varchar(255)
,`makhoa` varchar(255)
,`tenmon` varchar(255)
,`idmon` int(11)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `thongtinlopkhoa`
-- (See below for the actual view)
--
CREATE TABLE `thongtinlopkhoa` (
`idlop` int(11)
,`tenlop` varchar(255)
,`idkhoa` int(11)
,`tenkhoa` varchar(255)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `thongtinsinhvien`
-- (See below for the actual view)
--
CREATE TABLE `thongtinsinhvien` (
`idsinhvien` int(11)
,`ten` varchar(255)
,`masv` varchar(255)
,`ngaysinh` date
,`gioitinh` varchar(255)
,`quequan` varchar(255)
,`tenlop` varchar(255)
,`tenkhoa` varchar(255)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `tracuudiem`
-- (See below for the actual view)
--
CREATE TABLE `tracuudiem` (
`idsinhvien` int(11)
,`ten` varchar(255)
,`masv` varchar(255)
,`idmon` int(11)
,`tenmon` varchar(255)
,`hocky` int(11)
,`iddiem` int(11)
,`diemquatrinh` float
,`diemthi` float
,`diemtongket` float
,`diemchu` varchar(255)
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`iduser`, `username`, `password`, `level`) VALUES
(1, 'vuongquat', '123456', 2),
(3, 'theanh', '123456', 2),
(4, 'nguyennam', '123456', 3);

-- --------------------------------------------------------

--
-- Cấu trúc cho view `danhsachlop1`
--
DROP TABLE IF EXISTS `danhsachlop1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `danhsachlop1`  AS  select `lop`.`idlop` AS `idlop`,`lop`.`tenlop` AS `tenlop`,`sinhvien`.`idsinhvien` AS `idsinhvien`,`sinhvien`.`masv` AS `masv`,`sinhvien`.`ten` AS `ten`,`sinhvien`.`gioitinh` AS `gioitinh`,`sinhvien`.`ngaysinh` AS `ngaysinh`,`sinhvien`.`quequan` AS `quequan`,`khoa`.`idkhoa` AS `idkhoa`,`khoa`.`tenkhoa` AS `tenkhoa` from ((`lop` left join `sinhvien` on(`lop`.`idlop` = `sinhvien`.`idlop`)) left join `khoa` on(`lop`.`idkhoa` = `khoa`.`idkhoa`)) where `lop`.`tenlop` = 'CNTT01' ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `danhsachlop2`
--
DROP TABLE IF EXISTS `danhsachlop2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `danhsachlop2`  AS  select `lop`.`idlop` AS `idlop`,`lop`.`tenlop` AS `tenlop`,`sinhvien`.`idsinhvien` AS `idsinhvien`,`sinhvien`.`masv` AS `masv`,`sinhvien`.`ten` AS `ten`,`sinhvien`.`gioitinh` AS `gioitinh`,`sinhvien`.`ngaysinh` AS `ngaysinh`,`sinhvien`.`quequan` AS `quequan`,`khoa`.`idkhoa` AS `idkhoa`,`khoa`.`tenkhoa` AS `tenkhoa` from ((`lop` left join `sinhvien` on(`lop`.`idlop` = `sinhvien`.`idlop`)) left join `khoa` on(`lop`.`idkhoa` = `khoa`.`idkhoa`)) where `lop`.`tenlop` = 'CNTT02' ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `thongtingiangvien`
--
DROP TABLE IF EXISTS `thongtingiangvien`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `thongtingiangvien`  AS  select `giangvien`.`idgiangvien` AS `idgiangvien`,`giangvien`.`idkhoa` AS `idkhoa`,`giangvien`.`tengv` AS `tengv`,`giangvien`.`ngaysinh` AS `ngaysinh`,`giangvien`.`sdt` AS `sdt`,`giangvien`.`email` AS `email`,`khoa`.`tenkhoa` AS `tenkhoa`,`khoa`.`makhoa` AS `makhoa`,`monhoc`.`tenmon` AS `tenmon`,`monhoc`.`idmon` AS `idmon` from ((`giangvien` left join `monhoc` on(`giangvien`.`idgiangvien` = `monhoc`.`idgiangvien`)) left join `khoa` on(`giangvien`.`idkhoa` = `khoa`.`idkhoa`)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `thongtinlopkhoa`
--
DROP TABLE IF EXISTS `thongtinlopkhoa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `thongtinlopkhoa`  AS  select `lop`.`idlop` AS `idlop`,`lop`.`tenlop` AS `tenlop`,`khoa`.`idkhoa` AS `idkhoa`,`khoa`.`tenkhoa` AS `tenkhoa` from (`lop` left join `khoa` on(`lop`.`idkhoa` = `khoa`.`idkhoa`)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `thongtinsinhvien`
--
DROP TABLE IF EXISTS `thongtinsinhvien`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `thongtinsinhvien`  AS  select `sinhvien`.`idsinhvien` AS `idsinhvien`,`sinhvien`.`ten` AS `ten`,`sinhvien`.`masv` AS `masv`,`sinhvien`.`ngaysinh` AS `ngaysinh`,`sinhvien`.`gioitinh` AS `gioitinh`,`sinhvien`.`quequan` AS `quequan`,`lop`.`tenlop` AS `tenlop`,`khoa`.`tenkhoa` AS `tenkhoa` from ((`sinhvien` left join `lop` on(`sinhvien`.`idlop` = `lop`.`idlop`)) left join `khoa` on(`sinhvien`.`idkhoa` = `khoa`.`idkhoa`)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `tracuudiem`
--
DROP TABLE IF EXISTS `tracuudiem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tracuudiem`  AS  select `sinhvien`.`idsinhvien` AS `idsinhvien`,`sinhvien`.`ten` AS `ten`,`sinhvien`.`masv` AS `masv`,`monhoc`.`idmon` AS `idmon`,`monhoc`.`tenmon` AS `tenmon`,`monhoc`.`hocky` AS `hocky`,`diem`.`iddiem` AS `iddiem`,`diem`.`diemquatrinh` AS `diemquatrinh`,`diem`.`diemthi` AS `diemthi`,`diem`.`diemtongket` AS `diemtongket`,`diem`.`diemchu` AS `diemchu` from ((`sinhvien` left join `diem` on(`sinhvien`.`idsinhvien` = `diem`.`idsinhvien`)) left join `monhoc` on(`diem`.`idmon` = `monhoc`.`idmon`)) ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `diem`
--
ALTER TABLE `diem`
  ADD PRIMARY KEY (`iddiem`),
  ADD KEY `idsinhvien` (`idsinhvien`),
  ADD KEY `idmon` (`idmon`);

--
-- Chỉ mục cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  ADD PRIMARY KEY (`idgiangvien`),
  ADD KEY `idkhoa` (`idkhoa`);

--
-- Chỉ mục cho bảng `khoa`
--
ALTER TABLE `khoa`
  ADD PRIMARY KEY (`idkhoa`);

--
-- Chỉ mục cho bảng `lop`
--
ALTER TABLE `lop`
  ADD PRIMARY KEY (`idlop`),
  ADD KEY `idkhoa` (`idkhoa`);

--
-- Chỉ mục cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  ADD PRIMARY KEY (`idmon`),
  ADD KEY `idgiangvien` (`idgiangvien`);

--
-- Chỉ mục cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`idsinhvien`),
  ADD UNIQUE KEY `masv` (`masv`),
  ADD KEY `idkhoa` (`idkhoa`),
  ADD KEY `idlop` (`idlop`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `diem`
--
ALTER TABLE `diem`
  MODIFY `iddiem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  MODIFY `idgiangvien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `khoa`
--
ALTER TABLE `khoa`
  MODIFY `idkhoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `lop`
--
ALTER TABLE `lop`
  MODIFY `idlop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  MODIFY `idmon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  MODIFY `idsinhvien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `diem`
--
ALTER TABLE `diem`
  ADD CONSTRAINT `diem_ibfk_1` FOREIGN KEY (`idmon`) REFERENCES `monhoc` (`idmon`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diem_ibfk_2` FOREIGN KEY (`idsinhvien`) REFERENCES `sinhvien` (`idsinhvien`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  ADD CONSTRAINT `giangvien_ibfk_1` FOREIGN KEY (`idkhoa`) REFERENCES `khoa` (`idkhoa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `lop`
--
ALTER TABLE `lop`
  ADD CONSTRAINT `lop_ibfk_1` FOREIGN KEY (`idkhoa`) REFERENCES `khoa` (`idkhoa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  ADD CONSTRAINT `monhoc_ibfk_1` FOREIGN KEY (`idgiangvien`) REFERENCES `giangvien` (`idgiangvien`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD CONSTRAINT `sinhvien_ibfk_1` FOREIGN KEY (`idkhoa`) REFERENCES `khoa` (`idkhoa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sinhvien_ibfk_2` FOREIGN KEY (`idlop`) REFERENCES `lop` (`idlop`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
