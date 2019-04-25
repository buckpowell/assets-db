-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 25, 2019 at 05:13 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assets`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` tinyint(4) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `first_name` varchar(45) DEFAULT NULL,
  `mi` varchar(2) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `suffix` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `us_state` varchar(2) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(14) DEFAULT NULL,
  `ssn` varchar(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `auth_key` varchar(255) DEFAULT NULL,
  `status` varchar(3) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `t_created_at` BEFORE INSERT ON `user` FOR EACH ROW set new.created_at = NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `t_insertAccountData` AFTER INSERT ON `user` FOR EACH ROW BEGIN
INSERT INTO user_data (asset_id) VALUES (new.id);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `t_updated_at` BEFORE UPDATE ON `user` FOR EACH ROW set new.updated_at = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE `user_data` (
  `asset_id` int(11) NOT NULL,
  `entry_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `cash` float(10,0) DEFAULT '0',
  `certificates_of_deposit` float(10,2) DEFAULT '0.00',
  `life_insurance` float(10,0) DEFAULT '0',
  `securities` float(10,0) DEFAULT '0',
  `other_securities` float(10,0) DEFAULT '0',
  `accounts_receivable_good` float(10,0) DEFAULT '0',
  `assets_conv_to_cash` float(10,0) DEFAULT '0',
  `other_investments` float(10,2) DEFAULT '0.00',
  `total_current_assets` float(10,0) DEFAULT '0',
  `real_estate` float(10,0) DEFAULT '0',
  `mortgages_owned` float(10,0) DEFAULT '0',
  `accounts_receivable_doubt` float(10,0) DEFAULT '0',
  `notes_relatives_friends` float(10,0) DEFAULT '0',
  `other_securities_not_marketable` float(10,0) DEFAULT '0',
  `personal_property` float(10,0) DEFAULT '0',
  `other_assets` float(10,0) DEFAULT '0',
  `total_assets` float(10,0) DEFAULT '0',
  `notes_to_banks` float(10,0) DEFAULT '0',
  `notes_to_relatives` float(10,0) DEFAULT '0',
  `notes_to_others` float(10,0) DEFAULT '0',
  `accounts_payable` float(10,0) DEFAULT '0',
  `unpaid_income_tax` float(10,0) DEFAULT '0',
  `other_unpaid_tax` float(10,0) DEFAULT '0',
  `loans_on_life_insurance` float(10,0) DEFAULT '0',
  `contract_accounts_payable` float(10,0) DEFAULT '0',
  `cash_rent_owed` float(10,0) DEFAULT '0',
  `other_liabilities` float(10,0) DEFAULT '0',
  `total_current_liabilities` float(10,0) DEFAULT '0',
  `mortgage_payable` float(10,0) DEFAULT '0',
  `liens_payable` float(10,0) DEFAULT '0',
  `other_debts` float(10,0) DEFAULT '0',
  `total_liabilities` float(10,0) DEFAULT '0',
  `net_worth` float(10,0) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`asset_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
