-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2020 at 06:39 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `absentdates`
--

CREATE TABLE `absentdates` (
  `courseid` varchar(30) NOT NULL,
  `studentrollno` varchar(30) NOT NULL,
  `absentdates` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `ID`) VALUES
('admin', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `courseid` varchar(30) NOT NULL,
  `srollno` varchar(30) NOT NULL,
  `noofhourspresent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `cname` varchar(30) NOT NULL,
  `cid` varchar(30) NOT NULL,
  `departmentid` int(11) NOT NULL,
  `facultyid` int(11) NOT NULL,
  `totalhourstaken` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`cname`, `cid`, `departmentid`, `facultyid`, `totalhourstaken`) VALUES
('DBMS', '1', 1, 0, 0),
('DSA', '2', 1, 0, 0),
('OS', '3', 1, 0, 0),
('DSA', 'CS1', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dname` varchar(30) NOT NULL,
  `did` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dname`, `did`) VALUES
('CSE', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `fname` varchar(30) NOT NULL,
  `fid` int(11) NOT NULL,
  `departmentid` int(11) NOT NULL,
  `fusername` varchar(30) NOT NULL,
  `fpassword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`fname`, `fid`, `departmentid`, `fusername`, `fpassword`) VALUES
('Abdul Nazeer', 3, 1, 'Nazeer', 'Nazeer');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `sname` varchar(30) NOT NULL,
  `departmentid` int(11) NOT NULL,
  `program` varchar(30) NOT NULL,
  `semester` int(11) NOT NULL,
  `srollno` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sname`, `departmentid`, `program`, `semester`, `srollno`) VALUES
('Tarun', 1, 'B-Tech', 7, 'B170594CS');

-- --------------------------------------------------------

--
-- Table structure for table `studentprofile`
--

CREATE TABLE `studentprofile` (
  `susername` varchar(30) NOT NULL,
  `spassword` varchar(30) NOT NULL,
  `sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `studentprofile`
--

INSERT INTO `studentprofile` (`susername`, `spassword`, `sid`) VALUES
('B170594CS', 'Tarun', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absentdates`
--
ALTER TABLE `absentdates`
  ADD PRIMARY KEY (`courseid`,`studentrollno`,`absentdates`),
  ADD KEY `absentdates_ibfk_2` (`studentrollno`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`courseid`,`srollno`),
  ADD KEY `attendance_ibfk_2` (`srollno`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `faculty_ibfk_1` (`departmentid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`srollno`),
  ADD KEY `student_ibfk_1` (`departmentid`);

--
-- Indexes for table `studentprofile`
--
ALTER TABLE `studentprofile`
  ADD PRIMARY KEY (`sid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `studentprofile`
--
ALTER TABLE `studentprofile`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absentdates`
--
ALTER TABLE `absentdates`
  ADD CONSTRAINT `absentdates_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`cid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `absentdates_ibfk_2` FOREIGN KEY (`studentrollno`) REFERENCES `student` (`srollno`) ON UPDATE CASCADE;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`cid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`srollno`) REFERENCES `student` (`srollno`) ON UPDATE CASCADE;

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`departmentid`) REFERENCES `department` (`did`) ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`departmentid`) REFERENCES `department` (`did`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
