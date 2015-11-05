-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2015 at 07:31 AM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nicepic`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `idad` int(11) NOT NULL,
  `username` varchar(33) NOT NULL,
  `password` varchar(22) NOT NULL,
  `role` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `idclass` int(11) NOT NULL,
  `idschool` int(11) NOT NULL,
  `idpic` int(11) NOT NULL,
  `nameclass` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `idorder` int(11) NOT NULL,
  `idtran` int(11) NOT NULL,
  `idpic` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `data` varchar(222) NOT NULL,
  `status` varchar(22) NOT NULL,
  `createdat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `photographer`
--

CREATE TABLE `photographer` (
  `idph` int(11) NOT NULL,
  `acount` varchar(33) NOT NULL,
  `password` varchar(33) NOT NULL,
  `phone` varchar(22) NOT NULL,
  `adress` varchar(111) NOT NULL,
  `email` varchar(44) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `picture`
--

CREATE TABLE `picture` (
  `idpic` int(11) NOT NULL,
  `idphoto` int(11) NOT NULL,
  `iptran` int(11) NOT NULL,
  `idclass` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `price` decimal(15,3) NOT NULL,
  `image` mediumblob NOT NULL,
  `imagelink` text NOT NULL,
  `view` int(11) NOT NULL,
  `createdat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `idschool` int(11) NOT NULL,
  `idlocal` int(11) NOT NULL,
  `nameschool` varchar(33) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(22) NOT NULL,
  `local` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `idtran` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idpic` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment` varchar(44) NOT NULL,
  `createdat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `acount` varchar(33) NOT NULL,
  `password` varchar(22) NOT NULL,
  `fullname` varchar(22) NOT NULL,
  `phone` varchar(22) NOT NULL,
  `email` varchar(44) NOT NULL,
  `address` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idad`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`idclass`),
  ADD KEY `idnursery` (`idschool`),
  ADD KEY `idpic` (`idpic`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`idorder`),
  ADD KEY `idtran` (`idtran`),
  ADD KEY `idpic` (`idpic`);

--
-- Indexes for table `photographer`
--
ALTER TABLE `photographer`
  ADD PRIMARY KEY (`idph`);

--
-- Indexes for table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`idpic`),
  ADD KEY `idphoto` (`idphoto`),
  ADD KEY `iptran` (`iptran`),
  ADD KEY `idclass` (`idclass`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`idschool`),
  ADD KEY `idlocal` (`idlocal`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`idtran`),
  ADD UNIQUE KEY `idpic_3` (`idpic`),
  ADD KEY `iduser` (`iduser`),
  ADD KEY `idpic` (`idpic`),
  ADD KEY `idpic_2` (`idpic`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`idschool`) REFERENCES `school` (`idschool`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`idtran`) REFERENCES `transaction` (`idtran`);

--
-- Constraints for table `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`idphoto`) REFERENCES `photographer` (`idph`),
  ADD CONSTRAINT `picture_ibfk_2` FOREIGN KEY (`idpic`) REFERENCES `transaction` (`idpic`),
  ADD CONSTRAINT `picture_ibfk_3` FOREIGN KEY (`idclass`) REFERENCES `class` (`idpic`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
