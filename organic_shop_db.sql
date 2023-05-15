-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2023 at 08:56 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `organic_shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `caid` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `pid` int(11) NOT NULL,
  `cart_qunty` varchar(11) NOT NULL,
  `amount` varchar(11) NOT NULL,
  `old_stock` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`caid`, `email`, `pid`, `cart_qunty`, `amount`, `old_stock`) VALUES
(71, 'bilal@gmail.com', 8, '34', '3060', '34');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bank_info`
--

CREATE TABLE `tbl_bank_info` (
  `bank_info_id` int(11) NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `name_on_card` varchar(10) NOT NULL,
  `card_number` varchar(20) NOT NULL,
  `CVV` varchar(10) NOT NULL,
  `expiration_date` varchar(10) NOT NULL,
  `balance_amount` decimal(10,0) NOT NULL,
  `status` varchar(10) NOT NULL,
  `otp` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bank_info`
--

INSERT INTO `tbl_bank_info` (`bank_info_id`, `user_type_id`, `name_on_card`, `card_number`, `CVV`, `expiration_date`, `balance_amount`, `status`, `otp`) VALUES
(1, 2, 'Anu', '4532123485', '497', '12/22', '54134', 'VALID', '1948929281'),
(2, 3, 'Seller', '5674565545675645', '498', '13/23', '62248', 'VALID', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaints`
--

CREATE TABLE `tbl_complaints` (
  `complaints_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `customer_order` int(11) NOT NULL,
  `stock_product_id` int(11) NOT NULL,
  `complaint_message` varchar(100) NOT NULL,
  `replay_message` varchar(50) NOT NULL DEFAULT 'Not Yet Replied',
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_complaints`
--

INSERT INTO `tbl_complaints` (`complaints_id`, `email`, `customer_order`, `stock_product_id`, `complaint_message`, `replay_message`, `status`) VALUES
(10, 'tiny@gmail.com', 59, 8, ' not good', 'Not Yet Replied', 'new'),
(11, 'tiny@gmail.com', 75, 103, 'roated', 'Not Yet Replied', 'new');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_delv_address`
--

CREATE TABLE `tbl_customer_delv_address` (
  `delv_adres_id` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fname` varchar(40) NOT NULL,
  `Mobile number` varchar(20) NOT NULL,
  `address_line` varchar(50) NOT NULL,
  `landmark` varchar(50) NOT NULL,
  `town_city` varchar(30) NOT NULL,
  `pin_code` varchar(10) NOT NULL,
  `address_type` varchar(10) NOT NULL,
  `status5` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customer_delv_address`
--

INSERT INTO `tbl_customer_delv_address` (`delv_adres_id`, `email`, `fname`, `Mobile number`, `address_line`, `landmark`, `town_city`, `pin_code`, `address_type`, `status5`) VALUES
(36, 'georgebenny2023a@mca.ajce.in', 'george', 'benny', 'kidangathazhe', 'poonjar', 'poonjar', '686653', '2', 'VALID'),
(37, 'abilahari2023a@mca.ajce.in', 'Amal jyothi College Of Engineering', '06238681837', 'Poonjar', 'fdgfhj', 'Poonjar', '686581', '2', 'VALID'),
(38, 'bilal@gmail.com', 'bilal', '7238681837', 'Poonjar', 'iojij', 'Poonjar', '686581', '2', 'VALID'),
(39, 'bilal@gmail.com', 'babu', '56565676', 'kkii', 'yttt', 'ppp', '676778', '', 'VALID'),
(40, 'binu@gmail.com', 'binu', '06238681837', 'hgj', 'poonjar', 'tuyuy', '686581', '', 'VALID'),
(41, 'tiny@gmail.com', 'tiny', '06238681837', 'pp', 'iojij', 'Poonjar', '686581', '', 'VALID'),
(42, 'ankit2023a@mca.ajce.in', 'ankith', '6238681837', 'pathnam', 'poonjar', 'pathnam', '686581', '1', 'VALID'),
(43, 'vineethp2023b@mca.ajce.in', 'VINEETH', '9188004165', 'REVATHY', 'ERAVUKADU', 'ALAPPUZHA', '688002', '1', 'VALID'),
(44, 'tiny@gmail.com', 'tiny', '3456789765', 'ert', 'okp', 'ert', '456', '1', 'VALID');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_order`
--

CREATE TABLE `tbl_customer_order` (
  `customer_order_id` int(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `stock_product_id` int(10) NOT NULL,
  `delv_adres_id` int(10) NOT NULL,
  `purchase_qty` int(10) NOT NULL,
  `purchase_price` decimal(10,0) NOT NULL,
  `order_date` datetime NOT NULL,
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `status` varchar(15) NOT NULL,
  `otp` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customer_order`
--

INSERT INTO `tbl_customer_order` (`customer_order_id`, `email`, `stock_product_id`, `delv_adres_id`, `purchase_qty`, `purchase_price`, `order_date`, `delivery_date`, `status`, `otp`) VALUES
(54, 'abilahari2023a@mca.ajce.in', 6, 37, 3, '105', '2023-02-23 20:47:53', '2023-02-23', 'order placed', ''),
(55, 'abilahari2023a@mca.ajce.in', 7, 37, 4, '400', '2023-02-23 20:49:46', '2023-02-23', 'order placed', ''),
(56, 'abilahari2023a@mca.ajce.in', 9, 37, 7, '350', '2023-02-23 21:49:12', '2023-02-23', 'order placed', ''),
(57, 'tiny@gmail.com', 9, 41, 3, '150', '2023-02-24 09:06:18', '2023-02-24', 'order placed', ''),
(58, 'tiny@gmail.com', 6, 41, 2, '70', '2023-02-24 09:08:07', '2023-02-24', 'order placed', ''),
(59, 'tiny@gmail.com', 8, 41, 1, '90', '2023-02-24 09:17:31', '2023-02-24', 'order placed', ''),
(60, 'tiny@gmail.com', 8, 41, 1, '90', '2023-02-24 10:18:14', '2023-02-24', 'order placed', ''),
(61, 'tiny@gmail.com', 8, 41, 2, '180', '2023-02-24 10:27:04', '2023-02-24', 'order placed', ''),
(62, 'tiny@gmail.com', 8, 41, 3, '270', '2023-02-24 14:31:42', '2023-02-24', 'order placed', ''),
(63, 'ankit2023a@mca.ajce.in', 8, 42, 2, '180', '2023-03-01 10:50:08', '2023-03-01', 'order placed', ''),
(64, 'ankit2023a@mca.ajce.in', 7, 42, 5, '500', '2023-03-01 10:50:10', '2023-03-01', 'order placed', ''),
(65, 'tiny@gmail.com', 8, 41, 1, '90', '2023-03-01 11:19:57', '2023-03-01', 'order placed', ''),
(66, 'tiny@gmail.com', 9, 41, 1, '50', '2023-03-01 11:19:57', '2023-03-01', 'order placed', ''),
(67, 'tiny@gmail.com', 11, 41, 1, '100', '2023-03-01 11:19:57', '2023-03-01', 'order placed', ''),
(68, 'binu@gmail.com', 7, 40, 3, '300', '2023-03-01 14:19:44', '2023-03-01', 'order placed', ''),
(69, 'binu@gmail.com', 6, 40, 2, '70', '2023-03-01 14:19:44', '2023-03-01', 'order placed', ''),
(70, 'binu@gmail.com', 8, 40, 5, '450', '2023-03-01 14:19:44', '2023-03-01', 'order placed', ''),
(71, 'vineethp2023b@mca.ajce.in', 6, 43, 3, '105', '2023-03-01 15:28:09', '2023-03-01', 'order placed', ''),
(72, 'tiny@gmail.com', 8, 44, 20, '1800', '2023-04-03 09:36:24', '2023-04-03', 'order placed', ''),
(73, 'georgebenny2023a@mca.ajce.in', 82, 36, 4, '120', '2023-04-19 09:22:57', '2023-04-19', 'order placed', ''),
(74, 'abilahari2023a@mca.ajce.in', 8, 37, 1, '90', '2023-05-05 14:06:14', '2023-05-05', 'order placed', ''),
(75, 'tiny@gmail.com', 103, 41, 5, '500', '2023-05-09 14:20:14', '2023-05-09', 'order placed', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `email` varchar(30) NOT NULL,
  `user_type_id` int(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`email`, `user_type_id`, `password`, `status`) VALUES
('123@gmail.com', 3, 'Amal123@', 'ACTIVE'),
('abilahari2023a@mca.ajce.in', 2, '58571663', 'ACTIVE'),
('admin@gmail.com', 1, 'Admin00#', 'ACTIVE'),
('alen@gmail.com', 3, 'Alen@123', 'ACTIVE'),
('ankit2023a@mca.ajce.in', 2, 'Ankit@123', 'ACTIVE'),
('anton@gmail.com', 3, 'Anton@123', 'ACTIVE'),
('ben2023a@mca.ajce.in', 3, 'Benjhonson@123', 'ACTIVE'),
('bilal@gmail.com', 2, 'Bilal@123', 'ACTIVE'),
('binu@gmail.com', 2, 'Binu@123', 'ACTIVE'),
('georgebenny2023a@mca.ajce.in', 2, 'GeorgeBenny@1234', 'ACTIVE'),
('raman@gmail.com', 2, 'Raman@123', 'ACTIVE'),
('rocky@gmail.com', 3, 'Rocky@123', 'ACTIVE'),
('tiny@gmail.com', 2, 'Tiny@123', 'ACTIVE'),
('vineethp2023b@mca.ajce.in', 2, 'Vineeth@13', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `pid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` varchar(20) NOT NULL,
  `des` text NOT NULL,
  `qunty` float NOT NULL,
  `date` date NOT NULL,
  `image` varchar(20) NOT NULL DEFAULT 'blank.png',
  `picStatus` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`pid`, `rid`, `product_category_id`, `name`, `price`, `des`, `qunty`, `date`, `image`, `picStatus`) VALUES
(8, 61, 14, 'chilly', '90', 'oraganic chilly', 0, '2022-11-26', 'i.jpg', 0),
(11, 66, 14, 'tomattoo', '100', 'oraganic', 25, '2023-03-03', 'o.jpg', 0),
(82, 59, 14, 'Beans', '30', 'natural', 0, '2023-04-06', 'bb.jpg', 0),
(84, 59, 14, 'chilly', '98', 'very nice', 33, '2023-04-07', 'u.jpg', 0),
(103, 59, 15, 'apple', '100', 'Very Good', 5, '2023-05-11', 'apple.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_category`
--

CREATE TABLE `tbl_product_category` (
  `product_category_id` int(11) NOT NULL,
  `prod_category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product_category`
--

INSERT INTO `tbl_product_category` (`product_category_id`, `prod_category_name`) VALUES
(15, 'fruit');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registration`
--

CREATE TABLE `tbl_registration` (
  `rid` int(10) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `place` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_registration`
--

INSERT INTO `tbl_registration` (`rid`, `fname`, `lname`, `phone_no`, `email`, `place`) VALUES
(1, 'George', 'Benny', '9090909094', 'admin@gmail.com', 'Kottayam'),
(55, 'george', 'benny', '6238681837', 'georgebenny2023a@mca.ajce.in', 'poonjar'),
(56, 'alen', 'sdfdfdf', '9238681837', 'alen@gmail.com', 'piravaam'),
(57, 'Amsu', 'Bilahari', '9745286448', 'abilahari2023a@mca.ajce.in', 'Karukachal'),
(58, 'amal', 'sathyan', '6282916766', '123@gmail.com', 'tsr'),
(59, 'anton', 'mukaan', '5643789765', 'anton@gmail.com', 'poddaaa'),
(60, 'bilal', 'jhon', '7868766765', 'bilal@gmail.com', 'pikaaa'),
(61, 'rocky', 'baii', '5765564564', 'rocky@gmail.com', 'pala'),
(62, 'binu', 'babu', '5678654345', 'binu@gmail.com', 'poonjar'),
(63, 'Bilal', 'jhon', '9875676569', 'tiny@gmail.com', 'ppp'),
(64, 'raman', 'mon', '6238681837', 'raman@gmail.com', 'ppoo'),
(65, 'ankit', 'bigi', '6238681837', 'ankit2023a@mca.ajce.in', 'Pathanam'),
(66, 'ben', 'jhonson', '6238681837', 'ben2023a@mca.ajce.in', 'Pala'),
(67, 'VINEETH', 'PRADEEP', '9188004165', 'vineethp2023b@mca.ajce.in', 'ALAPPUZHA');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_type`
--

CREATE TABLE `tbl_user_type` (
  `user_type_id` int(10) NOT NULL,
  `user_type_name` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_type`
--

INSERT INTO `tbl_user_type` (`user_type_id`, `user_type_name`, `status`) VALUES
(1, 'admin', 'ACTIVE'),
(2, 'customer', 'ACTIVE'),
(3, 'seller', 'ACTIVE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`caid`),
  ADD KEY `email` (`email`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tbl_bank_info`
--
ALTER TABLE `tbl_bank_info`
  ADD PRIMARY KEY (`bank_info_id`),
  ADD KEY `user_type_id` (`user_type_id`);

--
-- Indexes for table `tbl_complaints`
--
ALTER TABLE `tbl_complaints`
  ADD PRIMARY KEY (`complaints_id`);

--
-- Indexes for table `tbl_customer_delv_address`
--
ALTER TABLE `tbl_customer_delv_address`
  ADD PRIMARY KEY (`delv_adres_id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `tbl_customer_order`
--
ALTER TABLE `tbl_customer_order`
  ADD PRIMARY KEY (`customer_order_id`),
  ADD KEY `delv_adres_id` (`delv_adres_id`),
  ADD KEY `stock_product_id` (`stock_product_id`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`email`),
  ADD KEY `user_type_id` (`user_type_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `product_category_id` (`product_category_id`);

--
-- Indexes for table `tbl_product_category`
--
ALTER TABLE `tbl_product_category`
  ADD PRIMARY KEY (`product_category_id`);

--
-- Indexes for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `tbl_user_type`
--
ALTER TABLE `tbl_user_type`
  ADD PRIMARY KEY (`user_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `caid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `tbl_bank_info`
--
ALTER TABLE `tbl_bank_info`
  MODIFY `bank_info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_complaints`
--
ALTER TABLE `tbl_complaints`
  MODIFY `complaints_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_customer_delv_address`
--
ALTER TABLE `tbl_customer_delv_address`
  MODIFY `delv_adres_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_customer_order`
--
ALTER TABLE `tbl_customer_order`
  MODIFY `customer_order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `tbl_product_category`
--
ALTER TABLE `tbl_product_category`
  MODIFY `product_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  MODIFY `rid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `tbl_user_type`
--
ALTER TABLE `tbl_user_type`
  MODIFY `user_type_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`email`) REFERENCES `tbl_login` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `tbl_product` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_bank_info`
--
ALTER TABLE `tbl_bank_info`
  ADD CONSTRAINT `tbl_bank_info_ibfk_1` FOREIGN KEY (`user_type_id`) REFERENCES `tbl_user_type` (`user_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD CONSTRAINT `tbl_login_ibfk_1` FOREIGN KEY (`user_type_id`) REFERENCES `tbl_user_type` (`user_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  ADD CONSTRAINT `tbl_registration_ibfk_1` FOREIGN KEY (`email`) REFERENCES `tbl_login` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
