-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 12, 2016 at 08:08 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `suchwow`
--

-- --------------------------------------------------------

--
-- Table structure for table `Club`
--

CREATE TABLE `Club` (
  `ClubID` int(11) NOT NULL,
  `Street` varchar(80) NOT NULL,
  `City` varchar(30) NOT NULL,
  `State` varchar(30) NOT NULL,
  `Zipcode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Club`
--

INSERT INTO `Club` (`ClubID`, `Street`, `City`, `State`, `Zipcode`) VALUES
(1, '439 Kiely Blvd', 'San Jose', 'CA', '95117'),
(2, '1365 Geneva Dr', 'Sunnyvale', 'CA', '94089'),
(3, '1191 W Montague Expy', 'Milpitas', 'CA', '95035'),
(4, '190 Constitution Dr', 'Menlo Park', 'CA', '94025'),
(5, '46049 Warm Springs Blvd', 'Fremont', 'CA', '94539'),
(6, '17 Hickory St', 'Palmyra', 'PA', '17078'),
(7, '317 Woodvale Ave', 'Johnstown', 'PA', '15901'),
(8, '340 Bill Banks Rd', 'Calhoun', 'LA', '71225'),
(9, 'Po Box 908', 'Buxton', 'NC', '27920'),
(10, '1468 Lakeview Ave', 'Dracut', 'MA', '01826'),
(11, '302 W 5th St', 'Clare', 'MI', '48617'),
(12, '603 W Park St', 'Sheldon', 'IA', '51201'),
(13, '15 W State Rd #16', 'Lucerne', 'IN', '46950'),
(14, '186 Twin Pine Dr', 'Jacksons Gap', 'AL', '36861'),
(15, '5304 W Summer Creek Pl', 'Sioux Falls', 'SD', '57106'),
(16, '1 Washington Square', 'San Jose', 'CA', '95112'),
(17, 'FunnyBones Street', 'Seattle', 'WA', '98972'),
(18, '560 5th Street', 'Miami', 'FL', '96572');

--
-- Triggers `Club`
--
DELIMITER $$
CREATE TRIGGER `insert_club` AFTER INSERT ON `Club` FOR EACH ROW BEGIN
    DECLARE ckey2 INT;
    DECLARE ckey1 INT;
    SELECT MAX(ClubKey) INTO @ckey2 from suchwow_analytical.Club;
    SELECT MAX(ClubID) INTO @ckey1 from suchwow.Club;
    INSERT INTO suchwow_analytical.Club(ClubKey,ClubID,Street,City,State,Zipcode) 
    SELECT ClubID,ClubID,Street,City,State,Zipcode from suchwow.Club where ClubID=(SELECT MAX(ClubID) from suchwow.Club);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Court`
--

CREATE TABLE `Court` (
  `CourtID` int(11) NOT NULL,
  `ClubID` int(11) NOT NULL,
  `FloorType` varchar(30) NOT NULL,
  `HourlyRate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Court`
--

INSERT INTO `Court` (`CourtID`, `ClubID`, `FloorType`, `HourlyRate`) VALUES
(1, 1, 'Matted', 20),
(1, 2, 'Matted', 25),
(1, 3, 'HardWood', 25),
(1, 4, 'HardWood', 20),
(1, 5, 'HardWood', 25),
(1, 6, 'HardWood', 25),
(1, 7, 'Concrete', 10),
(1, 8, 'Concrete', 20),
(1, 9, 'Concrete', 25),
(1, 10, 'Concrete', 10),
(1, 11, 'HardWood', 25),
(1, 12, 'Matted', 25),
(1, 13, 'HardWood', 25),
(1, 14, 'Matted', 20),
(1, 15, 'Concrete', 10),
(2, 1, 'Concrete', 25),
(2, 2, 'Concrete', 10),
(2, 3, 'Matted', 20),
(2, 4, 'Matted', 25),
(2, 5, 'HardWood', 25),
(2, 6, 'HardWood', 10),
(2, 7, 'Concrete', 10),
(2, 8, 'Matted', 20),
(2, 9, 'Concrete', 25),
(2, 10, 'Matted', 10),
(2, 11, 'Matted', 20),
(2, 12, 'HardWood', 10),
(2, 13, 'Concrete', 20),
(2, 14, 'Matted', 25),
(2, 15, 'Matted', 20),
(3, 1, 'Matted', 25),
(3, 2, 'HardWood', 25),
(3, 3, 'Matted', 20),
(3, 4, 'Concrete', 20),
(3, 5, 'HardWood', 10),
(3, 6, 'Matted', 25),
(3, 7, 'Concrete', 25),
(3, 8, 'Matted', 25),
(3, 9, 'Matted', 25),
(3, 10, 'Concrete', 10),
(3, 11, 'HardWood', 20),
(3, 12, 'Concrete', 20),
(3, 13, 'HardWood', 25),
(3, 14, 'HardWood', 10),
(3, 15, 'HardWood', 10),
(4, 1, 'Concrete', 25),
(4, 2, 'Matted', 20),
(4, 3, 'Concrete', 20),
(4, 4, 'HardWood', 10),
(4, 5, 'HardWood', 10),
(4, 6, 'Concrete', 25),
(4, 7, 'Concrete', 10),
(4, 8, 'Concrete', 20),
(4, 9, 'Matted', 20),
(4, 10, 'HardWood', 10),
(4, 11, 'Matted', 10),
(4, 12, 'Matted', 20),
(4, 13, 'Matted', 25),
(4, 14, 'Concrete', 20),
(4, 15, 'Matted', 20),
(5, 1, 'Matted', 25),
(5, 2, 'Concrete', 10),
(5, 3, 'Matted', 25),
(5, 4, 'Concrete', 10),
(5, 5, 'HardWood', 10),
(5, 6, 'HardWood', 25),
(5, 7, 'Concrete', 20),
(5, 8, 'Matted', 25),
(5, 9, 'Matted', 10),
(5, 10, 'Concrete', 20),
(5, 11, 'Concrete', 10),
(5, 12, 'Concrete', 25),
(5, 13, 'Concrete', 10),
(5, 14, 'Matted', 25),
(5, 15, 'Matted', 20),
(6, 1, 'Matted', 20),
(6, 2, 'Concrete', 20),
(6, 3, 'HardWood', 20),
(6, 4, 'HardWood', 10),
(6, 5, 'Matted', 25),
(6, 6, 'Matted', 20),
(6, 7, 'Matted', 10),
(6, 8, 'HardWood', 20),
(6, 9, 'Matted', 20),
(6, 10, 'Matted', 25),
(6, 11, 'HardWood', 25),
(6, 12, 'Matted', 10),
(6, 13, 'HardWood', 25),
(6, 14, 'Matted', 25),
(6, 15, 'Matted', 10),
(7, 1, 'Matted', 25),
(7, 2, 'Concrete', 25),
(7, 3, 'HardWood', 20),
(7, 4, 'Matted', 10),
(7, 5, 'Concrete', 20),
(7, 6, 'Matted', 25),
(7, 7, 'Concrete', 10),
(7, 8, 'HardWood', 10),
(7, 9, 'HardWood', 25),
(7, 10, 'HardWood', 20),
(7, 11, 'Matted', 25),
(7, 12, 'HardWood', 10),
(7, 13, 'Concrete', 10),
(7, 14, 'HardWood', 20),
(7, 15, 'HardWood', 25),
(8, 1, 'Matted', 20),
(8, 2, 'Matted', 20),
(8, 3, 'HardWood', 10),
(8, 4, 'HardWood', 25),
(8, 5, 'HardWood', 25),
(8, 6, 'HardWood', 25),
(8, 7, 'Matted', 20),
(8, 8, 'Matted', 25),
(8, 9, 'Concrete', 10),
(8, 10, 'Matted', 20),
(8, 11, 'Matted', 25),
(8, 12, 'HardWood', 25),
(8, 13, 'HardWood', 20),
(8, 14, 'Matted', 25),
(8, 15, 'Matted', 25),
(9, 1, 'Concrete', 25),
(9, 2, 'Concrete', 10),
(9, 3, 'HardWood', 25),
(9, 4, 'Concrete', 20),
(9, 5, 'HardWood', 25),
(9, 6, 'HardWood', 20),
(9, 7, 'Concrete', 10),
(9, 8, 'Concrete', 25),
(9, 9, 'Concrete', 20),
(9, 10, 'Matted', 10),
(9, 11, 'HardWood', 10),
(9, 12, 'Matted', 10),
(9, 13, 'Concrete', 10),
(9, 14, 'Matted', 10),
(9, 15, 'HardWood', 10),
(10, 1, 'HardWood', 20),
(10, 2, 'Concrete', 20),
(10, 3, 'HardWood', 10),
(10, 4, 'Matted', 20),
(10, 5, 'HardWood', 20),
(10, 6, 'Concrete', 20),
(10, 7, 'HardWood', 25),
(10, 8, 'Concrete', 10),
(10, 9, 'HardWood', 10),
(10, 10, 'Concrete', 25),
(10, 11, 'HardWood', 20),
(10, 12, 'HardWood', 20),
(10, 13, 'HardWood', 20),
(10, 14, 'Concrete', 20),
(10, 15, 'Matted', 25),
(11, 1, 'Matted', 20);

--
-- Triggers `Court`
--
DELIMITER $$
CREATE TRIGGER `insert_court` AFTER INSERT ON `Court` FOR EACH ROW BEGIN
    DECLARE ckey2 INT;
    SELECT MAX(CourtKey) INTO @ckey2 from suchwow_analytical.Court;
    INSERT INTO suchwow_analytical.Court(CourtKey,CourtID,FloorType,HourlyRate,ClubID,Street,City,State,Zipcode) 
    SELECT @ckey2+1,CourtID,FloorType,HourlyRate,c.ClubID,Street,City,State,Zipcode from suchwow.Court c,suchwow.Club cl where c.clubID=cl.ClubID and CourtID=new.CourtID and cl.ClubID=new.ClubID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `EmployeeID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Title` varchar(30) NOT NULL,
  `SSN` varchar(11) NOT NULL,
  `Street` varchar(80) NOT NULL,
  `City` varchar(30) NOT NULL,
  `State` varchar(30) NOT NULL,
  `ZipCode` varchar(10) NOT NULL,
  `ClubID` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`EmployeeID`, `Name`, `Title`, `SSN`, `Street`, `City`, `State`, `ZipCode`, `ClubID`, `Username`, `Password`) VALUES
(1, 'Royce', 'Boss', '234-32-2234', '3542 Pine Creek Dr.', 'San Jose', 'CA', '95132', 1, '', ''),
(2, 'Quinn', 'Boss', '234-32-5345', '101 E. San Fernando St', 'San Jose', 'CA', '98623', 2, '', ''),
(3, 'Lainey', 'Boss', '454-36-6443', '39639 Leslie St', 'Fremont', 'CA', '95438', 3, '', ''),
(4, 'Brandon', 'Boss', '443-23-6433', '30 E Santa Clara St', 'San Jose', 'CA', '97652', 4, '', ''),
(5, 'Gordon', 'Boss', '563-27-5987', '185 Park Ave', 'Milpitas', 'CA', '91228', 5, '', ''),
(6, 'Evan', 'Boss', '585-48-7932', '9707 Windsor Lane', 'Carol Stream', 'IL', '60188', 6, '', ''),
(7, 'Kaylynn', 'Boss', '504-04-2200', '632 Bohemia Lane', 'Goshen', 'IN', '46526', 7, '', ''),
(8, 'Elianna', 'Boss', '516-82-0814', '4 Penn St.', 'Hartsville', 'SC', '29550', 8, '', ''),
(9, 'Aracely', 'Boss', '263-61-0146', '162 Fairview Dr.', 'West Haven', 'CT', '6516', 9, '', ''),
(10, 'Harold', 'Boss', '520-78-3580', '8 W. Cottage St.', 'Cheshire', 'CT', '6410', 10, '', ''),
(11, 'Ezra', 'Boss', '082-88-1107', '196 Bellevue Ave.', 'Satellite Beach', 'FL', '32937', 11, '', ''),
(12, 'Sage', 'Boss', '509-74-4459', '17 SW. Vernon Lane', 'Muskegon', 'MI', '49441', 12, '', ''),
(13, 'Fabian', 'Boss', '458-84-4069', '138 Buckingham Court', 'Groton', 'CT', '6340', 13, '', ''),
(14, 'Odin', 'Boss', '224-42-7977', '8722 Clark Ave.', 'Lockport', 'NY', '14094', 14, '', ''),
(15, 'Kameron', 'Boss', '216-94-2805', '9596 Eagle St.', 'North Brunswick', 'NJ', '8902', 15, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `EmployeePhoneNumber`
--

CREATE TABLE `EmployeePhoneNumber` (
  `EmpID` int(11) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EmployeePhoneNumber`
--

INSERT INTO `EmployeePhoneNumber` (`EmpID`, `PhoneNumber`) VALUES
(10, '(107) 228-8145'),
(1, '(118) 127-7818'),
(12, '(134) 372-2196'),
(4, '(145) 578-1697'),
(5, '(152) 890-6065'),
(5, '(223) 107-9616'),
(1, '(226) 986-5257'),
(2, '(235)298-2760'),
(3, '(276)865-2864'),
(13, '(286) 357-3401'),
(5, '(287)229-8276'),
(7, '(320) 208-9630'),
(2, '(365) 217-6835'),
(9, '(401) 558-3432'),
(1, '(408)927-7452'),
(8, '(443) 324-3755'),
(1, '(510)282-7547'),
(8, '(538) 328-1976'),
(11, '(581) 131-1333'),
(15, '(586) 381-5787'),
(4, '(626) 414-9564'),
(3, '(627) 554-0114'),
(15, '(638) 344-3594'),
(13, '(640) 563-3170'),
(9, '(665) 384-2513'),
(6, '(668) 940-8351'),
(10, '(669) 317-4254'),
(14, '(676) 103-9378'),
(12, '(740) 377-2275'),
(5, '(761) 460-6821'),
(7, '(819) 309-1309'),
(11, '(821) 328-8064'),
(2, '(853) 700-0391'),
(14, '(897) 616-3433'),
(6, '(922) 682-3952'),
(4, '(927)286-3726'),
(15, '(951) 422-3892'),
(3, '(988) 448-9722');

-- --------------------------------------------------------

--
-- Table structure for table `Maintains`
--

CREATE TABLE `Maintains` (
  `ClubID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Maintains`
--

INSERT INTO `Maintains` (`ClubID`, `ProductID`, `Stock`) VALUES
(1, 1, 10),
(2, 1, 5),
(3, 1, 6),
(4, 1, 8),
(5, 1, 20),
(1, 2, 20),
(2, 2, 24),
(3, 2, 30),
(4, 2, 19),
(5, 2, 4),
(1, 3, 15),
(2, 3, 33),
(3, 4, 100),
(4, 5, 11),
(5, 6, 9),
(1, 7, 15),
(2, 8, 32),
(3, 9, 3),
(4, 10, 3),
(5, 10, 8);

-- --------------------------------------------------------

--
-- Table structure for table `Membership`
--

CREATE TABLE `Membership` (
  `MembershipType` varchar(30) NOT NULL,
  `QualifyingPoints` int(11) NOT NULL,
  `Discount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Membership`
--

INSERT INTO `Membership` (`MembershipType`, `QualifyingPoints`, `Discount`) VALUES
('Diamond', 5000, 20),
('Gold', 1000, 5),
('Platinum', 2000, 10);

-- --------------------------------------------------------

--
-- Table structure for table `Merchandise`
--

CREATE TABLE `Merchandise` (
  `ProductID` int(11) NOT NULL,
  `Brand` varchar(30) DEFAULT NULL,
  `Type` varchar(30) NOT NULL,
  `Price` double NOT NULL,
  `Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Merchandise`
--

INSERT INTO `Merchandise` (`ProductID`, `Brand`, `Type`, `Price`, `Name`) VALUES
(1, 'Yonex', 'Equipment', 200, 'Racket'),
(2, 'Yonex', 'Equipment', 18, 'Shuttlecock'),
(3, 'Blume', 'Drink', 20, 'Honey water'),
(4, 'Clif Bar', 'Food', 12, 'Energy Bar'),
(5, 'Cheer', 'Equipment', 10, 'Poms'),
(6, 'Cheerleading', 'Equipment', 5, 'Cardboard'),
(7, 'Nike', 'Sportswear', 50, 'Shoes'),
(8, 'Duece', 'Sportswear', 8, 'Wristband'),
(9, 'Duece', 'Sportswear', 28, 'Hats'),
(10, 'Fitbit', 'Sportswear', 18, 'FitnessBand'),
(11, 'Nike', 'Equipment', 10, 'Poms'),
(12, 'Yonex', 'Equipment', 40, 'Poms'),
(13, 'Blume', 'Equipment', 40, 'Racket'),
(14, 'CliffBar', 'Equipment', 20, 'Poms'),
(15, 'Blume', 'Equipment', 10, 'Cardboard'),
(16, 'Blume', 'Sportswear', 40, 'Hats'),
(17, 'Fitbit', 'Sportswear', 10, 'Fitnessband'),
(18, 'Prince', 'Sportswear', 20, 'Wristband'),
(19, 'Prince', 'Sportswear', 20, 'Shoes'),
(20, 'Fitbit', 'Sportswear', 40, 'Shoes'),
(21, 'Blume', 'Sportswear', 40, 'Fitnessband'),
(22, 'CliffBar', 'Sportswear', 10, 'Wristband'),
(23, 'CliffBar', 'Sportswear', 20, 'Shoes'),
(24, 'Wilson', 'Sportswear', 10, 'Hats'),
(25, 'Nike', 'Sportswear', 20, 'Shoes'),
(26, 'Blume', 'Drink', 5, 'EnergyBar'),
(27, 'Blume', 'Food', 3, 'Salad'),
(28, 'Blume', 'Food', 5, 'EnergyBar'),
(29, 'CliffBar', 'Drink', 3, 'EnergyBar'),
(30, 'CliffBar', 'Drink', 3, 'HoneyWater'),
(31, 'CliffBar', 'Food', 5, 'EnergyBar'),
(32, 'CliffBar', 'Food', 10, 'Salad'),
(33, 'CliffBar', 'Drink', 10, 'Salad'),
(34, 'CliffBar', 'Food', 10, 'HoneyWater'),
(35, 'Blume', 'Drink', 5, 'Salad'),
(36, 'Blume', 'Sportswear', 200, 'Wristband'),
(37, 'Blume', 'Sportswear', 50, 'Wristband'),
(38, 'Blume', 'Sportswear', 340, 'FitnessBand'),
(39, 'Babolat', 'Sportswear', 340, 'Hats'),
(40, 'CliffBar', 'Sportswear', 50, 'Shoes'),
(41, 'Prince', 'Sportswear', 340, 'Hats'),
(42, 'Nike', 'Sportswear', 340, 'FitnessBand'),
(43, 'Prince', 'Sportswear', 50, 'Shoes'),
(44, 'CliffBar', 'Sportswear', 200, 'Wristband'),
(45, 'Yonex', 'Sportswear', 200, 'Shoes'),
(46, 'CliffBar', 'Sportswear', 50, 'Shoes'),
(47, 'Blume', 'Sportswear', 200, 'Shoes'),
(48, 'Yonex', 'Sportswear', 340, 'FitnessBand'),
(49, 'Yonex', 'Sportswear', 340, 'Hats'),
(50, 'Blume', 'Sportswear', 50, 'FitnessBand'),
(51, 'Yonex', 'Sportswear', 30, 'Jersey');

--
-- Triggers `Merchandise`
--
DELIMITER $$
CREATE TRIGGER `insert_prod` AFTER INSERT ON `Merchandise` FOR EACH ROW BEGIN
    DECLARE ckey2 INT;
    SELECT MAX(ProductKey) INTO @ckey2 from suchwow_analytical.product;
    INSERT INTO suchwow_analytical.product(ProductKey,ProductID,Brand,Type,Price,Name) 
    SELECT @ckey2+1,ProductID,Brand,Type,Price,Name from suchwow.merchandise where ProductID=new.ProductID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Player`
--

CREATE TABLE `Player` (
  `PlayerID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Street` varchar(80) NOT NULL,
  `City` varchar(30) NOT NULL,
  `State` varchar(30) NOT NULL,
  `ZipCode` varchar(10) NOT NULL,
  `MembershipType` varchar(30) DEFAULT NULL,
  `Username` varchar(30) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Player`
--

INSERT INTO `Player` (`PlayerID`, `Name`, `Street`, `City`, `State`, `ZipCode`, `MembershipType`, `Username`, `Password`) VALUES
(1, 'Shannon', '8985 Southampton Dr.', 'Brunswick', 'GA', '31525', 'Gold', NULL, NULL),
(2, 'Jemima', '64 Gartner Drive', 'Phoenix', 'AZ', '85021', 'Platinum', 'je', '123'),
(3, 'Jared', '8709 Sulphur Springs Ave.', 'Douglasville', 'GA', '30134', 'Diamond', NULL, NULL),
(4, 'Alika', '7196 Fordham Street', 'Woodstock', 'GA', '30188', 'Gold', NULL, NULL),
(5, 'Robin', '8220 Hill Field Ave', 'Atwater', 'CA', '95301', NULL, NULL, NULL),
(6, 'Cailin', '17 South Wrangler Drive', 'Silver Spring', 'MD', '20901', 'Gold', NULL, NULL),
(7, 'Sophia', '34 Miller Lane', 'Morrisville', 'PA', '19067', 'Diamond', NULL, NULL),
(8, 'Edan', '86 East Sherwood Ave', 'Patchogue', 'NY', '11772', NULL, NULL, NULL),
(9, 'Julian', '173 San Carlos St.', 'Chelmsford', 'MA', '01824', NULL, NULL, NULL),
(10, 'Octavius', '861 Bishop Lane', 'Winter Park', 'FL', '32792', NULL, NULL, NULL),
(11, 'Audrey', '13 West Woodside St.', 'Warminster', 'PA', '18974', NULL, NULL, NULL),
(12, 'Estelle', '9952 Country St.', 'Hopewell', 'VA', '23860', NULL, NULL, NULL),
(13, 'Miguel', '9955 Myrtle Lane', 'Englewood', 'NJ', '07631', NULL, NULL, NULL),
(14, 'Marc', '3 Main Circle', 'North Augusta', 'SC', '29841', NULL, NULL, NULL),
(15, 'Tim', '367 High Noon St.', 'Mountain View', 'CA', '94043', NULL, NULL, NULL),
(16, 'Alvin', '749 Westport Drive', 'Fort Wayne', 'IN', '46804', NULL, NULL, NULL),
(17, 'Santos', '717 E. Devon St.', 'Reynoldsburg', 'OH', '43068', NULL, NULL, NULL),
(18, 'Darnell', '23 N. Shirley Lane', 'Pewaukee', 'WI', '53072', NULL, NULL, NULL),
(19, 'Wesley', '65 N. Squaw Creek St.', 'Pomona', 'CA', '91768', NULL, NULL, NULL),
(20, 'Angelina', '95 Lake View Ave.', 'Montclair', 'NJ', '07042', NULL, NULL, NULL),
(21, 'Eric', '186 Deerfield Road', 'Owosso', 'MI', '48867', NULL, NULL, NULL),
(22, 'Molly', '85 E. Union Ave.', 'Wooster', 'OH', '44691', NULL, NULL, NULL),
(23, 'Marvin', '7312 Kingston Ave.', 'Rockledge', 'FL', '32955', NULL, NULL, NULL),
(24, 'Deborah', '83 N. Bellevue St.', 'Port Jefferson Station', 'NY', '11776', NULL, NULL, NULL),
(25, 'Randall', '8379 Marvon Rd.', 'Sioux Falls', 'SD', '57103', NULL, NULL, NULL),
(26, 'Jason', '608 NW. Maiden Street', 'Howell', 'NJ', '07731', NULL, NULL, NULL),
(27, 'Tamara', '10 Harvey St.', 'West Springfield', 'MA', '01089', NULL, NULL, NULL),
(28, 'Tammy', '4 Thorne Street', 'Blackwood', 'NJ', '08012', NULL, NULL, NULL),
(29, 'Vera', '738 S. Marshall Avenue', 'Sykesville', 'MD', '21784', NULL, NULL, NULL),
(30, 'Homer', '8632 Academy Street', 'Elmhurst', 'NY', '11373', NULL, NULL, NULL),
(31, 'Terrell', '9462 West Lakeshore Drive', 'Kennewick', 'WA', '99337', NULL, NULL, NULL),
(32, 'Erika', '66 River Street', 'Hyattsville', 'MD', '20782', NULL, NULL, NULL),
(33, 'Neil', '9808 Beaver Ridge Ave.', 'Highland', 'IN', '46322', NULL, NULL, NULL),
(34, 'Gordon', '8939 Cottage Ave.', 'Gloucester', 'MA', '01930', NULL, NULL, NULL),
(35, 'Curtis', '86 Central Street', 'Ames', 'IA', '50010', NULL, NULL, NULL),
(36, 'Felix', '65 St Paul Lane', 'Fall River', 'MA', '02720', NULL, NULL, NULL),
(37, 'Opal', '164 S. St Paul Ave.', 'Severn', 'MD', '21144', NULL, NULL, NULL),
(38, 'Lowell', '447 Hill Field St.', 'Rossville', 'GA', '30741', NULL, NULL, NULL),
(39, 'Bradley', '18 Prairie Ave.', 'Garner', 'NC', '27529', NULL, NULL, NULL),
(40, 'Boyd', '8781 E. 4th Lane', 'Irvington', 'NJ', '07111', NULL, NULL, NULL),
(41, 'Stewart', '9855 Old Shadow Brook Lane', 'Auburn', 'NY', '13021', NULL, NULL, NULL),
(42, 'Cheryl', '8773 Bellevue Street', 'Thibodaux', 'LA', '70301', NULL, NULL, NULL),
(43, 'Gilberto', '7358 Honey Creek St.', 'Temple Hills', 'MD', '20748', NULL, NULL, NULL),
(44, 'Sarah', '873 Prince St.', 'Hicksville', 'NY', '11801', NULL, NULL, NULL),
(45, 'Domingo', '7618 Windfall St.', 'Rockville Centre', 'NY', '11570', NULL, NULL, NULL),
(46, 'Essie', '670 Front St.', 'Paducah', 'KY', '42001', NULL, NULL, NULL),
(47, 'Timothy', '9574 North East St.', 'Mount Juliet', 'TN', '37122', NULL, NULL, NULL),
(48, 'Rosemarie', '7508 Hillcrest St.', 'East Brunswick', 'NJ', '08816', NULL, NULL, NULL),
(49, 'Sheryl', '477 Trenton Road', 'Woodside', 'NY', '11377', NULL, NULL, NULL),
(50, 'Kathy', '15 State Ave.', 'Harlingen', 'TX', '78552', NULL, NULL, NULL),
(51, 'Muriel', '548 Ivy Drive', 'Deltona', 'FL', '32725', NULL, NULL, NULL),
(52, 'Vernon', '601 Hilltop Ave.', 'San Carlos', 'CA', '94070', NULL, NULL, NULL),
(53, 'Victor', '41 New Saddle St.', 'Monsey', 'NY', '10952', NULL, NULL, NULL),
(54, 'Diana', '23 Del Monte Dr.', 'Moses Lake', 'WA', '98837', NULL, NULL, NULL),
(55, 'Rufus', '234 8th Lane', 'Venice', 'FL', '34293', NULL, NULL, NULL),
(56, 'Lynn', '7421 S. Windsor Ave.', 'Asheboro', 'NC', '27205', NULL, NULL, NULL),
(57, 'Inez', '462 Sleepy Hollow Street Unit 4', 'Peabody', 'MA', '01960', NULL, NULL, NULL),
(58, 'Jeff', '7830 S. Orchard Ave.', 'Oak Park', 'MI', '48237', NULL, NULL, NULL),
(59, 'Gina', '300 Brickyard Road', 'Bradenton', 'FL', '34203', NULL, NULL, NULL),
(60, 'Seth', '41 S. Inverness Drive', 'Morganton', 'NC', '28655', NULL, NULL, NULL),
(61, 'Guillermo', '25 Sunnyslope Dr.', 'Edison', 'NJ', '08817', NULL, NULL, NULL),
(62, 'Randy', '848 Shipley Street', 'Queensbury', 'NY', '12804', NULL, NULL, NULL),
(63, 'Alma', '9249 Tunnel Ave.', 'Farmington', 'MI', '48331', NULL, NULL, NULL),
(64, 'Jessie', '57 Newcastle St.', 'Elizabeth City', 'NC', '27909', NULL, NULL, NULL),
(65, 'Ernest', '81 Mayflower Avenue', 'Vernon Rockville', 'CT', '06066', NULL, NULL, NULL),
(66, 'Wendell', '18 Fieldstone St.', 'Woodside', 'NY', '11377', NULL, NULL, NULL),
(67, 'Dixie', '60 West Arrowhead Street', 'Augusta', 'GA', '30906', NULL, NULL, NULL),
(68, 'Jeffery', '8654 Prospect Road', 'Saint Joseph', 'MI', '49085', NULL, NULL, NULL),
(69, 'Hector', '514 Old Hanover St.', 'Alabaster', 'AL', '35007', NULL, NULL, NULL),
(70, 'Jonathan', '8338 Sunnyslope Street', 'Kent', 'OH', '44240', NULL, NULL, NULL),
(71, 'Eileen', '54 E. Thatcher St.', 'Mechanicsville', 'VA', '23111', NULL, NULL, NULL),
(72, 'Toby', '286 Winchester Lane', 'Omaha', 'NE', '68107', NULL, NULL, NULL),
(73, 'Kelli', '30 Peg Shop St.', 'Boca Raton', 'FL', '33428', NULL, NULL, NULL),
(74, 'Nadine', '7589 Wentworth St.', 'Westland', 'MI', '48185', NULL, NULL, NULL),
(75, 'Jimmie', '28 Bellevue Dr.', 'Wilson', 'NC', '27893', NULL, NULL, NULL),
(76, 'Eddie', '9057 Indian Spring St.', 'Prattville', 'AL', '36067', NULL, NULL, NULL),
(77, 'Lionel', '93 John St.', 'Sulphur', 'LA', '70663', NULL, NULL, NULL),
(78, 'Bill', '8512 W. Heritage Street', 'Wappingers Falls', 'NY', '12590', NULL, NULL, NULL),
(79, 'Irma', '8832 Briarwood Dr.', 'Circle Pines', 'MN', '55014', NULL, NULL, NULL),
(80, 'Erik', '598 Bowman Street', 'Algonquin', 'IL', '60102', NULL, NULL, NULL),
(81, 'Miriam', '946 Sulphur Springs Lane', 'Syosset', 'NY', '11791', NULL, NULL, NULL),
(82, 'Betty', '7527 Galvin St.', 'Lexington', 'NC', '27292', NULL, NULL, NULL),
(83, 'Roman', '415 W. Kingston Ave.', 'Ashburn', 'VA', '20147', NULL, NULL, NULL),
(84, 'Rolando', '30 Holly St.', 'Matawan', 'NJ', '07747', NULL, NULL, NULL),
(85, 'Darin', '8 Riverview Road', 'Granger', 'IN', '46530', NULL, NULL, NULL),
(86, 'Joy', '9442 John Lane', 'Irwin', 'PA', '15642', NULL, NULL, NULL),
(87, 'Jimmy', '7 Bridgeton St.', 'North Andover', 'MA', '01845', NULL, NULL, NULL),
(88, 'Garry', '7204 Sierra Drive', 'Gloucester', 'MA', '01930', NULL, NULL, NULL),
(89, 'Dean', '7495 Princess Street', 'Macomb', 'MI', '48042', NULL, NULL, NULL),
(90, 'Kim', '484 Surrey St.', 'Faribault', 'MN', '55021', NULL, NULL, NULL),
(91, 'Fernando', '27 Lower River Street', 'Reidsville', 'NC', '27320', NULL, NULL, NULL),
(92, 'Lila', '866 Lookout Dr.', 'Hyattsville', 'MD', '20782', NULL, NULL, NULL),
(93, 'Lester', '721 South Hanover Street', 'Vista', 'CA', '92083', NULL, NULL, NULL),
(94, 'Gerard', '45 Roberts St.', 'Ridgewood', 'NJ', '07450', NULL, NULL, NULL),
(95, 'Marie', '4 North Beacon Lane', 'Groton', 'CT', '06340', NULL, NULL, NULL),
(96, 'Dora', '33 Newport Avenue', 'Avon', 'IN', '46123', NULL, NULL, NULL),
(97, 'Vivian', '7785 Henry Smith Dr.', 'Powhatan', 'VA', '23139', NULL, NULL, NULL),
(98, 'Cody', '518 Oak Ave.', 'Navarre', 'FL', '32566', NULL, NULL, NULL),
(99, 'Rudolph', '400 Holly Drive', 'Saint Louis', 'MO', '63109', NULL, NULL, NULL),
(100, 'Elmer', '9962 Cactus Ave.', 'Mokena', 'IL', '60448', NULL, NULL, NULL),
(101, 'Lisa', '571 Peninsula Ave.', 'New Lenox', 'IL', '60451', NULL, NULL, NULL),
(102, 'Dolores', '795 Jennings Drive', 'Camp Hill', 'PA', '17011', NULL, NULL, NULL),
(103, 'Geneva', '35 Young Street', 'Brooklyn', 'NY', '11201', NULL, NULL, NULL),
(104, 'Beth', '9820 Plymouth Lane', 'Romeoville', 'IL', '60446', NULL, NULL, NULL),
(105, 'Roosevelt', '11 E. Alton Rd.', 'West Orange', 'NJ', '07052', NULL, NULL, NULL),
(106, 'Arnold', '8507 Longfellow Court', 'Amsterdam', 'NY', '12010', NULL, NULL, NULL),
(107, 'Leonard', '21 Fairway Ave.', 'Lawrenceville', 'GA', '30043', NULL, NULL, NULL),
(108, 'Jeanette', '137 SW. Valley Farms St.', 'Brunswick', 'GA', '31525', NULL, NULL, NULL),
(109, 'Lyle', '997 Railroad St.', 'Medford', 'MA', '02155', NULL, NULL, NULL),
(110, 'Leticia', '8749 Golden Star St.', 'Kenosha', 'WI', '53140', NULL, NULL, NULL),
(111, 'Wilfred', '373 Rose St.', 'Sioux City', 'IA', '51106', NULL, NULL, NULL),
(112, 'Pam', '555 Johnson St.', 'Irwin', 'PA', '15642', NULL, NULL, NULL),
(113, 'Esther', '54 North St.', 'Lake Mary', 'FL', '32746', NULL, NULL, NULL),
(114, 'Mike', '380 Grant Lane', 'Piedmont', 'SC', '29673', NULL, NULL, NULL),
(115, 'Keith', '18 Lilac St.', 'New Philadelphia', 'OH', '44663', NULL, NULL, NULL),
(116, 'Kristina', '49 Canal Lane', 'Urbandale', 'IA', '50322', NULL, NULL, NULL),
(117, 'Matt', '733 East Green Hill Drive', 'Sicklerville', 'NJ', '08081', NULL, NULL, NULL),
(118, 'Lee', '898 College Court', 'Stevens Point', 'WI', '54481', NULL, NULL, NULL),
(119, 'Laura', '912 Wood Lane', 'West Islip', 'NY', '11795', NULL, NULL, NULL),
(120, 'Joseph', '81 Front Avenue', 'Burnsville', 'MN', '55337', NULL, NULL, NULL),
(121, 'Edwin', '9059 Pilgrim Street', 'Holland', 'MI', '49423', NULL, NULL, NULL),
(122, 'Shari', '66 W. Santa Clara St.', 'Greensburg', 'PA', '15601', NULL, NULL, NULL),
(123, 'Darin', '7055 Johnson Ave.', 'Pewaukee', 'WI', '53072', NULL, NULL, NULL),
(124, 'Leroy', '844 Howard Street', 'Banning', 'CA', '92220', NULL, NULL, NULL),
(125, 'Maxine', '13 Center St.', 'North Bergen', 'NJ', '07047', NULL, NULL, NULL),
(126, 'Theresa', '7097 Lakeshore Lane', 'The Villages', 'FL', '32162', NULL, NULL, NULL),
(127, 'George', '407 Prince Road', 'Phoenixville', 'PA', '19460', NULL, NULL, NULL),
(128, 'Robyn', '8 Linden St.', 'Chesterfield', 'VA', '23832', NULL, NULL, NULL),
(129, 'Tammy', '44 Division St.', 'Clarksburg', 'WV', '26301', NULL, NULL, NULL),
(130, 'Mattie', '35 Devon St.', 'Savannah', 'GA', '31404', NULL, NULL, NULL),
(131, 'Ernestine', '845 Bayberry St.', 'Battle Creek', 'MI', '49015', NULL, NULL, NULL),
(132, 'Nicholas', '529 Gonzales Drive', 'Lansing', 'MI', '48910', NULL, NULL, NULL),
(133, 'Jacqueline', '33 River Lane', 'West Springfield', 'MA', '01089', NULL, NULL, NULL),
(134, 'Dana', '7665 Cambridge St.', 'Desoto', 'TX', '75115', NULL, NULL, NULL),
(135, 'Darryl', '8968 Jones Dr.', 'Caldwell', 'NJ', '07006', NULL, NULL, NULL),
(136, 'Hazel', '9 Country Club Dr.', 'Easton', 'PA', '18042', NULL, NULL, NULL),
(137, 'Nina', '7904 Sierra Street', 'Plainfield', 'NJ', '07060', NULL, NULL, NULL),
(138, 'Melba', '979 NW. Hill Avenue', 'Manassas', 'VA', '20109', NULL, NULL, NULL),
(139, 'Beulah', '76 New Dr.', 'Pewaukee', 'WI', '53072', NULL, NULL, NULL),
(140, 'Tabitha', '580 Sutor Ave.', 'Providence', 'RI', '02904', NULL, NULL, NULL),
(141, 'Julio', '69 Colonial Avenue', 'Goose Creek', 'SC', '29445', NULL, NULL, NULL),
(142, 'Benny', '45 Brewery Lane', 'Union', 'NJ', '07083', NULL, NULL, NULL),
(143, 'Jessie', '7547 Greenview St.', 'Gloucester', 'MA', '01930', NULL, NULL, NULL),
(144, 'Shawna', '8317 King St.', 'Englewood', 'NJ', '07631', NULL, NULL, NULL),
(145, 'Shelia', '59 N. Garden Lane', 'Apex', 'NC', '27502', NULL, NULL, NULL),
(146, 'Amy', '8 Beacon Lane', 'Camp Hill', 'PA', '17011', NULL, NULL, NULL),
(147, 'Leslie', '456 Oak Meadow Rd.', 'Sheboygan', 'WI', '53081', NULL, NULL, NULL),
(148, 'Ella', '810 Marsh Ave.', 'Plainfield', 'NJ', '07060', NULL, NULL, NULL),
(149, 'Olive', '9650 Glenridge Street', 'Gallatin', 'TN', '37066', NULL, NULL, NULL),
(150, 'Holly', '41 Cottage Street', 'Burnsville', 'MN', '55337', NULL, NULL, NULL),
(151, 'Derrick', '7446 Chestnut St.', 'Massapequa', 'NY', '11758', NULL, NULL, NULL),
(152, 'Irvin', '29 Sierra St.', 'Grovetown', 'GA', '30813', NULL, NULL, NULL),
(153, 'Taylor', '9 Howard St.', 'Southampton', 'PA', '18966', NULL, NULL, NULL),
(154, 'Ruth', '41 Wood Street', 'Geneva', 'IL', '60134', NULL, NULL, NULL),
(155, 'Wilson', '915 Thatcher Ave.', 'New Britain', 'CT', '06051', NULL, NULL, NULL),
(156, 'Andrew', '8908 Vine Ave.', 'Pikesville', 'MD', '21208', NULL, NULL, NULL),
(157, 'Cristina', '9534 Prince Court', 'Glenside', 'PA', '19038', NULL, NULL, NULL),
(158, 'Joy', '539 SE. Elmwood Dr.', 'Liverpool', 'NY', '13090', NULL, NULL, NULL),
(159, 'Doyle', '99 Argyle Road', 'Livingston', 'NJ', '07039', NULL, NULL, NULL),
(160, 'Richard', '229 Old Homewood Rd.', 'Upper Darby', 'PA', '19082', NULL, NULL, NULL),
(161, 'Krista', '9 South Pleasant St.', 'Madisonville', 'KY', '42431', NULL, NULL, NULL),
(162, 'Kristy', '977 University Avenue', 'Wyoming', 'MI', '49509', NULL, NULL, NULL),
(163, 'Cary', '87 Galvin Dr.', 'North Attleboro', 'MA', '02760', NULL, NULL, NULL),
(164, 'Toni', '116 Fawn Street', 'Lemont', 'IL', '60439', NULL, NULL, NULL),
(165, 'April', '157 Poor House Dr.', 'Akron', 'OH', '44312', NULL, NULL, NULL),
(166, 'Bobby', '749 Richardson St.', 'Irmo', 'SC', '29063', NULL, NULL, NULL),
(167, 'Beth', '8517 Arnold Dr.', 'Allentown', 'PA', '18102', NULL, NULL, NULL),
(168, 'Della', '24 Cactus St.', 'North Attleboro', 'MA', '02760', NULL, NULL, NULL),
(169, 'Jay', '44 Tallwood Ave.', 'Owosso', 'MI', '48867', NULL, NULL, NULL),
(170, 'Elaine', '997 Brandywine Avenue', 'Monsey', 'NY', '10952', NULL, NULL, NULL),
(171, 'Whitney', '8513B Cypress Street', 'Endicott', 'NY', '13760', NULL, NULL, NULL),
(172, 'Cory', '585 E. Sierra Avenue', 'Palm Harbor', 'FL', '34683', NULL, NULL, NULL),
(173, 'Latoya', '483 E. Marshall Ave.', 'Hillsborough', 'NJ', '08844', NULL, NULL, NULL),
(174, 'Freddie', '7455 Gartner Road', 'Springfield Gardens', 'NY', '11413', NULL, NULL, NULL),
(175, 'Meghan', '9089 Jones Ave.', 'Cantonment', 'FL', '32533', NULL, NULL, NULL),
(176, 'Mae', '8489 S. Cherry Hill Drive', 'Norcross', 'GA', '30092', NULL, NULL, NULL),
(177, 'Doreen', '459 S. Sugar St.', 'Baltimore', 'MD', '21206', NULL, NULL, NULL),
(178, 'Janis', '458 Manhattan Rd.', 'Anoka', 'MN', '55303', NULL, NULL, NULL),
(179, 'Byron', '745 E. Theatre Drive', 'Lake Zurich', 'IL', '60047', NULL, NULL, NULL),
(180, 'Lillian', '647 Pineknoll Dr.', 'Southfield', 'MI', '48076', NULL, NULL, NULL),
(181, 'Ignacio', '9603 North St.', 'New City', 'NY', '10956', NULL, NULL, NULL),
(182, 'Ray', '8052 South Redwood Drive', 'Elkhart', 'IN', '46514', NULL, NULL, NULL),
(183, 'Brandi', '572 Brewery Lane', 'Laurel', 'MD', '20707', NULL, NULL, NULL),
(184, 'Faith', '4 Poor House Rd.', 'Freeport', 'NY', '11520', NULL, NULL, NULL),
(185, 'Rodney', '1 Van Dyke Ave.', 'Somerset', 'NJ', '08873', NULL, NULL, NULL),
(186, 'Terri', '7303 Circle Dr.', 'Mocksville', 'NC', '27028', NULL, NULL, NULL),
(187, 'Moses', '842 West Cactus Drive', 'Corona', 'NY', '11368', NULL, NULL, NULL),
(188, 'Jenna', '464 New Saddle St.', 'Yorktown', 'VA', '23693', NULL, NULL, NULL),
(189, 'Loren', '72 North Tallwood Dr.', 'Ballston Spa', 'NY', '12020', NULL, NULL, NULL),
(190, 'Cornelius', '7919 Bradford Rd.', 'Clemmons', 'NC', '27012', NULL, NULL, NULL),
(191, 'Clifford', '14 Blackburn St.', 'Scotch Plains', 'NJ', '07076', NULL, NULL, NULL),
(192, 'Lowell', '456 Annadale Street', 'Sylvania', 'OH', '43560', NULL, NULL, NULL),
(193, 'Jeanette', '7264 Lakewood Avenue', 'Helotes', 'TX', '78023', NULL, NULL, NULL),
(194, 'Cheryl', '552 North Woodland Dr.', 'Clifton Park', 'NY', '12065', NULL, NULL, NULL),
(195, 'Carla', '232 Woodside Dr.', 'Hudson', 'NH', '03051', NULL, NULL, NULL),
(196, 'Alejandro', '83 Clinton Drive', 'Davison', 'MI', '48423', NULL, NULL, NULL),
(197, 'Gabriel', '3 Middle River Drive', 'Norwich', 'CT', '06360', NULL, NULL, NULL),
(198, 'Dustin', '14 W. Fulton Road', 'Apple Valley', 'CA', '92307', NULL, NULL, NULL),
(199, 'Justin', '8576 Manhattan Rd.', 'Greenwood', 'SC', '29646', NULL, NULL, NULL),
(200, 'Juana', '7820 Lincoln Rd.', 'Lakeville', 'MN', '55044', NULL, NULL, NULL),
(201, 'Cody', '757 Swanson St.', 'Flushing', 'NY', '11354', NULL, NULL, NULL),
(202, 'Thelma', '886 Bridge Lane', 'Lindenhurst', 'NY', '11757', NULL, NULL, NULL),
(203, 'Bennie', '468 County St.', 'New Lenox', 'IL', '60451', NULL, NULL, NULL),
(204, 'Leona', '52 Brickell St.', 'West Bend', 'WI', '53095', NULL, NULL, NULL),
(205, 'Lora', '6 Corona Lane', 'Fitchburg', 'MA', '01420', NULL, NULL, NULL),
(206, 'Ian', '58 W. Country Street', 'Fresh Meadows', 'NY', '11365', NULL, NULL, NULL),
(207, 'Wallace', '3 Inverness Street', 'Plainview', 'NY', '11803', NULL, NULL, NULL),
(208, 'Jean', '672 W. Sleepy Hollow Ave.', 'Crofton', 'MD', '21114', NULL, NULL, NULL),
(209, 'Mabel', '839 Gates Lane', 'Sun Prairie', 'WI', '53590', NULL, NULL, NULL),
(210, 'Steve', '27 Amherst St.', 'Hopewell', 'VA', '23860', NULL, NULL, NULL),
(211, 'Erin', '614 St Louis Court', 'Hopewell Junction', 'NY', '12533', NULL, NULL, NULL),
(212, 'Alison', '65 East Glenlake Dr.', 'Amsterdam', 'NY', '12010', NULL, NULL, NULL),
(213, 'Candace', '8174 Squaw Creek Lane', 'Taylor', 'MI', '48180', NULL, NULL, NULL),
(214, 'Jaime', '294 Manchester Ave.', 'Summerville', 'SC', '29483', NULL, NULL, NULL),
(215, 'Gwen', '11 Evergreen Street', 'Rapid City', 'SD', '57701', NULL, NULL, NULL),
(216, 'Margaret', '9141 Cobblestone Dr.', 'Orlando', 'FL', '32806', NULL, NULL, NULL),
(217, 'Nicole', '744 Branch Drive', 'Orchard Park', 'NY', '14127', NULL, NULL, NULL),
(218, 'Felicia', '9709 South Linden Dr.', 'Camas', 'WA', '98607', NULL, NULL, NULL),
(219, 'Nettie', '433 East Proctor Dr.', 'Whitehall', 'PA', '18052', NULL, NULL, NULL),
(220, 'Sara', '254 Boston Dr.', 'Vernon Hills', 'IL', '60061', NULL, NULL, NULL),
(221, 'Jan', '73 E. Dogwood Ave.', 'Fort Lee', 'NJ', '07024', NULL, NULL, NULL),
(222, 'Owen', '9 Heritage Street', 'Bergenfield', 'NJ', '07621', NULL, NULL, NULL),
(223, 'Willard', '383 Virginia Lane', 'Ladson', 'SC', '29456', NULL, NULL, NULL),
(224, 'Tiffany', '122 Wellington St.', 'Fernandina Beach', 'FL', '32034', NULL, NULL, NULL),
(225, 'Vicky', '2 Columbia Ave.', 'Bayonne', 'NJ', '07002', NULL, NULL, NULL),
(226, 'Doreen', '12 Depot Dr.', 'Bangor', 'ME', '04401', NULL, NULL, NULL),
(227, 'Alejandro', '84 Lake Forest St.', 'Park Forest', 'IL', '60466', NULL, NULL, NULL),
(228, 'Pauline', '436 Cardinal St.', 'Elk Grove Village', 'IL', '60007', NULL, NULL, NULL),
(229, 'Maxine', '161 Johnson St.', 'Morgantown', 'WV', '26508', NULL, NULL, NULL),
(230, 'Pearl', '7576 Princess St.', 'Clearwater', 'FL', '33756', NULL, NULL, NULL),
(231, 'Gustavo', '8321 Spring Street', 'Fredericksburg', 'VA', '22405', NULL, NULL, NULL),
(232, 'Archie', '9532 North Galvin Street', 'Glen Cove', 'NY', '11542', NULL, NULL, NULL),
(233, 'Clint', '856 South Vermont Avenue', 'Chaska', 'MN', '55318', NULL, NULL, NULL),
(234, 'Roberta', '7977 West Theatre Lane', 'Downers Grove', 'IL', '60515', NULL, NULL, NULL),
(235, 'Brittany', '9752 Cactus St.', 'Tampa', 'FL', '33604', NULL, NULL, NULL),
(236, 'Eva', '70 St Paul Street', 'Athens', 'GA', '30605', NULL, NULL, NULL),
(237, 'Roosevelt', '715 Chestnut Street', 'Riverview', 'FL', '33569', NULL, NULL, NULL),
(238, 'Tamara', '8161 Santa Clara St.', 'Honolulu', 'HI', '96815', NULL, NULL, NULL),
(239, 'Josephine', '88 Fairground St.', 'Prattville', 'AL', '36067', NULL, NULL, NULL),
(240, 'Angelica', '550 South Magnolia Lane', 'Waltham', 'MA', '02453', NULL, NULL, NULL),
(241, 'Sheri', '878 NE. Central Ave.', 'South Plainfield', 'NJ', '07080', NULL, NULL, NULL),
(242, 'Ellis', '8889 Pennsylvania Drive', 'Raeford', 'NC', '28376', NULL, NULL, NULL),
(243, 'Stacey', '16 W. Devon Rd.', 'Palm Bay', 'FL', '32907', NULL, NULL, NULL),
(244, 'Bert', '9497 Kirkland St.', 'Lithonia', 'GA', '30038', NULL, NULL, NULL),
(245, 'Roger', '557 North Mill Lane', 'Waynesboro', 'PA', '17268', NULL, NULL, NULL),
(246, 'Tommie', '624 Mulberry Avenue', 'Michigan City', 'IN', '46360', NULL, NULL, NULL),
(247, 'Claude', '850 North Gates Street', 'Syosset', 'NY', '11791', NULL, NULL, NULL),
(248, 'Elbert', '812 Taylor St.', 'Winona', 'MN', '55987', NULL, NULL, NULL),
(249, 'Felipe', '132 Boston St.', 'Neenah', 'WI', '54956', NULL, NULL, NULL),
(250, 'Leslie', '9922 Olive St.', 'Miami Gardens', 'FL', '33056', NULL, NULL, NULL),
(251, 'Neal', '80 SW. Bayberry Road', 'Winston Salem', 'NC', '27103', NULL, NULL, NULL),
(252, 'Alton', '93 Primrose Circle', 'Prior Lake', 'MN', '55372', NULL, NULL, NULL),
(253, 'Cynthia', '9 Cross St.', 'Opa Locka', 'FL', '33054', NULL, NULL, NULL),
(254, 'Jill', '428 Miles Ave.', 'Chester', 'PA', '19013', NULL, NULL, NULL),
(255, 'April', '8956 Fulton St.', 'Rockaway', 'NJ', '07866', NULL, NULL, NULL),
(256, 'Amos', '566 Sleepy Hollow Ave.', 'Des Moines', 'IA', '50310', NULL, NULL, NULL),
(257, 'Debra', '38 Greystone Dr.', 'West Deptford', 'NJ', '08096', NULL, NULL, NULL),
(258, 'Ken', '7802 Carson Ave.', 'Victoria', 'TX', '77904', NULL, NULL, NULL),
(259, 'Lila', '89 Arcadia St.', 'Fond Du Lac', 'WI', '54935', NULL, NULL, NULL),
(260, 'Jessie', '642 Bow Ridge Ave.', 'Durham', 'NC', '27703', NULL, NULL, NULL),
(261, 'Dianne', '7734 Wayne Drive', 'Hattiesburg', 'MS', '39401', NULL, NULL, NULL),
(262, 'Jana', '47 Roehampton Circle', 'Hollis', 'NY', '11423', NULL, NULL, NULL),
(263, 'Gabriel', '9605 Princeton Street', 'Strongsville', 'OH', '44136', NULL, NULL, NULL),
(264, 'Irene', '25 Spring Street', 'Eastpointe', 'MI', '48021', NULL, NULL, NULL),
(265, 'Dawn', '7095 North Monroe Drive', 'Neenah', 'WI', '54956', NULL, NULL, NULL),
(266, 'Latoya', '7126 College Dr.', 'Neenah', 'WI', '54956', NULL, NULL, NULL),
(267, 'Silvia', '9812 Princess Dr.', 'Brandon', 'FL', '33510', NULL, NULL, NULL),
(268, 'Rachel', '9378 Mountainview Dr.', 'Shepherdsville', 'KY', '40165', NULL, NULL, NULL),
(269, 'Ryan', '9787 John St.', 'Los Angeles', 'CA', '90008', NULL, NULL, NULL),
(270, 'Estelle', '7908 North Temple Ave.', 'Bel Air', 'MD', '21014', NULL, NULL, NULL),
(271, 'Kristin', '74 Brandywine St.', 'Owensboro', 'KY', '42301', NULL, NULL, NULL),
(272, 'Lisa', '386 Selby Street', 'Emporia', 'KS', '66801', NULL, NULL, NULL),
(273, 'Preston', '1 Branch St.', 'Livingston', 'NJ', '07039', NULL, NULL, NULL),
(274, 'Shelly', '297 Park St.', 'Westfield', 'MA', '01085', NULL, NULL, NULL),
(275, 'Joseph', '33 Newport Ave.', 'Beloit', 'WI', '53511', NULL, NULL, NULL),
(276, 'Lynn', '16 Marsh St.', 'Banning', 'CA', '92220', NULL, NULL, NULL),
(277, 'Joanna', '46 Trusel Dr.', 'Summerfield', 'FL', '34491', NULL, NULL, NULL),
(278, 'Alma', '401 Pheasant Ave.', 'Gurnee', 'IL', '60031', NULL, NULL, NULL),
(279, 'Dora', '266 Snake Hill St.', 'Mundelein', 'IL', '60060', NULL, NULL, NULL),
(280, 'Casey', '2 Brickyard Rd.', 'Torrance', 'CA', '90505', NULL, NULL, NULL),
(281, 'Guadalupe', '122 Theatre St.', 'Norristown', 'PA', '19401', NULL, NULL, NULL),
(282, 'Dave', '9823 Edgefield Drive', 'Bolingbrook', 'IL', '60440', NULL, NULL, NULL),
(283, 'Abel', '162 Henry Drive', 'Calhoun', 'GA', '30701', NULL, NULL, NULL),
(284, 'Lynda', '97 Indian Summer St.', 'Monroe Township', 'NJ', '08831', NULL, NULL, NULL),
(285, 'Vanessa', '4 E. Amherst St.', 'Franklin Square', 'NY', '11010', NULL, NULL, NULL),
(286, 'Sylvia', '7531 Hilltop St.', 'Clarkston', 'MI', '48348', NULL, NULL, NULL),
(287, 'Jerry', '969 Valley Farms Drive', 'Ottumwa', 'IA', '52501', NULL, NULL, NULL),
(288, 'Anna', '839 West Jefferson St.', 'Noblesville', 'IN', '46060', NULL, NULL, NULL),
(289, 'Brandy', '7157 Heritage Drive', 'Portland', 'ME', '04103', NULL, NULL, NULL),
(290, 'Kelly', '945 Columbia Street', 'Loganville', 'GA', '30052', NULL, NULL, NULL),
(291, 'Christine', '8445 Henry Smith Drive', 'Chatsworth', 'GA', '30705', NULL, NULL, NULL),
(292, 'Everett', '582 West Oak Ave.', 'Muscatine', 'IA', '52761', NULL, NULL, NULL),
(293, 'Marjorie', '42 East Tower Drive', 'Desoto', 'TX', '75115', NULL, NULL, NULL),
(294, 'Frank', '7134 Wentworth Street', 'Springfield', 'PA', '19064', NULL, NULL, NULL),
(295, 'Kendra', '9746 Peg Shop Ave.', 'Piedmont', 'SC', '29673', NULL, NULL, NULL),
(296, 'Malcolm', '186 Fairfield Dr.', 'Winona', 'MN', '55987', NULL, NULL, NULL),
(297, 'Domingo', '336 Elmwood Ave.', 'Moorhead', 'MN', '56560', NULL, NULL, NULL),
(298, 'Antoinette', '883 Creek Street', 'Silver Spring', 'MD', '20901', NULL, NULL, NULL),
(299, 'Kim', '7417 Oak Valley Street', 'Rocky Mount', 'NC', '27804', NULL, NULL, NULL),
(300, 'Ron', '46 West Pineknoll St.', 'Apopka', 'FL', '32703', NULL, NULL, NULL),
(301, 'Caleb', '9156 West Harvard St.', 'San Jose', 'CA', '95127', NULL, NULL, NULL),
(302, 'Laura', '982 Old York Dr.', 'Waterford', 'MI', '48329', NULL, NULL, NULL),
(303, 'Boyd', '8643 Rosewood Street', 'Odenton', 'MD', '21113', NULL, NULL, NULL),
(304, 'Glenda', '7623 E. Lake View Street', 'Palm City', 'FL', '34990', NULL, NULL, NULL),
(305, 'Arthur', '17 Constitution Ave.', 'Holyoke', 'MA', '01040', NULL, NULL, NULL),
(306, 'Carroll', '811 Homestead St.', 'Prattville', 'AL', '36067', NULL, NULL, NULL),
(307, 'Jennifer', '9567 Elizabeth Dr.', 'West Warwick', 'RI', '02893', NULL, NULL, NULL),
(308, 'Bertha', '940 Catherine Lane', 'Glastonbury', 'CT', '06033', NULL, NULL, NULL),
(309, 'Norman', '695 West Williams Street', 'Orange Park', 'FL', '32065', NULL, NULL, NULL),
(310, 'Penny', '25 Edgefield Rd.', 'Ames', 'IA', '50010', NULL, NULL, NULL),
(311, 'aaa', 'aaa', 'aaa', 'AZ', '11111', NULL, 'aaa', 'aaa'),
(312, 'b', 'b', 'b', 'AL', '12345', NULL, 'b', 'b'),
(313, 'b', 'b', 'b', 'AL', '12456', NULL, 'b', 'b'),
(314, 'a', 'a', 'San Jose', 'AL', '95132', NULL, 'a', 'a'),
(315, 'a', 'a', 'a', 'AL', '12345', NULL, 'a', 'a'),
(316, 'a', 'a', 'a', 'AL', '123', NULL, 'a', 'a'),
(317, '1', '1', 's', 'AL', '124', NULL, 'a', 'q1'),
(318, 'Remie', '25 Avenue st.', 'Ames', 'IA', '50430', NULL, NULL, NULL);

--
-- Triggers `Player`
--
DELIMITER $$
CREATE TRIGGER `insert_play` AFTER INSERT ON `Player` FOR EACH ROW BEGIN
    DECLARE ckey2 INT;
    DECLARE ckey1 INT;
    SELECT MAX(PlayerKey) INTO @ckey2 from suchwow_analytical.player;
    SELECT MAX(PlayerID) INTO @ckey1 from suchwow.player;
    INSERT INTO suchwow_analytical.player(PlayerKey,PlayerID,PlayerName,State,City,Zipcode,Street,PlayerMembership) 
    SELECT PlayerID,PlayerID,Name,State,City,ZipCode,Street,MembershipType from suchwow.player where PlayerID=(SELECT MAX(PlayerID) from suchwow.player);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `PlayerPhoneNumber`
--

CREATE TABLE `PlayerPhoneNumber` (
  `PhoneNumber` varchar(15) NOT NULL,
  `PlayerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PlayerPhoneNumber`
--

INSERT INTO `PlayerPhoneNumber` (`PhoneNumber`, `PlayerID`) VALUES
('(100)101-8255', 106),
('(115)393-9037', 65),
('(138)417-3449', 241),
('(168)676-1604', 105),
('(186)174-1269', 57),
('(186)239-9879', 96),
('(186)721-3232', 305),
('(241)462-1751', 113),
('(245)705-3537', 213),
('(247)338-2754', 77),
('(254)413-4632', 8),
('(262)276-2660', 59),
('(263)881-5709', 129),
('(266)983-1241', 239),
('(286)471-5497', 297),
('(294)139-4641', 164),
('(317)407-5106', 239),
('(338)516-4569', 141),
('(344)739-7379', 67),
('(346)337-0288', 194),
('(347)546-3586', 93),
('(347)732-5259', 211),
('(348)404-4514', 184),
('(349)959-8232', 69),
('(360)538-6755', 227),
('(377)555-1598', 218),
('(383)483-5551', 282),
('(406)923-8976', 147),
('(408)791-6042', 180),
('(419)654-3751', 213),
('(428)904-5292', 256),
('(439)281-9876', 68),
('(444)858-3329', 136),
('(447)899-2189', 210),
('(466)357-6923', 212),
('(482)173-0464', 35),
('(504)625-0679', 182),
('(504)982-1787', 236),
('(515)740-0657', 257),
('(519)272-7601', 193),
('(535)171-2542', 210),
('(551)719-0496', 45),
('(552)328-4452', 218),
('(554)184-6843', 179),
('(560)166-2521', 223),
('(588)901-6034', 89),
('(594)160-7034', 205),
('(600)991-6741', 21),
('(602)904-3998', 62),
('(603)480-3810', 220),
('(623)142-3906', 55),
('(631)313-5782', 96),
('(635)679-5978', 57),
('(646)930-5021', 55),
('(655)924-1232', 6),
('(656)953-9423', 179),
('(663)540-5837', 26),
('(670)704-6364', 230),
('(674)235-6492', 172),
('(676)630-2333', 151),
('(676)930-0133', 225),
('(683)203-6403', 257),
('(684)309-6007', 33),
('(698)938-8442', 188),
('(704)371-0376', 253),
('(717)515-1575', 238),
('(722)793-0153', 274),
('(736)123-3674', 178),
('(736)184-6715', 78),
('(737)118-2250', 34),
('(739)171-0615', 74),
('(739)582-4006', 254),
('(747)195-7317', 215),
('(767)477-1933', 4),
('(768)611-4363', 74),
('(768)764-4047', 269),
('(770)907-1178', 140),
('(777)210-2476', 101),
('(786)405-6108', 173),
('(786)425-2108', 39),
('(787)214-2578', 232),
('(791)614-5279', 214),
('(793)487-2067', 27),
('(821)423-8676', 56),
('(822)728-8173', 204),
('(825)565-1749', 108),
('(838)132-6599', 198),
('(840)276-7790', 169),
('(841)616-1192', 307),
('(853)542-3501', 125),
('(859)867-6726', 251),
('(868)206-8185', 296),
('(883)600-0732', 53),
('(884)107-6134', 52),
('(887)470-0626', 241),
('(905)119-9795', 84),
('(905)835-3693', 113),
('(929)822-3986', 171),
('(931)284-5754', 223),
('(936)273-6812', 226),
('(946)369-5503', 120),
('(946)446-6563', 249),
('(947)183-1934', 191),
('(952)216-0704', 40),
('(955)321-0215', 134),
('(955)694-9540', 161),
('(958)724-8219', 133),
('(978)766-2634', 271),
('(979)466-0281', 13),
('(991)205-1270', 13);

-- --------------------------------------------------------

--
-- Table structure for table `PlaysAt`
--

CREATE TABLE `PlaysAt` (
  `CourtID` int(11) NOT NULL,
  `ClubID` int(11) NOT NULL,
  `PlayerID` int(11) NOT NULL,
  `BeginTime` datetime NOT NULL,
  `Duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PlaysAt`
--

INSERT INTO `PlaysAt` (`CourtID`, `ClubID`, `PlayerID`, `BeginTime`, `Duration`) VALUES
(10, 9, 48, '2011-08-01 22:42:33', 1),
(2, 12, 241, '1999-09-01 08:45:25', 2),
(10, 1, 141, '2006-04-15 05:44:35', 5),
(1, 8, 225, '2005-12-31 20:08:31', 5),
(4, 7, 2, '2005-02-25 07:22:44', 3),
(8, 9, 287, '1998-03-08 17:29:30', 5),
(1, 2, 96, '2006-03-26 09:54:36', 4),
(8, 2, 304, '2001-03-28 19:33:12', 2),
(9, 15, 34, '1999-05-18 06:02:31', 4),
(4, 9, 56, '2012-03-02 00:10:49', 2),
(6, 6, 177, '1999-03-27 05:02:09', 4),
(8, 9, 72, '2002-02-01 11:51:40', 3),
(5, 15, 87, '2010-10-20 07:16:40', 5),
(3, 5, 143, '2010-04-01 07:08:52', 1),
(9, 8, 131, '2003-07-20 02:03:30', 4),
(4, 7, 92, '2016-11-22 06:04:35', 3),
(10, 1, 170, '2002-03-07 04:26:42', 5),
(9, 11, 28, '2010-10-04 01:46:39', 4),
(4, 12, 88, '2005-01-05 11:39:51', 4),
(7, 15, 16, '2013-05-23 14:44:04', 2),
(1, 7, 194, '2008-09-02 19:58:15', 2),
(4, 8, 102, '2000-01-23 20:13:50', 5),
(9, 8, 285, '1999-06-29 09:33:08', 3),
(6, 12, 266, '2001-06-19 14:02:00', 3),
(2, 1, 221, '2001-06-03 18:22:47', 5),
(7, 1, 218, '2003-08-31 08:30:30', 3),
(8, 4, 89, '2004-12-14 15:03:35', 2),
(7, 3, 151, '2006-02-11 17:25:28', 2),
(5, 12, 102, '1997-04-28 23:59:07', 5),
(5, 8, 8, '2004-09-29 00:55:28', 3),
(8, 13, 106, '1998-08-12 11:38:52', 4),
(9, 1, 291, '2014-07-15 14:52:36', 1),
(5, 1, 105, '2002-09-02 03:10:15', 5),
(1, 10, 53, '2010-01-29 09:05:35', 1),
(4, 7, 81, '2003-06-27 11:13:16', 1),
(10, 9, 179, '2007-07-30 04:11:29', 3),
(6, 8, 146, '2001-06-25 21:52:06', 3),
(4, 13, 134, '2000-12-22 05:44:22', 5),
(2, 15, 40, '2012-11-02 06:40:41', 5),
(8, 1, 274, '2010-08-04 19:41:27', 2),
(2, 5, 102, '2004-07-19 22:18:44', 3),
(4, 4, 287, '2007-09-24 09:32:02', 1),
(8, 9, 38, '2013-03-28 05:45:19', 2),
(4, 9, 86, '2007-03-07 02:35:53', 5),
(3, 1, 298, '2008-04-08 19:22:05', 5),
(9, 3, 35, '1999-10-15 03:47:51', 5),
(5, 5, 243, '2012-05-08 09:26:22', 5),
(9, 8, 111, '2008-08-14 02:55:23', 1),
(6, 10, 167, '2015-09-05 12:43:42', 3),
(7, 2, 289, '2005-08-29 11:13:11', 5),
(7, 14, 38, '1997-01-30 06:53:57', 5),
(4, 8, 198, '2010-02-11 14:42:40', 2),
(5, 5, 304, '1999-05-19 03:15:56', 2),
(1, 8, 45, '2013-08-19 12:05:02', 2),
(8, 2, 215, '2012-07-26 06:05:01', 2),
(3, 6, 17, '2016-05-08 04:19:35', 3),
(3, 4, 111, '2015-01-30 11:44:13', 5),
(8, 8, 242, '2016-11-20 13:31:05', 3),
(5, 11, 142, '2009-03-06 08:17:33', 2),
(5, 10, 212, '2013-11-19 05:12:17', 1),
(3, 14, 214, '2014-03-02 11:17:10', 3),
(6, 14, 157, '2005-07-05 06:12:20', 2),
(4, 6, 274, '2016-07-17 13:24:21', 3),
(10, 13, 65, '2007-11-12 03:03:08', 1),
(5, 6, 233, '1999-12-10 16:22:38', 2),
(5, 9, 293, '2017-02-03 23:55:14', 2),
(5, 8, 69, '2012-10-02 13:52:03', 3),
(5, 2, 222, '1997-03-11 01:14:26', 5),
(9, 13, 236, '2016-06-07 16:21:30', 2),
(2, 14, 53, '2004-09-17 05:25:13', 1),
(7, 7, 114, '2010-01-11 00:13:40', 5),
(2, 14, 4, '2001-08-11 13:35:25', 4),
(2, 7, 256, '2017-10-11 15:15:04', 3),
(6, 10, 158, '2004-09-21 00:08:13', 5),
(8, 15, 118, '2015-05-17 03:14:03', 3),
(7, 5, 54, '2017-01-04 15:03:24', 3),
(8, 13, 69, '2012-12-18 21:21:51', 3),
(9, 4, 216, '2007-03-06 22:21:01', 2),
(10, 14, 104, '2010-08-22 17:51:12', 1),
(5, 15, 288, '2013-06-11 10:00:35', 1),
(4, 11, 93, '2008-06-25 04:55:40', 4),
(6, 6, 220, '1997-01-01 17:57:21', 5),
(9, 1, 293, '2001-06-30 15:41:08', 2),
(6, 4, 166, '2009-05-22 17:35:38', 2),
(2, 13, 296, '2006-11-02 01:45:52', 4),
(8, 9, 20, '2015-09-17 23:36:57', 1),
(5, 10, 33, '2007-01-11 15:12:00', 1),
(7, 3, 299, '2005-01-20 14:36:31', 2),
(8, 10, 216, '2006-01-30 23:50:14', 3),
(7, 14, 155, '2016-05-24 11:15:53', 4),
(3, 6, 12, '2011-09-25 18:05:02', 3),
(2, 4, 75, '2010-04-28 14:43:51', 1),
(3, 10, 238, '2017-02-11 13:20:54', 1),
(6, 10, 35, '2012-05-10 04:49:17', 3),
(1, 12, 66, '2011-06-12 15:59:34', 5),
(5, 12, 196, '2010-07-16 03:23:48', 3),
(8, 9, 142, '2007-01-03 00:07:25', 1),
(1, 2, 63, '2014-07-16 23:05:31', 1),
(6, 11, 285, '2007-01-01 01:08:35', 5),
(7, 1, 53, '2005-05-04 12:47:16', 3),
(2, 8, 144, '2017-01-17 14:46:31', 1),
(2, 3, 67, '2009-10-02 07:26:08', 2),
(4, 10, 106, '2004-11-27 17:06:02', 3),
(1, 6, 129, '2016-08-13 22:47:35', 1),
(5, 8, 75, '2014-05-04 13:21:52', 4),
(9, 8, 226, '2008-01-12 16:49:03', 1),
(4, 6, 123, '2016-06-28 13:31:21', 1),
(2, 1, 172, '2008-05-12 09:35:55', 4),
(3, 10, 143, '1999-10-28 08:33:00', 5),
(10, 8, 95, '2007-06-07 09:15:16', 3),
(1, 13, 300, '2000-10-08 00:20:53', 4),
(9, 6, 109, '2001-12-11 01:36:06', 1),
(7, 1, 67, '2015-08-02 22:50:18', 3),
(8, 3, 155, '2006-04-15 23:46:20', 1),
(7, 4, 246, '2016-09-13 23:14:57', 4),
(8, 5, 133, '1997-05-31 16:24:32', 1),
(8, 13, 66, '2016-07-01 15:45:54', 4),
(9, 7, 35, '2014-07-03 00:52:27', 2),
(5, 12, 206, '1998-03-24 23:30:49', 1),
(9, 12, 134, '2008-12-15 19:13:06', 3),
(1, 10, 175, '2004-09-05 01:20:39', 4),
(4, 11, 108, '2009-07-23 06:13:15', 3),
(5, 1, 215, '2017-04-26 19:25:57', 1),
(3, 13, 310, '2011-01-02 13:58:06', 4),
(3, 13, 258, '2011-01-25 02:42:19', 3),
(5, 12, 265, '1997-12-05 10:51:59', 4),
(6, 15, 226, '1997-05-06 15:33:43', 2),
(10, 10, 72, '2015-11-02 17:58:47', 4),
(9, 8, 193, '2010-02-24 02:51:33', 5),
(3, 6, 277, '2008-03-11 09:14:00', 5),
(2, 1, 245, '2013-12-17 07:18:06', 5),
(3, 10, 136, '2013-08-06 21:13:12', 5),
(2, 14, 6, '2012-06-02 19:10:19', 4),
(10, 3, 227, '2005-02-21 14:14:16', 5),
(10, 5, 151, '1996-11-28 04:42:16', 3),
(9, 7, 171, '2002-07-11 19:59:43', 3),
(1, 13, 204, '2017-01-24 12:40:52', 5),
(6, 5, 301, '2017-10-13 03:38:12', 5),
(5, 12, 199, '2014-03-31 06:48:39', 3),
(8, 13, 275, '2002-06-26 06:29:51', 2),
(3, 7, 237, '2002-04-09 19:06:44', 3),
(5, 3, 34, '2004-07-09 07:17:13', 1),
(10, 10, 307, '2008-06-26 14:05:51', 2),
(2, 13, 279, '2005-09-28 20:36:36', 2),
(4, 15, 172, '1999-07-09 05:07:13', 5),
(3, 8, 182, '2004-10-15 17:49:40', 3),
(3, 1, 2, '2000-07-26 11:36:50', 3),
(9, 12, 28, '1997-02-14 19:44:39', 4),
(1, 14, 133, '2016-07-12 16:57:29', 1),
(6, 11, 187, '2014-07-06 17:29:51', 4),
(8, 11, 257, '2016-05-25 11:18:07', 5),
(3, 3, 13, '2016-07-25 14:29:52', 5),
(9, 12, 273, '2010-12-26 09:34:17', 5),
(1, 7, 95, '2013-08-01 11:55:47', 2),
(1, 10, 212, '2003-09-29 23:01:35', 1),
(9, 7, 101, '2001-05-03 21:15:33', 5),
(2, 9, 58, '2008-11-10 23:42:54', 3),
(5, 11, 77, '2014-05-21 04:11:12', 2),
(8, 6, 163, '2010-02-04 10:12:36', 2),
(9, 3, 185, '2015-01-13 10:20:47', 3),
(6, 10, 129, '2012-10-02 12:11:22', 2),
(9, 5, 120, '2015-07-31 22:37:13', 1),
(7, 11, 302, '2007-06-01 13:25:57', 4),
(10, 6, 225, '2007-11-17 22:48:38', 1),
(9, 14, 24, '2010-04-05 08:20:04', 3),
(10, 11, 246, '2008-02-21 00:21:43', 5),
(5, 6, 213, '2012-09-08 02:32:15', 5),
(7, 14, 33, '1999-04-09 01:01:42', 5),
(1, 3, 38, '2010-06-04 02:33:45', 5),
(5, 4, 112, '2014-01-25 07:48:28', 3),
(4, 5, 283, '2008-05-30 04:05:37', 3),
(7, 12, 129, '2002-02-10 23:22:53', 5),
(8, 9, 47, '2014-11-20 22:03:22', 1),
(5, 5, 291, '2016-12-24 12:05:36', 3),
(8, 6, 94, '2005-03-18 09:33:57', 1),
(7, 10, 192, '2007-12-13 23:35:59', 4),
(5, 6, 83, '2001-12-25 00:56:17', 3),
(3, 3, 118, '2005-09-24 09:46:04', 1),
(5, 2, 230, '1996-11-23 22:07:51', 5),
(1, 2, 142, '2003-08-06 12:32:27', 5),
(2, 8, 17, '2004-10-28 09:31:33', 1),
(5, 4, 44, '2006-04-20 21:57:00', 4),
(8, 9, 234, '2005-10-21 21:59:14', 5),
(2, 1, 21, '2010-08-12 13:32:36', 5),
(6, 9, 202, '2002-07-13 15:32:09', 5),
(10, 7, 285, '2015-01-06 09:47:58', 4),
(2, 11, 225, '2001-07-19 23:14:44', 4),
(7, 5, 126, '2016-07-18 04:28:30', 4),
(7, 2, 261, '2005-01-29 02:52:08', 5),
(2, 9, 292, '2008-08-31 14:17:58', 2),
(6, 1, 106, '2013-04-06 16:47:59', 1),
(4, 13, 122, '2012-11-05 04:02:45', 4),
(6, 9, 233, '2006-03-14 22:59:09', 3),
(9, 4, 143, '2014-04-23 20:51:59', 3),
(6, 12, 157, '2006-01-17 12:57:58', 2),
(4, 2, 225, '2015-10-26 12:12:19', 2),
(9, 14, 219, '2004-02-12 22:24:41', 5),
(7, 1, 1, '2008-07-30 18:11:10', 2),
(6, 6, 60, '2003-02-06 01:19:50', 5),
(1, 8, 124, '2016-05-21 03:34:53', 5),
(9, 1, 44, '2016-04-26 01:06:28', 9),
(10, 12, 46, '2017-06-27 15:05:00', 1),
(7, 5, 185, '2017-09-26 18:25:56', 8),
(9, 14, 138, '2017-10-03 10:38:59', 1),
(8, 14, 11, '2015-11-22 17:35:27', 5),
(8, 8, 210, '2016-03-06 02:48:54', 9),
(8, 14, 257, '2017-08-07 06:15:50', 4),
(6, 10, 43, '2016-04-21 06:21:39', 4),
(2, 13, 28, '2016-04-20 21:46:36', 8),
(5, 15, 280, '2017-02-05 01:39:48', 3),
(4, 5, 126, '2017-04-08 21:56:15', 9),
(3, 11, 238, '2015-12-15 14:10:24', 8),
(5, 10, 121, '2017-10-09 17:51:21', 6),
(6, 13, 207, '2017-10-15 18:26:24', 5),
(1, 14, 74, '2016-01-26 23:30:30', 10),
(8, 12, 97, '2017-10-28 20:33:10', 7),
(4, 8, 225, '2017-09-28 17:07:06', 8),
(6, 9, 12, '2016-09-13 10:12:45', 6),
(9, 4, 149, '2016-11-05 02:34:29', 6),
(5, 3, 240, '2017-05-03 10:34:01', 6),
(8, 10, 128, '2016-12-17 02:55:40', 6),
(2, 1, 256, '2016-09-20 20:18:39', 5),
(2, 11, 17, '2017-01-26 00:35:14', 1),
(6, 1, 171, '2016-04-26 06:11:39', 5),
(2, 9, 245, '2017-04-02 09:21:14', 9),
(7, 2, 117, '2017-05-24 20:51:02', 10),
(3, 13, 268, '2017-02-11 14:14:07', 8),
(3, 11, 26, '2016-02-02 15:35:39', 1),
(3, 12, 79, '2015-12-20 23:46:13', 4),
(3, 4, 183, '2016-12-20 06:55:28', 5),
(9, 8, 254, '2016-10-25 00:42:57', 3),
(1, 9, 204, '2017-04-06 12:49:26', 1),
(6, 8, 63, '2017-08-08 00:31:27', 8),
(10, 1, 8, '2016-05-05 12:47:39', 1),
(6, 15, 34, '2016-09-04 10:43:06', 9),
(7, 2, 77, '2017-06-06 22:14:57', 7),
(7, 11, 147, '2017-09-03 15:31:07', 3),
(1, 11, 156, '2016-10-08 20:05:38', 1),
(3, 10, 193, '2017-09-24 01:53:07', 9),
(3, 3, 85, '2016-10-10 07:49:45', 5),
(8, 11, 116, '2016-06-22 02:27:42', 7),
(8, 1, 106, '2016-09-18 23:23:36', 8),
(8, 6, 250, '2017-01-26 21:35:26', 9),
(9, 11, 182, '2017-09-10 21:33:48', 4),
(9, 12, 210, '2017-01-24 07:57:40', 3),
(2, 14, 49, '2015-11-16 06:20:05', 1),
(5, 14, 24, '2016-04-28 09:57:20', 6),
(3, 13, 89, '2017-02-01 14:17:17', 10),
(9, 7, 282, '2016-06-12 10:06:49', 1),
(1, 5, 216, '2016-05-31 04:43:19', 10),
(8, 4, 230, '2016-12-13 00:43:48', 1),
(7, 9, 147, '2016-05-11 08:59:44', 4),
(4, 2, 151, '2016-07-05 13:44:20', 10),
(1, 5, 42, '2016-05-23 01:55:56', 8),
(7, 1, 200, '2016-06-01 02:10:12', 3),
(8, 8, 246, '2017-04-18 10:41:35', 1),
(1, 6, 75, '2017-02-23 17:24:41', 10),
(1, 1, 300, '2017-04-29 19:32:51', 7),
(4, 10, 132, '2016-07-29 01:21:33', 8),
(2, 12, 158, '2016-08-08 19:25:21', 1),
(8, 6, 26, '2016-09-07 22:29:12', 7),
(1, 12, 307, '2015-12-09 10:48:28', 8),
(5, 10, 254, '2015-11-06 20:22:54', 10),
(1, 1, 102, '2016-12-20 07:33:51', 2),
(2, 1, 175, '2017-05-22 05:25:30', 1),
(7, 15, 241, '2016-09-06 03:12:00', 8),
(4, 13, 42, '2017-01-31 06:48:12', 7),
(5, 7, 55, '2016-09-09 00:50:53', 9),
(9, 4, 64, '2016-10-19 11:59:49', 7),
(7, 9, 271, '2016-11-03 22:44:01', 8),
(8, 7, 257, '2015-12-25 17:54:27', 6),
(6, 3, 235, '2016-10-25 23:02:04', 10),
(4, 12, 300, '2017-06-16 01:21:05', 4),
(9, 14, 290, '2016-02-10 11:28:08', 3),
(6, 1, 5, '2016-09-10 07:05:12', 4),
(1, 14, 250, '2016-07-02 19:42:05', 7),
(8, 6, 238, '2017-04-05 23:41:39', 6),
(9, 3, 127, '2016-04-21 07:50:45', 10),
(5, 6, 147, '2016-08-02 17:43:24', 5),
(1, 5, 259, '2015-11-11 08:49:04', 5),
(8, 12, 161, '2016-05-12 20:10:13', 1),
(8, 3, 188, '2017-08-31 22:48:50', 8),
(10, 1, 168, '2017-02-26 04:13:23', 10),
(2, 13, 233, '2017-06-22 03:39:51', 3),
(10, 1, 54, '2015-12-13 18:26:30', 6),
(4, 15, 34, '2017-03-22 12:18:36', 2),
(5, 9, 292, '2016-05-14 19:44:38', 2),
(3, 14, 79, '2017-07-02 11:35:51', 7),
(10, 8, 228, '2017-06-24 20:46:36', 4),
(7, 15, 158, '2016-12-03 14:00:29', 3),
(5, 2, 226, '2016-05-11 18:02:58', 3),
(10, 9, 133, '2015-12-24 21:26:55', 7),
(2, 15, 300, '2017-07-25 02:45:27', 4),
(1, 1, 210, '2016-05-15 16:22:05', 1),
(4, 4, 229, '2017-03-11 03:27:01', 8),
(6, 14, 267, '2017-03-24 19:12:29', 5),
(7, 1, 83, '2017-09-19 00:02:06', 8),
(2, 15, 60, '2017-05-11 16:50:48', 1),
(8, 8, 55, '2017-09-07 20:03:27', 8),
(6, 10, 8, '2016-03-15 22:32:48', 3),
(11, 1, 34, '2016-12-01 10:15:39', 4);

--
-- Triggers `PlaysAt`
--
DELIMITER $$
CREATE TRIGGER `insert_calendar` AFTER INSERT ON `PlaysAt` FOR EACH ROW BEGIN
    DECLARE ckey INT;
    SELECT MAX(CalendarKey) INTO @ckey from suchwow_analytical.Calendar;
    INSERT INTO suchwow_analytical.Calendar(CalendarKey,FullDate,DayofWeek,DayofMonth,Month,Quarter,Year,TimeofDay) 
    SELECT @ckey+1,DATE(BeginTime),DayofWeek(BeginTime),DayofMonth(BeginTime),Month(BeginTime),Quarter(BeginTime),Year(BeginTime),TIME(BeginTime) from PlaysAt where ClubID=new.ClubID and CourtID=new.CourtID and PlayerID=new.PlayerID and BeginTime=new.BeginTime ;
    INSERT INTO suchwow_analytical.ActivityFact(CourtKey,PlayerKey,CalendarKey,Duration) SELECT CourtKey,PlayerKey,@ckey+1,Duration from suchwow.PlaysAt pl,suchwow_analytical.Court co,suchwow_analytical.Player p where pl.CourtID=co.CourtID and pl.ClubID=co.ClubID and p.PlayerID=pl.PlayerID and pl.PlayerID=new.PlayerID and pl.CourtID=new.CourtID and pl.BeginTime=new.BeginTime ;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Purchases`
--

CREATE TABLE `Purchases` (
  `PurchaseID` int(11) NOT NULL,
  `PlayerID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `ClubID` int(11) NOT NULL,
  `PurchaseTime` datetime NOT NULL,
  `PurchaseQuantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Purchases`
--

INSERT INTO `Purchases` (`PurchaseID`, `PlayerID`, `ProductID`, `ClubID`, `PurchaseTime`, `PurchaseQuantity`) VALUES
(1, 241, 47, 9, '1996-11-11 03:18:35', 4),
(2, 245, 19, 12, '1996-12-14 05:28:56', 5),
(3, 114, 13, 5, '1997-01-02 23:32:12', 6),
(4, 59, 32, 9, '1997-01-27 04:52:58', 1),
(5, 152, 47, 2, '1997-02-22 18:46:28', 10),
(6, 148, 22, 13, '1997-03-28 13:14:07', 1),
(7, 290, 9, 5, '1997-03-29 17:03:44', 3),
(8, 207, 9, 14, '1997-04-11 09:33:54', 1),
(9, 153, 36, 6, '1997-05-05 22:40:34', 9),
(10, 262, 50, 11, '1997-05-06 22:02:45', 2),
(11, 166, 26, 7, '1997-08-28 21:28:48', 1),
(12, 180, 29, 14, '1997-10-03 05:23:33', 1),
(13, 217, 14, 9, '1997-10-04 15:06:39', 2),
(14, 286, 40, 11, '1997-10-31 09:41:47', 1),
(15, 183, 11, 4, '1997-11-02 12:55:53', 9),
(16, 83, 28, 7, '1997-12-23 02:33:07', 8),
(17, 68, 42, 15, '1997-12-24 02:51:51', 1),
(18, 78, 48, 11, '1998-02-03 07:07:33', 2),
(19, 178, 27, 10, '1998-02-04 22:13:06', 1),
(20, 31, 47, 13, '1998-03-28 00:08:17', 6),
(21, 172, 25, 10, '1998-04-25 05:05:54', 7),
(22, 22, 27, 7, '1998-05-28 03:11:35', 2),
(23, 23, 48, 9, '1998-06-01 09:52:38', 9),
(24, 194, 50, 12, '1998-08-21 21:38:57', 3),
(25, 279, 30, 13, '1998-09-13 03:34:21', 4),
(26, 285, 31, 3, '1998-10-09 05:16:50', 8),
(27, 113, 29, 12, '1998-10-14 12:12:41', 6),
(28, 288, 2, 9, '1998-12-11 16:55:19', 7),
(29, 98, 45, 1, '1998-12-22 11:13:38', 9),
(30, 43, 42, 2, '1999-01-07 09:05:17', 1),
(31, 20, 34, 7, '1999-01-12 01:31:05', 6),
(32, 227, 31, 12, '1999-05-07 08:10:16', 7),
(33, 168, 38, 2, '1999-05-10 19:06:02', 5),
(34, 95, 27, 14, '1999-06-18 20:53:35', 8),
(35, 4, 15, 8, '1999-06-19 11:27:33', 6),
(36, 62, 30, 5, '1999-07-03 04:02:51', 5),
(37, 104, 17, 8, '1999-07-08 20:42:31', 3),
(38, 58, 5, 7, '1999-07-22 11:05:59', 9),
(39, 6, 20, 13, '1999-07-26 01:33:33', 10),
(40, 9, 15, 7, '1999-08-03 06:50:10', 3),
(41, 282, 7, 6, '1999-08-19 14:06:45', 7),
(42, 84, 39, 14, '1999-09-25 17:33:46', 1),
(43, 64, 11, 10, '1999-12-07 16:30:59', 1),
(44, 17, 4, 10, '1999-12-19 13:02:48', 1),
(45, 297, 19, 7, '1999-12-20 14:02:50', 3),
(46, 199, 26, 13, '1999-12-23 08:04:28', 4),
(47, 263, 32, 6, '2000-01-24 20:35:31', 8),
(48, 194, 42, 4, '2000-01-29 14:43:42', 3),
(49, 223, 8, 4, '2000-02-04 12:38:31', 6),
(50, 213, 7, 4, '2000-02-18 07:13:40', 10),
(51, 194, 11, 10, '2000-02-21 17:15:09', 8),
(52, 130, 27, 4, '2000-02-25 13:30:33', 3),
(53, 227, 9, 5, '2000-03-07 08:33:19', 5),
(54, 63, 19, 12, '2000-04-16 00:23:05', 4),
(55, 212, 2, 6, '2000-04-23 06:39:13', 4),
(56, 144, 11, 12, '2000-07-26 20:57:27', 6),
(57, 154, 9, 14, '2000-07-28 15:53:40', 3),
(58, 226, 4, 10, '2000-09-02 13:04:10', 4),
(59, 183, 33, 5, '2000-10-25 07:23:10', 2),
(60, 58, 42, 5, '2000-12-14 07:04:10', 7),
(61, 48, 34, 5, '2001-02-18 16:00:25', 1),
(62, 73, 26, 14, '2001-02-22 14:46:08', 8),
(63, 245, 33, 3, '2001-02-27 02:26:15', 2),
(64, 182, 48, 9, '2001-04-08 11:23:55', 7),
(65, 255, 43, 14, '2001-04-23 11:27:23', 8),
(66, 54, 14, 12, '2001-06-22 09:30:11', 10),
(67, 264, 20, 12, '2001-07-05 04:36:29', 8),
(68, 298, 4, 9, '2001-08-14 23:58:17', 4),
(69, 304, 7, 1, '2001-11-01 05:08:21', 4),
(70, 218, 21, 2, '2001-11-27 08:53:37', 5),
(71, 53, 33, 15, '2001-11-28 09:01:09', 9),
(72, 170, 14, 7, '2002-01-05 13:41:22', 3),
(73, 77, 15, 1, '2002-01-14 13:46:49', 9),
(74, 264, 7, 5, '2002-02-24 05:04:18', 7),
(75, 16, 32, 1, '2002-02-28 06:42:13', 4),
(76, 30, 28, 9, '2002-03-10 17:35:20', 1),
(77, 215, 7, 10, '2002-04-10 11:50:12', 1),
(78, 192, 28, 11, '2002-07-05 10:52:10', 3),
(79, 154, 44, 11, '2002-07-10 01:51:02', 10),
(80, 111, 30, 12, '2002-07-14 01:52:09', 8),
(81, 15, 29, 12, '2002-07-31 19:32:24', 3),
(82, 89, 38, 1, '2002-08-04 19:09:39', 10),
(83, 53, 1, 7, '2002-09-08 19:44:42', 2),
(84, 282, 41, 12, '2002-11-03 23:40:59', 8),
(85, 233, 50, 10, '2002-12-10 03:04:38', 3),
(86, 258, 7, 1, '2003-01-18 20:18:41', 9),
(87, 21, 2, 5, '2003-02-15 02:42:59', 10),
(88, 115, 35, 10, '2003-04-26 18:17:22', 8),
(89, 295, 37, 6, '2003-05-02 02:44:41', 9),
(90, 2, 20, 4, '2003-05-26 22:55:17', 9),
(91, 206, 7, 3, '2003-06-04 05:25:10', 8),
(92, 291, 12, 6, '2003-06-09 11:31:56', 10),
(93, 257, 45, 12, '2003-06-23 19:51:45', 10),
(94, 298, 14, 11, '2003-07-20 00:59:24', 10),
(95, 51, 28, 1, '2003-09-15 09:02:05', 1),
(96, 201, 19, 10, '2003-10-02 19:32:26', 7),
(97, 137, 10, 10, '2003-10-20 15:52:48', 8),
(98, 289, 27, 2, '2003-10-29 11:27:35', 8),
(99, 214, 2, 6, '2003-12-29 01:35:13', 9),
(100, 236, 36, 5, '2004-01-30 19:44:14', 2),
(101, 6, 16, 15, '2004-02-17 10:10:25', 8),
(102, 89, 33, 3, '2004-03-24 17:21:01', 6),
(103, 182, 17, 10, '2004-03-24 22:28:14', 8),
(104, 218, 11, 6, '2004-06-02 02:01:35', 6),
(105, 55, 20, 2, '2004-06-18 15:06:30', 9),
(106, 11, 24, 5, '2004-07-05 07:54:33', 9),
(107, 189, 40, 9, '2004-07-08 00:18:09', 1),
(108, 127, 37, 1, '2004-07-08 05:08:20', 1),
(109, 52, 47, 8, '2004-11-19 23:34:25', 8),
(110, 298, 39, 6, '2004-12-18 11:46:22', 10),
(111, 219, 4, 2, '2004-12-20 21:58:19', 9),
(112, 202, 16, 8, '2005-01-19 11:05:28', 8),
(113, 6, 5, 3, '2005-01-23 08:19:11', 4),
(114, 159, 24, 11, '2005-01-31 10:46:27', 9),
(115, 235, 11, 3, '2005-04-02 18:40:20', 6),
(116, 77, 31, 1, '2005-04-13 08:11:06', 8),
(117, 173, 15, 7, '2005-04-23 04:36:58', 6),
(118, 134, 40, 12, '2005-05-09 20:53:26', 3),
(119, 27, 24, 8, '2005-05-15 11:55:25', 9),
(120, 162, 14, 6, '2005-05-18 17:07:38', 1),
(121, 254, 30, 13, '2005-05-22 15:35:36', 4),
(122, 105, 41, 8, '2005-06-21 03:07:15', 6),
(123, 135, 36, 4, '2005-06-21 10:56:24', 6),
(124, 209, 26, 11, '2005-07-21 15:36:12', 10),
(125, 182, 18, 12, '2005-08-10 14:14:47', 4),
(126, 230, 15, 12, '2005-08-27 13:32:25', 8),
(127, 220, 49, 11, '2005-10-11 01:51:38', 7),
(128, 133, 37, 1, '2005-10-11 22:32:18', 2),
(129, 84, 8, 7, '2005-10-16 23:47:52', 3),
(130, 219, 23, 8, '2005-11-19 16:26:27', 7),
(131, 103, 5, 12, '2006-01-20 17:49:17', 3),
(132, 196, 24, 5, '2006-02-11 11:04:36', 7),
(133, 71, 13, 12, '2006-02-27 16:07:04', 3),
(134, 72, 47, 1, '2006-02-28 19:29:25', 9),
(135, 17, 2, 9, '2006-03-23 17:06:14', 6),
(136, 185, 45, 13, '2006-05-16 16:47:48', 7),
(137, 135, 14, 4, '2006-06-15 18:58:38', 10),
(138, 94, 21, 5, '2006-07-20 04:21:20', 4),
(139, 61, 1, 15, '2006-09-12 23:58:06', 4),
(140, 143, 48, 5, '2006-09-14 07:57:48', 2),
(141, 10, 30, 6, '2006-09-21 04:57:30', 3),
(142, 12, 47, 4, '2006-10-19 05:07:16', 4),
(143, 280, 15, 5, '2006-11-14 20:30:04', 8),
(144, 189, 27, 2, '2006-11-20 18:39:23', 6),
(145, 129, 12, 2, '2006-12-07 01:31:44', 1),
(146, 115, 20, 6, '2007-01-04 15:10:37', 4),
(147, 186, 38, 3, '2007-01-21 11:48:45', 8),
(148, 203, 24, 8, '2007-01-23 11:19:55', 7),
(149, 176, 21, 2, '2007-03-26 06:48:08', 6),
(150, 108, 43, 9, '2007-04-19 12:45:45', 8),
(151, 156, 10, 3, '2007-04-23 09:51:11', 4),
(152, 19, 11, 6, '2007-04-25 21:02:22', 2),
(153, 69, 23, 9, '2007-05-17 23:56:07', 2),
(154, 265, 33, 11, '2007-05-31 13:18:47', 3),
(155, 212, 13, 15, '2007-07-23 10:17:31', 9),
(156, 304, 50, 15, '2007-08-09 19:27:29', 8),
(157, 211, 40, 12, '2007-08-15 08:25:27', 3),
(158, 256, 8, 8, '2008-01-15 22:04:19', 1),
(159, 220, 10, 10, '2008-02-23 22:06:31', 1),
(160, 141, 41, 7, '2008-02-28 04:53:10', 7),
(161, 102, 34, 1, '2008-05-04 20:47:00', 2),
(162, 223, 33, 5, '2008-05-07 14:03:17', 9),
(163, 298, 46, 9, '2008-05-12 21:10:56', 7),
(164, 224, 29, 2, '2008-06-13 08:20:00', 5),
(165, 147, 3, 1, '2008-06-17 13:56:05', 10),
(166, 115, 32, 1, '2008-06-20 15:20:02', 6),
(167, 91, 45, 3, '2008-07-10 06:28:35', 9),
(168, 292, 15, 1, '2008-07-21 03:51:36', 8),
(169, 125, 41, 6, '2008-10-10 16:31:34', 8),
(170, 39, 24, 14, '2008-12-10 02:13:24', 9),
(171, 305, 7, 11, '2009-01-19 20:07:09', 8),
(172, 63, 5, 4, '2009-02-08 04:13:18', 7),
(173, 299, 29, 1, '2009-02-20 22:32:32', 1),
(174, 71, 12, 7, '2009-03-22 18:34:28', 4),
(175, 237, 13, 14, '2009-04-18 15:13:02', 4),
(176, 156, 23, 10, '2009-05-06 19:07:00', 2),
(177, 305, 27, 8, '2009-05-18 03:52:21', 2),
(178, 111, 8, 8, '2009-06-07 04:49:28', 10),
(179, 191, 40, 14, '2009-09-04 11:35:06', 8),
(180, 157, 13, 9, '2009-09-08 09:33:44', 5),
(181, 217, 4, 6, '2009-09-26 12:18:04', 5),
(182, 146, 50, 14, '2009-10-18 16:10:06', 3),
(183, 161, 7, 3, '2009-11-19 05:17:30', 10),
(184, 250, 4, 2, '2009-12-06 00:45:39', 6),
(185, 274, 6, 2, '2010-02-15 01:43:44', 9),
(186, 22, 49, 5, '2010-02-23 16:50:22', 9),
(187, 187, 21, 10, '2010-03-29 19:47:41', 8),
(188, 292, 3, 5, '2010-04-16 15:26:17', 2),
(189, 94, 13, 11, '2010-05-06 02:44:48', 7),
(190, 107, 19, 9, '2010-05-06 13:58:44', 2),
(191, 182, 20, 3, '2010-05-17 15:25:33', 8),
(192, 82, 15, 13, '2010-06-05 08:33:52', 5),
(193, 6, 35, 6, '2010-07-07 10:50:16', 6),
(194, 242, 22, 5, '2010-07-28 21:52:59', 8),
(195, 156, 20, 7, '2010-10-30 02:20:06', 2),
(196, 75, 15, 14, '2010-12-04 09:04:34', 2),
(197, 194, 8, 15, '2010-12-05 04:07:17', 1),
(198, 254, 46, 7, '2011-01-18 08:41:18', 6),
(199, 252, 2, 2, '2011-02-11 06:24:10', 7),
(200, 188, 33, 9, '2011-02-27 23:34:05', 10),
(201, 62, 46, 11, '2011-03-26 18:53:29', 4),
(202, 108, 29, 5, '2011-04-12 19:52:51', 1),
(203, 297, 16, 11, '2011-05-15 01:10:53', 3),
(204, 9, 31, 9, '2011-06-02 11:12:51', 3),
(205, 20, 38, 3, '2011-07-21 16:26:44', 9),
(206, 174, 33, 9, '2011-10-08 07:29:51', 5),
(207, 109, 23, 6, '2011-10-21 00:33:34', 4),
(208, 247, 46, 13, '2011-10-24 15:45:02', 10),
(209, 18, 23, 14, '2011-11-02 07:18:05', 8),
(210, 268, 39, 13, '2011-12-07 14:37:14', 8),
(211, 195, 13, 10, '2012-01-25 21:38:34', 9),
(212, 24, 5, 15, '2012-01-29 09:01:48', 3),
(213, 106, 36, 12, '2012-02-13 01:15:13', 3),
(214, 44, 14, 8, '2012-03-26 17:37:28', 6),
(215, 220, 43, 6, '2012-04-08 09:42:28', 2),
(216, 302, 18, 11, '2012-05-30 04:40:00', 2),
(217, 82, 18, 3, '2012-06-18 23:10:05', 10),
(218, 10, 36, 5, '2012-07-28 03:28:39', 7),
(219, 263, 7, 2, '2012-07-29 19:26:04', 5),
(220, 91, 12, 14, '2012-10-18 18:56:50', 2),
(221, 214, 42, 6, '2012-10-20 21:58:14', 10),
(222, 207, 26, 12, '2012-11-03 14:55:19', 2),
(223, 298, 25, 8, '2012-11-10 11:32:05', 9),
(224, 40, 45, 13, '2012-11-14 01:57:14', 8),
(225, 9, 36, 7, '2013-01-02 18:35:38', 2),
(226, 126, 24, 15, '2013-01-08 10:30:39', 1),
(227, 91, 14, 6, '2013-01-23 13:36:29', 6),
(228, 148, 36, 2, '2013-02-17 05:48:24', 9),
(229, 53, 12, 13, '2013-02-22 13:03:29', 1),
(230, 210, 35, 8, '2013-02-23 07:05:29', 6),
(231, 57, 19, 4, '2013-03-01 08:39:44', 7),
(232, 157, 10, 11, '2013-04-01 08:46:46', 9),
(233, 167, 44, 11, '2013-05-09 17:54:40', 1),
(234, 17, 37, 1, '2013-05-24 22:58:56', 7),
(235, 291, 46, 8, '2013-06-05 22:32:29', 5),
(236, 150, 44, 9, '2013-07-01 06:05:27', 2),
(237, 228, 43, 14, '2013-07-29 09:30:01', 5),
(238, 89, 20, 3, '2013-08-03 14:03:42', 3),
(239, 291, 25, 9, '2013-08-10 12:02:16', 3),
(240, 184, 17, 15, '2013-08-17 05:02:55', 3),
(241, 176, 28, 12, '2013-08-20 14:40:09', 7),
(242, 225, 36, 8, '2013-09-13 18:35:02', 5),
(243, 26, 48, 2, '2013-09-16 07:36:29', 5),
(244, 93, 26, 1, '2013-10-31 23:57:57', 3),
(245, 282, 42, 8, '2013-11-19 02:43:09', 7),
(246, 107, 31, 12, '2014-01-08 20:47:18', 9),
(247, 258, 45, 3, '2014-02-11 02:38:02', 4),
(248, 300, 19, 8, '2014-02-18 10:33:45', 8),
(249, 133, 32, 10, '2014-03-05 09:38:32', 2),
(250, 106, 11, 5, '2014-03-30 04:29:28', 10),
(251, 226, 37, 12, '2014-04-03 11:27:31', 4),
(252, 232, 28, 2, '2014-04-14 06:04:37', 2),
(253, 60, 29, 14, '2014-05-02 14:34:02', 1),
(254, 19, 27, 13, '2014-05-03 09:13:33', 1),
(255, 81, 15, 10, '2014-05-24 16:30:05', 10),
(256, 251, 21, 6, '2014-06-02 07:00:39', 2),
(257, 131, 34, 9, '2014-08-18 08:18:11', 5),
(258, 268, 41, 8, '2014-09-14 18:01:53', 1),
(259, 305, 45, 3, '2014-09-26 22:57:43', 7),
(260, 232, 1, 6, '2014-10-05 02:57:46', 5),
(261, 12, 21, 1, '2014-10-11 22:41:56', 8),
(262, 252, 25, 12, '2014-12-14 00:37:13', 10),
(263, 133, 42, 12, '2014-12-18 11:42:09', 2),
(264, 137, 2, 2, '2014-12-25 15:36:11', 10),
(265, 268, 40, 6, '2015-01-09 22:48:54', 3),
(266, 32, 44, 9, '2015-01-29 00:52:30', 8),
(267, 184, 37, 9, '2015-03-26 22:43:44', 1),
(268, 192, 21, 6, '2015-05-14 13:51:46', 2),
(269, 95, 1, 12, '2015-05-21 13:50:32', 1),
(270, 95, 43, 2, '2015-06-03 04:39:37', 9),
(271, 127, 10, 2, '2015-07-30 21:14:33', 6),
(272, 235, 20, 12, '2015-08-07 04:21:50', 3),
(273, 95, 12, 5, '2015-09-27 01:49:49', 7),
(274, 306, 40, 14, '2015-09-30 16:00:03', 5),
(275, 204, 23, 9, '2015-10-09 01:06:42', 5),
(276, 28, 33, 7, '2015-12-01 02:46:51', 4),
(277, 168, 31, 11, '2015-12-10 12:41:27', 10),
(278, 56, 29, 15, '2016-01-10 07:13:05', 10),
(279, 191, 31, 2, '2016-02-21 05:43:15', 3),
(280, 32, 16, 6, '2016-03-09 05:36:41', 8),
(281, 100, 33, 7, '2016-03-13 14:07:56', 5),
(282, 56, 44, 11, '2016-03-20 14:59:53', 6),
(283, 146, 6, 1, '2016-04-07 08:50:50', 4),
(284, 88, 29, 7, '2016-05-03 00:34:21', 1),
(285, 33, 43, 14, '2016-05-18 19:09:33', 3),
(286, 213, 17, 6, '2016-05-24 23:47:58', 3),
(287, 256, 27, 6, '2016-06-08 02:23:08', 7),
(288, 283, 13, 10, '2016-08-08 11:41:09', 10),
(289, 64, 7, 13, '2016-10-15 12:54:05', 7),
(290, 40, 31, 10, '2016-10-17 20:13:37', 2),
(291, 117, 50, 14, '2016-12-01 03:35:55', 1),
(292, 310, 49, 7, '2017-03-28 02:36:46', 4),
(293, 112, 27, 14, '2017-03-30 13:13:57', 10),
(294, 52, 17, 8, '2017-06-17 16:13:22', 1),
(295, 15, 17, 13, '2017-07-27 18:33:06', 5),
(296, 23, 28, 12, '2017-08-14 20:21:59', 5),
(297, 172, 16, 12, '2017-09-18 17:06:48', 4),
(298, 129, 11, 2, '2017-09-19 20:16:50', 7),
(299, 295, 42, 9, '2017-10-02 20:38:44', 8),
(300, 251, 17, 7, '2017-10-26 10:23:05', 7),
(301, 29, 6, 5, '2016-12-02 19:24:44', 5);

--
-- Triggers `Purchases`
--
DELIMITER $$
CREATE TRIGGER `insert_cal_sales` AFTER INSERT ON `Purchases` FOR EACH ROW BEGIN
    DECLARE ckey INT;
    SELECT MAX(CalendarKey) INTO @ckey from suchwow_analytical.Calendar;
    INSERT INTO suchwow_analytical.Calendar(CalendarKey,FullDate,DayofWeek,DayofMonth,Month,Quarter,Year,TimeofDay) 
    SELECT @ckey+1,DATE(PurchaseTime),DayofWeek(PurchaseTime),DayofMonth(PurchaseTime),Month(PurchaseTime),Quarter(PurchaseTime),Year(PurchaseTime),TIME(PurchaseTime) from Purchases where PurchaseID=new.PurchaseID;
    INSERT INTO suchwow_analytical.SalesFact(ProductKey,ClubKey,CalendarKey,PurchaseID,PurchaseQuantity,PlayerKey ) 
    SELECT ProductKey,ClubKey,@ckey+1,PurchaseID,PurchaseQuantity,PlayerKey from suchwow_analytical.Product pr,suchwow_analytical.Club c,suchwow_analytical.Player p,suchwow.Purchases pu where pu.ProductID=pr.ProductID and pu.ClubID=c.ClubID and pu.PlayerID=p.PlayerID and pu.PurchaseID=new.PurchaseID;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Club`
--
ALTER TABLE `Club`
  ADD PRIMARY KEY (`ClubID`);

--
-- Indexes for table `Court`
--
ALTER TABLE `Court`
  ADD PRIMARY KEY (`CourtID`,`ClubID`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD UNIQUE KEY `SSN` (`SSN`);

--
-- Indexes for table `EmployeePhoneNumber`
--
ALTER TABLE `EmployeePhoneNumber`
  ADD PRIMARY KEY (`PhoneNumber`);

--
-- Indexes for table `Membership`
--
ALTER TABLE `Membership`
  ADD PRIMARY KEY (`MembershipType`);

--
-- Indexes for table `Merchandise`
--
ALTER TABLE `Merchandise`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `Player`
--
ALTER TABLE `Player`
  ADD PRIMARY KEY (`PlayerID`);

--
-- Indexes for table `PlayerPhoneNumber`
--
ALTER TABLE `PlayerPhoneNumber`
  ADD PRIMARY KEY (`PhoneNumber`);

--
-- Indexes for table `Purchases`
--
ALTER TABLE `Purchases`
  ADD PRIMARY KEY (`PurchaseID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Player`
--
ALTER TABLE `Player`
  MODIFY `PlayerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=319;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
