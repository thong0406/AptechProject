-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2022 at 05:31 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'img/pfp/default.jpg',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phonenumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `image`, `password`, `username`, `email`, `phonenumber`, `level`, `created_at`, `updated_at`) VALUES
(6, 'Taisa', 'img/pfp/1641982114.png', '$2y$10$Z8MfWotFBXuHBObRaDpnt.FZnPczPKbMkKTzBUYW9.dMAxMZ.S0sa', 'TIS', 'tis_123@gmail.com', '123123123', '1', '2022-01-10 08:26:09', '2022-01-13 06:10:01'),
(7, 'Hazuna Rio', 'img/pfp/1641984999.jfif', '$2y$10$MiCz/C7dcO/s2tV58ZtgQe8A545fIeALHDclZDlFSKisV7y0YWJV6', 'HZN', 'hzn_crab123@gmail.com', '123123123', '3', '2022-01-11 00:32:14', '2022-01-12 08:29:39');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `bookstore_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `book_name`, `author`, `image`, `quantity`, `description`, `price`, `bookstore_id`, `created_at`, `updated_at`) VALUES
(3, 'F*ck Now There are Two of You', 'Adam Mansbach', 'img/fuck_now_there_are_two_of_you_adam_mansbach.jpg', 19, 'Adam Mansbach famously gave voice to two of parenting\'s primal struggles in Go the Fuck to Sleep and You Have to Fucking Eat--the often-imitated, never-duplicated pair of New York Times best sellers that ushered in a new era of radical honesty in humor books for parents. But what could possibly be left?\r\n<br>\r\nParents--new, old, expectant, and grand--of multiple children already knew the answer. Adam discovered it for himself by having two more kids, less than two years apart.\r\n<br>\r\nFuck, Now There Are Two of You is a loving monologue about the new addition to the family, addressed to a big sibling and shot through with Adam\'s trademark profane truth-telling. Gorgeously illustrated and chock-full of unspoken sentiments channeled directly from the brains of parents worldwide, Fuck, Now There Are Two of You articulates all the fears and frustrations attendant to the simple, math-defying fact that two is a million more kids than one.\r\n<br>\r\nAs you probably know by now, you shouldn\'t read it to a child.', 2, 1, '2021-12-25 21:06:26', '2022-01-12 08:10:06'),
(4, 'Go the F*ck to Sleep', 'Adam Mansbach', 'img/go_the_fuck_to_sleep_adam_mansbach.jpg', 20, 'Go the F**k to Sleep is a bedtime book for parents who live in the real world, where a few snoozing kitties and cutesy rhymes don\'t always send a toddler sailing blissfully off to dreamland. Profane, affectionate, and radically honest, California Book Award-winning author Adam Mansbach\'s verses perfectly capture the familiar--and unspoken--tribulations of putting your little angel down for the night. In the process, they open up a conversation about parenting, granting us permission to admit our frustrations, and laugh at their absurdity.\r\n<br>\r\nWith illustrations by Ricardo Cortes, Go the F**k to Sleep is beautiful, subversive, and pants-wettingly funny--a book for parents new, old, and expectant. You probably should not read it to your children.\r\n<br>\r\nSeriously, Just Go to Sleep, a children\'s book inspired by Go the F**k to Sleep and appropriate for kids of all ages, is also available, as well as Seriously, You Have to Eat for finicky ones everywhere!', 3, 1, '2021-12-25 21:13:18', '2022-01-12 08:04:20'),
(5, 'Think & Grow Rich', 'Napoleon Hill', 'img/thinkrich.jfif', 20, 'Think & Grow Rich - Ngh?? Gi??u V?? L??m Gi??u l?? m???t trong nh???ng cu???n s??ch b??n ch???y nh???t m???i th???i ?????i. ???? h??n 60 tri???u b???n ???????c ph??t h??nh v???i g???n tr??m ng??n ng??? tr??n to??n th??? gi???i v?? ???????c c??ng nh???n l?? cu???n s??ch t???o ra nhi???u tri???u ph?? h??n, m???t cu???n s??ch truy???n c???m h???ng th??nh c??ng nhi???u h??n b???t c??? cu???n s??ch kinh doanh n??o trong l???ch s???.', 3, 1, '2021-12-28 00:35:30', '2022-01-11 20:03:23'),
(6, 'Crime and Punishment', 'Dostoevsky', 'img/toiacvatrungphat.jpg', 50, '????y l?? cu???n s??ch t???ng ???????c b??nh ch???n l?? cu???n s??ch v?? ?????i nh???t m???i th???i ?????i, m???t trong nh???ng cu???n s??ch hay n??n ?????c. T???i ??c v?? tr???ng tr??? c?? n???i dung n??i v??? lu???t nh??n qu??? trong cu???c s???ng l?? m???t ki???t t??c v??? t??nh y??u th????ng gi???a con ng?????i v???i nhau. Trong cu???c s???ng ????? c?? th??? h??a nh???p, th??n thi???n v???i nhau. G???t v??? m???i th?? h???n, v?? n??i v??? c??c t???i ??c n???u ???? th???c hi???n.', 3, 1, '2021-12-28 00:44:30', '2022-01-12 08:28:24'),
(7, 'T??i T??i Gi???i', 'Adam Khoo', 'img/toitaigioi.png', 25, '???????c s??ng t??c b???i m???t doanh nh??n ng?????i Singapore t??n Adam Khoo. N???i dung c???a cu???n s??ch l?? nh???ng chia s??? v??? c??c c??u chuy???n c??ng nh?? ph????ng ph??p h???c t???p. Do ch??nh t??c gi??? ???? tr???i nghi???m khi m???i ??? ????? tu???i c???p 2. Ch??nh v?? th??? cu???n s??ch gi??p cho ng?????i ?????c c?? ???????c s??? t??? tin c??ng nh?? ?? th???c t??? l???p t???t. ?????ng th???i l??m ch??? cho cu???c s???ng c???a ch??nh m??nh. ????y ???????c xem l?? m???t trong nh???ng cu???n s??ch n??n ?????c b???i n?? ???? ???????c d???ch', 3, 2, '2022-01-01 03:11:05', '2022-01-10 05:49:26'),
(8, 'The Alchemist', 'Paulo Coelho', 'img/kmwOqKWszC.jpg', 20, 'The Alchemist (Portuguese: O Alquimista) is a novel by Brazilian author Paulo Coelho that was first published in 1988. Originally written in Portuguese, it became a widely translated international bestseller. An allegorical novel, The Alchemist follows a young Andalusian shepherd in his journey to the pyramids of Egypt, after having a recurring dream of finding a treasure there.', 2, 2, '2022-01-05 02:59:13', '2022-01-08 20:43:32'),
(10, 'Kh??m Ph?? Ng??n Ng??? T?? Duy', 'Phillip Miller', 'img/MoRDQIN6HR.jpg', 20, '?????ng sau th??i ?????, h??nh vi c???a m???i ch??ng ta l?? c??? m???t ???b???n ????? th??? gi???i??? (map of the world) ??? ch???a ?????ng nh???ng th??i quen, ni???m tin, gi?? tr???, k?? ???c,??? ??? ?????nh h??nh n??n suy ngh??, h??nh ?????ng, c??ch ta nh??n nh???n v??? b???n th??n, v??? m???i ng?????i v?? v??? th??? gi???i xung quanh. Li???u ph??p NLP (Neuro Linguistic Programming ??? L???p tr??nh Ng??n Ng??? T?? duy) gi??p thay ?????i t???n g???c h??nh vi, t???c l?? thay ?????i ki???u suy ngh?? d???n ?????n h??nh vi c???a m???i ng?????i. Kh??ng gi???ng nh?? c??c ph????ng ph??p truy???n th???ng kh??c, ch??? ????n thu???n b???o ta c???n ph???i l??m g??, NLP h?????ng d???n ta c??ch l??m ????? ?????t ???????c m???c ti??u ????? ra, ????? tr??? th??nh m???u ng?????i m?? m??nh mong mu???n.\r\n\r\nNLP c??ng ch??nh l?? b?? quy???t l??m n??n danh ti???ng c???a Anthony Robbins (m???t trong nh???ng di???n gi??? h??ng ?????u th??? gi???i hi???n nay), ???N??? ho??ng Truy???n h??nh??? Oprah Winfrey, c???u T???ng th???ng M??? Bill Clinton v?? nhi???u nh??n v???t t??n tu???i kh??c.\r\n\r\nHi???n t???i, NLP ???????c ???ng d???ng r???t r???ng r??i trong nhi???u l??nh v???c nh??: qu???n l??, hu???n luy???n, b??n h??ng, t??m l?? h???c, th??? thao, y t???, th????ng thuy???t, di???n thuy???t, nu??i d???y con c??i v?? nhi???u l??nh v???c kh??c.', 3, 1, '2022-01-05 06:48:22', '2022-01-11 20:04:05'),
(11, 'S???c M???nh T?? Duy', 'Martin Manser', 'img/1641463427.jpg', 26, 'Ch???c h???n m???i ng?????i ?????u ???? nghe qua thuy???t ???T???ng b??ng tr??i??? c???a Ernest Hemingway. V?? t?? duy n??o b??? c???a ch??ng ta c??ng nh?? t???ng b??ng ???y, ch??? c?? m???t ph???n nh??? l?? n???i, c??n ??a ph???n l?? ch??m. M???i ng?????i trong ch??ng ta hi???n t???i ch??? m???i s??? d???ng kho???ng 5% ho???t ?????ng c???a n??o b???, c??n 95% c??n l???i l?? thu???c v??? ti???m th???c, ch??a ???????c khai th??c. V???y ph???i l??m th??? n??o ????? kh??m ph?? v?? s??? d???ng t???i ??u ph???n ti???m th???c ????? B???n ???? th???t s??? hi???u r?? v??? ch??nh b???n v?? nh???ng g?? m?? b???n c?? th??? l??m ???????c hay ch??a? T???t c??? ?????u s??? c?? trong ???S???c m???nh t?? duy???.', 2, 3, '2022-01-06 03:03:47', '2022-01-08 20:59:15');

-- --------------------------------------------------------

--
-- Table structure for table `bookstores`
--

CREATE TABLE `bookstores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bookstore_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `information` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookstores`
--

INSERT INTO `bookstores` (`id`, `bookstore_name`, `information`, `created_at`, `updated_at`) VALUES
(1, 'Nh?? xu???t b???n T???ng h???p tp. HCM', 'Nh?? xu???t b???n T???ng h???p tp. HCM.', '2021-12-22 01:20:44', '2021-12-22 01:20:44'),
(2, 'Akashic Books', 'Akashic Books is a Brooklyn-based independent company dedicated to publishing urban literary fiction and political nonfiction by authors who are either ignored by the mainstream, or who have no interest in working within the ever-consolidating ranks of the major corporate publishers.', '2021-12-22 01:22:23', '2021-12-22 01:22:23'),
(3, '????ng ?? Publishing', 'T??? khi th??nh l???p cho ?????n nay, ????ng A ???? li??n k???t v???i c??c nh?? xu???t b???n l???n nh?? NXB H???i nh?? v??n, NXB V??n h???c, NXB D??n Tr??, NXB Tr???, NXB Kim ?????ng, NXB M??? Thu???t... ????? cho ra ?????i h??n 1500 ?????u s??ch v?? ph??t h??nh h??ng ng??n ?????u s??ch kh??c nh??? v??o h??? th???ng ph??t h??nh r???ng r??i.\r\n\r\nV??? m???t b???n quy???n, k??? t??? khi Vi???t Nam gia nh???p c??ng ?????c Bern, ????ng A ???? thi???t l???p quan h??? v?? mua b???n quy???n v???i nhi???u nh?? xu???t b???n l???n tr??n th??? gi???i nh?? Hemma, King Fisher, Dami, Dorling Kindersley, B???c Kinh... ????? mang ?????n c??c ?????u s??ch gi?? tr??? m?? ??i???n h??nh l?? T??? s??ch b??ch khoa tri th???c v?? ph??t tri???n t?? duy d??nh cho tr??? em ???????c nhi???u ?????c gi??? ????n nh???n.', '2021-12-22 01:23:33', '2022-01-12 09:02:31');

-- --------------------------------------------------------

--
-- Table structure for table `book_tags`
--

CREATE TABLE `book_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_tags`
--

INSERT INTO `book_tags` (`id`, `book_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(4, 4, 1, '2021-12-25 21:13:18', '2021-12-25 21:13:18'),
(5, 5, 1, '2021-12-28 00:35:30', '2021-12-28 00:35:30'),
(8, 7, 3, '2022-01-01 03:11:06', '2022-01-01 03:11:06'),
(9, 8, 2, '2022-01-05 02:59:15', '2022-01-05 02:59:15'),
(10, 8, 1, '2022-01-05 02:59:15', '2022-01-05 02:59:15'),
(12, 10, 3, '2022-01-05 06:48:23', '2022-01-05 06:48:23'),
(13, 11, 1, '2022-01-06 03:03:48', '2022-01-06 03:03:48'),
(24, 6, 2, '2022-01-11 17:00:00', '2022-01-11 17:00:00'),
(28, 3, 1, '2022-01-12 08:09:55', '2022-01-12 08:09:55'),
(29, 3, 3, '2022-01-12 08:09:55', '2022-01-12 08:09:55');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` double UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `book_id`, `user_id`, `comment`, `rating`, `created_at`, `updated_at`) VALUES
(3, 4, 3, 'good book, 4/5\r\ngood book, 4/5\r\ngood book, 4/5\r\ngood book, 4/5', 4, '2022-01-06 07:54:22', '2022-01-06 07:54:22'),
(4, 4, 3, 'bad lol', 1, '2022-01-06 07:59:01', '2022-01-06 07:59:01'),
(5, 7, 3, 'it was ok lol', 2, '2022-01-10 05:48:52', '2022-01-10 05:48:52');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(21, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(22, '2021_12_22_063647_create_users_table', 1),
(23, '2021_12_22_063913_create_admin_table', 1),
(24, '2021_12_22_064122_create_bookstores_table', 1),
(25, '2021_12_22_064412_create_books_table', 1),
(26, '2021_12_22_064518_create_tags_table', 1),
(27, '2021_12_22_065223_create_book_tags_table', 1),
(28, '2021_12_22_065829_create_orders_table', 1),
(31, '2021_12_22_065938_create_order_details_table', 2),
(32, '2021_12_22_065944_create_comments_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cus_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment` int(11) NOT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `cus_name`, `address`, `phone`, `email`, `payment`, `status`, `created_at`, `updated_at`) VALUES
(5, 3, 'Udzuki Kousei', 'UDK Household', '123123123', 'bidai_123@gmail.com', 24, 0, '2022-01-09 06:51:03', '2022-01-09 06:51:03');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `book_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(6, 5, 4, 8, 24, '2022-01-09 06:51:03', '2022-01-09 06:51:03');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag_name`, `created_at`, `updated_at`) VALUES
(1, 'V??n h???c n?????c ngo??i', '2021-12-22 02:00:32', '2022-01-12 09:03:44'),
(2, 'Ti???u thuy???t n?????c ngo??i', '2021-12-25 02:39:31', '2021-12-25 02:39:31'),
(3, 'Gi??o d???c', '2021-12-29 05:21:19', '2022-01-12 09:04:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'img/pfp/default.jpg',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `image`, `name`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(2, 'MZ', '$2y$10$MEYRneMO9JyEz6F/fFBZF.aazJ2hC.QQ0R3wNmtBF1/rxlev3JqRC', 'img/pfp/default.jpg', 'Marz', 'UDK Household', '123123123', 'mz_123@gmail.com', '2021-12-30 02:38:22', '2021-12-30 02:38:22'),
(3, 'UDK', '$2y$10$t/m17adXbonz3k2Kb0LrJ.zBOEOxrbdQhtK7oVV/IiGjcfy4clXLS', 'img/pfp/1641912467.png', 'Udzuki Kousei', 'UDK Household', '123123123', 'udk_bidai_123@gmail.com', '2022-01-04 07:05:57', '2022-01-11 19:08:18'),
(4, 'ri_sheep123', '$2y$10$k6nJ6yAHsVwZhWSBv58/WO2aj0olRanpHRX.T8dk1dzXjWLlcVtEq', 'img/pfp/default.jpg', 'Rei', 'UDK Household', '123123123', 'ri_sheep123@gmail.com', '2022-01-09 09:17:18', '2022-01-09 09:17:18'),
(5, 'mikan_123', '$2y$10$HI4nbJdQYIzrVFf9STvr7.IY/8QnhQhewWR/E.dO5RRDGwlL/O.w2', 'img/pfp/default.jpg', 'AZS', 'UDK Household', '123123123', 'mikan_123@gmail.com', '2022-01-09 09:22:28', '2022-01-09 09:22:28'),
(6, 'reu_123', '$2y$10$.W/Wxte3Ss9VDGAIQWQIqeAXExwaLi0AQUhMSWpJaAhLuu8S/VKOq', 'img/pfp/default.jpg', 'Reu', 'RIM Household', '123123123', 'reu_chnl123@gmail.com', '2022-01-09 09:28:35', '2022-01-09 09:28:35'),
(9, 'knn_123', '$2y$10$x/kCX/MEMpN6v/67x0p3wu8GGu96W.KKo0iDZTIuiTv2/mV7p0GYy', 'img/pfp/default.jpg', 'Kanna', 'RIM Household', '123123123', 'knn_chnl123@gmail.com', '2022-01-09 09:37:56', '2022-01-09 09:37:56'),
(10, 'yju_senpai123', '$2y$10$14l.UHGuaObiRFJ6R9wOOu5FImPUYZ7JHDDsODe9nn6CKTmMpa6UK', 'img/pfp/default.jpg', 'Yajuu', 'RIM Household', '123123123', 'yju_senpai123@gmail.com', '2022-01-09 09:39:33', '2022-01-09 09:39:33'),
(11, 'JOKER', '$2y$10$iDo0NQz.nAPcOBrnuaHB0Otp3onukJ1QPoucTzIw.dzKhXlDEMUsG', 'img/pfp/default.jpg', 'Joker', 'Who? Street', '123123123', 'joker_radish123@gmail.com', '2022-01-09 09:42:13', '2022-01-09 09:42:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `books_bookstore_id_foreign` (`bookstore_id`);

--
-- Indexes for table `bookstores`
--
ALTER TABLE `bookstores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_tags`
--
ALTER TABLE `book_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_tags_book_id_foreign` (`book_id`),
  ADD KEY `book_tags_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_book_id_foreign` (`book_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_book_id_foreign` (`book_id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bookstores`
--
ALTER TABLE `bookstores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `book_tags`
--
ALTER TABLE `book_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_bookstore_id_foreign` FOREIGN KEY (`bookstore_id`) REFERENCES `bookstores` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `book_tags`
--
ALTER TABLE `book_tags`
  ADD CONSTRAINT `book_tags_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
