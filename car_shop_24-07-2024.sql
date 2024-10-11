-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 24, 2024 lúc 04:10 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `car_shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `advises`
--

CREATE TABLE `advises` (
  `advise_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT current_timestamp(),
  `updated_at` int(11) NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `fullname` text NOT NULL,
  `phone` text NOT NULL,
  `car_id` int(11) DEFAULT NULL,
  `other_note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `advises`
--

INSERT INTO `advises` (`advise_id`, `created_at`, `updated_at`, `user_id`, `status`, `fullname`, `phone`, `car_id`, `other_note`) VALUES
(3, 2147483647, 2147483647, 1, 0, 'fges', 'eawe', 6, ''),
(4, 2147483647, 2147483647, 1, 0, 'fges', '0352272875', 6, ''),
(5, 2147483647, 2147483647, 1, 0, 'fges', 'eawe', 2, ''),
(14, 2147483647, 2147483647, 2, 0, 'Nguyễn Văn A', '0423425233', 6, 'mua 1000 chiếc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `bill_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `deposit_price` double NOT NULL,
  `transfer_method` text NOT NULL,
  `state_pay` text NOT NULL,
  `car_detail_id` int(11) NOT NULL,
  `car_id` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `receive_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`bill_id`, `created_at`, `updated_at`, `user_id`, `deposit_price`, `transfer_method`, `state_pay`, `car_detail_id`, `car_id`, `amount`, `receive_date`) VALUES
(54, '2024-07-17 00:43:49', '2024-07-17 00:43:49', 2, 124448740, 'Thanh toán tiền mặt', 'Chưa thanh toán', 14, 5, 2, '2024-07-18'),
(56, '2024-07-17 00:47:16', '2024-07-17 00:47:16', 2, 79362340, 'Thanh toán tiền mặt', 'Chưa thanh toán', 2, 1, 3, '2024-07-18'),
(58, '2024-07-17 11:21:12', '2024-07-17 11:21:12', 2, 79362340, 'Chuyển khoản ngân hàng', 'Đã hủy', 2, 1, 1, '2024-07-18'),
(74, '2024-07-17 14:17:05', '2024-07-17 14:17:05', 2, 73440170, 'Chuyển khoản ngân hàng', 'Đã thanh toán', 16, 5, 1, '2024-07-18'),
(86, '2024-07-19 11:21:12', '2024-07-19 11:21:12', 2, 39681170, 'Chuyển khoản ngân hàng', 'Chưa thanh toán', 2, 1, 1, '2024-07-19'),
(87, '2024-07-19 11:22:17', '2024-07-19 11:22:17', 2, 39681170, 'Chuyển khoản ngân hàng', 'Chưa thanh toán', 2, 1, 1, '2024-07-19'),
(88, '2024-07-19 11:26:23', '2024-07-19 11:26:23', 2, 39681170, 'Chuyển khoản ngân hàng', 'Đã thanh toán', 2, 1, 1, '2024-07-26'),
(89, '2024-07-20 21:00:00', '2024-07-20 21:00:00', 2, 39681170, 'Chuyển khoản ngân hàng', 'Đã thanh toán', 2, 1, 1, '2024-07-27'),
(90, '2024-07-21 15:49:13', '2024-07-21 15:49:13', 2, 39681170, 'Thanh toán tiền mặt', 'Chưa thanh toán', 2, 1, 2, '2024-07-21'),
(91, '2024-07-21 16:02:46', '2024-07-21 16:02:46', 2, 37225970, 'Thanh toán tiền mặt', 'Chưa thanh toán', 1, 1, 2, '2024-07-21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `url` text NOT NULL,
  `name` text NOT NULL,
  `price` double NOT NULL,
  `installment` text DEFAULT NULL,
  `inventory` int(11) DEFAULT NULL,
  `importdate` datetime DEFAULT NULL,
  `is_typical` tinyint(1) DEFAULT 0,
  `car_purchase_promotion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cars`
--

INSERT INTO `cars` (`car_id`, `created_at`, `updated_at`, `url`, `name`, `price`, `installment`, `inventory`, `importdate`, `is_typical`, `car_purchase_promotion`) VALUES
(1, '2024-05-10 14:24:23', '2024-05-10 14:24:23', 'https://otohondabinhduong5s.net/wp-content/uploads/2023/08/icon-brv.png', 'Honda BR-V', 661000000, 'từ 20% giá trị xe', 11, '2024-05-09 17:00:00', 0, '<span style=\"font-size: 15px\">&bull;&nbsp;<span class=\"highlight-text\">\r\n      Có Xe Sẵn, Đủ Màu, Đủ Phiên Bản, Giao ngay\r\n      </span><br />\r\n      &bull;&nbsp;<span class=\"highlight-text\">\r\n      Giảm ngay GÓI 66 triệu Bao gồm tiền mặt và phụ kiện\r\n      </span><br />\r\n      &bull;&nbsp;<span class=\"highlight-text\">\r\n      Tặng gói Phụ Kiện Chính Hãng Honda\r\n      </span><br />\r\n      &bull;&nbsp;<span class=\"highlight-text\">\r\n      Tặng gói bảo dưỡng miễn phí 1000km\r\n      </span><br />\r\n      &bull;&nbsp;<span class=\"common-text\">\r\n      Tư vấn, hỗ trợ lắp đặt phụ kiện chính hãng như: \r\n      Dán film cách nhiệt, phủ ceramic, trải sàn, trải cốp, \r\n      vá lốp, dù honda, sổ da, xăng xe.....v.v\r\n      </span><br />\r\n      &bull;&nbsp;<span class=\"common-text\">\r\n      Tư vấn tham gia bảo hiểm thân xe hai chiều chính hãng\r\n       Honda để đảm bảo đầy đủ quyền lợi cho Quý khách\r\n      </span><br />\r\n      &bull;&nbsp;<span class=\"common-text\">\r\n      Bảo hành 3 năm hoặc 100,000 Km, Mở Rộng Bảo Hành\r\n      </span><br />\r\n      &bull;&nbsp;<span class=\"common-text\">\r\n      Chỉ thanh toán trước <span style=\"font-weight: bold\">\r\n      khoảng 100 triệu nhận xe ngay</span><br/>\r\n      &bull;&nbsp;<span class=\"common-text\">\r\n      Đặc biệt không bán xe kèm lạc\r\n      </span><br />\r\n      &bull;&nbsp;<span class=\"common-text\">\r\n      Tư vấn mua xe nhiệt tình\r\n      </span><br />\r\n      &bull;&nbsp;<span class=\"common-text\">\r\n      Hỗ trợ lái thử tận nhà\r\n      </span><br />\r\n      &bull;&nbsp;<span class=\"highlight-text\">\r\n      Hỗ trợ mua xe trả góp 85%, thủ tục nhanh gọn, \r\n      lãi suất thấp, bao duyệt vay nợ xấu\r\n      </span><br />\r\n      &bull;&nbsp;<span class=\"common-text\">\r\n      Còn rất nhiều phần quà tặng hấp dẫn khác, \r\n      ưu đãi đặc biệt khi khách hàng gọi điện đặt hẹn trước \r\n      khi đến đại lý mua xe.\r\n      </span><br /></span>'),
(2, '2024-05-10 14:26:11', '2024-05-10 14:26:11', 'https://otohondabinhduong5s.net/wp-content/uploads/2023/05/icon-city.png', 'Honda City', 559000000, 'từ 120.000.000 ₫', 11, '2024-05-10 00:00:00', 0, NULL),
(3, '2024-05-10 14:27:18', '2024-05-10 14:27:18', 'https://otohondabinhduong5s.net/wp-content/uploads/2022/09/icon-civic.png', 'Honda Civic', 730000000, 'từ 230.000.000 ₫', 11, '2024-05-10 00:00:00', 0, NULL),
(4, '2024-05-10 14:28:32', '2024-05-10 14:28:32', 'https://otohondabinhduong5s.net/wp-content/uploads/2022/09/icon-hrv.png', 'Honda HR-V', 699000000, 'từ 210.000.000 ₫', 11, '2024-05-10 00:00:00', 0, NULL),
(5, '2024-05-10 14:29:43', '2024-05-10 14:29:43', 'https://otohondabinhduong5s.net/wp-content/uploads/2023/12/dai-dien-2.jpg', 'Honda CR-V', 1109000000, 'từ 250.000.000 ₫', 11, '2024-05-09 17:00:00', 0, NULL),
(6, '2024-05-10 14:30:32', '2024-05-10 14:30:32', 'https://otohondabinhduong5s.net/wp-content/uploads/2022/09/icon-accord.png', 'Honda Accord', 1319000000, 'từ 300.000.000 ₫', 11, '2024-05-09 17:00:00', 1, NULL),
(7, '2024-05-10 14:31:32', '2024-05-10 14:31:32', 'https://otohondabinhduong5s.net/wp-content/uploads/2023/05/icon-civic-type-a.png', 'Honda Civic Type R', 2399000000, 'từ 723.000.000 đ', 11, '2024-05-10 00:00:00', 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `car_details`
--

CREATE TABLE `car_details` (
  `car_detail_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `car_id` int(11) NOT NULL,
  `version` text NOT NULL,
  `price` double NOT NULL,
  `is_pause` tinyint(1) NOT NULL DEFAULT 0,
  `VRT` double DEFAULT NULL COMMENT 'Vehicle Registration Tax',
  `VRF` double DEFAULT NULL COMMENT 'Vehicle Registration Fee',
  `material_covered` double NOT NULL COMMENT 'bảo hiểm vật chất',
  `road_fee` double NOT NULL COMMENT 'phí đường bộ',
  `vehicle_inspection` double NOT NULL COMMENT 'đăng kiểm',
  `registration_service` double NOT NULL COMMENT 'dịch vụ đăng ký',
  `compulsory_insurance` double NOT NULL COMMENT 'bảo hiểm bắt buộc',
  `inventory` int(11) NOT NULL,
  `import_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `car_details`
--

INSERT INTO `car_details` (`car_detail_id`, `created_at`, `updated_at`, `car_id`, `version`, `price`, `is_pause`, `VRT`, `VRF`, `material_covered`, `road_fee`, `vehicle_inspection`, `registration_service`, `compulsory_insurance`, `inventory`, `import_date`) VALUES
(1, '2024-05-18 11:58:59', '2024-05-18 11:58:59', 1, 'Honda BR-V G', 661000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, '2023-02-23'),
(2, '2024-05-18 12:00:11', '2024-05-18 12:00:11', 1, 'đú tha23', 341232, 0, NULL, NULL, 0, 0, 0, 0, 0, 433, '2021-03-22'),
(3, '2024-05-18 12:00:59', '2024-05-18 12:00:59', 2, 'Honda City G', 559000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 3, '2024-07-21'),
(4, '2024-05-18 12:01:23', '2024-05-18 12:01:23', 2, 'Honda City L', 589000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 5, '2024-07-21'),
(5, '2024-05-18 12:01:51', '2024-05-18 12:01:51', 2, 'Honda City RS', 609000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 5, '2024-07-21'),
(6, '2024-05-18 12:02:20', '2024-05-18 12:02:20', 3, 'Honda Civic 1.8 E', 730000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 3, '2024-07-21'),
(7, '2024-05-18 12:02:50', '2024-05-18 12:02:50', 3, 'Honda Civic 1.5 G', 770000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 8, '2024-07-21'),
(8, '2024-05-18 12:03:23', '2024-05-18 12:03:23', 3, 'Honda Civic 1.5 RS', 870000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 1, '2024-07-21'),
(9, '2024-05-18 12:06:26', '2024-05-18 12:06:26', 4, 'Honda HR-V G', 699000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 3, '2024-07-21'),
(10, '2024-05-18 12:07:15', '2024-05-18 12:07:15', 4, 'Honda HR-V L (Đen Ánh/Xám)', 826000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 7, '2024-07-21'),
(11, '2024-05-18 12:07:37', '2024-05-18 12:07:37', 4, 'Honda HR-V L (Đỏ Cá Tính/Trắng Ngọc)', 831000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 3, '2024-07-21'),
(12, '2024-05-18 12:07:53', '2024-05-18 12:07:53', 4, 'Honda HR-V RS (Đen Ánh/Xám)', 871000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 6, '2024-07-21'),
(13, '2024-05-18 12:08:11', '2024-05-18 12:08:11', 4, 'Honda HR-V RS (Đỏ, Trắng Ngọc, Trắng Bạc)', 876000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 31, '2024-07-21'),
(14, '2024-05-18 12:08:57', '2024-05-18 12:08:57', 5, 'Honda CR-V 1.5 G', 1109000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 5, '2024-07-21'),
(15, '2024-05-18 12:09:17', '2024-05-18 12:09:17', 5, 'Honda CR-V 1.5 L', 1159000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 2, '2024-07-21'),
(16, '2024-05-18 12:09:39', '2024-05-18 12:09:39', 5, 'Honda CR-V 1.5 AWD', 1310000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 20, '2024-07-21'),
(17, '2024-05-18 12:10:02', '2024-05-18 12:10:02', 5, 'Honda CR-V HEV', 1259000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, '2024-07-21'),
(18, '2024-05-18 12:10:53', '2024-05-18 12:10:53', 6, 'Honda Accord (Đen ánh độc tôn/Ghi bạc thời trang)', 1319000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 4, '2024-07-21'),
(19, '2024-05-18 12:11:11', '2024-05-18 12:11:11', 6, 'Honda Accord (Trắng ngọc trai)', 1329000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, '2024-07-21'),
(20, '2024-05-18 12:11:36', '2024-05-18 12:11:36', 7, 'Honda Civic Type R', 2399000000, 0, NULL, NULL, 0, 0, 0, 0, 0, 3, '2024-07-21'),
(26, '2024-07-21 16:44:32', '2024-07-21 16:44:32', 1, 'đsd', 32312, 0, NULL, NULL, 0, 0, 0, 0, 0, 223, '2222-02-22'),
(27, '2024-07-21 16:49:23', '2024-07-21 16:49:23', 1, 'fewfwe', 12232222, 0, NULL, NULL, 0, 0, 0, 0, 0, 23, '2023-03-23'),
(28, '2024-07-21 16:53:29', '2024-07-21 16:53:29', 1, 'fvdfv', 23232, 0, NULL, NULL, 0, 0, 0, 0, 0, 2, '2222-02-22'),
(29, '2024-07-21 17:08:42', '2024-07-21 17:08:42', 1, 'đá thu', 234234, 0, NULL, NULL, 0, 0, 0, 0, 0, 23, '2022-02-22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `landing_carousels`
--

CREATE TABLE `landing_carousels` (
  `landing_carousel_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `landing_carousels`
--

INSERT INTO `landing_carousels` (`landing_carousel_id`, `created_at`, `updated_at`, `url`) VALUES
(1, '2024-05-07 16:46:29', '2024-05-07 16:46:29', 'https://otohondabinhduong5s.net/wp-content/uploads/2022/09/honda-hrv-slider.jpg'),
(2, '2024-05-07 16:47:15', '2024-05-07 16:47:15', 'https://otohondabinhduong5s.net/wp-content/uploads/2023/05/civictypabaner.jpg'),
(3, '2024-05-07 16:48:37', '2024-05-07 16:48:37', 'https://otohondabinhduong5s.net/wp-content/uploads/2022/09/honda-city-slider.jpg'),
(4, '2024-05-07 16:48:57', '2024-05-07 16:48:57', 'https://otohondabinhduong5s.net/wp-content/uploads/2022/09/honda-civic-slider.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `username` varchar(255) NOT NULL,
  `phone` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `permission` text NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id_user`, `created_at`, `updated_at`, `username`, `phone`, `address`, `email`, `password`, `permission`) VALUES
(1, '0000-00-00 00:00:00', '2024-06-30 03:16:40', 'hoangvu', '0123467885', 'abs', 'example@example.com', 'vu0123', 'user'),
(2, '2024-06-15 16:09:09', '2024-06-30 08:56:18', 'Hoàng Vũ', '0363656365', 'abcdef', 'hvu@gmail.com', 'vu0123', 'admin'),
(9, '2024-06-30 09:17:38', '2024-06-30 09:17:38', 'fsff', '032525665', 'fsfwe', 'vu@gmail.com', 'avc', 'user'),
(10, '2024-07-17 08:26:50', '2024-07-17 08:26:50', 'fseges', '0567354634', 'gfdsvdfv', 'dsvfs', 'fsdg', 'admin');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `advises`
--
ALTER TABLE `advises`
  ADD PRIMARY KEY (`advise_id`),
  ADD KEY `fk_cars_from_advises` (`car_id`),
  ADD KEY `fk_users_from_advises` (`user_id`);

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `fk_user_from_bill` (`user_id`),
  ADD KEY `fk_car_detail_from_bill` (`car_detail_id`);

--
-- Chỉ mục cho bảng `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`);

--
-- Chỉ mục cho bảng `car_details`
--
ALTER TABLE `car_details`
  ADD PRIMARY KEY (`car_detail_id`),
  ADD KEY `fk_car` (`car_id`);

--
-- Chỉ mục cho bảng `landing_carousels`
--
ALTER TABLE `landing_carousels`
  ADD PRIMARY KEY (`landing_carousel_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`) USING BTREE,
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `advises`
--
ALTER TABLE `advises`
  MODIFY `advise_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT cho bảng `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `car_details`
--
ALTER TABLE `car_details`
  MODIFY `car_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `landing_carousels`
--
ALTER TABLE `landing_carousels`
  MODIFY `landing_carousel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `advises`
--
ALTER TABLE `advises`
  ADD CONSTRAINT `fk_cars_from_advises` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_users_from_advises` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `fk_car_detail_from_bill` FOREIGN KEY (`car_detail_id`) REFERENCES `car_details` (`car_detail_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_from_bill` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `car_details`
--
ALTER TABLE `car_details`
  ADD CONSTRAINT `car_details_fk_car` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_car` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
