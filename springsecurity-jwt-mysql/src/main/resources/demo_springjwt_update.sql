-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th9 05, 2021 lúc 12:46 PM
-- Phiên bản máy phục vụ: 10.4.20-MariaDB
-- Phiên bản PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `demo_springjwt`
--

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
  `permission_key` varchar(255) DEFAULT NULL,
  `permission_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `role_key` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `t_role`
--

INSERT INTO `t_role` (`id`, `created_at`, `created_by`, `deleted`, `updated_at`, `updated_by`, `role_key`, `role_name`) VALUES
(1, NULL, NULL, 0, NULL, NULL, 'ROLE_ADMIN', 'Supper User'),
(2, NULL, NULL, 0, NULL, NULL, 'ROLE_CUSTOMER', 'Khách'),
(3, NULL, NULL, 0, NULL, NULL, 'ROLE_MANAGER', 'Quan ly');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `t_role_permission`
--

CREATE TABLE `t_role_permission` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `token` varchar(1000) DEFAULT NULL,
  `token_exp_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `t_token`
--

INSERT INTO `t_token` (`id`, `created_at`, `created_by`, `deleted`, `updated_at`, `updated_by`, `token`, `token_exp_date`) VALUES
(1, '2021-08-12 20:56:56', 0, 0, '2021-08-12 20:56:56', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk2NDA2MTUsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkY01lc2VRZDhnS01oVEttUlE2eEtYZVVidmZ0Sm13MWFNbXNsLjcySHlyanFTWFJ6cHEyUjYiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbXSwidXNlcm5hbWUiOiJUQU0ifX0.nHqxq49qGMerNRqYP9G2hMpPYeViDIEBDbWHNcghAK4', '2021-08-22 20:56:56'),
(2, '2021-08-12 21:01:17', 0, 0, '2021-08-12 21:01:17', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk2NDA4NzcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkY01lc2VRZDhnS01oVEttUlE2eEtYZVVidmZ0Sm13MWFNbXNsLjcySHlyanFTWFJ6cHEyUjYiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbXSwidXNlcm5hbWUiOiJUQU0ifX0.HK9E2BfmBrqQaUOYTBWhjbm9lWcoSJ2bHzc6pdVlYP4', '2021-08-22 21:01:17'),
(3, '2021-08-12 21:28:10', 0, 0, '2021-08-12 21:28:10', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk2NDI0OTAsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkY01lc2VRZDhnS01oVEttUlE2eEtYZVVidmZ0Sm13MWFNbXNsLjcySHlyanFTWFJ6cHEyUjYiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIkFETUlOIiwiVVNFUl9SRUFEIl0sInVzZXJuYW1lIjoiVEFNIn19.s1Yi4W2jOmkc33oQhmh3J840VPeF6Be579bO-8bmESo', '2021-08-22 21:28:10'),
(4, '2021-08-12 21:39:59', 1, 0, '2021-08-12 21:39:59', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk2NDMxOTksInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVk9iSHhteHljZjAuUUpOWGx3cUVjLm1GWi5pWWtTNVY0ekFKMHhkSU1Tb0VZb1cxOE83Y3UiLCJ1c2VySWQiOjIsImF1dGhvcml0aWVzIjpbIkNVU1RPTUVSIiwiVVNFUl9DUkVBVEUiXSwidXNlcm5hbWUiOiJodW5naGgifX0.7lH472ACwIIJEoKl8xqF-5RGghNaxpDNjC2tJaSX1MU', '2021-08-22 21:39:59'),
(5, '2021-08-12 21:52:08', 1, 0, '2021-08-12 21:52:08', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk2NDM5MjgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVk9iSHhteHljZjAuUUpOWGx3cUVjLm1GWi5pWWtTNVY0ekFKMHhkSU1Tb0VZb1cxOE83Y3UiLCJ1c2VySWQiOjIsImF1dGhvcml0aWVzIjpbIkNVU1RPTUVSIiwiVVNFUl9DUkVBVEUiXSwidXNlcm5hbWUiOiJodW5naGgifX0.g4SID7GIhrhj8jjUdvybut_5W3VMKmQQOQm1ZBbcYEI', '2021-08-22 21:52:08'),
(6, '2021-08-12 21:53:27', 1, 0, '2021-08-12 21:53:27', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk2NDQwMDcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkY01lc2VRZDhnS01oVEttUlE2eEtYZVVidmZ0Sm13MWFNbXNsLjcySHlyanFTWFJ6cHEyUjYiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9VUERBVEUiLCJVU0VSX0NSRUFURSIsIkFETUlOIiwiVVNFUl9SRUFEIl0sInVzZXJuYW1lIjoiVEFNIn19.RhxcLgllfOCLuzZDcnd7axN24UtfmlV3eTA58tT9WmM', '2021-08-22 21:53:27'),
(7, '2021-08-12 22:15:04', 1, 0, '2021-08-12 22:15:04', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk2NDUzMDQsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkY01lc2VRZDhnS01oVEttUlE2eEtYZVVidmZ0Sm13MWFNbXNsLjcySHlyanFTWFJ6cHEyUjYiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJUQU0ifX0.4EeLoP9CrseN7MY95O93u4YWLnmBzJaALQJr8dc66-4', '2021-08-22 22:15:04'),
(8, '2021-08-12 22:16:44', 1, 0, '2021-08-12 22:16:44', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk2NDU0MDQsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVk9iSHhteHljZjAuUUpOWGx3cUVjLm1GWi5pWWtTNVY0ekFKMHhkSU1Tb0VZb1cxOE83Y3UiLCJ1c2VySWQiOjIsImF1dGhvcml0aWVzIjpbIlJPTEVfQ1VTVE9NRVIiLCJVU0VSX0NSRUFURSJdLCJ1c2VybmFtZSI6Imh1bmdoaCJ9fQ.cdgjL_NV2CWLwmIHOS5nvRAfeyexJk0YP_KH9MudGmc', '2021-08-22 22:16:44'),
(9, '2021-08-12 22:18:01', 0, 0, '2021-08-12 22:18:01', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk2NDU0ODEsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVk9iSHhteHljZjAuUUpOWGx3cUVjLm1GWi5pWWtTNVY0ekFKMHhkSU1Tb0VZb1cxOE83Y3UiLCJ1c2VySWQiOjIsImF1dGhvcml0aWVzIjpbIlJPTEVfQ1VTVE9NRVIiLCJVU0VSX0NSRUFURSJdLCJ1c2VybmFtZSI6Imh1bmdoaCJ9fQ.pRIku0VwODy7dBXtcuNrm-LBRVk_b781M3UfYvNcqyI', '2021-08-22 22:18:01'),
(10, '2021-08-12 22:18:57', 2, 0, '2021-08-12 22:18:57', 2, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk2NDU1MzcsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkY01lc2VRZDhnS01oVEttUlE2eEtYZVVidmZ0Sm13MWFNbXNsLjcySHlyanFTWFJ6cHEyUjYiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJUQU0ifX0.aDnf6EX_13y9vRU7l46HAK18eheumuqWAXA68FJfaww', '2021-08-22 22:18:57'),
(11, '2021-08-12 22:26:32', 1, 0, '2021-08-12 22:26:32', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk2NDU5OTIsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkQi5sZk05WFwvb1hoaHRjaWpcL3hDRXB1YVNGU1FSeGJucEt6MFhTenZVTkExWDdjVmVzXC93ZDYiLCJ1c2VySWQiOjMsImF1dGhvcml0aWVzIjpbXSwidXNlcm5hbWUiOiJIVUFOTFQifX0.DM4y3fgjiwxxMsDn9Nu_gQUc_0l2Qv-yySZC09wkscY', '2021-08-22 22:26:32'),
(12, '2021-08-12 22:35:24', 0, 0, '2021-08-12 22:35:24', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk2NDY1MjQsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkQi5sZk05WFwvb1hoaHRjaWpcL3hDRXB1YVNGU1FSeGJucEt6MFhTenZVTkExWDdjVmVzXC93ZDYiLCJ1c2VySWQiOjMsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiUk9MRV9NQU5BR0VSIiwiVVNFUl9VUERBVEUiLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJIVUFOTFQifX0.UHv3m-7ufA1E_Dd0-F1sevZJvy3qjMBRAnaCqOoRilc', '2021-08-22 22:35:24'),
(13, '2021-08-12 22:37:18', 3, 0, '2021-08-12 22:37:18', 3, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjk2NDY2MzgsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkY01lc2VRZDhnS01oVEttUlE2eEtYZVVidmZ0Sm13MWFNbXNsLjcySHlyanFTWFJ6cHEyUjYiLCJ1c2VySWQiOjEsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiVVNFUl9DUkVBVEUiLCJVU0VSX1VQREFURSIsIlJPTEVfQURNSU4iLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJUQU0ifX0.64xdxGmh3IstEdndYWY0-5diYhMkFIOe8mmzU0Wr3KE', '2021-08-22 22:37:18'),
(14, '2021-09-05 17:18:11', 0, 0, '2021-09-05 17:18:11', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MzE3MDEwOTAsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjQsImF1dGhvcml0aWVzIjpbXSwidXNlcm5hbWUiOiJoaWV1aG4ifX0.s2sT4KNGe4x_JrllkWITPoHEQ2J2sP4z1FNMvYwQO48', '2021-09-15 17:18:11'),
(15, '2021-09-05 17:36:41', 0, 0, '2021-09-05 17:36:41', 0, 'eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MzE3MDIyMDEsInVzZXIiOnsicGFzc3dvcmQiOiIkMmEkMTAkVzJoOUgwUFltbllScFg0Tm0yQ3dvdWRDalZUdkUuT3I1SHpsRnZGR1VQU2htZDIwZFQxNEMiLCJ1c2VySWQiOjMsImF1dGhvcml0aWVzIjpbIlVTRVJfREVMRVRFIiwiUk9MRV9NQU5BR0VSIiwiVVNFUl9VUERBVEUiLCJVU0VSX1JFQUQiXSwidXNlcm5hbWUiOiJIVUFOTFQifX0.Z5zy81JiWuMhElxoCzI9-JTjqOenmMsLzzIJ1KLbi-s', '2021-09-15 17:36:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `t_user`
--

CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `t_user`
--

INSERT INTO `t_user` (`id`, `username`, `created_at`, `created_by`, `deleted`, `updated_at`, `updated_by`, `password`) VALUES
(1, 'TAM', '2021-08-12 20:53:58', 0, 0, '2021-08-12 20:53:58', 0, '$2a$10$W2h9H0PYmnYRpX4Nm2CwoudCjVTvE.Or5HzlFvFGUPShmd20dT14C'),
(2, 'hunghh', NULL, NULL, 0, NULL, NULL, '$2a$10$W2h9H0PYmnYRpX4Nm2CwoudCjVTvE.Or5HzlFvFGUPShmd20dT14C'),
(3, 'HUANLT', '2021-08-12 22:25:51', 1, 0, '2021-08-12 22:25:51', 1, '$2a$10$W2h9H0PYmnYRpX4Nm2CwoudCjVTvE.Or5HzlFvFGUPShmd20dT14C'),
(4, 'hieuhn', '2021-09-05 17:16:27', 0, 0, '2021-09-05 17:16:27', 0, '$2a$10$W2h9H0PYmnYRpX4Nm2CwoudCjVTvE.Or5HzlFvFGUPShmd20dT14C'),
(5, 'hieuhn1', '2021-09-05 17:25:14', 0, 0, '2021-09-05 17:25:14', 0, '$2a$10$W2h9H0PYmnYRpX4Nm2CwoudCjVTvE.Or5HzlFvFGUPShmd20dT14C');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `t_user_role`
--

CREATE TABLE `t_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `t_user_role`
--

INSERT INTO `t_user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

--
-- Chỉ mục cho các bảng đã đổ
--

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `t_role_permission`
--
ALTER TABLE `t_role_permission`
  ADD CONSTRAINT `FK90j038mnbnthgkc17mqnoilu9` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  ADD CONSTRAINT `FKjobmrl6dorhlfite4u34hciik` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`id`);

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
