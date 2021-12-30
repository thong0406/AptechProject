-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2021 at 07:52 AM
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
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, 'Không Gia Đình', 'Hector Mallot', 'img/khongiadinh.jpg', 50, 'Không gia đình kể chuyện một cậu bé tên là Rémi bị bỏ rơi từ nhỏ rồi bị bỏ lại ở 1 góc đường,cậu được 1 gia đình khác nhận nuôi. Rémi được chăm sóc trong vòng tay yêu thương của má Barberin. Cho đến một ngày người chồng của má làm việc ở Paris bị tai nạn và tàn phế trở về, sau đó Rémi đi theo gánh xiếc của cụ Vitalis để làm thuê.', 3, 1, '2021-12-25 06:34:35', '2021-12-25 06:34:35'),
(3, 'F*ck Now There are Two of You', 'Adam Mansbach', 'img/fuck_now_there_are_two_of_you_adam_mansbach.jpg', 20, 'Adam Mansbach famously gave voice to two of parenting\'s primal struggles in Go the Fuck to Sleep and You Have to Fucking Eat--the often-imitated, never-duplicated pair of New York Times best sellers that ushered in a new era of radical honesty in humor books for parents. But what could possibly be left?\r\n<br>\r\nParents--new, old, expectant, and grand--of multiple children already knew the answer. Adam discovered it for himself by having two more kids, less than two years apart.\r\n<br>\r\nFuck, Now There Are Two of You is a loving monologue about the new addition to the family, addressed to a big sibling and shot through with Adam\'s trademark profane truth-telling. Gorgeously illustrated and chock-full of unspoken sentiments channeled directly from the brains of parents worldwide, Fuck, Now There Are Two of You articulates all the fears and frustrations attendant to the simple, math-defying fact that two is a million more kids than one.\r\n<br>\r\nAs you probably know by now, you shouldn\'t read it to a child.', 2, 2, '2021-12-25 21:06:26', '2021-12-25 21:06:26'),
(4, 'Go the F*ck to Sleep', 'Adam Mansbach', 'img/go_the_fuck_to_sleep_adam_mansbach.jpg', 20, 'Go the F**k to Sleep is a bedtime book for parents who live in the real world, where a few snoozing kitties and cutesy rhymes don\'t always send a toddler sailing blissfully off to dreamland. Profane, affectionate, and radically honest, California Book Award-winning author Adam Mansbach\'s verses perfectly capture the familiar--and unspoken--tribulations of putting your little angel down for the night. In the process, they open up a conversation about parenting, granting us permission to admit our frustrations, and laugh at their absurdity.\r\n<br>\r\nWith illustrations by Ricardo Cortes, Go the F**k to Sleep is beautiful, subversive, and pants-wettingly funny--a book for parents new, old, and expectant. You probably should not read it to your children.\r\n<br>\r\nSeriously, Just Go to Sleep, a children\'s book inspired by Go the F**k to Sleep and appropriate for kids of all ages, is also available, as well as Seriously, You Have to Eat for finicky ones everywhere!', 3, 2, '2021-12-25 21:13:18', '2021-12-25 21:13:18'),
(5, 'Think & Grow Rich', 'Napoleon Hill', 'img/thinkrich.jfif', 20, 'Think & Grow Rich - Nghĩ Giàu Và Làm Giàu là một trong những cuốn sách bán chạy nhất mọi thời đại. Đã hơn 60 triệu bản được phát hành với gần trăm ngôn ngữ trên toàn thế giới và được công nhận là cuốn sách tạo ra nhiều triệu phú hơn, một cuốn sách truyền cảm hứng thành công nhiều hơn bất cứ cuốn sách kinh doanh nào trong lịch sử.', 3, 1, '2021-12-28 00:35:30', '2021-12-28 00:35:30'),
(6, 'Crime and Punishment', 'Dostoevsky', 'img/toiacvatrungphat.jpg', 50, 'Đây là cuốn sách từng được bình chọn là cuốn sách vĩ đại nhất mọi thời đại, một trong những cuốn sách hay nên đọc. Tội ác và trừng trị có nội dung nói về luật nhân quả trong cuộc sống là một kiệt tác về tình yêu thương giữa con người với nhau. Trong cuộc sống để có thể hòa nhập, thân thiện với nhau. Gạt vỏ mọi thù hằn, và nói về các tội ác nếu đã thực hiện.', 3, 1, '2021-12-28 00:44:30', '2021-12-28 00:44:30');

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
(1, 'Nhà xuất bản Tổng hợp tp. HCM', 'Nhà xuất bản Tổng hợp tp. HCM.', '2021-12-22 01:20:44', '2021-12-22 01:20:44'),
(2, 'Akashic Books', 'Akashic Books is a Brooklyn-based independent company dedicated to publishing urban literary fiction and political nonfiction by authors who are either ignored by the mainstream, or who have no interest in working within the ever-consolidating ranks of the major corporate publishers.', '2021-12-22 01:22:23', '2021-12-22 01:22:23'),
(3, 'Đông Á Publishing', 'Từ khi thành lập cho đến nay, Đông A đã liên kết với các nhà xuất bản lớn như NXB Hội nhà văn, NXB Văn học, NXB Dân Trí, NXB Trẻ, NXB Kim Đồng, NXB Mỹ Thuật... để cho ra đời hơn 1500 đầu sách và phát hành hàng ngàn đầu sách khác nhờ vào hệ thống phát hành rộng rãi.<br>\r\n\r\nVề mặt bản quyền, kể từ khi Việt Nam gia nhập công ước Bern, Đông A đã thiết lập quan hệ và mua bản quyền với nhiều nhà xuất bản lớn trên thế giới như Hemma, King Fisher, Dami, Dorling Kindersley, Bắc Kinh... để mang đến các đầu sách giá trị mà điển hình là Tủ sách bách khoa tri thức và phát triển tư duy dành cho trẻ em được nhiều độc giả đón nhận.', '2021-12-22 01:23:33', '2021-12-22 01:23:33');

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
(1, 2, 1, '2021-12-25 06:34:35', '2021-12-25 06:34:35'),
(2, 2, 2, '2021-12-25 06:34:36', '2021-12-25 06:34:36'),
(3, 3, 1, '2021-12-25 21:06:26', '2021-12-25 21:06:26'),
(4, 4, 1, '2021-12-25 21:13:18', '2021-12-25 21:13:18'),
(5, 5, 1, '2021-12-28 00:35:30', '2021-12-28 00:35:30'),
(6, 6, 1, '2021-12-28 00:44:30', '2021-12-28 00:44:30'),
(7, 6, 2, '2021-12-28 00:44:30', '2021-12-28 00:44:30');

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
(1, 2, 1, 'It was alright lol.', 3, '2021-12-25 17:00:00', '2021-12-25 17:00:00'),
(2, 2, 1, 'meh', 2, '2021-12-26 17:00:00', '2021-12-26 17:00:00');

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
(1, 1, 'Taisa', 'ALC-Faction', '123123123', 'tis123@gmail.com', 39, 0, '2021-12-29 05:05:46', '2021-12-29 05:05:46'),
(2, 1, 'Taisa', 'ALC-Faction', '123123123', 'tis123@gmail.com', 39, 0, '2021-12-29 05:15:46', '2021-12-29 05:15:46');

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
(1, 1, 2, 11, 33, '2021-12-29 05:05:47', '2021-12-29 05:05:47'),
(2, 1, 3, 3, 6, '2021-12-29 05:05:47', '2021-12-29 05:05:47'),
(3, 2, 2, 6, 18, '2021-12-29 05:15:46', '2021-12-29 05:15:46'),
(4, 2, 4, 7, 21, '2021-12-29 05:15:47', '2021-12-29 05:15:47');

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
(1, 'Văn học nước ngoài', '2021-12-22 02:00:32', '2021-12-22 02:00:32'),
(2, 'Tiểu thuyết nước ngoài', '2021-12-25 02:39:31', '2021-12-25 02:39:31'),
(3, 'Khoa học', '2021-12-29 05:21:19', '2021-12-29 05:21:19');

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
(1, 'TIS', '$2y$10$Ij9ks.4elPpgFEFaGpKHrebRl1fXUfIZ75KfL3a5/9Arb.k4ekf7a', 'img/pfp/default.jpg', 'Taisa', 'ALC Faction', '123123123', 'tis_123@gmail.com', '2021-12-22 01:01:41', '2021-12-22 01:01:41');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookstores`
--
ALTER TABLE `bookstores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `book_tags`
--
ALTER TABLE `book_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
