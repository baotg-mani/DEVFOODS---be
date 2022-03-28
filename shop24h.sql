-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 28, 2022 lúc 03:18 PM
-- Phiên bản máy phục vụ: 10.4.18-MariaDB
-- Phiên bản PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop24h`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit_limit` int(11) DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sales_rep_employee_number` int(11) DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `address`, `city`, `country`, `credit_limit`, `first_name`, `last_name`, `phone_number`, `postal_code`, `sales_rep_employee_number`, `state`, `user_id`) VALUES
(2, 'Hanoi, Vietnam', 'Hanoi', 'Vietnam', 0, 'Bao', 'Gia', '0336699146', '250000', 0, '', 1),
(5, '2 District', 'Hochiminh', 'Vietnam', 0, 'Loc', 'Lam', '0999999999', '200000', 0, '', 3),
(6, '3 District', 'Hochiminh', 'Vietnam', 0, 'My', 'Huynh', '0888888888', '200000', 0, '', 4),
(7, '3 District', 'Hochiminh', 'Vietnam', 0, 'Khoa', 'Vo Van', '0777777777', '200000', 0, '', 10),
(8, '5 District', 'Hochiminh', 'Vietnam', 0, 'Hung', 'Ly', '0789999999', '200000', 0, '', 11),
(10, '3 District', 'Hochiminh', 'Vietnam', 0, 'Bach', 'Nguyen', '0999666666', '200000', 0, '', 12),
(19, 'Thangloi', 'Thainguyen', 'Vietnam', 0, 'Duy', 'Tran', '0915808745', '123000', 0, '', 13),
(23, '3 District', 'Hochiminh', 'Vietnam', 0, 'Quan', 'Van', '0987654321', '200000', 0, 'miền Nam', 14),
(25, 'Hanoi, Vietnam', 'Hanoi', 'Vietnam', 0, 'Lan', 'Ho Thi', '0336699888', '250000', 0, '', 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `job_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `office_code` int(11) DEFAULT NULL,
  `report_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `offices`
--

CREATE TABLE `offices` (
  `id` int(11) NOT NULL,
  `address_line` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `territory` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_date` datetime NOT NULL,
  `required_date` datetime NOT NULL,
  `shipped_date` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `comments`, `order_date`, `required_date`, `shipped_date`, `status`, `customer_id`) VALUES
(3, 'uy tín', '2022-02-17 07:00:00', '2022-02-17 07:00:00', '2022-02-17 07:00:00', 'open', 2),
(5, 'ok', '2022-02-16 07:00:00', '2022-02-16 07:00:00', '2022-02-17 07:00:00', 'open', 2),
(6, 'alo trước', '2022-02-09 07:00:00', '2022-02-11 07:00:00', '2022-02-11 07:00:00', 'open', 5),
(7, 'nhận sáng', '2022-01-26 07:00:00', '2022-02-02 07:00:00', '2022-02-02 07:00:00', 'open', 6),
(8, 'nhận chiều', '2022-02-16 07:00:00', '2022-02-17 07:00:00', '2022-02-17 07:00:00', 'process', 2),
(9, 'đơn rau củ', '2022-02-14 07:00:00', '2022-02-15 07:00:00', '2022-02-15 07:00:00', 'process', 6),
(10, NULL, '2022-02-18 07:00:00', '2022-02-19 07:00:00', NULL, 'open', 7),
(11, NULL, '2022-02-15 07:00:00', '2022-02-16 07:00:00', NULL, 'open', 8),
(13, NULL, '2022-02-19 07:00:00', '2022-02-20 07:00:00', NULL, 'open', 6),
(14, NULL, '2022-02-20 07:00:00', '2022-02-21 07:00:00', NULL, 'open', 10),
(15, NULL, '2022-02-10 07:00:00', '2022-02-11 07:00:00', NULL, 'open', 2),
(16, NULL, '2022-02-01 07:00:00', '2022-02-02 07:00:00', NULL, 'open', 10),
(17, NULL, '2022-02-21 07:00:00', '2022-02-22 07:00:00', NULL, 'open', 10),
(18, NULL, '2022-02-03 07:00:00', '2022-02-04 07:00:00', NULL, 'open', 7),
(19, NULL, '2022-02-21 07:00:00', '2022-02-25 07:00:00', NULL, 'open', 8),
(20, NULL, '2022-02-09 07:00:00', '2022-02-10 07:00:00', NULL, 'open', 5),
(21, NULL, '2022-02-26 07:00:00', '2022-02-26 07:00:00', NULL, 'open', 2),
(23, NULL, '2022-03-02 07:00:00', '2022-03-02 07:00:00', NULL, 'open', 2),
(24, NULL, '2022-03-03 07:00:00', '2022-03-03 07:00:00', NULL, 'open', 2),
(27, NULL, '2022-03-10 07:00:00', '2022-03-18 07:00:00', NULL, 'open', 7),
(28, NULL, '2022-03-03 07:00:00', '2022-03-03 07:00:00', NULL, 'open', 7),
(30, NULL, '2022-03-03 07:00:00', '2022-03-03 07:00:00', NULL, 'open', 19),
(31, NULL, '2022-03-03 07:00:00', '2022-03-03 07:00:00', NULL, 'open', 19),
(32, NULL, '2022-03-03 07:00:00', '2022-03-03 07:00:00', NULL, 'open', 6),
(33, NULL, '2022-03-07 07:00:00', '2022-03-07 07:00:00', NULL, 'open', 2),
(38, NULL, '2022-03-07 07:00:00', '2022-03-07 07:00:00', NULL, 'open', 23),
(39, NULL, '2022-03-07 07:00:00', '2022-03-07 07:00:00', NULL, 'open', 23),
(40, 'ship chiều', '2022-03-07 07:00:00', '2022-03-07 07:00:00', '2022-03-07 07:00:00', 'process', 6),
(42, NULL, '2022-03-07 07:00:00', '2022-03-10 07:00:00', NULL, 'open', 25);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `price_each` decimal(19,2) NOT NULL,
  `quantity_order` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `price_each`, `quantity_order`, `order_id`, `product_id`) VALUES
(7, '15.00', 2, 6, 23),
(8, '15.00', 1, 6, 44),
(9, '15.00', 1, 6, 41),
(10, '35.00', 10, 7, 5),
(11, '35.00', 10, 7, 29),
(12, '25.00', 3, 8, 8),
(13, '35.00', 2, 8, 2),
(14, '35.00', 1, 8, 5),
(15, '35.00', 5, 9, 5),
(16, '15.00', 1, 10, 26),
(17, '15.00', 1, 10, 32),
(18, '15.00', 1, 10, 35),
(19, '35.00', 2, 10, 29),
(20, '35.00', 3, 11, 29),
(21, '15.00', 2, 11, 35),
(24, '15.00', 10, 13, 41),
(25, '15.00', 10, 13, 41),
(26, '15.00', 10, 13, 44),
(27, '15.00', 10, 13, 44),
(28, '70.00', 5, 14, 47),
(29, '35.00', 5, 14, 5),
(30, '35.00', 5, 14, 17),
(31, '45.00', 5, 14, 38),
(32, '35.00', 5, 15, 5),
(33, '35.00', 5, 15, 2),
(34, '70.00', 3, 15, 47),
(35, '70.00', 10, 16, 47),
(36, '70.00', 10, 17, 47),
(37, '70.00', 6, 18, 47),
(38, '70.00', 6, 19, 47),
(39, '70.00', 6, 19, 47),
(40, '35.00', 10, 20, 5),
(41, '35.00', 10, 20, 14),
(42, '35.00', 10, 20, 17),
(43, '25.00', 6, 21, 8),
(44, '35.00', 3, 21, 5),
(45, '35.00', 2, 21, 2),
(47, '35.00', 1, 23, 5),
(48, '35.00', 3, 24, 5),
(51, '35.00', 10, 30, 5),
(52, '35.00', 1, 31, 5),
(53, '35.00', 4, 32, 5),
(54, '25.00', 9, 33, 8),
(58, '35.00', 1, 38, 2),
(59, '25.00', 1, 38, 8),
(60, '30.00', 3, 38, 21),
(61, '35.00', 1, 38, 5),
(62, '25.00', 1, 39, 8),
(63, '30.00', 3, 39, 21),
(64, '35.00', 1, 39, 2),
(65, '35.00', 1, 39, 2),
(66, '35.00', 1, 39, 5),
(67, '35.00', 1, 39, 5),
(68, '25.00', 1, 39, 8),
(69, '30.00', 3, 39, 21),
(70, '25.00', 2, 40, 8),
(71, '35.00', 2, 40, 5),
(72, '20.00', 2, 40, 10),
(73, '35.00', 2, 40, 2),
(74, '15.00', 5, 42, 23);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `amount` decimal(19,2) NOT NULL,
  `check_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `buy_price` decimal(19,2) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_vendor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `product_line_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `buy_price`, `image`, `product_code`, `product_description`, `product_name`, `product_size`, `product_vendor`, `quantity_in_stock`, `product_line_id`) VALUES
(1, '30.00', 'images/product-1.jpg', 'p1', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'BELL PEPPER', 'S', 'baotg', 500, 1),
(2, '35.00', 'images/product-1.jpg', 'p2', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'BELL PEPPER', 'M', 'baotg', 500, 1),
(3, '40.00', 'images/product-1.jpg', 'p3', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'BELL PEPPER', 'L', 'baotg', 500, 1),
(4, '30.00', 'images/product-2.jpg', 'p4', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'STRAWBERRY', 'S', 'baotg', 500, 2),
(5, '35.00', 'images/product-2.jpg', 'p5', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'STRAWBERRY', 'M', 'baotg', 500, 2),
(6, '40.00', 'images/product-3.jpg', 'p6', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'STRAWBERRY', 'L', 'baotg', 500, 2),
(7, '20.00', 'images/product-3.jpg', 'p7', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'GREEN BEANS', 'S', 'baotg', 500, 1),
(8, '25.00', 'images/product-3.jpg', 'p8', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'GREEN BEANS', 'M', 'baotg', 500, 1),
(9, '30.00', 'images/product-3.jpg', 'p9', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'GREEN BEANS', 'L', 'baotg', 500, 1),
(10, '20.00', 'images/product-4.jpg', 'p10', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'PURPLE CABBAGE', 'S', 'baotg', 500, 1),
(11, '25.00', 'images/product-4.jpg', 'p11', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'PURPLE CABBAGE', 'M', 'baotg', 500, 1),
(12, '30.00', 'images/product-4.jpg', 'p12', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'PURPLE CABBAGE', 'L', 'baotg', 500, 1),
(13, '30.00', 'images/product-5.jpg', 'p13', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'TOMATOE', 'S', 'baotg', 500, 1),
(14, '35.00', 'images/product-5.jpg', 'p14', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'TOMATOE', 'M', 'baotg', 500, 1),
(15, '40.00', 'images/product-5.jpg', 'p15', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'TOMATOE', 'L', 'baotg', 500, 1),
(16, '30.00', 'images/product-6.jpg', 'p16', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'BROCOLLI', 'S', 'baotg', 500, 1),
(17, '35.00', 'images/product-6.jpg', 'p17', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'BROCOLLI', 'M', 'baotg', 500, 1),
(18, '40.00', 'images/product-6.jpg', 'p18', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'BROCOLLI', 'L', 'baotg', 500, 1),
(19, '20.00', 'images/product-7.jpg', 'p19', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'CARROTS', 'S', 'baotg', 500, 1),
(20, '25.00', 'images/product-7.jpg', 'p20', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'CARROTS', 'M', 'baotg', 500, 1),
(21, '30.00', 'images/product-7.jpg', 'p21', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'CARROTS', 'L', 'baotg', 500, 1),
(22, '13.00', 'images/product-8.jpg', 'p22', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'FRUIT JUICE', 'S', 'baotg', 500, 3),
(23, '15.00', 'images/product-8.jpg', 'p23', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'FRUIT JUICE', 'M', 'baotg', 500, 3),
(24, '17.00', 'images/product-8.jpg', 'p24', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'FRUIT JUICE', 'L', 'baotg', 500, 3),
(25, '10.00', 'images/product-9.jpg', 'p25', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'ONION', 'S', 'baotg', 500, 1),
(26, '15.00', 'images/product-9.jpg', 'p26', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'ONION', 'M', 'baotg', 500, 1),
(27, '20.00', 'images/product-9.jpg', 'p27', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'ONION', 'L', 'baotg', 500, 1),
(28, '30.00', 'images/product-10.jpg', 'p28', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'APPLE', 'S', 'baotg', 500, 2),
(29, '35.00', 'images/product-10.jpg', 'p29', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'APPLE', 'M', 'baotg', 500, 2),
(30, '40.00', 'images/product-10.jpg', 'p30', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'APPLE', 'L', 'baotg', 500, 2),
(31, '10.00', 'images/product-11.jpg', 'p31', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'GARLIC', 'S', 'baotg', 500, 1),
(32, '15.00', 'images/product-11.jpg', 'p32', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'GARLIC', 'M', 'baotg', 500, 1),
(33, '20.00', 'images/product-11.jpg', 'p33', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'GARLIC', 'L', 'baotg', 500, 1),
(34, '10.00', 'images/product-12.jpg', 'p34', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'CHILLI', 'S', 'baotg', 500, 1),
(35, '15.00', 'images/product-12.jpg', 'p35', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'CHILLI', 'M', 'baotg', 500, 1),
(36, '20.00', 'images/product-12.jpg', 'p36', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'CHILLI', 'L', 'baotg', 500, 1),
(37, '40.00', 'images/product-13.jpg', 'p37', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'ORANGE', 'S', 'baotg', 500, 2),
(38, '45.00', 'images/product-13.jpg', 'p38', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'ORANGE', 'M', 'baotg', 500, 2),
(39, '50.00', 'images/product-13.jpg', 'p39', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'ORANGE', 'L', 'baotg', 500, 2),
(40, '13.00', 'images/product-14.jpg', 'p40', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'ORANGE JUICE', 'S', 'baotg', 500, 3),
(41, '15.00', 'images/product-14.jpg', 'p41', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'ORANGE JUICE', 'M', 'baotg', 500, 3),
(42, '17.00', 'images/product-14.jpg', 'p42', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'ORANGE JUICE', 'L', 'baotg', 500, 3),
(43, '13.00', 'images/product-15.jpg', 'p43', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'APPLE JUICE', 'S', 'baotg', 500, 3),
(44, '15.00', 'images/product-15.jpg', 'p44', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'APPLE JUICE', 'M', 'baotg', 500, 3),
(45, '17.00', 'images/product-15.jpg', 'p45', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'APPLE JUICE', 'L', 'baotg', 500, 3),
(46, '60.00', 'images/product-16.jpg', 'p46', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'PISTACHIOS', 'S', 'baotg', 500, 4),
(47, '70.00', 'images/product-16.jpg', 'p47', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'PISTACHIOS', 'M', 'baotg', 500, 4),
(48, '17.00', 'images/product-16.jpg', 'p48', 'A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing ', 'PISTACHIOS', 'L', 'baotg', 500, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_lines`
--

CREATE TABLE `product_lines` (
  `id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_line` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_lines`
--

INSERT INTO `product_lines` (`id`, `description`, `product_line`) VALUES
(1, 'Description of vegetables', 'VEGETABLES'),
(2, 'Description of fruits', 'FRUITS'),
(3, 'Description of juice', 'JUICE'),
(4, 'Description of Dried', 'DRIED');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `t_permission`
--

CREATE TABLE `t_permission` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `permission_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permission_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `t_permission`
--

INSERT INTO `t_permission` (`id`, `created_at`, `created_by`, `deleted`, `updated_at`, `updated_by`, `permission_key`, `permission_name`) VALUES
(1, NULL, NULL, 0, NULL, NULL, 'USER_CREATE', 'tạo user'),
(2, NULL, NULL, 0, NULL, NULL, 'USER_READ', 'xem user'),
(3, NULL, NULL, 0, NULL, NULL, 'USER_UPDATE', 'sửa user'),
(4, NULL, NULL, 0, NULL, NULL, 'USER_DELETE', 'xóa user');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `t_role`
--

CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `role_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `t_role`
--

INSERT INTO `t_role` (`id`, `created_at`, `created_by`, `deleted`, `updated_at`, `updated_by`, `role_key`, `role_name`) VALUES
(1, NULL, NULL, 0, NULL, NULL, 'ROLE_ADMIN', 'Super User'),
(2, NULL, NULL, 0, NULL, NULL, 'ROLE_CUSTOMER', 'Customer'),
(3, NULL, NULL, 0, NULL, NULL, 'ROLE_MANAGER', 'Manager');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `t_role_permission`
--

CREATE TABLE `t_role_permission` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `t_role_permission`
--

INSERT INTO `t_role_permission` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(3, 2),
(3, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `t_token`
--

CREATE TABLE `t_token` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `token` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token_exp_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `t_token`
--

INSERT INTO `t_token` (`id`, `created_at`, `created_by`, `deleted`, `updated_at`, `updated_by`, `token`, `token_exp_date`) VALUES
(1, NULL, 1, 0, NULL, NULL, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY1MTgxMTEsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.Y_a44BoJqhNFG4kuXm85BWY82Dw0qZcLryvHrB9WTEM', '2022-03-06 05:08:31'),
(2, NULL, 1, 0, NULL, NULL, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY1MTgyMjIsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.WeoATbA8vOTRULG4NfB3DrHlvdsNs9PLQ-9Zdn5uCVQ', '2022-03-06 05:10:22'),
(3, NULL, 1, 0, NULL, NULL, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY1MTg2NjcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.q5-p-U5J4yB-5D1v89X3NfBwjHl9kCIN-9mf77Fb11s', '2022-03-06 05:17:47'),
(4, '2022-02-25 05:09:17', 0, 0, '2022-02-25 05:09:17', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2MDQ1NTcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkSkx0SzhtSUp5dWxYY0EwTVE0OHpqdXUubDlcL3I5bGtzQnpxUmpYMnVJWmFTTERrWm1cL1kxeSIsInVzZXJJZCI6NCwiYXV0aG9yaXRpZXMiOltdLCJ1c2VybmFtZSI6Im15aG5rIn19.6HdXsUKYOsajzYLgI0cz5ISo-zNJvK0gvXBV2l3_fFM', '2022-03-07 05:09:17'),
(5, '2022-02-25 05:18:52', 0, 0, '2022-02-25 05:18:52', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2MDUxMzIsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkSkx0SzhtSUp5dWxYY0EwTVE0OHpqdXUubDlcL3I5bGtzQnpxUmpYMnVJWmFTTERrWm1cL1kxeSIsInVzZXJJZCI6NCwiYXV0aG9yaXRpZXMiOltdLCJ1c2VybmFtZSI6Im15aG5rIn19.BnXHMOQozVCNJN6MWMm1DvSde83TYkmjzDYeOIJIP8I', '2022-03-07 05:18:52'),
(6, '2022-02-25 05:19:14', 0, 0, '2022-02-25 05:19:14', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2MDUxNTQsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.f7tSg0QLPpoMlkdmqX4s9X0OOpFCfyFlpESC9Z7pLm0', '2022-03-07 05:19:14'),
(7, '2022-02-25 05:22:57', 0, 0, '2022-02-25 05:22:57', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2MDUzNzcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.EZ47bEOP36Dz_rh2mkTLqU1dA-mbVFFGkavXjnnsF_E', '2022-03-07 05:22:57'),
(8, '2022-02-25 05:31:23', 0, 0, '2022-02-25 05:31:23', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2MDU4ODMsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.xSziBZ2kZEIk6CDhHT2vrwqGMxb5v-XkAueSZRNUQhY', '2022-03-07 05:31:23'),
(9, '2022-02-25 05:34:49', 0, 0, '2022-02-25 05:34:49', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2MDYwODksInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.NRzpajMdbxynudIc6XtgtlAlxtttMe5v5KdG1KNX39M', '2022-03-07 05:34:49'),
(10, '2022-02-25 05:38:14', 0, 0, '2022-02-25 05:38:14', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2MDYyOTQsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.ns6_54lyEABM1rXowbu5OKNwt8ciynv9UFwttwgWsKk', '2022-03-07 05:38:14'),
(11, '2022-02-25 05:40:37', 0, 0, '2022-02-25 05:40:37', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2MDY0MzcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.yzYNRRNIl8ezwM708EWwmb2DwBvDyYAbGbyaAirz_j4', '2022-03-07 05:40:37'),
(12, '2022-02-25 05:46:15', 0, 0, '2022-02-25 05:46:15', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2MDY3NzUsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.hsRe4h4l1X59F72ZqL1TpIpXyJkR6RG79rG4CTSff_c', '2022-03-07 05:46:15'),
(13, '2022-02-25 17:34:58', 0, 0, '2022-02-25 17:34:58', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NDkyOTgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.nklrKHNIHbwxZhhkDtIsDojQfj1YRsO0mhNGqqIZpzk', '2022-03-07 17:34:58'),
(14, '2022-02-25 18:23:08', 0, 0, '2022-02-25 18:23:08', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NTIxODgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.jjS5LlQTi8v5pQ8PetZ_LzGJC1XyOn_3Br8MQUyLLt4', '2022-03-07 18:23:08'),
(15, '2022-02-25 18:25:29', 0, 0, '2022-02-25 18:25:29', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NTIzMjksInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.cqT-hm-EpT5rMssVMGgSXcSEFIL-RnPQSOgtC2zILnU', '2022-03-07 18:25:29'),
(16, '2022-02-25 18:28:58', 0, 0, '2022-02-25 18:28:58', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NTI1MzgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.yEtRWFcD7uy2-t574tpq81iYEKtjgmOIGEaJhxZfmLU', '2022-03-07 18:28:58'),
(17, '2022-02-25 18:30:56', 0, 0, '2022-02-25 18:30:56', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NTI2NTYsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.SOAwYLu7-nkdXeyw0zcyFtzxbWLdAjqtnZ4snLCas4k', '2022-03-07 18:30:56'),
(18, '2022-02-25 18:31:39', 0, 0, '2022-02-25 18:31:39', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NTI2OTksInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.b9DawNbU1xmeAtX_2ZY0okil6X0gKuo1sSi5uWnntio', '2022-03-07 18:31:39'),
(19, '2022-02-25 18:34:41', 0, 0, '2022-02-25 18:34:41', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NTI4ODEsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.FAm6qi43bbIC6wkAol_I62cIw0cJLZaWyQELoQsBBAw', '2022-03-07 18:34:41'),
(20, '2022-02-25 20:14:41', 0, 0, '2022-02-25 20:14:41', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NTg4ODEsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkc096TjlPdWQyazd4MUVmMG1RMkFoT1FxNGlPYS5PLjZkYngxQkR0c0NDUVk2WkYuRjhJMGkiLCJ1c2VySWQiOjUsImF1dGhvcml0aWVzIjpbXSwidXNlcm5hbWUiOiJ0cmFuYmFvMjcwNyJ9fQ.TS8ggn6L3KCqp-E5K4r9AT5gUaw1My7LKUVU6YQ6lX4', '2022-03-07 20:14:41'),
(21, '2022-02-25 20:35:35', 0, 0, '2022-02-25 20:35:35', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjAxMzUsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.D73uHDLGNqEE4enjwcZ1V5ci5_i4_aX1PedmhYyAbIU', '2022-03-07 20:35:35'),
(22, '2022-02-25 20:37:17', 0, 0, '2022-02-25 20:37:17', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjAyMzcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.Nt0JYQAnp6oJtFaganAYMhWKOu40vpUHv2Ap1gEHMuY', '2022-03-07 20:37:17'),
(23, '2022-02-25 21:15:16', 0, 0, '2022-02-25 21:15:16', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjI1MTYsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.6SFVz3fSm-zFuVYaMprLAGmHKvmEAK3vW5q0_j2dssQ', '2022-03-07 21:15:16'),
(24, '2022-02-25 21:29:39', 0, 0, '2022-02-25 21:29:39', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjMzNzksInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.xjEiYxZaKzlCEkeJxIgvYFiMdGzdYIKANrIPD17E2SI', '2022-03-07 21:29:39'),
(25, '2022-02-25 22:00:35', 0, 0, '2022-02-25 22:00:35', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjUyMzUsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.Byub424I-NG-1F6pCUgiJ5hZSqRJSY0EmTs-zVJQE5c', '2022-03-07 22:00:35'),
(26, '2022-02-25 22:00:56', 0, 0, '2022-02-25 22:00:56', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjUyNTYsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.UzTZQqJwyQRktdrC2oBknjRpt0fkDv3bGjBn6Pa9K30', '2022-03-07 22:00:56'),
(27, '2022-02-25 22:00:59', 0, 0, '2022-02-25 22:00:59', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjUyNTksInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.0shWQSOgi1KK6V3xmbiNp3HQNEuKXSWnAlDn4FWm5SE', '2022-03-07 22:00:59'),
(28, '2022-02-25 22:01:00', 0, 0, '2022-02-25 22:01:00', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjUyNjAsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.b5-iJTqapRf7EUTasaLOKa3ztCNb7oNTdzINrYBUci0', '2022-03-07 22:01:00'),
(29, '2022-02-25 22:01:02', 0, 0, '2022-02-25 22:01:02', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjUyNjIsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.6Gi15WrplMW-v1ltoIrYCORorPmeXFDoyPuK3fiP9VM', '2022-03-07 22:01:02'),
(30, '2022-02-25 22:01:02', 0, 0, '2022-02-25 22:01:02', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjUyNjIsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.mXMZ7wV_eIe6oL00CbS34n7xLXLx8OUlyDLqYfxToBU', '2022-03-07 22:01:02'),
(31, '2022-02-25 22:01:02', 0, 0, '2022-02-25 22:01:02', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjUyNjIsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.mXMZ7wV_eIe6oL00CbS34n7xLXLx8OUlyDLqYfxToBU', '2022-03-07 22:01:02'),
(32, '2022-02-25 22:01:07', 0, 0, '2022-02-25 22:01:07', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjUyNjcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.sQ6MgMMLuJwC5jPT2K-BW8koIE_LwZxGIAXgTl2h1W0', '2022-03-07 22:01:07'),
(33, '2022-02-25 22:01:07', 0, 0, '2022-02-25 22:01:07', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjUyNjcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.oAYjdvxp7mMq9vBxb8408FUahhdlepgTbn3vK3ffknE', '2022-03-07 22:01:07'),
(34, '2022-02-25 22:01:07', 0, 0, '2022-02-25 22:01:07', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjUyNjcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.oAYjdvxp7mMq9vBxb8408FUahhdlepgTbn3vK3ffknE', '2022-03-07 22:01:07'),
(35, '2022-02-25 22:01:08', 0, 0, '2022-02-25 22:01:08', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjUyNjgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.enNBIsD_06hZ7jqeLL0BZtRygiN9nBX2YFZrLErFHvg', '2022-03-07 22:01:08'),
(36, '2022-02-25 22:01:08', 0, 0, '2022-02-25 22:01:08', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjUyNjgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.enNBIsD_06hZ7jqeLL0BZtRygiN9nBX2YFZrLErFHvg', '2022-03-07 22:01:08'),
(37, '2022-02-25 22:01:08', 0, 0, '2022-02-25 22:01:08', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjUyNjgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.enNBIsD_06hZ7jqeLL0BZtRygiN9nBX2YFZrLErFHvg', '2022-03-07 22:01:08'),
(38, '2022-02-25 22:01:08', 0, 0, '2022-02-25 22:01:08', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjUyNjgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.enNBIsD_06hZ7jqeLL0BZtRygiN9nBX2YFZrLErFHvg', '2022-03-07 22:01:08'),
(39, '2022-02-25 22:02:37', 0, 0, '2022-02-25 22:02:37', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjUzNTcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.GA1BouwibyiqimnzXWoWLps2OCKo4iE6TaOJp9V2RoI', '2022-03-07 22:02:37'),
(40, '2022-02-25 22:02:45', 0, 0, '2022-02-25 22:02:45', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjUzNjUsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.y64oeZr6I1K5-u9RGBSaCZeRBj3UT7_KMHVsm8BdP1w', '2022-03-07 22:02:45'),
(41, '2022-02-25 22:02:45', 0, 0, '2022-02-25 22:02:45', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjUzNjUsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.Mlh3isa3RocxruWNB27GGCoFdlK5Pk-pcm0ETxVXKNU', '2022-03-07 22:02:45'),
(42, '2022-02-25 22:03:30', 0, 0, '2022-02-25 22:03:30', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjU0MTAsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.XDIwTXEcATN5kdm5ic_T6QQiIVKtSDoM5z7yjchJr80', '2022-03-07 22:03:30'),
(43, '2022-02-25 22:03:55', 0, 0, '2022-02-25 22:03:55', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjU0MzUsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.szmfqHkJbTrkD_D5dnJ50vduSgWNEWAMZS7OSOuTZZ8', '2022-03-07 22:03:55'),
(44, '2022-02-25 22:04:19', 0, 0, '2022-02-25 22:04:19', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjU0NTksInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.RbGNQwvkMx-F9i5Cxh1UiQ-T_03sE5426Gjd8k1l5QE', '2022-03-07 22:04:19'),
(45, '2022-02-25 23:05:07', 0, 0, '2022-02-25 23:05:07', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NjkxMDcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.2UTVgc1N1n6vjBoG1jN8vPRSYCrGj-C1qVlv6KIpD9o', '2022-03-07 23:05:07'),
(46, '2022-02-25 23:19:43', 0, 0, '2022-02-25 23:19:43', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2Njk5ODMsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.0yWuFplY7hd2JCsDGcmLmzsUhPYRqW824zk8o_Jm_Sw', '2022-03-07 23:19:43'),
(47, '2022-02-25 23:20:18', 0, 0, '2022-02-25 23:20:18', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NzAwMTgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.6d5yW_Lvk0PdXNgJd4Sdy5D0OcGDLTAmmjPAeEmnbDw', '2022-03-07 23:20:18'),
(48, '2022-02-25 23:26:59', 0, 0, '2022-02-25 23:26:59', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NzA0MTksInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.pWpESZ58CcTQgOOkAa7KBi890g8N5_h4Rdp0_d96XDE', '2022-03-07 23:26:59'),
(49, '2022-02-25 23:33:37', 0, 0, '2022-02-25 23:33:37', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NzA4MTcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.XmQzM6eHyZAKzyn1WEvhOIj12at3jyladwiJznHSzG0', '2022-03-07 23:33:37'),
(50, '2022-02-25 23:36:47', 0, 0, '2022-02-25 23:36:47', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NzEwMDcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.j9ie8EqVoqWRA5N81c8RgpAB6QihF-IMuc-cHEgwPvQ', '2022-03-07 23:36:47'),
(51, '2022-02-25 23:42:05', 0, 0, '2022-02-25 23:42:05', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NzEzMjUsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.Tu9dMMaxMzichp8bvcAPyQVsDJxJ0GYd6WJVnxIjz6g', '2022-03-07 23:42:05'),
(52, '2022-02-25 23:42:56', 0, 0, '2022-02-25 23:42:56', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2NzEzNzYsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.BEcQDVQu5MpslwuCQSDSz3_-dwmcXP69ZyY3b_kNrUs', '2022-03-07 23:42:56'),
(53, '2022-02-26 01:49:28', 1, 0, '2022-02-26 01:49:28', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2Nzg5NjgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkc096TjlPdWQyazd4MUVmMG1RMkFoT1FxNGlPYS5PLjZkYngxQkR0c0NDUVk2WkYuRjhJMGkiLCJ1c2VySWQiOjUsImF1dGhvcml0aWVzIjpbXSwidXNlcm5hbWUiOiJ0cmFuYmFvMjcwNyJ9fQ.kweduHDWetwYB1SZFx0WflhvxJV1SX1v3bngESs2src', '2022-03-08 01:49:28'),
(54, '2022-02-26 02:12:38', 5, 0, '2022-02-26 02:12:38', 5, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2ODAzNTgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.KBRet1etnJCGGIZMSvoBh0vRSrQ9AwuJ4alNeyLZWGc', '2022-03-08 02:12:38'),
(55, '2022-02-26 02:15:44', 5, 0, '2022-02-26 02:15:44', 5, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2ODA1NDQsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.ncaJsy8ObV3X0LyAysBq7MAPINVxj2kWMEGgXXQqPKc', '2022-03-08 02:15:44'),
(56, '2022-02-26 02:18:39', 1, 0, '2022-02-26 02:18:39', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2ODA3MTksInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkSkx0SzhtSUp5dWxYY0EwTVE0OHpqdXUubDlcL3I5bGtzQnpxUmpYMnVJWmFTTERrWm1cL1kxeSIsInVzZXJJZCI6NCwiYXV0aG9yaXRpZXMiOltdLCJ1c2VybmFtZSI6Im15aG5rIn19.dExhPYyOOEvuJPcAeorTBg-a16Eu7m9OLcgjPH2pH8E', '2022-03-08 02:18:39'),
(57, '2022-02-26 02:22:30', 1, 0, '2022-02-26 02:22:30', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2ODA5NTAsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkc096TjlPdWQyazd4MUVmMG1RMkFoT1FxNGlPYS5PLjZkYngxQkR0c0NDUVk2WkYuRjhJMGkiLCJ1c2VySWQiOjUsImF1dGhvcml0aWVzIjpbXSwidXNlcm5hbWUiOiJ0cmFuYmFvMjcwNyJ9fQ.IT4VOKgGl3QGsbd4CTSQkBDAz-8MV4yqDwiod_ri9HM', '2022-03-08 02:22:30'),
(58, '2022-02-26 02:23:48', 4, 0, '2022-02-26 02:23:48', 4, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2ODEwMjgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.X8VdQUHdgot7ak14Y9xtiW-7hcVmYOgNavEIMza-PpU', '2022-03-08 02:23:48'),
(59, '2022-02-26 02:24:06', 1, 0, '2022-02-26 02:24:06', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2ODEwNDYsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkSkx0SzhtSUp5dWxYY0EwTVE0OHpqdXUubDlcL3I5bGtzQnpxUmpYMnVJWmFTTERrWm1cL1kxeSIsInVzZXJJZCI6NCwiYXV0aG9yaXRpZXMiOltdLCJ1c2VybmFtZSI6Im15aG5rIn19.L-WC-1BM3On0os-ZPID8-TPH4YJrxhJEVEgKFlnhkPw', '2022-03-08 02:24:06'),
(60, '2022-02-26 02:24:24', 4, 0, '2022-02-26 02:24:24', 4, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2ODEwNjQsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkMnRzVWpHQ3AzeFlPY0xxTHNYTEJOT1A0UTdrdXY3Vm5JYnVUUUE4NE03RVBuQlwvXC81WjdGeSIsInVzZXJJZCI6NywiYXV0aG9yaXRpZXMiOltdLCJ1c2VybmFtZSI6ImhpZXVobiJ9fQ.BoiLy02O3bOEP0KIwRGnX7PR6LPe6N2V49ryeycaOjU', '2022-03-08 02:24:24'),
(61, '2022-02-26 02:24:51', 7, 0, '2022-02-26 02:24:51', 7, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2ODEwOTEsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAka2ZUVWd4eVRzSkpxVXRnaUc3aXAxLnBzZjY4cjdoQ2Fqd0p6a3dUc2lhT01TbUxFQzFRYXUiLCJ1c2VySWQiOjMsImF1dGhvcml0aWVzIjpbXSwidXNlcm5hbWUiOiJsb2NsdCJ9fQ.koE1OKr-Pxv6cShnNA2P3bp78DFxZDP8RC_BuFNo8FA', '2022-03-08 02:24:51'),
(62, '2022-02-26 02:25:09', 3, 0, '2022-02-26 02:25:09', 3, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2ODExMDksInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.b250tmsSmk9trSkHEy6lxZALPL5xT8NqO7Nl2llnwSk', '2022-03-08 02:25:09'),
(63, '2022-02-26 02:31:01', 0, 0, '2022-02-26 02:31:01', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2ODE0NjAsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.3aQ5ccd24o1Vf4ZEUzFU246f3VCZjOyhknWsYWG8yL0', '2022-03-08 02:31:00'),
(64, '2022-02-26 02:31:22', 1, 0, '2022-02-26 02:31:22', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2ODE0ODIsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkSkx0SzhtSUp5dWxYY0EwTVE0OHpqdXUubDlcL3I5bGtzQnpxUmpYMnVJWmFTTERrWm1cL1kxeSIsInVzZXJJZCI6NCwiYXV0aG9yaXRpZXMiOltdLCJ1c2VybmFtZSI6Im15aG5rIn19.KlkAaeJ1QJk35JgS0NnAqZxzts4WmKXPrAtHTxRsQec', '2022-03-08 02:31:22'),
(65, '2022-02-26 02:49:32', 0, 0, '2022-02-26 02:49:32', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2ODI1NzIsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.eKtJJ2_oY_L0gfba_hrTbgGxz0eIDjplp1m7OmOEXt0', '2022-03-08 02:49:32'),
(66, '2022-02-26 03:58:55', 0, 0, '2022-02-26 03:58:55', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDY2ODY3MzUsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.hu0Xincnq2W6jJ716ivKDxA15iCne361DEHF_bF3ZBM', '2022-03-08 03:58:55'),
(67, '2022-03-02 04:13:43', 0, 0, '2022-03-02 04:13:43', 0, NULL, '2022-03-12 04:13:43'),
(68, '2022-03-02 04:13:49', 0, 0, '2022-03-02 04:13:49', 0, NULL, '2022-03-12 04:13:49'),
(69, '2022-03-02 04:15:15', 5, 0, '2022-03-02 04:15:15', 5, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwMzMzMTUsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ._mvj-sZt6OBFjbeB3EQyf81n-XZglO0W3vYOvYvrgEo', '2022-03-12 04:15:15'),
(70, '2022-03-02 04:29:44', 5, 0, '2022-03-02 04:29:44', 5, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwMzQxODQsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.9n_BIOKasQQ-bxGPRM8Sk4k_X0V3OuxJQOvYziC-3tY', '2022-03-12 04:29:44'),
(71, '2022-03-02 04:37:35', 0, 0, '2022-03-02 04:37:35', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwMzQ2NTQsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.Wtr7tfswNPeoY5crV_apUMnNE5Cdrf2Xhw7tPbBCeFs', '2022-03-12 04:37:35'),
(72, '2022-03-02 04:54:41', 0, 0, '2022-03-02 04:54:41', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwMzU2ODEsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.a8YDYExmNdKs78HH8bDpZCRhu8R-y7mmHto2tm94Djs', '2022-03-12 04:54:41'),
(73, '2022-03-02 04:57:36', 0, 0, '2022-03-02 04:57:36', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwMzU4NTYsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.w9DzsO1GD_ttnmXdB1kI-exl_jrLZ_Il9J58Pbw_uyg', '2022-03-12 04:57:36'),
(74, '2022-03-02 04:57:57', 0, 0, '2022-03-02 04:57:57', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwMzU4NzcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.00YG0mXt5Pc3kEaJJ3Z4Rc4Kg6yAsv4onHFW903zrsw', '2022-03-12 04:57:57'),
(75, '2022-03-02 05:00:53', 0, 0, '2022-03-02 05:00:53', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwMzYwNTMsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.duoxaXpEjsfLB2iBIv2fG5GcKOG0EMoMu5oHa63G-_I', '2022-03-12 05:00:53'),
(76, '2022-03-02 05:06:54', 0, 0, '2022-03-02 05:06:54', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwMzY0MTMsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.o8eQFfHiLydvbXO26P2QVgJkjZNThrGbXxcnOPklCFc', '2022-03-12 05:06:54'),
(77, '2022-03-02 05:07:03', 0, 0, '2022-03-02 05:07:03', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwMzY0MjMsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.6VBoy59FcUdXWlLk0nITBx9j9WsqDjjqMZ9pd9RjG2I', '2022-03-12 05:07:03'),
(78, '2022-03-02 05:08:24', 0, 0, '2022-03-02 05:08:24', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwMzY1MDMsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.zuI6iAECJ6_xuSEV7clNlxSUcRM-6RctfTlTpKlzuZQ', '2022-03-12 05:08:23'),
(79, '2022-03-02 05:14:28', 0, 0, '2022-03-02 05:14:28', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwMzY4NjgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.5k_pfUK_iRfpBlOfH8cL8zQxU_uzuAE4H6Z_eQOtYvg', '2022-03-12 05:14:28'),
(80, '2022-03-02 05:32:28', 0, 0, '2022-03-02 05:32:28', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwMzc5NDgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.lfMBjK-1-LuoZHrfMDsdm4bpJClbN6Ps6pezIt_tK5Y', '2022-03-12 05:32:28'),
(81, '2022-03-02 05:33:40', 0, 0, '2022-03-02 05:33:40', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwMzgwMjAsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.01hq6a7lPqNbR0BKjK_GN7kVwr_YLRzcvWwgA5qWwIg', '2022-03-12 05:33:40'),
(82, '2022-03-02 05:37:15', 0, 0, '2022-03-02 05:37:15', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwMzgyMzUsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.CG-qP-pn4Hnz3p5h14nzrByU69nn9E7TBEl4dvc0TLA', '2022-03-12 05:37:15'),
(83, '2022-03-02 05:38:45', 0, 0, '2022-03-02 05:38:45', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwMzgzMjUsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.9c7d0fkyyQCo5-hwWvVkFvuy6mx6bnNRSj6ZWMSuU0M', '2022-03-12 05:38:45'),
(84, '2022-03-02 05:39:16', 0, 0, '2022-03-02 05:39:16', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwMzgzNTYsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.V5OGOm4xZjLRt-18MZ1Jmw70UBZDDQAyjVQ3QVguv8Y', '2022-03-12 05:39:16'),
(85, '2022-03-02 06:00:20', 0, 0, '2022-03-02 06:00:20', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwMzk2MjAsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.1LDxq3E5oQizw22g6YPfiIg7BZlnb7f5mz4dlD3TKNI', '2022-03-12 06:00:20'),
(86, '2022-03-02 06:10:31', 0, 0, '2022-03-02 06:10:31', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNDAyMzEsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.Pl_RinBzRLAc-A0cSYiJDX__-pHSJxBYjljfWA3ln_k', '2022-03-12 06:10:31'),
(87, '2022-03-02 06:16:45', 0, 0, '2022-03-02 06:16:45', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNDA2MDUsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkSkx0SzhtSUp5dWxYY0EwTVE0OHpqdXUubDlcL3I5bGtzQnpxUmpYMnVJWmFTTERrWm1cL1kxeSIsInVzZXJJZCI6NCwiYXV0aG9yaXRpZXMiOltdLCJ1c2VybmFtZSI6Im15aG5rIn19.B7SLYTOTo2_qL3bVAxubQcvqYmIdeq5i7uOfbCxW2yE', '2022-03-12 06:16:45'),
(88, '2022-03-02 06:19:04', 0, 0, '2022-03-02 06:19:04', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNDA3NDQsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.h0AYEV8wIsstM5_Rs7BDcsXrMr0kaRGTc029uBT7MAw', '2022-03-12 06:19:04'),
(89, '2022-03-02 06:20:05', 0, 0, '2022-03-02 06:20:05', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNDA4MDUsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkSkx0SzhtSUp5dWxYY0EwTVE0OHpqdXUubDlcL3I5bGtzQnpxUmpYMnVJWmFTTERrWm1cL1kxeSIsInVzZXJJZCI6NCwiYXV0aG9yaXRpZXMiOltdLCJ1c2VybmFtZSI6Im15aG5rIn19.Ouddcw373IyG7ivwHt3ExrkVTboiVRiMyBsU6uvO-CI', '2022-03-12 06:20:05'),
(90, '2022-03-02 06:42:57', 0, 0, '2022-03-02 06:42:57', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNDIxNzcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.J41OFzFB0rfkiguiANQCta6Xn2WXnG9cbhWkv3eXbFM', '2022-03-12 06:42:57'),
(91, '2022-03-02 13:09:20', 0, 0, '2022-03-02 13:09:20', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNjUzNjAsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.Y9UeQxlSWxuy-L_WJDuZdBmyLDi_f-MkZUCKugLbVsg', '2022-03-12 13:09:20'),
(92, '2022-03-02 13:11:26', 5, 0, '2022-03-02 13:11:26', 5, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNjU0ODYsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.Catsle4ZHayQDpXQx2942AaDeJWzloAqqzJo-GiMfIc', '2022-03-12 13:11:26'),
(93, '2022-03-02 13:16:35', 0, 0, '2022-03-02 13:16:35', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNjU3OTUsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.8btXWRGBHixXAK9_utKBj1ci1wcEp-9ekOIHav9RAZE', '2022-03-12 13:16:35'),
(94, '2022-03-02 13:19:18', 0, 0, '2022-03-02 13:19:18', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNjU5NTgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.khB06dzhfUJ5JH7dBSWDAP1XFFf023_Jb9tN-VE4lKU', '2022-03-12 13:19:18'),
(95, '2022-03-02 13:22:39', 0, 0, '2022-03-02 13:22:39', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNjYxNTksInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.UiG_ZZQ34Q-RKrSyelUcqYZwMRePFD0DzOvWlNHHPA0', '2022-03-12 13:22:39'),
(96, '2022-03-02 14:11:53', 0, 0, '2022-03-02 14:11:53', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNjkxMTMsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.wvlhO4NxdgQWGVjCuIqm-l35vKAQWnMCDZYfbV_gJUQ', '2022-03-12 14:11:53'),
(97, '2022-03-02 14:14:03', 0, 0, '2022-03-02 14:14:03', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNjkyNDMsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.deb0xOczuJmMuF1B_Vy5tLKnQ9Z7t4qPG4n1Ia8Cai4', '2022-03-12 14:14:03'),
(98, '2022-03-02 14:17:18', 0, 0, '2022-03-02 14:17:18', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNjk0MzgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.4K50-20mKiSAfF62qUhh3OHYimBTOnNBlSdGl_-uVo4', '2022-03-12 14:17:18'),
(99, '2022-03-02 14:27:51', 0, 0, '2022-03-02 14:27:51', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNzAwNzEsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.Ws3GXEBEAId0g5doEDUXCXpwhqMp_cBZHuyW7Ndycno', '2022-03-12 14:27:51'),
(100, '2022-03-02 14:28:11', 0, 0, '2022-03-02 14:28:11', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNzAwOTEsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkSkx0SzhtSUp5dWxYY0EwTVE0OHpqdXUubDlcL3I5bGtzQnpxUmpYMnVJWmFTTERrWm1cL1kxeSIsInVzZXJJZCI6NCwiYXV0aG9yaXRpZXMiOltdLCJ1c2VybmFtZSI6Im15aG5rIn19.srn2oLiLttNubbRi-W9MbIFm68-ZyuNUE_P6qDGBEr0', '2022-03-12 14:28:11'),
(101, '2022-03-02 14:31:25', 0, 0, '2022-03-02 14:31:25', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNzAyODUsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.3fsgmGbFut20Aj6IRRpbikMXIGNNmcnbVPc8fgkosOg', '2022-03-12 14:31:25'),
(102, '2022-03-02 14:31:41', 0, 0, '2022-03-02 14:31:41', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNzAzMDEsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkSkx0SzhtSUp5dWxYY0EwTVE0OHpqdXUubDlcL3I5bGtzQnpxUmpYMnVJWmFTTERrWm1cL1kxeSIsInVzZXJJZCI6NCwiYXV0aG9yaXRpZXMiOltdLCJ1c2VybmFtZSI6Im15aG5rIn19.pgyM_ZLPyK9V_z56uPRat1cWziNz25EznoLoKPPvlq8', '2022-03-12 14:31:41'),
(103, '2022-03-02 14:35:09', 0, 0, '2022-03-02 14:35:09', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNzA1MDksInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkdmRzajhNLlVYbnBkQnVvbldvNWdXT3ZCTnpnNDVKZnVXU0wuVFcxN0RFV09hQUExZUVFbTYiLCJ1c2VySWQiOjgsImF1dGhvcml0aWVzIjpbXSwidXNlcm5hbWUiOiJoYWhpZXUifX0.4WbozNm79_ghlKXjWtBPLQyyKtdBkMAK4m00sE9H6zY', '2022-03-12 14:35:09'),
(104, '2022-03-02 14:37:42', 0, 0, '2022-03-02 14:37:42', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNzA2NjIsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkdmRzajhNLlVYbnBkQnVvbldvNWdXT3ZCTnpnNDVKZnVXU0wuVFcxN0RFV09hQUExZUVFbTYiLCJ1c2VySWQiOjgsImF1dGhvcml0aWVzIjpbXSwidXNlcm5hbWUiOiJoYWhpZXUifX0.AtywTOSDd3_eZNq70vKojiFoXPtU4xcDDuxS-f-asRI', '2022-03-12 14:37:42'),
(105, '2022-03-02 14:37:56', 0, 0, '2022-03-02 14:37:56', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwNzA2NzYsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.FXinXOXQ_FT9r-RGZ5WoyPBf74bekvKArbOu-FWXj8w', '2022-03-12 14:37:56'),
(106, '2022-03-02 18:09:34', 0, 0, '2022-03-02 18:09:34', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwODMzNzQsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.0aLclOdxbyTdTADo2fcP_mIBUMudhc-PNqZzuGcU2EY', '2022-03-12 18:09:34'),
(107, '2022-03-02 18:12:15', 0, 0, '2022-03-02 18:12:15', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwODM1MzUsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkSkx0SzhtSUp5dWxYY0EwTVE0OHpqdXUubDlcL3I5bGtzQnpxUmpYMnVJWmFTTERrWm1cL1kxeSIsInVzZXJJZCI6NCwiYXV0aG9yaXRpZXMiOltdLCJ1c2VybmFtZSI6Im15aG5rIn19.vuywPM21t7LJHqndWdmjSuHwlR-0dZ04g4TSj5Bmn7g', '2022-03-12 18:12:15'),
(108, '2022-03-02 18:13:59', 0, 0, '2022-03-02 18:13:59', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwODM2MzksInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.b_yk1BEhDOogissnPJMklrm0mjT2lIcxiUWgEYDvgRQ', '2022-03-12 18:13:59'),
(109, '2022-03-02 21:10:23', 0, 0, '2022-03-02 21:10:23', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcwOTQyMjMsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.drotW6W2xceYyrDB87_ZVhPY5K0OzuaL4UgesBArVGo', '2022-03-12 21:10:23'),
(110, '2022-03-03 01:38:47', 0, 0, '2022-03-03 01:38:47', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcxMTAzMjcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkWnZBVXNRUDlrM1RoZ3cuYUlWalBnT0s4eFwvYUN6N0dsVHNEd3hWd2pKZFVsVnp5RHZlYVdTIiwidXNlcklkIjo5LCJhdXRob3JpdGllcyI6W10sInVzZXJuYW1lIjoiZHV5dHEifX0.XipZQIWmlwvo569pxy3Pvmd5fwy1gtdPxpEntkrbsNk', '2022-03-13 01:38:47'),
(111, '2022-03-03 03:12:41', 0, 0, '2022-03-03 03:12:41', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcxMTU5NjEsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAka2ZUVWd4eVRzSkpxVXRnaUc3aXAxLnBzZjY4cjdoQ2Fqd0p6a3dUc2lhT01TbUxFQzFRYXUiLCJ1c2VySWQiOjMsImF1dGhvcml0aWVzIjpbXSwidXNlcm5hbWUiOiJsb2NsdCJ9fQ.Q4_vM-6uxKs0Cv57Q4JOokONsCzI1efreX7Xxg19Ve4', '2022-03-13 03:12:41'),
(112, '2022-03-03 03:25:58', 0, 0, '2022-03-03 03:25:58', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcxMTY3NTgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkNmwuSHoxQjdpbUVxeVB6WnA2WW9KZW5wVC5ZR1lGLldvTmRWNVl5RWduVVBZWTZ6d0RRZ2EiLCJ1c2VySWQiOjEwLCJhdXRob3JpdGllcyI6W10sInVzZXJuYW1lIjoia2hvYXZ2In19.MCZLLJ74g1yk2b8xpSFKiSb4gtBDCGZFtYxbJ_r5eus', '2022-03-13 03:25:58'),
(113, '2022-03-03 14:13:41', 0, 0, '2022-03-03 14:13:41', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcxNTU2MjEsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkTndaYjl1OHVrLlZ5bks2ZlRqMTJ6dTh2NUtnaFYwNndsWVM0VldSRk43ZVk0Q1IwMGlndEsiLCJ1c2VySWQiOjEzLCJhdXRob3JpdGllcyI6W10sInVzZXJuYW1lIjoiZHV5dHEifX0.H2EYiVXe5FCnBpnBpfB3Z_bD0GFbfx7YIKWJ_pIQZx8', '2022-03-13 14:13:41'),
(114, '2022-03-03 15:34:06', 0, 0, '2022-03-03 15:34:06', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcxNjA0NDYsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.i5u9LRmlFTPoEZKRrH2BtXtvfhIBHNfhm1hcIdVPRIw', '2022-03-13 15:34:06'),
(115, '2022-03-03 15:35:04', 0, 0, '2022-03-03 15:35:04', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcxNjA1MDQsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.-KnnHHo508KojU-wQYXNazLvct9Q5F7ZrYqa5_tQpoY', '2022-03-13 15:35:04'),
(116, '2022-03-03 15:37:06', 0, 0, '2022-03-03 15:37:06', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcxNjA2MjYsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.aimINWsW3khkP492TbuKx2rKRU7zeMMa-msFWRIkLQY', '2022-03-13 15:37:06'),
(117, '2022-03-03 15:45:00', 0, 0, '2022-03-03 15:45:00', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDcxNjExMDAsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkSkx0SzhtSUp5dWxYY0EwTVE0OHpqdXUubDlcL3I5bGtzQnpxUmpYMnVJWmFTTERrWm1cL1kxeSIsInVzZXJJZCI6NCwiYXV0aG9yaXRpZXMiOltdLCJ1c2VybmFtZSI6Im15aG5rIn19.IfVQxXQEDf82W0xrM_EsD_NZPAGyEsEoRSe_1XNlQ7U', '2022-03-13 15:45:00'),
(118, '2022-03-07 00:07:34', 0, 0, '2022-03-07 00:07:34', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDc0NTA0NTQsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.UXsHLJeTIA9wGHbcpintJZew1I3GS9Du857VR8kOqac', '2022-03-17 00:07:34'),
(119, '2022-03-07 00:31:43', 0, 0, '2022-03-07 00:31:43', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDc0NTE5MDMsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkS1dpRWJBRDZhNEc5ZjBiajNpbHlhT0hjdWtSZlNaNmRaSTVFZ0N1bWMwZFlBMlE5UzBMSTYiLCJ1c2VySWQiOjE0LCJhdXRob3JpdGllcyI6W10sInVzZXJuYW1lIjoicXVhbm52In19.cFPbiTSzyHS1kgzykQQR_GxBxyDQsDwvwyIveL35atI', '2022-03-17 00:31:43'),
(120, '2022-03-07 14:01:18', 0, 0, '2022-03-07 14:01:18', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDc1MDA0NzgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.JsVyr-Zc9o_7E7Btw02ENPCFWT99pu7UYQdjNur6900', '2022-03-17 14:01:18');
INSERT INTO `t_token` (`id`, `created_at`, `created_by`, `deleted`, `updated_at`, `updated_by`, `token`, `token_exp_date`) VALUES
(121, '2022-03-07 14:22:53', 0, 0, '2022-03-07 14:22:53', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDc1MDE3NzIsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkS1dpRWJBRDZhNEc5ZjBiajNpbHlhT0hjdWtSZlNaNmRaSTVFZ0N1bWMwZFlBMlE5UzBMSTYiLCJ1c2VySWQiOjE0LCJhdXRob3JpdGllcyI6W10sInVzZXJuYW1lIjoicXVhbm52In19.aIzBKTS0_bjUoz5-OwmfgPBoSc77G5O1hQMKBEhDMcM', '2022-03-17 14:22:53'),
(122, '2022-03-07 15:25:26', 0, 0, '2022-03-07 15:25:26', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDc1MDU1MjUsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.Xcz6z90uhM_JxQKDktlq86UJscabsWuk6V55VysStd4', '2022-03-17 15:25:25'),
(123, '2022-03-07 16:11:33', 0, 0, '2022-03-07 16:11:33', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDc1MDgyOTMsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkSkx0SzhtSUp5dWxYY0EwTVE0OHpqdXUubDlcL3I5bGtzQnpxUmpYMnVJWmFTTERrWm1cL1kxeSIsInVzZXJJZCI6NCwiYXV0aG9yaXRpZXMiOltdLCJ1c2VybmFtZSI6Im15aG5rIn19.wSuI6SVzIbQ1_8v2lSmyWYvVmCFNZ-zr1kHUecTZ8u4', '2022-03-17 16:11:33'),
(124, '2022-03-07 16:13:37', 0, 0, '2022-03-07 16:13:37', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDc1MDg0MTcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.ZqngPpMgEtvYA3XzNjWC3yCtsiA3nIgLemZTvBAYHGU', '2022-03-17 16:13:37'),
(125, '2022-03-07 16:19:28', 0, 0, '2022-03-07 16:19:28', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDc1MDg3NjgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkd1wvaU14NDFyZDRiUllqZmdVZzNMTHV5OU4yM1BEY3VmaDhyckRCbGhEWnFJRmxKNzN3YWtlIiwidXNlcklkIjoxNSwiYXV0aG9yaXRpZXMiOltdLCJ1c2VybmFtZSI6Imxhbmh0In19.3eqKwDlHlB_UYg7kfwju2270Z_m7J8RTZObaS2b7kSE', '2022-03-17 16:19:28'),
(126, '2022-03-14 20:25:08', 0, 0, '2022-03-14 20:25:08', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDgxMjgzMDcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.BfgwXw8_7JVnILZh_ZMPHDyZ569OyJHEcf9UXsdWDq8', '2022-03-24 20:25:08'),
(127, '2022-03-14 20:55:41', 0, 0, '2022-03-14 20:55:41', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDgxMzAxNDEsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJiYW90ZyJ9fQ.9CNIF9HAvmGIgfYXnpWC_Eo8dXUhe1S8HI8qNiA94WA', '2022-03-24 20:55:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `t_user`
--

CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `t_user`
--

INSERT INTO `t_user` (`id`, `created_at`, `created_by`, `deleted`, `updated_at`, `updated_by`, `password`, `username`, `customer_id`) VALUES
(1, '2021-09-05 17:16:27', 0, 0, '2021-09-05 17:16:27', 0, '$2a$10$W2h9H0PYmnYRpX4Nm2CwoudCjVTvE.Or5HzlFvFGUPShmd20dT14C', 'baotg', 2),
(3, NULL, NULL, 0, NULL, NULL, '$2a$10$kfTUgxyTsJJqUtgiG7ip1.psf68r7hCajwJzkwTsiaOMSmLEC1Qau', 'loclt', 5),
(4, '2022-02-24 16:20:27', 0, 0, '2022-02-24 16:20:27', 0, '$2a$10$JLtK8mIJyulXcA0MQ48zjuu.l9/r9lksBzqRjX2uIZaSLDkZm/Y1y', 'myhnk', 6),
(10, '2022-03-03 03:24:17', 0, 0, '2022-03-03 03:24:17', 0, '$2a$10$6l.Hz1B7imEqyPzZp6YoJenpT.YGYF.WoNdV5YyEgnUPYY6zwDQga', 'khoavv', 7),
(11, '2022-03-03 03:24:33', 0, 0, '2022-03-03 03:24:33', 0, '$2a$10$I.4rWSN3qq03Sbr6x0tatuAeFLrQK5sIzLDDhhFopTkQRZYSRwX1W', 'hunglm', 8),
(12, '2022-03-03 03:24:45', 0, 0, '2022-03-03 03:24:45', 0, '$2a$10$A8/0pTo40lHi304Q605DGOCGoMzgoXyl50iIReaaCBNX9f04oW.va', 'bachnguyen', 10),
(13, '2022-03-03 13:52:44', 0, 0, '2022-03-03 13:52:44', 0, '$2a$10$NwZb9u8uk.VynK6fTj12zu8v5KghV06wlYS4VWRFN7eY4CR00igtK', 'duytq', NULL),
(14, '2022-03-07 00:31:24', 0, 0, '2022-03-07 00:31:24', 0, '$2a$10$KWiEbAD6a4G9f0bj3ilyaOHcukRfSZ6dZI5EgCumc0dYA2Q9S0LI6', 'quannv', NULL),
(15, '2022-03-07 16:19:16', 0, 0, '2022-03-07 16:19:16', 0, '$2a$10$w/iMx41rd4bRYjfgUg3LLuy9N23PDcufh8rrDBlhDZqIFlJ73wake', 'lanht', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `t_user_role`
--

CREATE TABLE `t_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `t_user_role`
--

INSERT INTO `t_user_role` (`user_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_orders_by_days`
-- (See below for the actual view)
--
CREATE TABLE `view_orders_by_days` (
`order_date` datetime
,`price_all` decimal(29,2)
);

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_orders_by_days`
--
DROP TABLE IF EXISTS `view_orders_by_days`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_orders_by_days`  AS SELECT `o`.`order_date` AS `order_date`, `od`.`price_each`* `od`.`quantity_order` AS `price_all` FROM (`order_details` `od` join `orders` `o` on(`od`.`order_id` = `o`.`id`)) ORDER BY `o`.`order_date` ASC ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_6v6x92wb400iwh6unf5rwiim4` (`phone_number`),
  ADD KEY `FKfarlvhlnr0c5lqy5jr1fa253r` (`user_id`);

--
-- Chỉ mục cho bảng `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpxtb8awmi0dk6smoh2vp1litg` (`customer_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  ADD KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK45dp0030s8e3myd8n6ky4e79g` (`customer_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1eicg1yvaxh1gqdp2lsda7vlv` (`product_line_id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqnq71xsohugpqwf3c9gxmsuy` (`product_id`);

--
-- Chỉ mục cho bảng `product_lines`
--
ALTER TABLE `product_lines`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `t_permission`
--
ALTER TABLE `t_permission`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `t_role`
--
ALTER TABLE `t_role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `t_role_permission`
--
ALTER TABLE `t_role_permission`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `FKjobmrl6dorhlfite4u34hciik` (`permission_id`);

--
-- Chỉ mục cho bảng `t_token`
--
ALTER TABLE `t_token`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3cgvxn5dnreak2tjt18msfanx` (`customer_id`);

--
-- Chỉ mục cho bảng `t_user_role`
--
ALTER TABLE `t_user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKa9c8iiy6ut0gnx491fqx4pxam` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `offices`
--
ALTER TABLE `offices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_lines`
--
ALTER TABLE `product_lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `t_permission`
--
ALTER TABLE `t_permission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `t_role`
--
ALTER TABLE `t_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `t_token`
--
ALTER TABLE `t_token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT cho bảng `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `FKfarlvhlnr0c5lqy5jr1fa253r` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FKpxtb8awmi0dk6smoh2vp1litg` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `FK45dp0030s8e3myd8n6ky4e79g` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK1eicg1yvaxh1gqdp2lsda7vlv` FOREIGN KEY (`product_line_id`) REFERENCES `product_lines` (`id`);

--
-- Các ràng buộc cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `FKqnq71xsohugpqwf3c9gxmsuy` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `t_role_permission`
--
ALTER TABLE `t_role_permission`
  ADD CONSTRAINT `FK90j038mnbnthgkc17mqnoilu9` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  ADD CONSTRAINT `FKjobmrl6dorhlfite4u34hciik` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`id`);

--
-- Các ràng buộc cho bảng `t_user`
--
ALTER TABLE `t_user`
  ADD CONSTRAINT `FK3cgvxn5dnreak2tjt18msfanx` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Các ràng buộc cho bảng `t_user_role`
--
ALTER TABLE `t_user_role`
  ADD CONSTRAINT `FKa9c8iiy6ut0gnx491fqx4pxam` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  ADD CONSTRAINT `FKq5un6x7ecoef5w1n39cop66kl` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
