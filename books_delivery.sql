-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 01, 2024 at 01:39 AM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id21287611_books_delivery`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_name` varchar(255) NOT NULL,
  `address_city` varchar(255) NOT NULL,
  `address_street` varchar(255) NOT NULL,
  `address_lat` double NOT NULL,
  `address_long` double NOT NULL,
  `address_usersid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `address_name`, `address_city`, `address_street`, `address_lat`, `address_long`, `address_usersid`) VALUES
(8, 'home', 'sanaa', 'hada', 37.42066309923518, -122.08530575037003, 78),
(9, 'home ', 'Taiz', 'bbbb', 37.41335562967756, -122.08132870495321, 79);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `book_name` varchar(100) NOT NULL,
  `book_desc` varchar(255) NOT NULL,
  `book_image` varchar(255) NOT NULL,
  `book_count` int(11) NOT NULL DEFAULT 1,
  `book_active` tinyint(4) NOT NULL,
  `book_price` float NOT NULL,
  `book_discount` smallint(6) NOT NULL,
  `book_data` timestamp NOT NULL DEFAULT current_timestamp(),
  `book_cat` int(11) NOT NULL,
  `book_publisherid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `book_name`, `book_desc`, `book_image`, `book_count`, `book_active`, `book_price`, `book_discount`, `book_data`, `book_cat`, `book_publisherid`) VALUES
(10, 'book1', 'good', 'book-action1.jpg', 2, 1, 255, 0, '2022-10-10 16:28:19', 1, 1),
(12, 'book2', 'Funny', 'book-funny1.jpg', 5, 1, 400, 10, '2023-10-18 14:35:13', 2, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `bookView`
-- (See below for the actual view)
--
CREATE TABLE `bookView` (
`book_id` int(11)
,`book_name` varchar(100)
,`book_desc` varchar(255)
,`book_image` varchar(255)
,`book_count` int(11)
,`book_active` tinyint(4)
,`book_price` float
,`book_discount` smallint(6)
,`book_data` timestamp /* mariadb-5.3 */
,`book_cat` int(11)
,`book_publisherid` int(11)
,`categoriers_id` int(11)
,`categoriers_name` varchar(100)
,`categoriers_image` varchar(255)
,`categoriers_datatime` timestamp /* mariadb-5.3 */
,`publisher_name` varchar(60)
,`favorite` int(1)
,`bookpricediscount` double
);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_userid` int(11) NOT NULL,
  `cart_bookid` int(11) NOT NULL,
  `cart_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_userid`, `cart_bookid`, `cart_order`) VALUES
(136, 78, 12, 27),
(137, 78, 12, 27),
(138, 78, 10, 27),
(139, 78, 10, 27),
(140, 79, 10, 28),
(141, 79, 10, 28),
(142, 79, 12, 28),
(143, 79, 12, 28),
(144, 79, 12, 28),
(146, 79, 10, 29),
(147, 79, 10, 29),
(150, 79, 12, 39),
(151, 79, 12, 39),
(152, 79, 10, 39),
(153, 79, 10, 39);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cartView`
-- (See below for the actual view)
--
CREATE TABLE `cartView` (
`bookprice` double
,`countbook` bigint(21)
,`cart_id` int(11)
,`cart_userid` int(11)
,`cart_bookid` int(11)
,`cart_order` int(11)
,`book_id` int(11)
,`book_name` varchar(100)
,`book_desc` varchar(255)
,`book_image` varchar(255)
,`book_count` int(11)
,`book_active` tinyint(4)
,`book_price` float
,`book_discount` smallint(6)
,`book_data` timestamp
,`book_cat` int(11)
,`book_publisherid` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `categoriers`
--

CREATE TABLE `categoriers` (
  `categoriers_id` int(11) NOT NULL,
  `categoriers_name` varchar(100) NOT NULL,
  `categoriers_image` varchar(255) NOT NULL,
  `categoriers_datatime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categoriers`
--

INSERT INTO `categoriers` (`categoriers_id`, `categoriers_name`, `categoriers_image`, `categoriers_datatime`) VALUES
(1, 'Action', 'actions.jpg', '2023-10-09 20:59:30'),
(2, 'Funy', 'bookstore-interior.jpg', '2023-10-18 14:22:00');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_name` varchar(255) NOT NULL,
  `coupon_count` int(11) NOT NULL,
  `coupon_discount` smallint(6) NOT NULL,
  `coupon_expiredate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL,
  `favorite_userid` int(11) NOT NULL,
  `favorite_bookid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`favorite_id`, `favorite_userid`, `favorite_bookid`) VALUES
(84, 76, 10),
(95, 78, 10),
(96, 78, 12),
(97, 79, 10),
(101, 79, 12);

-- --------------------------------------------------------

--
-- Stand-in structure for view `myfavorite`
-- (See below for the actual view)
--
CREATE TABLE `myfavorite` (
`favorite_id` int(11)
,`favorite_userid` int(11)
,`favorite_bookid` int(11)
,`book_id` int(11)
,`book_name` varchar(100)
,`book_desc` varchar(255)
,`book_image` varchar(255)
,`book_count` int(11)
,`book_active` tinyint(4)
,`book_price` float
,`book_discount` smallint(6)
,`book_data` timestamp
,`book_cat` int(11)
,`book_publisherid` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `notification_title` varchar(255) NOT NULL,
  `notification_body` varchar(255) NOT NULL,
  `notification_userid` int(11) NOT NULL,
  `notification_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `notification_title`, `notification_body`, `notification_userid`, `notification_datetime`) VALUES
(2, 'success', 'The Order Has been Approved', 78, '2023-11-20 23:14:44'),
(3, 'success', 'The Order Has been Approved', 79, '2023-11-20 23:18:24'),
(4, 'success', 'The Order Has been Approved', 79, '2023-11-20 23:25:02');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `orders_usersid` int(11) NOT NULL,
  `orders_address` int(11) NOT NULL,
  `orders_type` int(11) NOT NULL DEFAULT 0 COMMENT '0=>Delivery,1=>Revice',
  `orders_pricedelivery` int(11) NOT NULL DEFAULT 0,
  `orders_price` double NOT NULL,
  `orders_coupon` int(11) NOT NULL DEFAULT 0,
  `orders_totalprice` double NOT NULL,
  `orders_paymentmethod` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>Cash,1=>Payment',
  `orders_date` datetime NOT NULL DEFAULT current_timestamp(),
  `orders_status` tinyint(4) NOT NULL DEFAULT 0,
  `orders_noterating` varchar(255) DEFAULT NULL,
  `orders_rating` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `orders_usersid`, `orders_address`, `orders_type`, `orders_pricedelivery`, `orders_price`, `orders_coupon`, `orders_totalprice`, `orders_paymentmethod`, `orders_date`, `orders_status`, `orders_noterating`, `orders_rating`) VALUES
(27, 78, 8, 0, 10, 1230, 0, 1240, 0, '2023-11-16 20:47:41', 1, NULL, 0),
(28, 79, 9, 0, 10, 1590, 0, 1600, 0, '2023-11-16 21:25:11', 2, NULL, 0),
(39, 79, 9, 0, 10, 1230, 0, 1240, 0, '2024-08-01 01:13:38', 0, NULL, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersdetailsview`
-- (See below for the actual view)
--
CREATE TABLE `ordersdetailsview` (
`bookprice` double
,`countbook` bigint(21)
,`cart_id` int(11)
,`cart_userid` int(11)
,`cart_bookid` int(11)
,`cart_order` int(11)
,`book_id` int(11)
,`book_name` varchar(100)
,`book_desc` varchar(255)
,`book_image` varchar(255)
,`book_count` int(11)
,`book_active` tinyint(4)
,`book_price` float
,`book_discount` smallint(6)
,`book_data` timestamp
,`book_cat` int(11)
,`book_publisherid` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersview`
-- (See below for the actual view)
--
CREATE TABLE `ordersview` (
`order_id` int(11)
,`orders_usersid` int(11)
,`orders_address` int(11)
,`orders_type` int(11)
,`orders_pricedelivery` int(11)
,`orders_price` double
,`orders_coupon` int(11)
,`orders_totalprice` double
,`orders_paymentmethod` tinyint(4)
,`orders_date` datetime
,`orders_status` tinyint(4)
,`orders_noterating` varchar(255)
,`orders_rating` double
,`address_id` int(11)
,`address_name` varchar(255)
,`address_city` varchar(255)
,`address_street` varchar(255)
,`address_lat` double
,`address_long` double
,`address_usersid` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisherid` int(10) NOT NULL,
  `publisher_name` varchar(60) NOT NULL,
  `publisher_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisherid`, `publisher_name`, `publisher_image`) VALUES
(1, 'Ahmed', 'avatar.png'),
(2, 'Ali', 'avatar.png'),
(3, 'Mohammed ', 'avatar.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phone` varchar(100) NOT NULL,
  `user_verfiycode` varchar(11) NOT NULL,
  `user_approve` int(4) NOT NULL DEFAULT 0,
  `user_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_type` varchar(50) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_password`, `user_email`, `user_phone`, `user_verfiycode`, `user_approve`, `user_create`, `user_type`) VALUES
(76, 'Ali', 'b95bf44158782d7e678241ff2ba2ad5f47f1f40d', 'ahmed2@gmail.com', '775626671', '69808', 1, '2023-10-07 20:57:26', 'admin'),
(78, 'Ali', '1698c2bea6c8000723d5bb70363a8352d846917e', 'mubarakalzubair871@gmail.com', '778562671', '86100', 1, '2023-11-04 21:14:54', 'user'),
(79, 'Amjed', 'b95bf44158782d7e678241ff2ba2ad5f47f1f40d', 'ahmedalzubair79@gmail.com', '775626679', '36341', 1, '2023-11-05 17:37:38', 'user'),
(82, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin@gmail.com', '735123456', '49592', 1, '2023-11-25 21:37:46', 'admin'),
(85, 'marwan1', '24fe0ea8af967f084ae948bf4cadcd9b7278aba1', 'ma@gmail.com', '7736231652', '31140', 0, '2023-11-27 18:04:25', 'user'),
(86, 'mohammedfahd', 'f126676b964000533eeda5ffe4be7f02fa9ebb09', 'mohammedfahdalhetar@gmail.com', '774631058', '82394', 1, '2023-11-27 18:20:13', 'user');

-- --------------------------------------------------------

--
-- Structure for view `bookView`
--
DROP TABLE IF EXISTS `bookView`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id21287611_ahmed`@`%` SQL SECURITY DEFINER VIEW `bookView`  AS SELECT `book`.`book_id` AS `book_id`, `book`.`book_name` AS `book_name`, `book`.`book_desc` AS `book_desc`, `book`.`book_image` AS `book_image`, `book`.`book_count` AS `book_count`, `book`.`book_active` AS `book_active`, `book`.`book_price` AS `book_price`, `book`.`book_discount` AS `book_discount`, `book`.`book_data` AS `book_data`, `book`.`book_cat` AS `book_cat`, `book`.`book_publisherid` AS `book_publisherid`, `categoriers`.`categoriers_id` AS `categoriers_id`, `categoriers`.`categoriers_name` AS `categoriers_name`, `categoriers`.`categoriers_image` AS `categoriers_image`, `categoriers`.`categoriers_datatime` AS `categoriers_datatime`, `publisher`.`publisher_name` AS `publisher_name`, 1 AS `favorite`, `book`.`book_price`- `book`.`book_price` * `book`.`book_discount` / 100 AS `bookpricediscount` FROM (((`book` join `categoriers` on(`book`.`book_cat` = `categoriers`.`categoriers_id`)) join `publisher` on(`book`.`book_publisherid` = `publisher`.`publisherid`)) join `favorite` on(`favorite`.`favorite_bookid` = `book`.`book_id` and `favorite`.`favorite_userid` = 76))union all select `book`.`book_id` AS `book_id`,`book`.`book_name` AS `book_name`,`book`.`book_desc` AS `book_desc`,`book`.`book_image` AS `book_image`,`book`.`book_count` AS `book_count`,`book`.`book_active` AS `book_active`,`book`.`book_price` AS `book_price`,`book`.`book_discount` AS `book_discount`,`book`.`book_data` AS `book_data`,`book`.`book_cat` AS `book_cat`,`book`.`book_publisherid` AS `book_publisherid`,`categoriers`.`categoriers_id` AS `categoriers_id`,`categoriers`.`categoriers_name` AS `categoriers_name`,`categoriers`.`categoriers_image` AS `categoriers_image`,`categoriers`.`categoriers_datatime` AS `categoriers_datatime`,`publisher`.`publisher_name` AS `publisher_name`,0 AS `favorite`,`book`.`book_price` - `book`.`book_price` * `book`.`book_discount` / 100 AS `bookpricediscount` from ((`book` join `categoriers` on(`book`.`book_cat` = `categoriers`.`categoriers_id`)) join `publisher` on(`book`.`book_publisherid` = `publisher`.`publisherid`)) where `categoriers`.`categoriers_id` = 2 and !(`book`.`book_id` in (select `book`.`book_id` from (`book` join `favorite` on(`favorite`.`favorite_bookid` = `book`.`book_id` and `favorite`.`favorite_userid` = 76))))  ;

-- --------------------------------------------------------

--
-- Structure for view `cartView`
--
DROP TABLE IF EXISTS `cartView`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id21287611_ahmed`@`%` SQL SECURITY DEFINER VIEW `cartView`  AS SELECT sum(`book`.`book_price` - `book`.`book_price` * `book`.`book_discount` / 100) AS `bookprice`, count(`cart`.`cart_bookid`) AS `countbook`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_userid` AS `cart_userid`, `cart`.`cart_bookid` AS `cart_bookid`, `cart`.`cart_order` AS `cart_order`, `book`.`book_id` AS `book_id`, `book`.`book_name` AS `book_name`, `book`.`book_desc` AS `book_desc`, `book`.`book_image` AS `book_image`, `book`.`book_count` AS `book_count`, `book`.`book_active` AS `book_active`, `book`.`book_price` AS `book_price`, `book`.`book_discount` AS `book_discount`, `book`.`book_data` AS `book_data`, `book`.`book_cat` AS `book_cat`, `book`.`book_publisherid` AS `book_publisherid` FROM ((`cart` join `book` on(`cart`.`cart_bookid` = `book`.`book_id`)) join `users` on(`cart`.`cart_userid` = `users`.`user_id`)) WHERE `cart`.`cart_order` = 0 GROUP BY `cart`.`cart_bookid`, `cart`.`cart_order` ;

-- --------------------------------------------------------

--
-- Structure for view `myfavorite`
--
DROP TABLE IF EXISTS `myfavorite`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id21287611_ahmed`@`%` SQL SECURITY DEFINER VIEW `myfavorite`  AS SELECT `favorite`.`favorite_id` AS `favorite_id`, `favorite`.`favorite_userid` AS `favorite_userid`, `favorite`.`favorite_bookid` AS `favorite_bookid`, `book`.`book_id` AS `book_id`, `book`.`book_name` AS `book_name`, `book`.`book_desc` AS `book_desc`, `book`.`book_image` AS `book_image`, `book`.`book_count` AS `book_count`, `book`.`book_active` AS `book_active`, `book`.`book_price` AS `book_price`, `book`.`book_discount` AS `book_discount`, `book`.`book_data` AS `book_data`, `book`.`book_cat` AS `book_cat`, `book`.`book_publisherid` AS `book_publisherid` FROM ((`favorite` join `users` on(`users`.`user_id` = `favorite`.`favorite_userid`)) join `book` on(`book`.`book_id` = `favorite`.`favorite_bookid`)) ;

-- --------------------------------------------------------

--
-- Structure for view `ordersdetailsview`
--
DROP TABLE IF EXISTS `ordersdetailsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id21287611_ahmed`@`%` SQL SECURITY DEFINER VIEW `ordersdetailsview`  AS SELECT sum(`book`.`book_price` - `book`.`book_price` * `book`.`book_discount` / 100) AS `bookprice`, count(`cart`.`cart_bookid`) AS `countbook`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_userid` AS `cart_userid`, `cart`.`cart_bookid` AS `cart_bookid`, `cart`.`cart_order` AS `cart_order`, `book`.`book_id` AS `book_id`, `book`.`book_name` AS `book_name`, `book`.`book_desc` AS `book_desc`, `book`.`book_image` AS `book_image`, `book`.`book_count` AS `book_count`, `book`.`book_active` AS `book_active`, `book`.`book_price` AS `book_price`, `book`.`book_discount` AS `book_discount`, `book`.`book_data` AS `book_data`, `book`.`book_cat` AS `book_cat`, `book`.`book_publisherid` AS `book_publisherid` FROM (`cart` join `book` on(`cart`.`cart_bookid` = `book`.`book_id`)) WHERE `cart`.`cart_order` <> 0 GROUP BY `cart`.`cart_order` ;

-- --------------------------------------------------------

--
-- Structure for view `ordersview`
--
DROP TABLE IF EXISTS `ordersview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id21287611_ahmed`@`%` SQL SECURITY DEFINER VIEW `ordersview`  AS SELECT `orders`.`order_id` AS `order_id`, `orders`.`orders_usersid` AS `orders_usersid`, `orders`.`orders_address` AS `orders_address`, `orders`.`orders_type` AS `orders_type`, `orders`.`orders_pricedelivery` AS `orders_pricedelivery`, `orders`.`orders_price` AS `orders_price`, `orders`.`orders_coupon` AS `orders_coupon`, `orders`.`orders_totalprice` AS `orders_totalprice`, `orders`.`orders_paymentmethod` AS `orders_paymentmethod`, `orders`.`orders_date` AS `orders_date`, `orders`.`orders_status` AS `orders_status`, `orders`.`orders_noterating` AS `orders_noterating`, `orders`.`orders_rating` AS `orders_rating`, `address`.`address_id` AS `address_id`, `address`.`address_name` AS `address_name`, `address`.`address_city` AS `address_city`, `address`.`address_street` AS `address_street`, `address`.`address_lat` AS `address_lat`, `address`.`address_long` AS `address_long`, `address`.`address_usersid` AS `address_usersid` FROM (`orders` left join `address` on(`address`.`address_id` = `orders`.`orders_address`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `addres_usid` (`address_usersid`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `book_cat` (`book_cat`),
  ADD KEY `book_fk_pub` (`book_publisherid`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_userid` (`cart_userid`),
  ADD KEY `cart_bookid` (`cart_bookid`);

--
-- Indexes for table `categoriers`
--
ALTER TABLE `categoriers`
  ADD PRIMARY KEY (`categoriers_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `favorite_userid` (`favorite_userid`),
  ADD KEY `favorite_bookid` (`favorite_bookid`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `notification_ftk` (`notification_userid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_userfk` (`orders_usersid`),
  ADD KEY `order_addrfk` (`orders_address`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisherid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_phone` (`user_phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `categoriers`
--
ALTER TABLE `categoriers`
  MODIFY `categoriers_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisherid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`book_cat`) REFERENCES `categoriers` (`categoriers_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_pubfk` FOREIGN KEY (`book_publisherid`) REFERENCES `publisher` (`publisherid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_bookfk` FOREIGN KEY (`cart_bookid`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_userfk` FOREIGN KEY (`cart_userid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favo_bookfk` FOREIGN KEY (`favorite_bookid`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favo_userfk` FOREIGN KEY (`favorite_userid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `not_userfk` FOREIGN KEY (`notification_userid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order_addrfk` FOREIGN KEY (`orders_address`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_userfk` FOREIGN KEY (`orders_usersid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
