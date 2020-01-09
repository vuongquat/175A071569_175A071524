-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 09, 2020 lúc 05:07 AM
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
-- Cấu trúc bảng cho bảng `diem`
--

CREATE TABLE `diem` (
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

INSERT INTO `diem` (`idmon`, `idsinhvien`, `diemquatrinh`, `diemthi`, `diemtongket`, `diemchu`) VALUES
(3, 1, 5, 4, 4.4, 'D');

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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giangvien`
--

CREATE TABLE `giangvien` (
  `idgiangvien` int(11) NOT NULL,
  `idkhoa` int(11) NOT NULL,
  `ten` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngaysinh` date NOT NULL,
  `sdt` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giangvien`
--

INSERT INTO `giangvien` (`idgiangvien`, `idkhoa`, `ten`, `ngaysinh`, `sdt`, `email`) VALUES
(7, 2, 'Nguyễn Văn Nam', '1990-01-24', 981453628, 'nam@tlu.edu.vn');

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
(2, 1, 'CNTT02'),
(3, 2, 'KT01');

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
(3, 7, 'Toán 1', 3, 1);

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
(1, 1, 1, ' SVCNTT01', 'Hoàng Thế Anh', 'Bê Đê', '1999-12-24', ' Nghệ An'),
(2, 1, 1, 'SVCNTT02', 'Trương Vương Quát', 'nam', '1999-12-18', 'Bắc Ninh'),
(3, 1, 1, 'SVCNTT03', 'Nguyễn Thành Dự', 'Nam', '1996-12-18', 'Nam Định'),
(4, 1, 1, 'SVCNTT04', 'Đỗ Cảnh Dương', 'Nam', '1995-08-16', 'Nam Định');

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
,`tenmon` varchar(255)
,`hocky` int(11)
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
  `usernam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tracuudiem`  AS  select `sinhvien`.`idsinhvien` AS `idsinhvien`,`sinhvien`.`ten` AS `ten`,`sinhvien`.`masv` AS `masv`,`monhoc`.`tenmon` AS `tenmon`,`monhoc`.`hocky` AS `hocky`,`diem`.`diemquatrinh` AS `diemquatrinh`,`diem`.`diemthi` AS `diemthi`,`diem`.`diemtongket` AS `diemtongket`,`diem`.`diemchu` AS `diemchu` from ((`sinhvien` left join `diem` on(`sinhvien`.`idsinhvien` = `diem`.`idsinhvien`)) left join `monhoc` on(`monhoc`.`idmon` = `diem`.`idmon`)) ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `diem`
--
ALTER TABLE `diem`
  ADD PRIMARY KEY (`idmon`),
  ADD KEY `idsinhvien` (`idsinhvien`);

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
  MODIFY `idmon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  MODIFY `idgiangvien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `idmon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  MODIFY `idsinhvien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `diem`
--
ALTER TABLE `diem`
  ADD CONSTRAINT `diem_ibfk_1` FOREIGN KEY (`idsinhvien`) REFERENCES `sinhvien` (`idsinhvien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diem_ibfk_2` FOREIGN KEY (`idmon`) REFERENCES `monhoc` (`idmon`) ON DELETE CASCADE ON UPDATE CASCADE;

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
