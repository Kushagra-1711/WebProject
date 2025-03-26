-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2025 at 01:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anidb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `product_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `bidding_price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `bidder_name` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `bid_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`product_id`, `item_name`, `bidding_price`, `quantity`, `bidder_name`, `location`, `bid_time`) VALUES
(24, 'cardamom', 1500.00, 60, '0', 'Pune', '2025-03-25 20:34:26'),
(24, 'cardamom', 1200.00, 40, '0', 'Pune', '2025-03-25 20:36:58');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_username` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prac`
--

CREATE TABLE `prac` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `username` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `alt_mobile` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `alt_email` varchar(100) DEFAULT NULL,
  `aadhar` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `occupation` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `income` decimal(10,2) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `branch_code` varchar(20) NOT NULL,
  `ifsc` varchar(20) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `perm_address` text NOT NULL,
  `perm_pin` varchar(10) NOT NULL,
  `perm_city` varchar(50) NOT NULL,
  `perm_state` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prac`
--

INSERT INTO `prac` (`id`, `name`, `dob`, `username`, `age`, `mobile`, `alt_mobile`, `email`, `alt_email`, `aadhar`, `password`, `occupation`, `designation`, `income`, `bank_name`, `branch_name`, `branch_code`, `ifsc`, `account_number`, `perm_address`, `perm_pin`, `perm_city`, `perm_state`, `created_at`) VALUES
(4, 'Saksham', '2025-03-01', 'Ani1012@#', 20, '9787765548', '9767676561', 'abracadab12@gmail.com', 'abracadab13@gmail.com', '123456789654', '$2y$10$CdqxRMeORfon6tODPLsvoeO6aH9DwjRiXQcZc2.vFkQsXRtJ44HAS', 'Student', 'Student', 20.00, 'SBI', 'Rewa', '0032', 'SBIN000032', '45678965432', 'D-7 eco valley', '418164', 'Pune', 'Maharashtra', '2025-03-11 17:03:49'),
(6, 'Sahil Mohril', '2025-03-10', 'sahilsigma', 19, '8318552946', '9887766554', 'sahilabc@gmail.com', 'sahilop@gmail.com', '123456789012', '$2y$10$yhSDOlfDCxQMJ/FFmEyL9eFgJya6RBeOQFY68BxNG6OVpog.ikkNe', 'student', 'abc', 1000.00, 'icici', 'Lucknow', '1234', 'SBIN000032', '12334455212', 'Samarth Parisar', '1233', 'Bhopal', 'Madhya Pradesh', '2025-03-11 17:56:00'),
(8, 'Harshita', '2025-03-01', 'Yashi05@', 21, '9988776655', '3344556677', 'abcd12@gmail.com', 'abcde@gmail.com', '998877665544', '$2y$10$yO8aqAS8d7.h2ZJDRXfek.H4mSoK0YXtoqUnmxRRvaXNscPVBhjQ2', 'Student', 'Student', 0.00, 'SBI', 'SBI', '0032', 'SBIN000032', '45678900004', 'GCE', '123456', 'Delhi', 'Haryana', '2025-03-12 05:23:15'),
(9, 'User', '2004-12-10', 'User12@#', 20, '9966334411', '8855663311', 'user12@gmail.c0m', 'user123@gmail.com', '778844555994', '$2y$10$C464RIr7dyEAkbAVTljkB.3VUPsBWNIZKDO3YJp9b1ZxRecz64076', 'Seller', 'Seller', 0.00, 'SBI', 'SBI', '0001', 'SBIN00001', '11223385669', 'Vit vellore', '632014', 'Vellore', 'Tamil Nadu', '2025-03-22 16:22:15');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `available_quantity` int(11) NOT NULL,
  `base_fare` decimal(10,2) NOT NULL,
  `bidding_date` date NOT NULL,
  `bidding_time` time NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `username`, `product_id`, `product_name`, `description`, `available_quantity`, `base_fare`, `bidding_date`, `bidding_time`, `image_path`, `created_at`) VALUES
(1, 'Ani1012@#', '01', 'Wheat', 'We offer high-quality wheat sourced from trusted farms, ensuring freshness, purity, and rich nutritional value. Our wheat is carefully cleaned, processed, and packed to meet the highest standards. Available in bulk and retail quantities, we cater to wholesalers, retailers, and individual buyers.\r\n✅ Premium quality grains\r\n✅ Rich in fiber, protein, and essential nutrients\r\n✅ Ideal for flour milling, baking, and food production\r\n✅ Competitive pricing with flexible supply options\r\n✅ Timely delivery and excellent customer support\r\n\r\nWhether you\'re a distributor, flour mill, or a household looking for the best wheat, we provide the finest product to meet your needs. Contact us today for pricing and bulk order inquiries!', 10000, 15.00, '2025-03-23', '10:00:00', 'uploads/01.jpg', '2025-03-22 04:29:14'),
(2, 'Ani1012@#', '02', 'Rice', 'We offer premium-quality rice sourced from the finest farms, ensuring rich aroma, superior taste, and high nutritional value. Our rice is carefully cleaned, processed, and packaged to maintain purity and freshness. Available in various varieties, including Basmati, non-Basmati, long-grain, and short-grain, we cater to wholesalers, retailers, and individual buyers.\r\n✅ Superior quality with excellent taste and aroma\r\n✅ Rich in nutrients and naturally processed\r\n✅ Ideal for daily cooking, restaurants, and bulk supply\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with top-notch customer service\r\n\r\nWhether you\'re a supplier, retailer, or looking for the best rice for your home, we provide the perfect solution. Contact us today for orders and inquiries!', 10000, 20.00, '2025-03-23', '10:00:00', 'uploads/02.png', '2025-03-22 04:33:01'),
(3, 'Ani1012@#', '03', 'Moong Daal', 'We provide premium-quality Moong Dal, carefully sourced and processed to ensure purity, freshness, and rich nutritional value. Our dal is hygienically cleaned and packed, making it perfect for households, retailers, and bulk buyers. Rich in protein, fiber, and essential nutrients, it is an excellent choice for a healthy diet.\r\n✅ 100% pure and free from adulteration\r\n✅ Rich in protein, fiber, and essential minerals\r\n✅ Easy to cook and highly digestible\r\n✅ Ideal for households, restaurants, and bulk suppliers\r\n✅ Competitive pricing with bulk order options\r\n✅ Timely delivery with excellent customer service\r\n\r\nWhether for home use, retail, or wholesale supply, our Moong Dal guarantees quality and taste. Contact us today for orders and inquiries!', 2000, 25.00, '2025-03-25', '10:00:00', 'uploads/03.jpg', '2025-03-22 04:47:30'),
(4, 'User12@#', '04', 'Potato', 'We offer farm-fresh, high-quality potatoes sourced directly from trusted farmers. Our potatoes are carefully selected, cleaned, and packed to ensure freshness, rich taste, and long shelf life. Available in bulk and retail quantities, they are ideal for households, retailers, wholesalers, and food businesses.\r\n\r\n✅ Fresh, firm, and naturally grown\r\n✅ Rich in nutrients and free from chemicals\r\n✅ Suitable for cooking, frying, and industrial use\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether you need potatoes for daily cooking, food processing, or wholesale supply, we provide the best quality at the best prices. Contact us today for orders and inquiries!', 5000, 15.00, '2025-03-25', '11:00:00', 'uploads/04.jpg', '2025-03-22 16:28:16'),
(5, 'User12@#', '05', 'Carrot', 'We supply premium-quality, farm-fresh carrots that are rich in taste, nutrients, and freshness. Sourced from trusted farmers, our carrots are carefully cleaned, sorted, and packed to maintain their natural flavor and crisp texture. Available in bulk and retail quantities, they are perfect for households, retailers, wholesalers, and food businesses.\r\n\r\n✅ Naturally fresh, crisp, and sweet\r\n✅ Rich in vitamins, fiber, and antioxidants\r\n✅ Perfect for salads, cooking, and juicing\r\n✅ Competitive pricing with bulk order options\r\n✅ Timely delivery with quality assurance\r\n\r\nWhether for daily consumption, commercial use, or wholesale supply, we provide the best carrots to meet your needs. Contact us today for orders and inquiries!', 1000, 20.00, '2025-03-24', '11:00:00', 'uploads/05.jpg', '2025-03-22 16:29:30'),
(6, 'User12@#', '06', 'Cauliflower', 'We offer farm-fresh, high-quality cauliflower, carefully sourced from trusted farmers to ensure freshness, superior taste, and rich nutritional value. Our cauliflowers are naturally grown, hygienically cleaned, and packed to maintain their crisp texture and purity. Available in bulk and retail quantities, they are ideal for households, retailers, wholesalers, and food businesses.\r\n\r\n✅ Fresh, firm, and naturally grown\r\n✅ Rich in fiber, vitamins, and antioxidants\r\n✅ Perfect for cooking, curries, and salads\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for daily consumption, commercial use, or wholesale supply, we provide the finest cauliflower at the best prices. Contact us today for orders and inquiries!', 1000, 10.00, '2025-03-26', '11:00:00', 'uploads/06.jpg', '2025-03-22 16:32:11'),
(7, 'User12@#', '07', 'Spinach', 'We provide farm-fresh, high-quality spinach, carefully sourced from trusted farmers to ensure maximum freshness, taste, and nutritional value. Our spinach is naturally grown, hygienically cleaned, and packed to retain its rich green color and crisp texture. Available in bulk and retail quantities, it is perfect for households, retailers, wholesalers, and food businesses.\r\n\r\n✅ Fresh, crisp, and naturally grown\r\n✅ Rich in iron, vitamins, and antioxidants\r\n✅ Ideal for salads, cooking, and smoothies\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for daily cooking, commercial use, or wholesale supply, we offer the best quality spinach at the best prices. Contact us today for orders and inquiries!', 200, 5.00, '2025-03-26', '12:00:00', 'uploads/07.jpg', '2025-03-22 16:42:49'),
(8, 'User12@#', '08', 'Garlic', 'We offer premium-quality, farm-fresh garlic, carefully sourced from trusted farmers to ensure rich flavor, strong aroma, and high nutritional value. Our garlic is naturally grown, hygienically cleaned, and packed to retain its freshness and purity. Available in bulk and retail quantities, it is perfect for households, retailers, wholesalers, and food businesses.\r\n\r\nWhy Choose Our Garlic?\r\n✅ Fresh, aromatic, and naturally grown\r\n✅ Rich in antioxidants, vitamins, and medicinal properties\r\n✅ Ideal for cooking, seasoning, and health benefits\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for daily cooking, commercial use, or wholesale supply, we provide the finest garlic at the best prices. Contact us today for orders and inquiries!', 500, 12.00, '2025-03-27', '13:00:00', 'uploads/08.jpg', '2025-03-22 16:42:49'),
(9, 'User12@#', '09', 'Brinjal', 'We offer farm-fresh, high-quality brinjals (eggplants) sourced from trusted farmers to ensure rich taste, freshness, and superior nutritional value. Our brinjals are naturally grown, carefully cleaned, and packed to maintain their firm texture and vibrant color. Available in bulk and retail quantities, they are perfect for households, retailers, wholesalers, and food businesses.\r\n\r\nWhy Choose Our Brinjals?\r\n✅ Fresh, firm, and naturally grown\r\n✅ Rich in fiber, vitamins, and antioxidants\r\n✅ Ideal for curries, grilling, and frying\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for home cooking, commercial use, or wholesale supply, we provide the best quality brinjals at the best prices. Contact us today for orders and inquiries!', 500, 8.00, '2025-03-27', '10:00:00', 'uploads/09.jpg', '2025-03-22 16:42:49'),
(10, 'User12@#', '10', 'Turnip', 'We offer farm-fresh, high-quality turnips, carefully sourced from trusted farmers to ensure superior taste, crisp texture, and rich nutritional value. Our turnips are naturally grown, hygienically cleaned, and packed to retain their freshness and purity. Available in bulk and retail quantities, they are perfect for households, retailers, wholesalers, and food businesses.\r\n\r\nWhy Choose Our Turnips?\r\n✅ Fresh, firm, and naturally grown\r\n✅ Rich in fiber, vitamins, and antioxidants\r\n✅ Ideal for soups, salads, and cooking\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for daily consumption, commercial use, or wholesale supply, we provide the finest turnips at the best prices. Contact us today for orders and inquiries!', 500, 10.00, '2025-03-29', '09:00:00', 'uploads/10.jpg', '2025-03-22 16:42:49'),
(11, 'User12@#', '11', 'Spring Onion', 'We offer farm-fresh, high-quality spring onions, sourced from trusted farmers to ensure rich flavor, crisp texture, and maximum freshness. Our spring onions are naturally grown, carefully cleaned, and hygienically packed to retain their nutritional value and vibrant green color. Available in bulk and retail quantities, they are perfect for households, retailers, wholesalers, and food businesses.\r\n\r\nWhy Choose Our Spring Onions?\r\n✅ Fresh, crisp, and naturally grown\r\n✅ Rich in vitamins, fiber, and antioxidants\r\n✅ Ideal for salads, soups, stir-fries, and garnishing\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for home cooking, restaurant use, or wholesale supply, we provide the best-quality spring onions at the best prices. Contact us today for orders and inquiries!', 200, 20.00, '2025-03-28', '09:30:00', 'uploads/11.jpg', '2025-03-22 16:42:49'),
(12, 'User12@#', '12', 'Cabbage', 'We offer farm-fresh, high-quality cabbage, sourced from trusted farmers to ensure superior taste, crisp texture, and maximum freshness. Our cabbages are naturally grown, carefully cleaned, and hygienically packed to retain their nutritional value and purity. Available in bulk and retail quantities, they are perfect for households, retailers, wholesalers, and food businesses.\r\n\r\nWhy Choose Our Cabbage?\r\n✅ Fresh, firm, and naturally grown\r\n✅ Rich in fiber, vitamins, and antioxidants\r\n✅ Ideal for salads, stir-fries, soups, and curries\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for home cooking, commercial use, or wholesale supply, we provide the finest cabbage at the best prices. Contact us today for orders and inquiries!', 100, 12.00, '2025-04-01', '08:00:00', 'uploads/12.jpg', '2025-03-24 13:46:10'),
(13, 'User12@#', '13', 'Onion', 'We offer premium-quality, farm-fresh onions sourced from trusted farmers to ensure rich flavor, crisp texture, and long shelf life. Our onions are naturally grown, carefully cleaned, and hygienically packed to maintain their freshness and nutritional value. Available in bulk and retail quantities, they are perfect for households, retailers, wholesalers, and food businesses.\r\n\r\nWhy Choose Our Onions?\r\n✅ Fresh, firm, and naturally grown\r\n✅ Rich in antioxidants, vitamins, and essential nutrients\r\n✅ Ideal for cooking, seasoning, and food processing\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for daily cooking, commercial use, or wholesale supply, we provide the best-quality onions at the best prices. Contact us today for orders and inquiries!', 500, 5.00, '2025-04-01', '08:00:00', 'uploads/13.jpg', '2025-03-24 13:46:10'),
(14, 'User12@#', '14', 'Broccoli', 'We offer farm-fresh, high-quality broccoli, sourced from trusted farmers to ensure rich taste, crisp texture, and maximum freshness. Our broccoli is naturally grown, carefully cleaned, and hygienically packed to retain its nutritional value and vibrant green color. Available in bulk and retail quantities, it is perfect for households, retailers, wholesalers, and food businesses.\r\n\r\nWhy Choose Our Broccoli?\r\n✅ Fresh, firm, and naturally grown\r\n✅ Rich in fiber, vitamins, and antioxidants\r\n✅ Ideal for salads, stir-fries, soups, and healthy meals\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for home cooking, restaurant use, or wholesale supply, we provide the best-quality broccoli at the best prices. Contact us today for orders and inquiries!', 200, 15.00, '2025-04-01', '09:00:00', 'uploads/14.jpg', '2025-03-24 13:56:02'),
(15, 'User12@#', '15', 'Cucumber', 'We offer farm-fresh, high-quality cucumbers, sourced from trusted farmers to ensure crisp texture, rich taste, and maximum freshness. Our cucumbers are naturally grown, carefully cleaned, and hygienically packed to retain their nutritional value and vibrant green color. Available in bulk and retail quantities, they are perfect for households, retailers, wholesalers, and food businesses.\r\n\r\nWhy Choose Our Cucumbers?\r\n✅ Fresh, crisp, and naturally grown\r\n✅ Rich in hydration, fiber, and essential nutrients\r\n✅ Ideal for salads, smoothies, pickles, and garnishing\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for home consumption, restaurant use, or wholesale supply, we provide the best-quality cucumbers at the best prices. Contact us today for orders and inquiries!', 500, 10.00, '2025-04-01', '09:30:00', 'uploads/15.jpg', '2025-03-24 13:56:02'),
(16, 'User12@#', '16', 'Almonds', 'We offer high-quality, naturally grown almonds sourced from trusted farms to ensure superior taste, crunch, and maximum nutritional benefits. Our almonds are carefully selected, hygienically processed, and packed to retain their purity and freshness. Available in bulk and retail quantities, they are perfect for households, retailers, wholesalers, and food businesses.\r\n\r\nWhy Choose Our Almonds?\r\n✅ 100% natural, fresh, and premium quality\r\n✅ Rich in protein, healthy fats, and essential nutrients\r\n✅ Ideal for snacking, baking, and culinary use\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for daily consumption, commercial use, or wholesale supply, we provide the finest almonds at the best prices. Contact us today for orders and inquiries!', 500, 400.00, '2025-04-01', '10:00:00', 'uploads/almonds.jpg', '2025-03-24 13:56:02'),
(17, 'User12@#', '17', 'Apples', 'We offer premium-quality, farm-fresh apples sourced from trusted orchards to ensure superior taste, crisp texture, and rich nutritional value. Our apples are naturally grown, carefully handpicked, and hygienically packed to maintain their freshness and purity. Available in bulk and retail quantities, they are perfect for households, retailers, wholesalers, and food businesses.\r\n\r\nWhy Choose Our Apples?\r\n✅ Fresh, juicy, and naturally grown\r\n✅ Rich in fiber, vitamins, and antioxidants\r\n✅ Ideal for snacking, juices, and desserts\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for home consumption, retail, or wholesale supply, we provide the best-quality apples at the best prices. Contact us today for orders and inquiries!', 600, 50.00, '2025-04-01', '11:00:00', 'uploads/apples.jpg', '2025-03-24 13:56:02'),
(18, 'User12@#', '18', 'Tur Dal (Arahar)', 'We offer high-quality Tur Dal (Arhar Dal), sourced from trusted farmers to ensure purity, rich taste, and superior nutritional value. Our dal is carefully cleaned, processed, and hygienically packed to retain its natural freshness and goodness. Available in bulk and retail quantities, it is perfect for households, retailers, wholesalers, and food businesses.\r\n\r\nWhy Choose Our Tur Dal?\r\n✅ 100% pure and free from adulteration\r\n✅ Rich in protein, fiber, and essential nutrients\r\n✅ Easy to cook and highly nutritious\r\n✅ Ideal for daily meals, restaurants, and bulk supply\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for home use, commercial cooking, or wholesale supply, we provide the best-quality Tur Dal at the best prices. Contact us today for orders and inquiries!', 500, 50.00, '2025-03-30', '10:00:00', 'uploads/arahar_pulse.jpg', '2025-03-24 13:56:02'),
(19, 'User12@#', '19', 'Bananas', 'We offer premium-quality, farm-fresh bananas sourced from trusted growers to ensure superior taste, rich nutrition, and maximum freshness. Our bananas are naturally ripened, carefully handpicked, and hygienically packed to retain their purity and quality. Available in bulk and retail quantities, they are perfect for households, retailers, wholesalers, and food businesses.\r\n\r\nWhy Choose Our Bananas?\r\n✅ Fresh, naturally ripened, and high in quality\r\n✅ Rich in fiber, potassium, and essential vitamins\r\n✅ Ideal for snacking, smoothies, desserts, and cooking\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for daily consumption, retail, or wholesale supply, we provide the best-quality bananas at the best prices. Contact us today for orders and inquiries!', 500, 25.00, '2025-03-30', '12:00:00', 'uploads/bananas.jpg', '2025-03-24 13:56:02'),
(20, 'User12@#', '20', 'Black Gram (Urad Dal)', 'We offer high-quality Black Gram (Urad Dal), sourced from trusted farmers to ensure superior taste, purity, and rich nutritional value. Our black gram is carefully cleaned, processed, and hygienically packed to retain its natural freshness and goodness. Available in bulk and retail quantities, it is perfect for households, retailers, wholesalers, and food businesses.\r\n\r\nWhy Choose Our Black Gram?\r\n✅ 100% pure and free from adulteration\r\n✅ Rich in protein, fiber, and essential nutrients\r\n✅ Easy to cook and highly nutritious\r\n✅ Ideal for dals, curries, idlis, dosas, and more\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for home cooking, commercial use, or wholesale supply, we provide the best-quality Black Gram at the best prices. Contact us today for orders and inquiries!', 400, 90.00, '2025-03-31', '10:30:00', 'uploads/black gram.jpg', '2025-03-24 13:56:02'),
(21, 'User12@#', '21', 'Black eyed peas (Lobia)', 'We offer high-quality Black Eyed Peas (Lobia), sourced from trusted farmers to ensure superior taste, purity, and rich nutritional value. Our black-eyed peas are carefully cleaned, processed, and hygienically packed to retain their natural freshness and goodness. Available in bulk and retail quantities, they are perfect for households, retailers, wholesalers, and food businesses.\r\n\r\nWhy Choose Our Black Eyed Peas?\r\n✅ 100% pure, fresh, and free from adulteration\r\n✅ Rich in protein, fiber, and essential nutrients\r\n✅ Easy to cook and highly nutritious\r\n✅ Ideal for curries, salads, soups, and various dishes\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for home cooking, commercial use, or wholesale supply, we provide the best-quality Black Eyed Peas at the best prices. Contact us today for orders and inquiries!', 300, 70.00, '2025-04-02', '08:00:00', 'uploads/black_eyed_peas.jpg', '2025-03-24 13:56:02'),
(22, 'User12@#', '22', 'Cashew', 'We offer high-quality, naturally grown cashew nuts sourced from trusted farms to ensure superior taste, crunch, and maximum nutritional benefits. Our cashews are carefully selected, hygienically processed, and packed to retain their purity and freshness. Available in bulk and retail quantities, they are perfect for households, retailers, wholesalers, and food businesses.\r\n\r\nWhy Choose Our Cashew Nuts?\r\n✅ 100% natural, fresh, and premium quality\r\n✅ Rich in protein, healthy fats, and essential nutrients\r\n✅ Ideal for snacking, desserts, cooking, and gifting\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for daily consumption, commercial use, or wholesale supply, we provide the finest cashew nuts at the best prices. Contact us today for orders and inquiries!', 500, 200.00, '2025-04-02', '11:00:00', 'uploads/cashewnuts.jpg', '2025-03-24 13:56:02'),
(23, 'User12@#', '23', 'Chickpeas (Kabuli Chana)', 'We offer high-quality chickpeas (Kabuli Chana), sourced from trusted farmers to ensure superior taste, purity, and rich nutritional value. Our chickpeas are carefully cleaned, processed, and hygienically packed to retain their natural freshness and goodness. Available in bulk and retail quantities, they are perfect for households, retailers, wholesalers, and food businesses.\r\n\r\nWhy Choose Our Chickpeas?\r\n✅ 100% pure, fresh, and free from adulteration\r\n✅ Rich in protein, fiber, and essential nutrients\r\n✅ Easy to cook and highly nutritious\r\n✅ Ideal for curries, salads, hummus, and snacks\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for home cooking, commercial use, or wholesale supply, we provide the best-quality chickpeas at the best prices. Contact us today for orders and inquiries!', 400, 90.00, '2025-04-02', '09:00:00', 'uploads/chickpeas.jpg', '2025-03-24 13:56:02'),
(24, 'User12@#', '24', 'cardamom', 'We offer high-quality, aromatic cardamom sourced from trusted farms to ensure rich flavor, freshness, and superior quality. Our cardamom is carefully handpicked, hygienically processed, and packed to retain its natural essence and purity. Available in bulk and retail quantities, it is perfect for households, retailers, wholesalers, and food businesses.\r\n\r\nWhy Choose Our Cardamom?\r\n✅ 100% natural, fresh, and premium quality\r\n✅ Rich aroma and intense flavor for culinary and medicinal uses\r\n✅ Ideal for teas, desserts, curries, and spice blends\r\n✅ Competitive pricing with bulk order options\r\n✅ Reliable and timely delivery with quality assurance\r\n\r\nWhether for home use, commercial cooking, or wholesale supply, we provide the finest cardamom at the best prices. Contact us today for orders and inquiries!', 150, 1000.00, '2025-03-26', '01:48:00', 'uploads/cardamom.jpg', '2025-03-25 18:55:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_username` (`user_username`);

--
-- Indexes for table `prac`
--
ALTER TABLE `prac`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `aadhar` (`aadhar`),
  ADD UNIQUE KEY `account_number` (`account_number`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `prac`
--
ALTER TABLE `prac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_username`) REFERENCES `prac` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
