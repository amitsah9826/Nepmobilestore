-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2023 at 03:37 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobile_store_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `status`, `date_created`) VALUES
(1, 'Apple', 'Apple Company', 1, '2021-08-30 10:33:53'),
(3, 'Samsung', 'Samsung Company', 1, '2021-08-30 10:34:22');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Smart Phone', 'Smart Phone Products', 1, '2021-08-30 10:52:25');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(1, 'Claire', 'Blake', 'Female', '09123456789', 'cblake@gmail.com', 'cd74fae0a3adf459f73bbf187607ccea', 'Sample Address', '2021-08-30 15:32:20'),
(2, 'amit', 'sah', 'Male', '9826848172', 'amitsah@gmail.com', '855fdf45885f6026cf67d653edb8d533', 'malngw', '2023-07-27 14:11:55'),
(3, 'amit', 'sah', 'Male', '982648172', 'bibek@gmail.com', 'cce492688e30ea1eeaaa637df7e44eed', 'pa', '2023-07-27 15:08:37');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(1, 1, 15, 132900, '2021-08-30 13:24:01', '2023-07-22 19:35:37'),
(2, 2, 20, 179999, '2021-08-30 13:27:26', '2023-07-22 19:35:54'),
(3, 3, 25, 350, '2021-08-30 15:42:20', NULL),
(4, 4, 5, 202000, '2023-07-25 19:45:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `specs` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `sub_category_id`, `name`, `specs`, `status`, `date_created`) VALUES
(1, 1, 1, 0, 'iPhone 13 (125GB,Green)', '<ul class=\\\"techspecs-list\\\" role=\\\"list\\\" style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none;\\\"><li class=\\\"row list-li\\\" style=\\\"--bs-gutter-x: 1.25rem; --bs-gutter-y: 0; margin: 0px -10px 30px !important;\\\"><div class=\\\"col-md-4\\\" style=\\\"flex-basis: auto; width: 426.663px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><span class=\\\"pdp-specifications-heading fw-800\\\" style=\\\"font-size: 18px; margin-top: 20px; display: inline-block;\\\">Main</span></div><div class=\\\"col-md-8\\\" style=\\\"flex-basis: auto; width: 853.325px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><div class=\\\"pdp-specifications-blocks\\\" style=\\\"border: 1px solid rgb(221, 221, 221); border-radius: 6px;\\\"><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Brand</div><div class=\\\"w-60\\\" itemprop=\\\"brand\\\" itemtype=\\\"https://schema.org/Brand\\\" itemscope=\\\"\\\" style=\\\"width: 430.625px;\\\">Apple</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Color</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Green</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Model Number</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">MGJL3AA/A</div></div></div></div></div></li><li class=\\\"row list-li\\\" style=\\\"--bs-gutter-x: 1.25rem; --bs-gutter-y: 0; margin: 0px -10px 30px !important;\\\"><div class=\\\"col-md-4\\\" style=\\\"flex-basis: auto; width: 426.663px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><span class=\\\"pdp-specifications-heading fw-800\\\" style=\\\"font-size: 18px; margin-top: 20px; display: inline-block;\\\">General</span></div><div class=\\\"col-md-8\\\" style=\\\"flex-basis: auto; width: 853.325px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><div class=\\\"pdp-specifications-blocks\\\" style=\\\"border: 1px solid rgb(221, 221, 221); border-radius: 6px;\\\"><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Region</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">UAE Version</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">OS</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">iOS</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">OS Version</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">iOS 14</div></div></div></div></div></li><li class=\\\"row list-li\\\" style=\\\"--bs-gutter-x: 1.25rem; --bs-gutter-y: 0; margin: 0px -10px 30px !important;\\\"><div class=\\\"col-md-4\\\" style=\\\"flex-basis: auto; width: 426.663px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><span class=\\\"pdp-specifications-heading fw-800\\\" style=\\\"font-size: 18px; margin-top: 20px; display: inline-block;\\\">Cellular</span></div><div class=\\\"col-md-8\\\" style=\\\"flex-basis: auto; width: 853.325px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><div class=\\\"pdp-specifications-blocks\\\" style=\\\"border: 1px solid rgb(221, 221, 221); border-radius: 6px;\\\"><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Sim Slot</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Single Sim</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Technology</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">5G</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">SIM Card</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Nano-SIM</div></div></div></div></div></li><li class=\\\"row list-li\\\" style=\\\"--bs-gutter-x: 1.25rem; --bs-gutter-y: 0; margin: 0px -10px 30px !important;\\\"><div class=\\\"col-md-4\\\" style=\\\"flex-basis: auto; width: 426.663px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><span class=\\\"pdp-specifications-heading fw-800\\\" style=\\\"font-size: 18px; margin-top: 20px; display: inline-block;\\\">Display</span></div><div class=\\\"col-md-8\\\" style=\\\"flex-basis: auto; width: 853.325px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><div class=\\\"pdp-specifications-blocks\\\" style=\\\"border: 1px solid rgb(221, 221, 221); border-radius: 6px;\\\"><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Screen Size</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">6.1 in</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Resolution</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">1170 x 2532</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Type</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Super Retina XDR OLED, HDR10, 625 nits (typ), 1200 nits (peak)</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Protection</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Scratch-resistant glass, oleophobic coating</div></div></div></div></div></li><li class=\\\"row list-li\\\" style=\\\"--bs-gutter-x: 1.25rem; --bs-gutter-y: 0; margin: 0px -10px 30px !important;\\\"><div class=\\\"col-md-4\\\" style=\\\"flex-basis: auto; width: 426.663px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><span class=\\\"pdp-specifications-heading fw-800\\\" style=\\\"font-size: 18px; margin-top: 20px; display: inline-block;\\\">Features</span></div><div class=\\\"col-md-8\\\" style=\\\"flex-basis: auto; width: 853.325px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><div class=\\\"pdp-specifications-blocks\\\" style=\\\"border: 1px solid rgb(221, 221, 221); border-radius: 6px;\\\"><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Chipset</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Apple A14 Bionic (5 nm)</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">CPU</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Hexa-core</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">GPU</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Apple GPU (4-core graphics)</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Sensors</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Face ID, accelerometer, gyro, proximity, compass, barometer</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Others</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Upon purchase, the mobile activation is mandatory at the same time the delivery is made. Delivery will be cancelled for cases where activation in presence of delivery team is refused.</div></div></div></div></div></li><li class=\\\"row list-li\\\" style=\\\"--bs-gutter-x: 1.25rem; --bs-gutter-y: 0; margin: 0px -10px 30px !important;\\\"><div class=\\\"col-md-4\\\" style=\\\"flex-basis: auto; width: 426.663px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><span class=\\\"pdp-specifications-heading fw-800\\\" style=\\\"font-size: 18px; margin-top: 20px; display: inline-block;\\\">Memory &amp; Storage</span></div><div class=\\\"col-md-8\\\" style=\\\"flex-basis: auto; width: 853.325px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><div class=\\\"pdp-specifications-blocks\\\" style=\\\"border: 1px solid rgb(221, 221, 221); border-radius: 6px;\\\"><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Internal Memory</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">256 GB</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Card slot</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">No</div></div></div></div></div></li><li class=\\\"row list-li\\\" style=\\\"--bs-gutter-x: 1.25rem; --bs-gutter-y: 0; margin: 0px -10px 30px !important;\\\"><div class=\\\"col-md-4\\\" style=\\\"flex-basis: auto; width: 426.663px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><span class=\\\"pdp-specifications-heading fw-800\\\" style=\\\"font-size: 18px; margin-top: 20px; display: inline-block;\\\">Camera</span></div><div class=\\\"col-md-8\\\" style=\\\"flex-basis: auto; width: 853.325px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><div class=\\\"pdp-specifications-blocks\\\" style=\\\"border: 1px solid rgb(221, 221, 221); border-radius: 6px;\\\"><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Rear / Front Camera</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">12 + 12 MP / 12 MP</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Video Resolution</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">4K@24/30/60fps, 1080p@30/60/120/240fps, HDR, Dolby Vision HDR (up to 30fps), stereo sound rec.</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Features</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Quad-LED dual-tone flash, HDR (photo/panorama)</div></div></div></div></div></li><li class=\\\"row list-li\\\" style=\\\"--bs-gutter-x: 1.25rem; --bs-gutter-y: 0; margin: 0px -10px 30px !important;\\\"><div class=\\\"col-md-4\\\" style=\\\"flex-basis: auto; width: 426.663px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><span class=\\\"pdp-specifications-heading fw-800\\\" style=\\\"font-size: 18px; margin-top: 20px; display: inline-block;\\\">Sound</span></div><div class=\\\"col-md-8\\\" style=\\\"flex-basis: auto; width: 853.325px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><div class=\\\"pdp-specifications-blocks\\\" style=\\\"border: 1px solid rgb(221, 221, 221); border-radius: 6px;\\\"><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Loudspeaker</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Yes, with stereo speakers</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">3.5mm jack</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">No</div></div></div></div></div></li><li class=\\\"row list-li\\\" style=\\\"--bs-gutter-x: 1.25rem; --bs-gutter-y: 0; margin: 0px -10px 30px !important;\\\"><div class=\\\"col-md-4\\\" style=\\\"flex-basis: auto; width: 426.663px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><span class=\\\"pdp-specifications-heading fw-800\\\" style=\\\"font-size: 18px; margin-top: 20px; display: inline-block;\\\">Connectivity</span></div><div class=\\\"col-md-8\\\" style=\\\"flex-basis: auto; width: 853.325px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><div class=\\\"pdp-specifications-blocks\\\" style=\\\"border: 1px solid rgb(221, 221, 221); border-radius: 6px;\\\"><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">WiFi Type</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Wi-Fi 802.11 a/b/g/n/ac/6, dual-band, hotspot</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Bluetooth</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">5.0, A2DP, LE</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">NFC</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Yes</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">USB</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Lightning, USB 2.0</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Radio</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">No</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">GPS</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Yes, with A-GPS, GLONASS, GALILEO, QZSS</div></div></div></div></div></li><li class=\\\"row list-li\\\" style=\\\"--bs-gutter-x: 1.25rem; --bs-gutter-y: 0; margin: 0px -10px 30px !important;\\\"><div class=\\\"col-md-4\\\" style=\\\"flex-basis: auto; width: 426.663px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><span class=\\\"pdp-specifications-heading fw-800\\\" style=\\\"font-size: 18px; margin-top: 20px; display: inline-block;\\\">Battery</span></div><div class=\\\"col-md-8\\\" style=\\\"flex-basis: auto; width: 853.325px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><div class=\\\"pdp-specifications-blocks\\\" style=\\\"border: 1px solid rgb(221, 221, 221); border-radius: 6px;\\\"><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Usage Time</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Up to 17 hours</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Battery Type</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Li-Ion, non-removable</div></div></div></div></div></li><li class=\\\"row list-li\\\" style=\\\"--bs-gutter-x: 1.25rem; --bs-gutter-y: 0; margin: 0px -10px 30px !important;\\\"><div class=\\\"col-md-4\\\" style=\\\"flex-basis: auto; width: 426.663px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><span class=\\\"pdp-specifications-heading fw-800\\\" style=\\\"font-size: 18px; margin-top: 20px; display: inline-block;\\\">Body</span></div><div class=\\\"col-md-8\\\" style=\\\"flex-basis: auto; width: 853.325px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><div class=\\\"pdp-specifications-blocks\\\" style=\\\"border: 1px solid rgb(221, 221, 221); border-radius: 6px;\\\"><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Dimensions</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">146.7 x 71.5 x 7.4 mm</div></div></div></div></div></li><li class=\\\"row list-li\\\" style=\\\"--bs-gutter-x: 1.25rem; --bs-gutter-y: 0; margin: 0px -10px 30px !important;\\\"><div class=\\\"col-md-4\\\" style=\\\"flex-basis: auto; width: 426.663px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><span class=\\\"pdp-specifications-heading fw-800\\\" style=\\\"font-size: 18px; margin-top: 20px; display: inline-block;\\\">Weight</span></div><div class=\\\"col-md-8\\\" style=\\\"flex-basis: auto; width: 853.325px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><div class=\\\"pdp-specifications-blocks\\\" style=\\\"border: 1px solid rgb(221, 221, 221); border-radius: 6px;\\\"><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Weight</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">164 g</div></div></div></div></div></li></ul>', 1, '2021-08-30 12:19:22'),
(2, 3, 1, 0, 'Samsung Galaxy S23 Ultra (Black, 256GB)', '<ul class=\\\"specifications-list\\\" style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none;\\\"><li class=\\\"row list-li\\\" style=\\\"--bs-gutter-x: 1.25rem; --bs-gutter-y: 0; margin: 0px -10px 30px !important;\\\"><div class=\\\"col-md-4\\\" style=\\\"flex-basis: auto; width: 426.663px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><font color=\\\"#212529\\\" face=\\\"Nunito Sans, sans-serif\\\"><span style=\\\"font-size: 24px;\\\"><b>Product Specification :</b></span></font><br></div><div class=\\\"col-md-4\\\" style=\\\"color: rgb(33, 37, 41); font-family: \\\" nunito=\\\"\\\" sans\\\",=\\\"\\\" sans-serif;=\\\"\\\" flex-basis:=\\\"\\\" auto;=\\\"\\\" width:=\\\"\\\" 426.663px;=\\\"\\\" max-width:=\\\"\\\" 100%;=\\\"\\\" padding-right:=\\\"\\\" calc(var(--bs-gutter-x)=\\\"\\\" *=\\\"\\\" .5);=\\\"\\\" padding-left:=\\\"\\\" margin-top:=\\\"\\\" var(--bs-gutter-y);\\\"=\\\"\\\"><span class=\\\"pdp-specifications-heading fw-800\\\" style=\\\"font-size: 18px; margin-top: 20px; display: inline-block;\\\"><br></span></div><div class=\\\"col-md-4\\\" style=\\\"color: rgb(33, 37, 41); font-family: \\\" nunito=\\\"\\\" sans\\\",=\\\"\\\" sans-serif;=\\\"\\\" flex-basis:=\\\"\\\" auto;=\\\"\\\" width:=\\\"\\\" 426.663px;=\\\"\\\" max-width:=\\\"\\\" 100%;=\\\"\\\" padding-right:=\\\"\\\" calc(var(--bs-gutter-x)=\\\"\\\" *=\\\"\\\" .5);=\\\"\\\" padding-left:=\\\"\\\" margin-top:=\\\"\\\" var(--bs-gutter-y);\\\"=\\\"\\\"><span class=\\\"pdp-specifications-heading fw-800\\\" style=\\\"font-size: 18px; margin-top: 20px; display: inline-block;\\\">Main</span></div><div class=\\\"col-md-4\\\" style=\\\"color: rgb(33, 37, 41); font-family: \\\" nunito=\\\"\\\" sans\\\",=\\\"\\\" sans-serif;=\\\"\\\" flex-basis:=\\\"\\\" auto;=\\\"\\\" width:=\\\"\\\" 426.663px;=\\\"\\\" max-width:=\\\"\\\" 100%;=\\\"\\\" padding-right:=\\\"\\\" calc(var(--bs-gutter-x)=\\\"\\\" *=\\\"\\\" .5);=\\\"\\\" padding-left:=\\\"\\\" margin-top:=\\\"\\\" var(--bs-gutter-y);\\\"=\\\"\\\"><span class=\\\"pdp-specifications-heading fw-800\\\" style=\\\"font-size: 18px; margin-top: 20px; display: inline-block;\\\"><br></span></div><div class=\\\"col-md-8\\\" style=\\\"color: rgb(33, 37, 41); font-family: \\\" nunito=\\\"\\\" sans\\\",=\\\"\\\" sans-serif;=\\\"\\\" flex-basis:=\\\"\\\" auto;=\\\"\\\" width:=\\\"\\\" 853.325px;=\\\"\\\" max-width:=\\\"\\\" 100%;=\\\"\\\" padding-right:=\\\"\\\" calc(var(--bs-gutter-x)=\\\"\\\" *=\\\"\\\" .5);=\\\"\\\" padding-left:=\\\"\\\" margin-top:=\\\"\\\" var(--bs-gutter-y);\\\"=\\\"\\\"><div class=\\\"pdp-specifications-blocks\\\" style=\\\"border: 1px solid rgb(221, 221, 221); border-radius: 6px;\\\"><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Color Family</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Purple</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Brand</div><div class=\\\"w-60\\\" itemprop=\\\"brand\\\" itemtype=\\\"https://schema.org/Brand\\\" itemscope=\\\"\\\" style=\\\"width: 430.625px;\\\">Samsung</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Color</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Lavender</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Model Number</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">SM-S918BLICMEA</div></div></div></div></div></li><li class=\\\"row list-li\\\" style=\\\"color: rgb(33, 37, 41); font-family: \\\" nunito=\\\"\\\" sans\\\",=\\\"\\\" sans-serif;=\\\"\\\" --bs-gutter-x:=\\\"\\\" 1.25rem;=\\\"\\\" --bs-gutter-y:=\\\"\\\" 0;=\\\"\\\" margin:=\\\"\\\" 0px=\\\"\\\" -10px=\\\"\\\" 30px=\\\"\\\" !important;\\\"=\\\"\\\"><div class=\\\"col-md-4\\\" style=\\\"flex-basis: auto; width: 426.663px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><span class=\\\"pdp-specifications-heading fw-800\\\" style=\\\"font-size: 18px; margin-top: 20px; display: inline-block;\\\">General</span></div><div class=\\\"col-md-8\\\" style=\\\"flex-basis: auto; width: 853.325px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><div class=\\\"pdp-specifications-blocks\\\" style=\\\"border: 1px solid rgb(221, 221, 221); border-radius: 6px;\\\"><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Region</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Middle East Version</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Dual SIM</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Yes</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">OS</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Android</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">OS Version</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Android 13, One UI 5.1</div></div></div></div></div></li><li class=\\\"row list-li\\\" style=\\\"color: rgb(33, 37, 41); font-family: \\\" nunito=\\\"\\\" sans\\\",=\\\"\\\" sans-serif;=\\\"\\\" --bs-gutter-x:=\\\"\\\" 1.25rem;=\\\"\\\" --bs-gutter-y:=\\\"\\\" 0;=\\\"\\\" margin:=\\\"\\\" 0px=\\\"\\\" -10px=\\\"\\\" 30px=\\\"\\\" !important;\\\"=\\\"\\\"><div class=\\\"col-md-4\\\" style=\\\"flex-basis: auto; width: 426.663px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><span class=\\\"pdp-specifications-heading fw-800\\\" style=\\\"font-size: 18px; margin-top: 20px; display: inline-block;\\\">Cellular</span></div><div class=\\\"col-md-8\\\" style=\\\"flex-basis: auto; width: 853.325px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><div class=\\\"pdp-specifications-blocks\\\" style=\\\"border: 1px solid rgb(221, 221, 221); border-radius: 6px;\\\"><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Sim Slot</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Dual Sim (E-Sim + Sim Slot)</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Technology</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">5G</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">SIM Card</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Nano-SIM</div></div></div></div></div></li><li class=\\\"row list-li\\\" style=\\\"color: rgb(33, 37, 41); font-family: \\\" nunito=\\\"\\\" sans\\\",=\\\"\\\" sans-serif;=\\\"\\\" --bs-gutter-x:=\\\"\\\" 1.25rem;=\\\"\\\" --bs-gutter-y:=\\\"\\\" 0;=\\\"\\\" margin:=\\\"\\\" 0px=\\\"\\\" -10px=\\\"\\\" 30px=\\\"\\\" !important;\\\"=\\\"\\\"><div class=\\\"col-md-4\\\" style=\\\"flex-basis: auto; width: 426.663px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><span class=\\\"pdp-specifications-heading fw-800\\\" style=\\\"font-size: 18px; margin-top: 20px; display: inline-block;\\\">Display</span></div><div class=\\\"col-md-8\\\" style=\\\"flex-basis: auto; width: 853.325px; max-width: 100%; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\\\"><div class=\\\"pdp-specifications-blocks\\\" style=\\\"border: 1px solid rgb(221, 221, 221); border-radius: 6px;\\\"><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Screen Size</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">6.8 in</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Resolution</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Edge Quad FHD+ (1440 x 3088)</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px; background-color: rgb(247, 247, 247);\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Type</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">OLED Dynamic AMOLED 2X 1750 nits, 120 Hz (48-120 Hz)</div></div></div><div class=\\\"pdp-specifications-block\\\" style=\\\"padding: 20px 57px;\\\"><div class=\\\"flex\\\" style=\\\"display: flex;\\\"><div class=\\\"fw-800 w-30\\\" style=\\\"width: 215.312px;\\\">Protection</div><div class=\\\"w-60\\\" style=\\\"width: 430.625px;\\\">Corning Gorilla Glass Victus 2, Armor Aluminum frame, IP68 Water Resistance</div></div></div></div></div></li></ul>', 1, '2021-08-30 13:15:11');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 3, 'Batteries', 'Mobile Batteries', 1, '2021-08-30 11:28:40'),
(2, 2, 'Phone Case Cover', 'Mobile Phones Cases', 1, '2021-08-30 11:29:15'),
(3, 4, 'Micro SD Card', 'Micro SD Cards', 1, '2021-08-30 11:29:40');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'NEP माेबाईल STORE'),
(6, 'short_name', ''),
(11, 'logo', 'uploads/1690032300_12.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1690452960_ad.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Amit', 'Sah', 'maab', '3f25f7acce99d5c49a29a884b82cb202', 'uploads/1690033200_1688834940_d1d01b5c-b2c8-49a6-9056-08438c2bc3b7.jpeg', NULL, 1, '2021-01-20 14:02:37', '2023-07-23 19:01:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
