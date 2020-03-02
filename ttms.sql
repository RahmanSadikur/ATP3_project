-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2020 at 11:33 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ttms`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `bookid` int(11) NOT NULL,
  `packageid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `feedback` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branchid` int(11) NOT NULL,
  `branchname` varchar(50) NOT NULL,
  `placeid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `custompackage`
--

CREATE TABLE `custompackage` (
  `userid` int(11) NOT NULL,
  `packageid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `hotelid` int(11) NOT NULL,
  `hotelname` varchar(50) NOT NULL,
  `hoteltype` varchar(50) NOT NULL,
  `roomtype` varchar(50) NOT NULL,
  `hotelphone` varchar(12) NOT NULL,
  `cost` double NOT NULL,
  `branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `imageid` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `packageid` int(11) NOT NULL,
  `packagename` varchar(150) NOT NULL,
  `branchid` int(11) NOT NULL,
  `hotelid` int(11) NOT NULL,
  `transportid` int(11) NOT NULL,
  `duration` varchar(50) NOT NULL,
  `totalcost` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE `place` (
  `placeid` int(11) NOT NULL,
  `placename` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transport`
--

CREATE TABLE `transport` (
  `transportid` int(11) NOT NULL,
  `transporttype` varchar(50) NOT NULL,
  `vehiclename` varchar(50) NOT NULL,
  `startpoint` varchar(50) NOT NULL,
  `endpoint` varchar(50) NOT NULL,
  `cost` double NOT NULL,
  `branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usercredential`
--

CREATE TABLE `usercredential` (
  `userid` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(150) NOT NULL,
  `usertypeid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `usertypeid` int(11) NOT NULL,
  `usertypename` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`bookid`),
  ADD KEY `fk_constraint7` (`packageid`),
  ADD KEY `fk_constraint8` (`userid`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branchid`),
  ADD KEY `fk_constraint1` (`placeid`);

--
-- Indexes for table `custompackage`
--
ALTER TABLE `custompackage`
  ADD KEY `fk_constraint10` (`userid`),
  ADD KEY `fk_constraint11` (`packageid`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hotelid`),
  ADD KEY `fk_constraint2` (`branchid`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`imageid`),
  ADD KEY `fk_constraint12` (`branchid`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`packageid`),
  ADD KEY `fk_constraint4` (`branchid`),
  ADD KEY `fk_constraint5` (`hotelid`),
  ADD KEY `fk_constraint6` (`transportid`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentid`);

--
-- Indexes for table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`placeid`);

--
-- Indexes for table `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`transportid`),
  ADD KEY `fk_constraint3` (`branchid`);

--
-- Indexes for table `usercredential`
--
ALTER TABLE `usercredential`
  ADD KEY `fk_constraint` (`userid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `fk_constraint9` (`usertypeid`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`usertypeid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `bookid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branchid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `hotelid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `imageid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `packageid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `place`
--
ALTER TABLE `place`
  MODIFY `placeid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport`
--
ALTER TABLE `transport`
  MODIFY `transportid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usertype`
--
ALTER TABLE `usertype`
  MODIFY `usertypeid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_constraint7` FOREIGN KEY (`packageid`) REFERENCES `package` (`packageid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_constraint8` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `fk_constraint1` FOREIGN KEY (`placeid`) REFERENCES `place` (`placeid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `custompackage`
--
ALTER TABLE `custompackage`
  ADD CONSTRAINT `fk_constraint10` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_constraint11` FOREIGN KEY (`packageid`) REFERENCES `package` (`packageid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `fk_constraint2` FOREIGN KEY (`branchid`) REFERENCES `branch` (`branchid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `fk_constraint12` FOREIGN KEY (`branchid`) REFERENCES `branch` (`branchid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `fk_constraint4` FOREIGN KEY (`branchid`) REFERENCES `branch` (`branchid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_constraint5` FOREIGN KEY (`hotelid`) REFERENCES `hotel` (`hotelid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_constraint6` FOREIGN KEY (`transportid`) REFERENCES `transport` (`transportid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transport`
--
ALTER TABLE `transport`
  ADD CONSTRAINT `fk_constraint3` FOREIGN KEY (`branchid`) REFERENCES `branch` (`branchid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usercredential`
--
ALTER TABLE `usercredential`
  ADD CONSTRAINT `fk_constraint` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_constraint9` FOREIGN KEY (`usertypeid`) REFERENCES `usertype` (`usertypeid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
