-- phpMyAdmin SQL Dump
-- version 2.11.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 28, 2008 at 03:41 PM
-- Server version: 5.0.24
-- PHP Version: 5.2.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `4rum`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `Id` int(10) NOT NULL auto_increment,
  `Username` varchar(255) collate latin1_general_ci default NULL,
  `Password` varchar(255) collate latin1_general_ci default NULL,
  `Status` int(2) default '1',
  `LastLogin` datetime default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Id`, `Username`, `Password`, `Status`, `LastLogin`) VALUES
(1, 'ninhgio', '202cb962ac59075b964b07152d234b70', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `advertising`
--

DROP TABLE IF EXISTS `advertising`;
CREATE TABLE IF NOT EXISTS `advertising` (
  `Id` int(10) NOT NULL auto_increment,
  `Name` varchar(255) collate latin1_general_ci default NULL,
  `Position` int(2) default '1',
  `Priority` int(5) default '0',
  `Type` int(1) default '1',
  `Status` int(1) default '1',
  `Link` varchar(255) collate latin1_general_ci default NULL,
  `File` varchar(255) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=FIXED AUTO_INCREMENT=19 ;

--
-- Dumping data for table `advertising`
--

INSERT INTO `advertising` (`Id`, `Name`, `Position`, `Priority`, `Type`, `Status`, `Link`, `File`) VALUES
(2, 'Mua nhanh bÃ¡n ráº»', 1, 1, 1, 1, 'http://www.99k.com.vn', '2.jpg'),
(1, 'Khai chÆ°Æ¡ng', 4, 1, 2, 1, 'http://www.qtmgroup.com.vn', '1.swf'),
(3, 'Banner', 3, 1, 1, 1, 'http://Banner', '3.gif'),
(4, 'BÃªn pháº£i', 2, 1, 1, 1, 'http://right', '4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `Id` int(10) NOT NULL auto_increment,
  `Name` varchar(255) collate latin1_general_ci default NULL,
  `Position` int(10) default NULL,
  `Status` int(2) default '1',
  `ListPropertyId` varchar(255) collate latin1_general_ci default NULL,
  `RootId` int(10) default '0',
  `HotCategory` int(2) default '0',
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=73 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Id`, `Name`, `Position`, `Status`, `ListPropertyId`, `RootId`, `HotCategory`) VALUES
(1, 'VÄƒn phÃ²ng pháº©m', 4, 1, '', 0, 0),
(2, 'Äá»“ dÃ¹ng nhÃ  báº¿p', 7, 1, '3,4,5,6,', 0, 0),
(3, 'Äá»“ dÃ¹ng cho tráº»', 5, 1, '', 0, 0),
(4, 'BÃ¡nh káº¹o & Ä‘á»“ uá»‘ng', 3, 1, '', 0, 0),
(5, 'LÆ°Æ¡ng thá»±c & thá»±c pháº©m', 2, 1, '', 0, 1),
(6, 'Bá»™t giáº·t vÃ  dáº§u gá»™i Ä‘áº§u', 1, 1, '2,4,', 6, 0),
(7, 'Má»¹ pháº©m vÃ  dá»¥ng cá»¥', 6, 1, '4,6,', 0, 1),
(8, 'Sáº£n pháº©m chÄƒm sÃ³c cÃ¡ nhÃ¢n', 9, 1, '', 0, 0),
(9, 'Vá»Ÿ táº­p', 1, 1, '3,', 1, 0),
(10, 'CÃ¡c loáº¡i giáº¥y', 2, 1, '', 1, 0),
(11, 'Phong bÃ¬ & giáº¥y viáº¿t thÆ°', 3, 1, '', 1, 0),
(12, 'Compa & dá»¥ng cá»¥ ghim', 4, 1, '', 1, 0),
(13, 'Dao kÃ©o & thÆ°á»›c', 5, 1, '', 1, 0),
(14, 'BÃºt chÃ¬ & dá»¥ng cá»¥ gá»t', 6, 1, '', 1, 0),
(15, 'BÃºt bi & viáº¿t nÆ°á»›c', 7, 1, '', 1, 0),
(16, 'BÃºt lÃ´ng & bÃºt dáº¡', 8, 1, '', 1, 0),
(17, 'BÄƒng keo & gÃ´m', 9, 1, '', 1, 0),
(18, 'BÃ¬nh á»§ sá»¯a', 1, 1, '1,4,', 3, 0),
(19, 'BÃ¬nh sá»¯a vÃ  nÃºm vÃº', 2, 1, '1,4,', 3, 0),
(20, 'KhÄƒn Æ°á»›t vÃ  táº¥m lÃ³t', 3, 1, '3,5,', 3, 0),
(21, 'Thá»±c pháº©m dinh dÆ°á»¡ng', 4, 1, '', 3, 0),
(22, 'Bá»‰m vÃ  tÃ£ lÃ³t', 5, 1, '1,', 3, 0),
(23, 'Quáº§n Ã¡o', 6, 1, '3,', 3, 0),
(24, 'BÃºp bÃª', 7, 1, '3,', 3, 0),
(25, 'Xe giá»¯ bÃ©', 8, 1, '3,', 3, 0),
(26, 'Xe mini cho bÃ©', 9, 1, '3,', 3, 0),
(27, 'Äá»“ chÆ¡i cÆ¡ há»c', 10, 1, '', 3, 0),
(28, 'Äá»“ uá»‘ng cho tráº»', 11, 1, '2,4,', 3, 0),
(29, 'BÃ n cháº£i tráº» em', 12, 1, '', 3, 0),
(30, 'Äá»“ Ä‘i chÆ¡i', 13, 1, '', 3, 0),
(31, 'Äá»“ dÃ¹ng cho máº¹', 14, 1, '', 3, 0),
(32, 'Sá»¯a bá»™t', 2, 1, '2,', 4, 0),
(33, 'BÃ¡nh', 1, 1, '6,', 4, 0),
(34, 'Káº¹o', 3, 1, '', 4, 0),
(35, 'NÆ°á»›c giáº£i khÃ¡t', 4, 1, '4,6,', 4, 0),
(36, 'NÆ°á»›c trÃ¡i cÃ¢y', 5, 1, '4,6,', 4, 0),
(37, 'NÆ°á»›c tinh khiáº¿t', 6, 1, '4,', 4, 0),
(38, 'Cafe', 7, 1, '2,6,', 4, 0),
(39, 'RÆ°á»£u', 8, 1, '4,', 4, 0),
(40, 'Bia', 9, 1, '4,6,', 4, 0),
(41, 'TrÃ ', 10, 1, '2,6,', 4, 0),
(42, 'Thá»±c pháº©m Ä‘Ã³ng há»™p', 1, 1, '1,2,9,', 5, 0),
(43, 'Thá»±c pháº©m Ä‘Ã´ng láº¡nh', 2, 1, '2,', 5, 0),
(44, 'Thá»©c pháº©m sáº¥y khÃ´', 3, 1, '2,6,', 5, 0),
(45, 'ChÃ¡o vÃ  mÃ¬ Äƒn liá»n', 4, 1, '7,', 5, 0),
(46, 'Gáº¡o', 5, 1, '19,', 5, 0),
(47, 'ÄÆ°á»ng', 6, 1, '19,', 5, 0),
(48, 'NÆ°á»›c máº¯m', 7, 1, '4,', 5, 0),
(49, 'Gia vá»‹', 8, 1, '2,6,', 5, 0),
(50, 'NÆ°á»›c tÆ°Æ¡ng', 9, 1, '4,', 5, 0),
(51, 'Dáº§u Äƒn', 10, 1, '20,', 5, 0),
(52, 'Sá»¯a tÆ°Æ¡i', 11, 1, '1,4,', 4, 0),
(53, 'Sá»¯a tiá»‡t trÃ¹ng', 12, 1, '1,4,', 4, 0),
(54, 'XÃ  phÃ²ng vÃ  dáº§u gá»™i Ä‘áº§u', 10, 1, '', 0, 1),
(55, 'XÃ  phÃ²ng giáº·t', 1, 1, '7,19,', 54, 0),
(56, 'XÃ  bÃ´ng', 2, 1, '14,', 54, 0),
(57, 'Dáº§u gá»™i Ä‘áº§u', 3, 1, '4,5,', 54, 0),
(58, 'Sá»¯a rá»­a máº·t', 1, 1, '4,13,', 7, 0),
(59, 'Kem dÆ°á»¡ng da', 2, 1, '2,9,', 7, 0),
(60, 'Sá»¯a táº¯m', 3, 1, '4,5,', 7, 0),
(61, 'Dáº§u xáº£', 4, 1, '4,5,', 54, 0),
(62, 'Gel vuá»‘t tÃ³c', 5, 1, '4,5,', 54, 0),
(63, 'Thuá»‘c nhuá»™m tÃ³c', 6, 1, '', 54, 0),
(64, 'BÄƒng vá»‡ sinh', 1, 1, '', 8, 0),
(65, 'Giáº¥y', 2, 1, '', 8, 0),
(66, 'Hoa quáº£ sáº¥y khÃ´', 13, 1, '2,', 4, 0),
(67, 'Háº¡t sáº¥y khÃ´', 14, 1, '2,', 4, 0),
(68, 'Tháº¡ch', 15, 1, '', 4, 0),
(69, 'Bá»™t ngÅ© cá»‘c', 16, 1, '', 4, 0),
(72, 'TÄƒm bÃ´ng', 3, 1, '', 8, 0),
(70, 'Sá»¯a Ä‘áº·c', 17, 1, '2,', 4, 0),
(71, 'NÆ°á»›c rá»­a chÃ©n', 1, 1, '4,', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
CREATE TABLE IF NOT EXISTS `currency` (
  `Id` int(10) NOT NULL auto_increment,
  `Name` varchar(255) collate latin1_general_ci default NULL,
  `Info` text collate latin1_general_ci,
  `Status` int(2) default '1',
  `Position` int(10) default NULL,
  `Rate` varchar(255) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`Id`, `Name`, `Info`, `Status`, `Position`, `Rate`) VALUES
(1, 'USD', 'USD', 1, 1, '16520'),
(2, 'VNÄ', '', 1, 2, '1');

-- --------------------------------------------------------

--
-- Table structure for table `intro`
--

DROP TABLE IF EXISTS `intro`;
CREATE TABLE IF NOT EXISTS `intro` (
  `Id` int(10) NOT NULL auto_increment,
  `Detail` text collate latin1_general_ci,
  `PageName` varchar(255) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `intro`
--

INSERT INTO `intro` (`Id`, `Detail`, `PageName`) VALUES
(1, '<font size="5" face="Tahoma" color="#ff6600">Update Information<br />\r\n</font>', 'intro'),
(2, '<font size="7" face="Tahoma" color="#ff0000">service service<br />\r\n<img align="middle" src="http://www.360flower.net/images/upload/Image/new_year.gif" alt="" /><br />\r\n</font><img alt="" src="file:///C:/Documents%20and%20Settings/Luong%20bn/Desktop/tat%20ca/New%20Folder/4.jpg" /><img alt="" src="file:///C:/Documents%20and%20Settings/Luong%20bn/Desktop/tat%20ca/New%20Folder/new_year.gif" />', 'service');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE IF NOT EXISTS `manufacturer` (
  `Id` int(10) NOT NULL auto_increment,
  `Name` varchar(255) collate latin1_general_ci default NULL,
  `Telephone` varchar(255) collate latin1_general_ci default NULL,
  `Mobile` varchar(255) collate latin1_general_ci default NULL,
  `Fax` varchar(255) collate latin1_general_ci default NULL,
  `Email` varchar(255) collate latin1_general_ci default NULL,
  `Website` varchar(255) collate latin1_general_ci default NULL,
  `Address` varchar(255) collate latin1_general_ci default NULL,
  `Image` varchar(255) collate latin1_general_ci default NULL,
  `Info` varchar(255) collate latin1_general_ci default NULL,
  `Position` int(10) default NULL,
  `Status` int(10) default '1',
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`Id`, `Name`, `Telephone`, `Mobile`, `Fax`, `Email`, `Website`, `Address`, `Image`, `Info`, `Position`, `Status`) VALUES
(2, 'Nokia', '', '', '', '', '', '', NULL, '', 5, 1),
(1, 'Viet sun', '', '', '', '', '', '', NULL, '', 4, 1),
(3, 'LGvina', '', '', '', '', '', '', NULL, '', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `Id` int(10) NOT NULL auto_increment,
  `Username` varchar(255) character set latin1 collate latin1_general_ci default NULL,
  `Password` varchar(255) character set latin1 collate latin1_general_ci default NULL,
  `Fullname` varchar(255) character set latin1 collate latin1_general_ci default NULL,
  `BirthDate` date default NULL,
  `JoinDate` date default NULL,
  `Email` varchar(255) character set latin1 collate latin1_general_ci default NULL,
  `Telephone` varchar(255) character set latin1 collate latin1_general_ci default NULL,
  `Mobile` varchar(255) character set latin1 collate latin1_general_ci default NULL,
  `Address` varchar(255) character set latin1 collate latin1_general_ci default NULL,
  `RootId` int(10) default '0',
  `Status` int(2) default '1',
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=30 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`Id`, `Username`, `Password`, `Fullname`, `BirthDate`, `JoinDate`, `Email`, `Telephone`, `Mobile`, `Address`, `RootId`, `Status`) VALUES
(1, 'ninhgio', '202cb962ac59075b964b07152d234b70', 'Nguyá»…n HoÃ ng Ninh', '1984-10-27', '2008-01-09', 'ninhgio@yahoo.com', '8439510', '0903234638', '11a ngÃƒÂµ 46 Ã„ÂÃ¡Â»â„¢i CÃ¡ÂºÂ¥n - Ba Ã„ÂÃƒÂ¬nh - HÃƒÂ  NÃ¡Â»â„¢i', 0, 1),
(2, 'minh', '202cb962ac59075b964b07152d234b70', 'Nguyá»…n Há»“ng Minh', '1981-11-24', '2008-01-09', 'ng.minh81@yahoo.com', '123', '0904799711', 'Kim LiÃƒÂªn', 1, 1),
(3, 'nguyentrunghieu', '81dc9bdb52d04dc20036dbd8313ed055', 'NguyÃ¡Â»â€¦n Trung HiÃ¡ÂºÂ¿u', '1984-06-06', '2008-01-09', 'hoangtucoi84@yahoo.com', '', '', 'TriÃ¡Â»Âu KhÃƒÂºc', 1, 1),
(4, 'thacson', '202cb962ac59075b964b07152d234b70', 'NguyÃ¡Â»â€¦n ThÃƒÂ¡c SÃ†Â¡n', NULL, '2008-01-09', '', '', '', 'Ã„ÂÃ†Â°Ã¡Â»Âng LÃƒÂ¡ng', 1, 1),
(5, 'hong', '202cb962ac59075b964b07152d234b70', 'NguyÃ¡Â»â€¦n MÃ¡ÂºÂ¡nh HÃ¡Â»â€œng', NULL, '2008-01-09', '', '', '', 'Ã„ÂÃ†Â°Ã¡Â»Âng LÃƒÂ¡ng', 2, 1),
(6, 'sang', '202cb962ac59075b964b07152d234b70', 'DÃ†Â° Minh  SÃƒÂ¡ng', NULL, '2008-01-09', '', '', '', 'Ã„ÂÃ†Â°Ã¡Â»Âng LÃƒÂ¡ng', 2, 1),
(10, '1234534234213', 'd9b1d7db4cd6e70935368a1efb10e377', '1234534234213', '1900-01-01', '2008-01-19', 'ninhgio@yahoo.com', '123', '123', '1234534234213', 0, 1),
(7, '123456789', 'd9b1d7db4cd6e70935368a1efb10e377', '123', '1900-01-01', '2008-01-19', 'ninhgio@yahoo.com', '123', '123', '123', 0, 1),
(8, '123456789000', 'd9b1d7db4cd6e70935368a1efb10e377', '123213', '1900-01-01', '2008-01-19', 'ninhgio@yahoo.com', '123', '123', '123123', 0, 1),
(9, '12312321445435', 'd9b1d7db4cd6e70935368a1efb10e377', '12312', '1900-01-01', '2008-01-19', 'ninhgio@yahoo.com', '123', '123', '123123', 0, 1),
(11, 'phamngocha', '14e1b600b1fd579f47433b88e8d85291', 'Pháº¡m Ngá»c HÃ ', '1977-01-10', '2008-01-30', 'luquy1980@yahoo.com', '047567142', '0988425456', 'ngÃµ 15', 1, 1),
(12, 'ngocha', '14e1b600b1fd579f47433b88e8d85291', 'Ã daffaf', '1900-01-01', '2008-01-30', 'luquy1980@yahoo.com', '8360480', '047567142', 'Ã dfsafsaf', 2, 1),
(13, 'donchim', '14e1b600b1fd579f47433b88e8d85291', 'Chim', '1983-09-24', '2008-01-30', 'tangthehung83@gmail.com', '042002234', '0985505225', 'QTM', 0, 1),
(14, 'chim', '14e1b600b1fd579f47433b88e8d85291', 'hÆ°ng', '1900-01-01', '2008-01-31', 'sfdfs@yahoo.com', '2002234', '0985505225', 'Äá»‹nh CÃ´ng', 0, 1),
(15, 'abc', '202cb962ac59075b964b07152d234b70', 'giÃ²', '1987-01-30', '2008-02-13', 'ninhgio@yahoo.com', '12345678', '0903234638', 'Äá»™i Cáº¥n', 0, 1),
(16, 'thang', '202cb962ac59075b964b07152d234b70', 'Pháº¡m Äá»©c Thang', '1985-01-22', '2008-02-24', 'thang@yahoo.com', '12345', '12345', 'Cáº§u Diá»…n', 5, 1),
(17, 'ha', '202cb962ac59075b964b07152d234b70', 'pháº¡m thá»‹ thanh hÃ ', '1988-02-15', '2008-02-24', 'ha@yahoo.com', '12345', '12', 'Cáº§u Diá»…n', 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `method`
--

DROP TABLE IF EXISTS `method`;
CREATE TABLE IF NOT EXISTS `method` (
  `Id` int(11) NOT NULL auto_increment,
  `Money` double NOT NULL default '0',
  `YahooMessenger` varchar(255) default NULL,
  `Skype` varchar(255) default NULL,
  `Email` varchar(255) default NULL,
  `HotLine` varchar(255) default NULL,
  `Fax` varchar(255) default NULL,
  `Telephone` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=2 ;

--
-- Dumping data for table `method`
--

INSERT INTO `method` (`Id`, `Money`, `YahooMessenger`, `Skype`, `Email`, `HotLine`, `Fax`, `Telephone`) VALUES
(1, 50000, 'ninhgio', 'ninhgio', 'ninhgio@yahoo.com', '123456789', '123456789', '123456789');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `Id` int(10) NOT NULL auto_increment,
  `Title` varchar(255) collate latin1_general_ci default NULL,
  `Description` text collate latin1_general_ci,
  `Detail` text collate latin1_general_ci,
  `Image` varchar(255) collate latin1_general_ci default NULL,
  `ImageNote` varchar(255) collate latin1_general_ci default NULL,
  `newscategoryId` int(10) default NULL,
  `HotNews` int(2) default '0',
  `Status` int(2) default '1',
  `WriteDate` datetime default NULL,
  `ModifyDate` datetime default NULL,
  `View` int(10) default '0',
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`Id`, `Title`, `Description`, `Detail`, `Image`, `ImageNote`, `newscategoryId`, `HotNews`, `Status`, `WriteDate`, `ModifyDate`, `View`) VALUES
(1, '10 sá»± kiá»‡n kinh táº¿ - xÃ£ há»™i 2007', 'BÃªn cáº¡nh nhá»¯ng thÃ nh cÃ´ng nhÆ° Ä‘áº¯c cá»­ vÃ o Há»™i Ä‘á»“ng báº£o an LiÃªn Há»£p Quá»‘c, tÄƒng trÆ°á»Ÿng kinh táº¿ Ä‘áº¡t má»©c ká»· lá»¥c 10 nÄƒm qua, nÄƒm 2007 Viá»‡t Nam Ä‘Ã£ pháº£i Ä‘á»‘i máº·t vá»›i nhá»¯ng Ä‘á»£t sÃ³ng giÃ³ cá»§a giÃ¡ cáº£ leo thang, tháº£m há»a sáº­p cáº§u vÃ  thiÃªn tai dá»‹ch bá»‡nh.', '<p class="Normal">DÆ°á»›i Ä‘Ã¢y lÃ  cÃ¡c sá»± kiá»‡n kinh táº¿ - xÃ£ há»™i ná»•i báº­t, theo Ä‘Ã¡nh giÃ¡ cá»§a <em>VnExpress</em>.</p>\r\n<font color="#4f4f4f"><a class="SubTitle" href="http://vnexpress.net/Topic/?ID=4861">Viá»‡t Nam Ä‘Æ°á»£c báº§u vÃ o Há»™i Ä‘á»“ng báº£o an LHQ</a><font color="#000000">\r\n<p class="Normal">NgÃ y 16/10 trá»Ÿ thÃ nh má»™t ngÃ y Ä‘Ã¡ng nhá»› khi Viá»‡t Nam, vá»›i tÆ° cÃ¡ch lÃ  á»©ng cá»­ viÃªn duy nháº¥t Ä‘áº¡i diá»‡n cho chÃ¢u Ã, Ä‘áº¯c cá»­ gháº¿ thÃ nh viÃªn khÃ´ng thÆ°á»ng trá»±c Há»™i Ä‘á»“ng Báº£o an LiÃªn Há»£p Quá»‘c khÃ³a 2008-2009 - cÆ¡ quan cÃ³ vai trÃ² hÃ ng Ä‘áº§u trong viá»‡c gÃ¬n giá»¯ hoÃ  bÃ¬nh vÃ  an ninh tháº¿ giá»›i.</p>\r\n<font color="#000000">\r\n<p class="Normal">Viá»‡c Ä‘Æ°á»£c cÃ¡c nÆ°á»›c chÃ¢u Ã thá»‘ng nháº¥t Ä‘á» cá»­ vÃ  nhá»¯ng lÃ¡ phiáº¿u á»§ng há»™ cá»§a nhiá»u nÆ°á»›c ngoÃ i chÃ¢u lá»¥c lÃ  sá»± ghi nháº­n vá» kháº£ nÄƒng Ä‘Ã³ng gÃ³p cá»§a Viá»‡t Nam khi tham gia gÃ¬n giá»¯ hÃ²a bÃ¬nh, á»•n Ä‘á»‹nh vÃ  phÃ¡t triá»ƒn khu vá»±c cÅ©ng nhÆ° toÃ n cáº§u.</p>\r\n<p class="Normal">Vá»›i tÆ° cÃ¡ch lÃ  thÃ nh viÃªn Há»™i Ä‘á»“ng Báº£o an, láº§n Ä‘áº§u tiÃªn Viá»‡t Nam Ä‘Æ°á»£c tham gia Ä‘áº§y Ä‘á»§ vÃ o quÃ¡ trÃ¬nh kiáº¿n táº¡o nhá»¯ng quyáº¿t Ä‘á»‹nh mang tÃ­nh rÃ ng buá»™c Ä‘á»‘i vá»›i táº¥t cáº£ thÃ nh viÃªn LiÃªn Há»£p Quá»‘c, chá»§ Ä‘á»™ng tham gia giáº£i quyáº¿t cÃ¡c váº¥n Ä‘á» chung, Ä‘á»“ng thá»i há»™i nháº­p sÃ¢u trÃªn cáº£ hai lÄ©nh vá»±c kinh táº¿ - thÆ°Æ¡ng máº¡i vÃ  chÃ­nh trá»‹ - an ninh.</p>\r\n<p class="Normal">Sá»± kiá»‡n Ä‘Æ°á»£c bÃ¡o chÃ­ quá»‘c táº¿ Ä‘Ã¡nh giÃ¡ lÃ  má»‘c quan trá»ng, kháº³ng Ä‘á»‹nh vá»‹ tháº¿ má»›i cá»§a Viá»‡t Nam trÃªn trÆ°á»ng quá»‘c táº¿.</p>\r\n</font></font></font>', '1.jpg', 'Má»™t phiÃªn há»p cá»§a Há»™i Ä‘á»“ng Báº£o an LiÃªn Há»£p Quá»‘c. áº¢nh: UN.', 5, 1, 1, '2008-01-10 21:18:59', '0000-00-00 00:00:00', 0),
(2, 'Ngá»c â€œxinhâ€ - cÃ´ há»c sinh chÃ¢n dÃ i', '<p><span class="story_teaser" id="lbTeaser">Quen máº·t tá»« lÃ¢u trong vai trÃ² lÃ  ngÆ°á»i máº«u teen. Rá»“i xuáº¥t hiá»‡n trÃªn cÃ¡c táº¡p chÃ­ chuyÃªn vá» thá»i trang nhÆ° má»™t ngÆ°á»i máº«u áº£nh chuyÃªn nghiá»‡p, sáº£i chÃ¢n trÃªn sÃ n catwalk cá»§a Vietnam Collection Grand Prix. Ngá»c â€œxinhâ€ Ä‘á»ƒ láº¡i khÃ¡ nhiá»u áº¥n tÆ°á»£ng, báº¯t Ä‘áº§u ngay tá»« cÃ¡i nick name dá»… thÆ°Æ¡ng. <br />\r\n</span><font face="Times New Roman" size="3"><strong>Nick name Ngá»c â€œxinhâ€</strong> </font></p>', '<p class="MsoNormal" style="MARGIN: 0in 0in 12pt"><font face="Times New Roman" size="3">Mai Ngá»c - cao tá»›i 1,72m, khuÃ´n máº·t xinh xáº¯n, dÃ¢n lá»›p 12 Trung trÆ°á»ng&nbsp;HÃ  Ná»™i - Amsterdam, cÃ³ má»™t cÃ´ng viá»‡c partime thÃº vá»‹ - ngÆ°á»i máº«u.&nbsp; Má»i thá»© á»Ÿ cÃ´ báº¡n nÃ y dÆ°á»ng nhÆ° Ä‘á»u hoÃ n háº£o vÃ  Ä‘Ã¡ng Ä‘á»ƒ cÃ¡c cÃ´ báº¡n cÃ¹ng lá»©a hÆ¡i hÆ¡i â€œghen tá»µâ€.<br />\r\n<br />\r\nÄáº¥y lÃ  cÃ¡ch mÃ  nhá»¯ng ngÆ°á»i xung quanh váº«n nhÃ¬n vá» Ngá»c. CÃ´ báº¡n há»c cÃ¹ng lá»›p vá»›i Ngá»c thi thoáº£ng cÅ©ng tháº¥y hÆ¡i hÆ¡i khoÃ¡i vÃ¬ chÆ¡i thÃ¢n vá»›i cÃ´ báº¡n ná»•i tiáº¿ng.&nbsp;ÄÃ´i ba&nbsp;ngÆ°á»i Ã­t quen biáº¿t cÃ´ báº¡n hÆ¡n thÃ¬ e dÃ¨ khi nghÄ© Ä‘áº¿n viá»‡c tiáº¿p xÃºc: â€œCháº¯c kiÃªu láº¯mâ€.&nbsp;</font></p>\r\n<p class="MsoNormal" style="MARGIN: 0in 0in 12pt" align="center"><img alt="" src="http://images7.dantri.com.vn/Uploaded/lantm/Thang11.07/Ngocxinh271107.jpg" /><br />\r\n<font face="Tahoma">Ngá»c "xinh" vá»›i Ä‘Ã´i chÃ¢n dÃ i báº¥t táº­n.</font></p>\r\n<p><font face="Times New Roman" size="3">Trong cuá»™c nÃ³i chuyá»‡n, Ngá»c ráº¥t hay nháº¯c tá»›i tá»« â€œxinhâ€: vÃ¬ tháº¥y mÃ¬nh xinh xinh, cao cao nÃªn Ä‘Æ°á»£c lÃ m ngÆ°á»i máº«u; ngoáº¡i hÃ¬nh xinh xáº¯n cÅ©ng lÃ  lá»£i tháº¿; rá»“i â€œkhuÃ´n máº·t mÃ¬nh xinh dá»… thÆ°Æ¡ng nÃªn thÆ°á»ng Ä‘Æ°á»£c cho máº·c nhá»¯ng trang phá»¥c phÃ¹ há»£pâ€...</font></p>\r\n<p><font face="Times New Roman" size="3">CÃ¡i nick name Ngá»c â€œxinhâ€ lÃ m nhiá»u ngÆ°á»i tháº¯c máº¯c: â€œCháº¯c tá»± tin láº¯m nÃªn má»›i Ä‘áº·t nick váº­yâ€. NhÆ°ng thá»±c ra cÃ¡i tÃªn nÃ y Ä‘áº¿n vá»›i cÃ´ báº¡n ráº¥t tÃ¬nh cá». Láº§n Ä‘áº§u tiÃªn chá»¥p máº«u cho bÃ¡o <em style="mso-bidi-font-style: normal">Hoa há»c trÃ²</em>. Cháº³ng ai nhá»› ra tÃªn Ä‘áº§y Ä‘á»§ cá»§a Ngá»c lÃ  gÃ¬, chá»‰ nhá»› má»—i tÃªn. Tháº¿ lÃ  chá»‹ biÃªn táº­p ghi luÃ´n lÃ  Ngá»c xinh. Tháº¥y hay hay vÃ  há»£p, nÃªn láº¥y lÃ m nick name luÃ´n cho má»—i láº§n chá»¥p máº«u.</font></p>\r\n<p><font face="Times New Roman" size="3">ThÃ¬ cÃ³ gÃ¬ Ä‘Ã¢u mÃ  khÃ´ng tá»± tin, Ngá»c xinh tháº­t mÃ . NhÆ°ng cháº³ng kiÃªu vÃ¬ nghÄ© mÃ¬nh xinh. Xinh thÃ¬ nhiá»u ngÆ°á»i xinh láº¯m chá»©. Ai há»c trong khá»‘i cá»§a Ngá»c mÃ  chÆ¡i vá»›i cÃ´ nÃ ng nÃ y thÃ¬ rÃµ, nhÃ­ nháº£nh vÃ  cá»±c ká»³ cá»Ÿi má»Ÿ.</font></p>\r\n<p align="center"><img alt="" src="http://images7.dantri.com.vn/Uploaded/lantm/Thang11.07/Ngocxinh271107.2.jpg" /><br />\r\n<font face="Tahoma">Ngá»c cá»§a Ä‘á»i thÆ°á»ng.</font></p>\r\n<p><font face="Times New Roman" size="3">MÃ  Ngá»c cÅ©ng hÃ´ng há» áº£o tÆ°á»Ÿng vá» Ä‘iá»u Ä‘Ã³, biáº¿t ráº¥t rÃµ mÃ¬nh Ä‘ang lÃ  cÃ´ há»c sinh lá»›p 12 vá»›i Ä‘áº§y Ä‘á»§ nhá»¯ng Ã¡p lá»±c há»c hÃ nh thi cá»­.</font></p>\r\n<p><font face="Times New Roman" size="3">CÃ´ng viá»‡c ngÆ°á»i máº«u vá»›i Ngá»c hiá»‡n giá», ngoÃ i lÃ½ do lÃ  má»™t cÃ´ng viá»‡c partime cÃ²n lÃ  cÃ¡ch Ä‘á»ƒ Ngá»c Ä‘áº·t nhá»¯ng má»‘i quan há»‡ Ä‘áº§u tiÃªn cho cÃ´ng viá»‡c mÃ  cÃ´ báº¡n nghÄ© mÃ¬nh sáº½ theo Ä‘uá»•i. Má»™t phÃ³ng viÃªn truyá»n hÃ¬nh.</font></p>\r\n<p><font face="Times New Roman" size="3">KhÃ´ng háº³n vÃ¬ Ä‘Ã³ lÃ  cÃ´ng viá»‡c thá»i thÆ°á»£ng vÃ  nghe háº¥p dáº«n mÃ  lÃ  má»™t mong muá»‘n hoÃ n toÃ n nghiÃªm tÃºc vÃ  cÃ´ báº¡n Ä‘ang gáº¯ng háº¿t sá»©c Ä‘á»ƒ cÃ³ thá»ƒ thi Ä‘á»— vÃ o Há»c viá»‡n BÃ¡o chÃ­ &amp; TuyÃªn truyá»n.</font></p>\r\n<p><strong><font face="Times New Roman" size="3">Má»™t cÃ´ng viá»‡c partime thÃº vá»‹</font></strong></p>\r\n<p><font face="Times New Roman" size="3">Tham gia ngÆ°á»i máº«u <em style="mso-bidi-font-style: normal">Hoa há»c trÃ²</em> tá»« cÃ¡ch Ä‘Ã¢y 3 nÄƒm, Ä‘áº¿n giá» nÃ y thÃ¬ Ngá»c xinh Ä‘Ã£ cÃ³ cÃ¡i vá»‘n kha khÃ¡ vá» nghá» ngÆ°á»i máº«u. KhÃ´ng chá»‰ lÃ m model cho cÃ¡c táº¡p chÃ­ tuá»•i teen, cÃ´ báº¡n Ä‘Ã£ báº¯t Ä‘áº§u chá»¥p cho nhá»¯ng táº¡p chÃ­ â€œngÆ°á»i lá»›nâ€ hÆ¡n nhÆ° <em style="mso-bidi-font-style: normal">Thá»i trang tráº»</em> - chá»¥p Ã¡o cÆ°á»›i háº³n hoi Ä‘áº¥y; lÃ m ngÆ°á»i máº«u cho nhá»¯ng Ä‘Ãªm diá»…n chuyÃªn nghiá»‡p nhÆ° chung káº¿t Vietnam Collection Grand Prix 2007...</font></p>\r\n<p><font face="Times New Roman" size="3">ÄÃ³ lÃ  má»™t cÃ´ng viá»‡c partime thá»±c sá»± thÃº vá»‹ vÃ  thÃ­ch há»£p vá»›i tuá»•i teen, Ä‘áº·c biá»‡t vá»›i má»™t cÃ´ ná»¯ sinh â€œchÃ¢n dÃ iâ€, Ngá»c cÆ°á»i khÃºc khÃ­ch. â€œBá»n mÃ¬nh ai cháº³ng muá»‘n kiáº¿m viá»‡c lÃ m thÃªm Ä‘á»ƒ kiáº¿m tiá»n tiÃªu váº·t. MÃ¬nh nghÄ© ngÆ°á»i máº«u lÃ  cÃ´ng viá»‡c thÃº vá»‹ mÃ  ai cÅ©ng muá»‘n. CÃ³ chÃºt ngoáº¡i hÃ¬nh vÃ  biáº¿t diá»…n lÃ  á»•nâ€.</font></p>\r\n<p align="center"><img alt="" src="http://images7.dantri.com.vn/Uploaded/lantm/Thang11.07/Ngocxinh271107.3.jpg" /><br />\r\nMá»™t pha diá»…n cá»§a Ngá»c "xinh" trong <a href="http://www1.dantri.com.vn/nhipsongtre/2007/9/195951.vip"><strong>"CÃ¢u chuyá»‡n tÃ¬nh yÃªu"</strong></a>.</p>\r\n<p><font face="Times New Roman" size="3">Má»™t cÃ´ng viá»‡c thá»a mÃ£n sá»Ÿ thÃ­ch cá»§a báº¥t cá»© má»™t cÃ´ gÃ¡i tuá»•i teen nÃ o: Ä‘Æ°á»£c khoÃ¡c lÃªn mÃ¬nh nhá»¯ng bá»™ quáº§n Ã¡o Ä‘áº¹p, Ä‘Æ°á»£c chá»¥p áº£nh Ä‘áº¹p vÃ  cÃ³ thá»ƒ kiáº¿m tiá»n Ä‘á»ƒ mua nhá»¯ng bá»™ quáº§n Ã¡o Ä‘áº¹p cho mÃ¬nh.</font></p>\r\n<p class="MsoNormal" style="MARGIN: 0in 0in 0pt"><font face="Times New Roman" size="3">NhÆ°ng Ngá»c cÅ©ng thá»«a nháº­n,&nbsp;â€œnhá»¯ng má»‘i quan há»‡, sá»± Ä‘á»™c láº­p vÃ  kháº£ nÄƒng giao tiáº¿p lÃ  nhá»¯ng cÃ¡i mÃ  tá»› tháº¥y Ä‘Æ°á»£c nhiá»u nháº¥t tá»« cÃ´ng viá»‡c nÃ yâ€.</font></p>\r\n<p class="MsoNormal" style="MARGIN: 0in 0in 0pt"><font face="Times New Roman" size="3"></font>&nbsp;</p>\r\n<p class="MsoNormal" style="MARGIN: 0in 0in 0pt"><font face="Times New Roman" size="3">Tuy nhiÃªn&nbsp;chá»‰ dá»«ng láº¡i á»Ÿ Ä‘Ã³ thÃ´i. Ngá»c khÃ´ng cÃ³ Ã½ Ä‘á»‹nh phÃ¡t triá»ƒn thÃ nh ngÆ°á»i máº«u chuyÃªn nghiá»‡p. ChÆ°a bao giá» dÃ¡m bá» há»c Ä‘á»ƒ Ä‘i diá»…n nÃªn chÆ°a bap giá» Ä‘Æ°á»£c Ä‘i diá»…n xa.</font></p>\r\n<p><font face="Times New Roman" size="3">â€œVá»›i láº¡i, lÃ m ngÆ°á»i máº«u tuá»•i teen, chÆ°a pháº£i ganh Ä‘ua nhiá»u nÃªn tá»› tháº¥y má»i ngÆ°á»i tÃ¬nh cáº£m vá»›i nhau hÆ¡n. Ra ngoÃ i, tháº¥y má»‘i quan há»‡ trong giá»›i ngÆ°á»i máº«u chuyÃªn nghiá»‡p, phá»©c táº¡p quÃ¡. Tá»› khÃ´ng há»£p vá»›i nhá»¯ng cÃ¡i Ä‘Ã³â€.</font></p>\r\n<p class="MsoNormal" style="MARGIN: 0in 0in 0pt"><font face="Times New Roman" size="3">Cuá»™c nÃ³i chuyá»‡n káº¿t thÃºc vÃ o lÃºc 11h trÆ°a vÃ¬ Ngá»c pháº£i vá» nhÃ  tranh thá»§ ngá»§ Ä‘á»ƒ chiá»u báº¯t Ä‘áº§u cÃ¡c ca há»c thÃªm. Lá»›p 12 rá»“i mÃ !</font></p>\r\n<p class="MsoNormal" style="MARGIN: 0in 0in 0pt; TEXT-ALIGN: right" align="right"><o:p><font face="Times New Roman" size="3">&nbsp;</font></o:p></p>\r\n<p class="MsoNormal" style="MARGIN: 0in 0in 0pt; TEXT-ALIGN: right" align="right"><font face="Times New Roman" size="3">Theo </font><font size="3"><font face="Times New Roman"><strong>XuÃ¢n LÃª<br />\r\n</strong><em style="mso-bidi-font-style: normal"><span style="mso-bidi-font-weight: bold">KÃªnh 14<o:p></o:p></span></em></font></font></p>\r\n<p class="MsoNormal" style="MARGIN: 0in 0in 0pt; TEXT-ALIGN: right" align="right"><font face="Times New Roman" size="3"><em>áº¢nh: www.cauchuyentinhyeu.org</em></font></p>', '2.jpg', 'Ná»¯ sinh Mai Ngá»c.', 4, 1, 1, '2008-01-15 14:59:14', '0000-00-00 00:00:00', 0),
(3, 'HoÃ ng ThÃ¹y Linh: ''TÃ´i há»c Ä‘Æ°á»£c chá»¯ Nháº«n''', '<p class="Lead">"Thá»i gian qua, tÃ´i Ä‘Ã£ há»c Ä‘Æ°á»£c thÃªm nhiá»u Ä‘iá»u ráº¥t hay mÃ  khÃ´ng pháº£i báº¥t cá»© ai á»Ÿ tuá»•i tÃ´i cÅ©ng muá»‘n há»c vÃ  há»c Ä‘Æ°á»£c. ÄÃ³ lÃ  chá»¯ Nháº«n", diá»…n viÃªn chÃ­nh trong pháº§n 2 phim "Nháº­t kÃ½ VÃ ng Anh" bÃ y tá».</p>', '<p class="Normal">- <em>Má»™t ngÃ y bÃ¬nh thÆ°á»ng cá»§a Linh hiá»‡n giá» diá»…n ra nhÆ° tháº¿ nÃ o?</em> </p>\r\n<p class="Normal">- TÃ´i Ä‘i há»c. CÃ ng há»c tÃ´i cÃ ng tháº¥y mÃ¬nh hiá»ƒu biáº¿t cÃ²n Ã­t quÃ¡. CÃ ng sá»‘ng, tÃ´i cÃ ng tháº¥y muá»‘n biáº¿t nhiá»u hÆ¡n ná»¯a, tá»« nhá»¯ng Ä‘iá»u nhá» nháº¥t mÃ  trÆ°á»›c Ä‘Ã¢y vÃ¬ cÃ³ Ã­t thá»i gian nÃªn tÃ´i khÃ´ng Ä‘á»ƒ Ã½. NhÆ°ng nhiá»u lÃºc, há»c nhiá»u quÃ¡ khiáº¿n tÃ´i cÅ©ng tháº¥y mÃ´ng lung vÃ¬ cá»© biáº¿t thÃªm Ä‘iá»u gÃ¬ lÃ  tÃ´i láº¡i tháº¥y há»©ng thÃº vá»›i Ä‘iá»u má»›i máº» Ä‘Ã³ vÃ  muá»‘n thá»­ sá»©c. TÃ´i sáº½ há»c cho Ä‘áº¿n khi hiá»ƒu mÃ¬nh thá»±c sá»± cáº§n gÃ¬, muá»‘n gÃ¬ vÃ  lÃ m Ä‘Æ°á»£c gÃ¬. </p>\r\n<p class="Normal">- <em>Äáº­u thá»§ khoa vÃ o khoa Äáº¡o diá»…n Truyá»n hÃ¬nh - Äáº¡i há»c SÃ¢n kháº¥u Äiá»‡n áº£nh, Linh duy trÃ¬ "phong Ä‘á»™" Ä‘Ã³ ra sao trong viá»‡c há»c hÃ nh thi cá»­ háº±ng ngÃ y á»Ÿ lá»›p?</em></p>\r\n<p class="Normal">- Táº¥t cáº£ chá»‰ má»›i lÃ  báº¯t Ä‘áº§u. Náº¿u muá»‘n tiáº¿p tá»¥c tá»‘t hÆ¡n ná»¯a, hoÃ n thiá»‡n mÃ¬nh hÆ¡n ná»¯a thÃ¬ khÃ´ng nÃªn nghÄ© quÃ¡ nhiá»u vá» nhá»¯ng gÃ¬ Ä‘Ã£ lÃ m Ä‘Æ°á»£c. MÃ¬nh biáº¿t vÃ  háº¡nh phÃºc vÃ¬ Ä‘Ã£ lÃ m Ä‘Æ°á»£c Ä‘iá»u Ä‘Ã³ lÃ  Ä‘á»§. KhÃ´ng chá»‰ viá»‡c há»c á»Ÿ trÆ°á»ng Ä‘Ã¢u, mÃ  trong cÃ´ng viá»‡c hay chuyá»‡n tÃ¬nh cáº£m cÅ©ng váº­y. </p>\r\n<table cellspacing="0" cellpadding="3" width="1" align="center" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td><img height="419" width="300" border="1" alt="" src="http://vnexpress.net/Vietnam/Van-hoa/2008/01/3B9FE5D8/linh5aa.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image">Diá»…n viÃªn HoÃ ng ThÃ¹y Linh. áº¢nh: <em>HoÃ ng HÃ .</em></td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p class="Normal">- <em>Linh nghÄ© sao vá» viá»‡c chá»n con Ä‘Æ°á»ng du há»c trong tÆ°Æ¡ng lai?</em></p>\r\n<p class="Normal">- Tá»­ vi nÃ³i tÃ´i láº­p nghiá»‡p á»Ÿ nÆ°á»›c ngoÃ i thÃ¬ tá»‘t láº¯m (cÆ°á»i). Ã Ä‘áº¥y cÅ©ng hay. NhÆ°ng má»™t khi chÆ°a lÃ m Ä‘Æ°á»£c Ä‘iá»u mÃ¬nh muá»‘n lÃ m vÃ  cáº§n pháº£i lÃ m á»Ÿ Viá»‡t Nam thÃ¬ tÃ´i chÆ°a Ä‘i Ä‘Ã¢u háº¿t. </p>\r\n<p class="Normal">- <em>LÃ  má»™t cÃ´ gÃ¡i nÄƒng Ä‘á»™ng vÃ  thÃ­ch cuá»™c sá»‘ng báº­n rá»™n, Linh cÃ³ cáº£m giÃ¡c nhÆ° tháº¿ nÃ o khi tráº£i qua khoáº£ng thá»i gian khÃ¡ láº·ng láº½ vá»«a qua? </em></p>\r\n<p class="Normal">- CÃ³ thá»ƒ nÃ³i khoáº£ng thá»i gian vá»«a rá»“i cÃ³ nhiá»u biáº¿n Ä‘á»™ng nháº¥t chá»© khÃ´ng há» láº·ng láº½ chÃºt nÃ o. TÃ­nh tÃ´i hiáº¿u tháº¯ng láº¯m, tá»« bÃ© Ä‘Ã£ ráº¥t thÃ­ch cuá»™c sá»‘ng báº­n rá»™n Ä‘á»ƒ Ä‘Æ°á»£c khÃ¡m phÃ¡ mÃ¬nh. CÃ³ láº½ Ä‘Ã³ lÃ  má»™t pháº§n tÃ­nh cÃ¡ch cá»§a nhá»¯ng con ngÆ°á»i tráº» tuá»•i láº¯m Ä‘am mÃª vÃ  thÃ­ch chinh phá»¥c. Thá»i gian qua, tÃ´i Ä‘Ã£ há»c Ä‘Æ°á»£c thÃªm nhiá»u Ä‘iá»u ráº¥t hay mÃ  khÃ´ng pháº£i báº¥t cá»© ai á»Ÿ tuá»•i tÃ´i cÅ©ng muá»‘n há»c vÃ  há»c Ä‘Æ°á»£c. ÄÃ³ lÃ  chá»¯ Nháº«n! Kinh Pháº­t nÃ³i vá» chá»¯ Nháº«n hay láº¯m. NhÆ°ng nÃ³i nhÆ° tháº¿ khÃ´ng cÃ³ nghÄ©a lÃ  tÃ´i thiáº¿u quyáº¿t liá»‡t vÃ  khao khÃ¡t. CÃ³ má»™t ngÆ°á»i anh ráº¥t hay tÃ¢m sá»± vá»›i tÃ´i thá»i gian qua. Má»—i khi tÃ­nh hiáº¿u tháº¯ng non tráº» cá»§a tÃ´i ná»•i lÃªn, anh Ä‘á»u â€œcan ngÄƒn" ká»‹p thá»i. â€œLÃ¹i má»™t bÆ°á»›c trá»i cao Ä‘áº¥t rá»™ngâ€. Pháº£i bÃ¬nh tÄ©nh thÃ´i. TÃ¢m cÃ³ yÃªn thÃ¬ suy nghÄ© má»›i Ä‘Ãºng Ä‘áº¯n vÃ  chÃ­n cháº¯n Ä‘Æ°á»£c! </p>\r\n<p class="Normal">- <em>TÄƒng Nháº­t Tuá»‡ lÃ  má»™t trong nhá»¯ng ngÆ°á»i báº¡n gáº¯n bÃ³ vá»›i Linh thá»i gian qua. ChÃ ng nháº¡c sÄ© nÃ y cÃ³ Ã½ nghÄ©a nhÆ° tháº¿ nÃ o vá»›i Linh?</em></p>\r\n<p class="Normal">- Tuá»‡ lÃ  nguá»“n Ä‘á»™ng viÃªn ráº¥t lá»›n Ä‘á»‘i vá»›i tÃ´i trong thá»i gian qua. TÃ´i ná»ƒ Tuá»‡ á»Ÿ niá»m Ä‘am mÃª nghá»‡ thuáº­t vÃ  kháº£ nÄƒng vÆ°á»£t qua khÃ³ khÄƒn. Tuá»‡ lÃ  má»™t ngÆ°á»i anh ráº¥t tÃ¢m lÃ½. Chá»‰ cáº§n nghe Tuá»‡ nÃ³i má»™t vÃ i Ä‘iá»u vá» nhá»¯ng khÃ³ khÄƒn Tuá»‡ gáº·p thÃ´i, tÃ´i cÅ©ng Ä‘Ã£ muá»‘n tiáº¿p tá»¥c ná»— lá»±c cho cuá»™c sá»‘ng cá»§a mÃ¬nh rá»“i. Ai cháº³ng cÃ³ nhá»¯ng khÃ³ khÄƒn riÃªng. Quan trá»ng lÃ  mÃ¬nh cÃ³ cÃ²n muá»‘n vÃ  cÃ²n dÃ¡m Ä‘á»©ng lÃªn sá»‘ng cuá»™c sá»‘ng cá»§a chÃ­nh mÃ¬nh hay khÃ´ng thÃ´i. TÃ´i Ä‘Ã£ nÃ³i chuyá»‡n vá»›i ráº¥t nhiá»u ngÆ°á»i báº£n lÄ©nh nhÆ° tháº¿. VÃ  tÃ´i sáº½ khÃ´ng lÃ m phá»¥ lÃ²ng há» Ä‘Ã¢u. Äáº·c biá»‡t lÃ  nhá»¯ng ngÆ°á»i luÃ´n theo dÃµi bÆ°á»›c Ä‘i vÃ  á»§ng há»™ cho tÃ´i. TÃ´i ráº¥t biáº¿t Æ¡n nhá»¯ng thÃ y cÃ´ Ä‘Ã£ gá»­i thÆ°, Ä‘Ã£ Ä‘áº¿n táº­n nhÃ  Ä‘á»™ng viÃªn tÃ´i, nhá»¯ng fan nhÃ­ vÃ´ cÃ¹ng dá»… thÆ°Æ¡ng vá»›i suy nghÄ© Ä‘Æ¡n giáº£n nhÆ°ng trÃ n Ä‘áº§y lÃ²ng tin, hy vá»ng vÃ  ráº¥t nhiá»u ngÆ°á»i anh, ngÆ°á»i chá»‹ khÃ´ng chá»‰ á»Ÿ Viá»‡t Nam mÃ  cÃ²n á»Ÿ nhiá»u nÆ¡i khÃ¡c... TÃ´i háº¡nh phÃºc vÃ¬ cÃ³ Ä‘Æ°á»£c nhá»¯ng ngÆ°á»i báº¡n nhÆ° há». </p>\r\n<table cellspacing="0" cellpadding="3" width="1" align="center" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td><img height="285" alt="ThÃ¹y Linh trong chuyáº¿n Ä‘i thá»±c táº­p táº¡i trÆ°á»ng quay HÆ°ng YÃªn." width="380" border="1" src="http://vnexpress.net/Vietnam/Van-hoa/2008/01/3B9FE5D8/IMG_1842a.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image">ThÃ¹y Linh trong chuyáº¿n Ä‘i thá»±c táº­p cá»§a sinh viÃªn SÃ¢n kháº¥u Äiá»‡n áº£nh táº¡i trÆ°á»ng quay HÆ°ng YÃªn. áº¢nh: <em>Blog HoÃ ng ThÃ¹y Linh.</em></td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p class="Normal">- <em>Giao thá»«a nÄƒm nay vá»›i Linh sáº½ khÃ¡c nhá»¯ng nÄƒm trÆ°á»›c nhÆ° tháº¿ nÃ o?</em></p>\r\n<p class="Normal">- Má»i nÄƒm, tÃ´i báº­n rá»™n láº¯m, chá»‰ Æ°á»›c hoÃ n thÃ nh xong cÃ´ng viá»‡c tháº­t sá»›m Ä‘á»ƒ Ä‘Æ°á»£c vá» nhÃ  vá»›i bá»‘ máº¹, Ä‘Æ°á»£c nháº­n lÃ¬ xÃ¬ Ä‘áº§u nÄƒm thÃ´i. TÃ´i lÃ  con má»™t trong nhÃ  nhÆ°ng cá»© Ä‘i lÃ m suá»‘t. Bá»‘ máº¹ tÃ´i cháº³ng muá»‘n tháº¿ nhÆ°ng cÃ´ng viá»‡c Ä‘Ã£ lÃ  niá»m Ä‘am mÃª cá»§a tÃ´i rá»“i, biáº¿t lÃ m tháº¿ nÃ o Ä‘Æ°á»£c. Tháº¥y bá»‘ máº¹ á»Ÿ nhÃ  chá»‰ biáº¿t Ä‘á»™ng viÃªn con, nhiá»u khi tÃ´i cháº¡nh lÃ²ng láº¯m. TÃ´i nghÄ©, lÃ m gÃ¬ thÃ¬ lÃ m nhÆ°ng trÆ°á»›c háº¿t pháº£i lÃ m trÃ²n chá»¯ hiáº¿u, dÃ¹ cÃ³ chuyá»‡n gÃ¬ xáº£y ra Ä‘i ná»¯a. </p>\r\n<p class="Normal">TÃ´i cháº³ng máº¥y khi cÃ³ nhiá»u thá»i gian dÃ nh cho gia Ä‘Ã¬nh vÃ  ngÆ°á»i thÃ¢n nhÆ° nÄƒm nay. Äáº¥y lÃ  sá»± khÃ¡c biá»‡t. CÃ²n trong Ä‘Ãªm giao thá»«a, tÃ´i ráº¥t thÃ­ch Ä‘i lá»… chÃ¹a. </p>\r\n<p class="Normal">- <em>Äiá»u Æ°á»›c lá»›n nháº¥t cá»§a Linh trong nÄƒm má»›i lÃ  gÃ¬?</em></p>\r\n<p class="Normal">- TÃ´i mong mÃ¬nh cÃ³ sá»©c khá»e tháº­t tá»‘t Ä‘á»ƒ tiáº¿p tá»¥c bÆ°á»›c trÃªn con Ä‘Æ°á»ng Ä‘Ã£ chá»n, Ä‘á»ƒ cÃ³ thá»ƒ táº¡o ra nhá»¯ng â€œmÃ³n quÃ  tháº­t Ã½ nghÄ©aâ€ dÃ nh táº·ng cho bá»‘ máº¹, ngÆ°á»i thÃ¢n vÃ  nhá»¯ng ai luÃ´n á»§ng há»™ tÃ´i trong nÄƒm má»›i nÃ y, Ä‘á»ƒ khÃ´ng ai pháº£i buá»“n phiá»n vÃ  tháº¥t vá»ng thÃªm ná»¯a.</p>\r\n<p class="Normal" align="right"><strong>Huyá»n Anh</strong> <em>thá»±c hiá»‡n</em><br />\r\n</p>', '3.jpg', 'Diá»…n viÃªn HoÃ ng ThÃ¹y Linh. áº¢nh: HoÃ ng HÃ .', 4, 1, 1, '2008-01-15 15:14:55', '2008-01-15 15:14:55', 0),
(4, 'áº¢nh thi ngÆ°á»i máº«u ná»™i y Trung Quá»‘c', '<p class="Lead">Li Xinyue (ngÆ°á»i Báº¯c Kinh) Ä‘Ã£ vÆ°á»£t qua 35 thÃ­ sinh khÃ¡c Ä‘á»ƒ giÃ nh giáº£i Hoa khÃ´i cuá»™c thi NgÆ°á»i máº«u ná»™i y Trung Quá»‘c, tá»• chá»©c hÃ´m 29/12/2007 táº¡i Nam Ninh (Quáº£ng TÃ¢y).<br />\r\n&gt; <a class="Lead" href="http://vnexpress.net/Vietnam/Van-hoa/2008/01/3B9FDF56/">Trung Quá»‘c gÃ³p máº·t trong top 10 vÆ°Æ¡ng quá»‘c sáº¯c Ä‘áº¹p</a></p>', '<p class="Lead">\r\n<table cellspacing="0" cellpadding="3" width="1" align="center" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td><img height="393" alt="Models attend the final of 2007 China Underwear Model Contest in Nanning, capital of Southwest China''s Guangxi Zhuang Autonomous Region, December 28, 2007. A total of 36 contestants took part in the final." width="300" border="1" src="http://vnexpress.net/Vietnam/Van-hoa/2008/01/3B9FDFE2/03.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image">36 ngÆ°á»i máº«u trÃªn toÃ n Trung Quá»‘c Ä‘Ã£ lá»t vÃ o vÃ²ng chung káº¿t Underwear Model.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table cellspacing="0" cellpadding="3" width="1" align="center" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td><img height="439" alt="Models attend the final of 2007 China Underwear Model Contest in Nanning, capital of Southwest China''s Guangxi Zhuang Autonomous Region, December 28, 2007. A total of 36 contestants took part in the final." width="300" border="1" src="http://vnexpress.net/Vietnam/Van-hoa/2008/01/3B9FDFE2/02.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image">VÃ²ng chung káº¿t Ä‘Æ°á»£c tá»• chá»©c táº¡i Nam Ninh, thá»§ phá»§ khu tá»± trá»‹ Zhuang (Quáº£ng TÃ¢y).</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table cellspacing="0" cellpadding="3" width="1" align="center" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td><img height="413" alt="Wu Di attends the final of 2007 China Underwear Model Contest in Nanning, capital of Southwest China''s Guangxi Zhuang Autonomous Region, December 28, 2007. A total of 36 contestants took part in the final." width="300" border="1" src="http://vnexpress.net/Vietnam/Van-hoa/2008/01/3B9FDFE2/05.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image">Má»™t thÃ­ sinh trÃ¬nh diá»…n trong pháº§n thi bikini.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table cellspacing="0" cellpadding="3" width="1" align="center" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td><img height="454" alt="Li Xinyue, champion of the 2007 China Underwear Model Contest, competes in the contest final in Nanning, capital of Southwest China''s Guangxi Zhuang Autonomous Region, December 29, 2007. Li Xinyue from Beijing, Li Zhaoxuan from Shandong and Zhang Shujun from Beijing won the champion, runner-up and second runner-up respectively." width="300" border="1" src="http://vnexpress.net/Vietnam/Van-hoa/2008/01/3B9FDFE2/08.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td><img height="387" alt="Li Xinyue, champion of the 2007 China Underwear Model Contest, competes in the contest final in Nanning, capital of Southwest China''s Guangxi Zhuang Autonomous Region, December 29, 2007. Li Xinyue from Beijing, Li Zhaoxuan from Shandong and Zhang Shujun from Beijing won the champion, runner-up and second runner-up respectively." width="262" border="1" src="http://vnexpress.net/Vietnam/Van-hoa/2008/01/3B9FDFE2/07.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image">Hoa khÃ´i Li Xinyue tham dá»± cÃ¡c pháº§n thi trong Ä‘Ãªm chung káº¿t.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<a class="Normal" href="http://vnexpress.net/Vietnam/Van-hoa/2008/01/3B9FDFE2/Li%20Zhaoxuan,%20runner-up%20of%20the%202007%20China%20Underwear%20Model%20Contest,%20competes%20in%20the%20contest%20final%20in%20Nanning,%20capital%20of%20Southwest%20China''s%20Guangxi%20Zhuang%20Autonomous%20Region,%20December%2029,%202007.%20Li%20Xinyue%20from%20Beijing,%20Li%20Zhaoxuan%20from%20Shandong%20and%20Zhang%20Shujun%20from%20Beijing%20won%20the%20champion,%20runner-up%20and%20second%20runner-up%20respectively.">\r\n<table cellspacing="0" cellpadding="3" width="1" align="center" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td><img height="426" alt="Li Zhaoxuan, runner-up of the 2007 China Underwear Model Contest, competes in the contest final in Nanning, capital of Southwest China''s Guangxi Zhuang Autonomous Region, December 29, 2007. Li Xinyue from Beijing, Li Zhaoxuan from Shandong and Zhang Shujun from Beijing won the champion, runner-up and second runner-up respectively." width="300" border="1" src="http://vnexpress.net/Vietnam/Van-hoa/2008/01/3B9FDFE2/06.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td><img height="464" alt="Li Zhaoxuan attends the final of 2007 China Underwear Model Contest in Nanning, capital of Southwest China''s Guangxi Zhuang Autonomous Region, December 28, 2007. A total of 36 contestants took part in the final." width="300" border="1" src="http://vnexpress.net/Vietnam/Van-hoa/2008/01/3B9FDFE2/04.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image">Li Zhaoxuan (ngÆ°á»i SÆ¡n ÄÃ´ng) giÃ nh ngÃ´i Ã khÃ´i 1.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</a>\r\n<table cellspacing="0" cellpadding="3" width="1" align="center" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td><img height="268" width="400" border="1" alt="" src="http://vnexpress.net/Vietnam/Van-hoa/2008/01/3B9FDFE2/01.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image">Ã khÃ´i 1 Li Zhaoxuan (pháº£i), Hoa khÃ´i Li Xinyue (giá»¯a) vÃ  Ã khÃ´i 2 Zhang Shujun (ngÆ°á»i Báº¯c Kinh) trong phÃºt Ä‘Äƒng quang.</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>\r\n<p class="Normal" align="right"><strong>Y.P.</strong> (theo <em>Xinhua</em>)</p>', '4.jpg', 'Ã khÃ´i 1 Li Zhaoxuan (pháº£i), Hoa khÃ´i Li Xinyue (giá»¯a) vÃ  Ã khÃ´i 2 Zhang Shujun (ngÆ°á»i Báº¯c Kinh) trong phÃºt Ä‘Äƒng quang.', 4, 1, 1, '2008-01-17 12:02:10', '2008-01-17 12:02:10', 0),
(5, 'Nhá»¯ng cÃ´ gÃ¡i trÃªn Ä‘Æ°á»ng Ä‘ua', '<p class="Lead">KhÃ´ng á»Ÿ Ä‘Ã¢u cÃ¡c ngÆ°á»i máº«u láº¡i cuá»“ng nhiá»‡t, háº¿t mÃ¬nh nhÆ°ng khÃ´ng kÃ©m pháº§n duyÃªn dÃ¡ng nhÆ° trÃªn Ä‘Æ°á»ng Ä‘ua mÃ´tÃ´ phÃ¢n khá»‘i lá»›n.</p>', '<table cellspacing="0" cellpadding="7" width="1" align="center" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td class="Image"><img height="485" alt="" width="350" border="1" src="http://vnexpress.net/Vietnam/Oto-Xe-may/2007/08/3B9F8D98/Xedua13.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image"><img height="484" alt="" width="350" border="1" src="http://vnexpress.net/Vietnam/Oto-Xe-may/2007/08/3B9F8D98/Xedua9.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image"><img height="462" alt="" width="350" border="1" src="http://vnexpress.net/Vietnam/Oto-Xe-may/2007/08/3B9F8D98/Xedua12.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image"><img height="461" alt="" width="350" border="1" src="http://vnexpress.net/Vietnam/Oto-Xe-may/2007/08/3B9F8D98/Xedua14.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image"><img height="536" alt="" width="350" border="1" src="http://vnexpress.net/Vietnam/Oto-Xe-may/2007/08/3B9F8D98/Xedua4.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image"><img height="493" alt="" width="350" border="1" src="http://vnexpress.net/Vietnam/Oto-Xe-may/2007/08/3B9F8D98/Xedua8.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image"><img height="502" alt="" width="350" border="1" src="http://vnexpress.net/Vietnam/Oto-Xe-may/2007/08/3B9F8D98/Xedua7.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image"><img height="471" alt="" width="350" border="1" src="http://vnexpress.net/Vietnam/Oto-Xe-may/2007/08/3B9F8D98/Xedua2.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image"><img height="260" alt="" width="350" border="1" src="http://vnexpress.net/Vietnam/Oto-Xe-may/2007/08/3B9F8D98/Xedua11.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image"><img height="234" alt="" width="350" border="1" src="http://vnexpress.net/Vietnam/Oto-Xe-may/2007/08/3B9F8D98/Xedua3.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image"><img height="231" alt="" width="350" border="1" src="http://vnexpress.net/Vietnam/Oto-Xe-may/2007/08/3B9F8D98/Xedua1.jpg" /></td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p class="Normal" align="right"><strong>N.N.</strong><br />\r\náº¢nh: <em>Motor-magazine</em></p>', '5.jpg', '', 1, 1, 1, '2008-01-17 12:04:54', '0000-00-00 00:00:00', 0),
(6, 'ChÃ¹m áº£nh ná»¯ CÄV Ä‘áº·c biá»‡t cá»§a Nani', '<p class="Lead">áº¤n tÆ°á»£ng vá»›i lá»‘i chÆ¡i "ma thuáº­t" cá»§a tÃ i nÄƒng tráº» MU, Keeley Hazell - siÃªu máº«u ná»•i tiáº¿ng nÆ°á»›c Anh - thÆ°á»ng xuyÃªn xuáº¥t hiá»‡n trÃªn khÃ¡n Ä‘Ã i sÃ¢n Old Trafford thá»i gian gáº§n Ä‘Ã¢y. CÃ´ lÃ  ngÆ°á»i phá»¥ ná»¯ háº¥p dáº«n thá»© hai tháº¿ giá»›i do táº¡p chÃ­ FHM bÃ¬nh chá»n.</p>', '<table cellspacing="0" cellpadding="3" width="390" align="center" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td class="Image" align="center">&nbsp;<img height="475" alt="" width="350" border="0" src="http://vnexpress.net/Vietnam/The-thao/Chan-dung/2007/12/3B9FDD5B/q13.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center">&nbsp;<img height="523" alt="" width="350" border="0" src="http://vnexpress.net/Vietnam/The-thao/Chan-dung/2007/12/3B9FDD5B/q16.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center">&nbsp;<img height="531" alt="" width="350" border="0" src="http://vnexpress.net/Vietnam/The-thao/Chan-dung/2007/12/3B9FDD5B/q12.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center">&nbsp;<img height="532" alt="" width="350" border="0" src="http://vnexpress.net/Vietnam/The-thao/Chan-dung/2007/12/3B9FDD5B/q15.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center">&nbsp;<img height="529" alt="" width="350" border="0" src="http://vnexpress.net/Vietnam/The-thao/Chan-dung/2007/12/3B9FDD5B/q10.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center">&nbsp;<img height="636" alt="" width="350" border="0" src="http://vnexpress.net/Vietnam/The-thao/Chan-dung/2007/12/3B9FDD5B/q7.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center"><img height="458" alt="" width="350" border="0" src="http://vnexpress.net/Vietnam/The-thao/Chan-dung/2007/12/3B9FDD5B/q9.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center"><img height="228" alt="" width="380" border="0" src="http://vnexpress.net/Vietnam/The-thao/Chan-dung/2007/12/3B9FDD5B/q2.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center">&nbsp;<img height="247" alt="" width="380" border="0" src="http://vnexpress.net/Vietnam/The-thao/Chan-dung/2007/12/3B9FDD5B/q8.jpg" /></td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p class="Normal" align="right"><strong>HÃ  UyÃªn</strong></p>', '6.jpg', 'ChÃ¹m áº£nh ná»¯ CÄV Ä‘áº·c biá»‡t cá»§a Nani', 4, 1, 1, '2008-01-18 16:25:46', '2008-01-18 16:25:46', 0),
(7, 'áº¢nh siÃªu máº«u ngá»±c tráº§n mÃ  Maradona si mÃª', '<p class="Lead">Gáº·p gá»¡ rá»“i mÃª Ä‘áº¯m sáº¯c Ä‘áº¹p cá»§a Evangelina Anderson, huyá»n thoáº¡i bÃ³ng Ä‘Ã¡ Argentina tá»«ng tá»± Ä‘á»©ng ra tá»• chá»©c lá»… má»«ng sinh nháº­t táº¡i má»™t sÃ n nháº£y cho siÃªu máº«u chuyÃªn chá»¥p áº£nh nÃ³ng nÃ y, cÃ¡ch Ä‘Ã¢y vÃ i nÄƒm. </p>', '<table cellspacing="0" cellpadding="3" width="366" align="center" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td align="center">&nbsp;<img height="426" width="300" border="0" alt="" src="http://vnexpress.net/Vietnam/The-thao/Chan-dung/2008/01/3B9FE7D2/q3.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td align="center">&nbsp;<img height="475" width="300" border="0" alt="" src="http://vnexpress.net/Vietnam/The-thao/Chan-dung/2008/01/3B9FE7D2/q14.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td align="center">&nbsp;<img height="462" width="300" border="0" alt="" src="http://vnexpress.net/Vietnam/The-thao/Chan-dung/2008/01/3B9FE7D2/q12.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td align="center">&nbsp;<img height="452" width="300" border="0" alt="" src="http://vnexpress.net/Vietnam/The-thao/Chan-dung/2008/01/3B9FE7D2/q15.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td align="center">&nbsp;<img height="246" width="390" border="0" alt="" src="http://vnexpress.net/Vietnam/The-thao/Chan-dung/2008/01/3B9FE7D2/q1.jpg" /></td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p class="Normal" align="right"><strong>HÃ  UyÃªn</strong></p>', '7.jpg', 'Chuyá»‡n tÃ¬nh cáº£m giá»¯a Evangelina vá»›i Maradona thá»i gian Ä‘Ã³ lÃ m sÃ´i Ä‘á»™ng cáº£ Argentina nhÆ°ng khÃ´ng Ä‘i Ä‘áº¿n Ä‘Ã¢u. Giá» cÃ´ Ä‘ang cáº·p kÃ¨ vá»›i Martin Demichelis - trung vá»‡ Ä‘iá»ƒn trai cá»§a Bayern Munich. ', 4, 1, 1, '2008-01-18 16:27:36', '2008-01-18 16:27:36', 0),
(8, 'Sharapova Ä‘ua sáº¯c vá»›i biá»ƒn trong trang phá»¥c Ã¡o táº¯m', '<p class="Lead">Máº¡nh máº½ trÃªn sÃ¢n Ä‘áº¥u quáº§n vá»£t, duyÃªn dÃ¡ng ngoÃ i Ä‘á»i thÆ°á»ng, Sharapova cÃ²n hÃºt há»“n ngÆ°á»i hÃ¢m má»™ báº±ng váº» quyáº¿n rÅ© khi khoe váº» Ä‘áº¹p trÆ°á»›c biá»ƒn, cÃ¹ng vá»›i sÃ³ng, cÃ¡t, náº¯ng vÃ  giÃ³. Bá»™ sÆ°u táº­p Ã¡o táº¯m cá»§a táº¡p chÃ­ ná»•i tiáº¿ng Sports Illustrated (SI) giá» Ä‘Ã£ Æ°u tiÃªn hÃ¬nh áº£nh cá»§a cÃ´, thay vÃ¬ <a class="Lead" href="http://vnexpress.net/Vietnam/The-thao/Tennis/2004/02/3B9CFAA5/">Kournikova nhÆ° trÆ°á»›c</a>.</p>', '<table cellspacing="0" cellpadding="3" width="359" align="center" bgcolor="#e8f8ff" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td class="Image" align="center"><img height="277" alt="" width="350" border="1" src="http://vnexpress.net/Vietnam/The-thao/2006/10/3B9EF814/06_msharapova_07.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center"><img height="260" alt="" width="350" border="1" src="http://vnexpress.net/Vietnam/The-thao/2006/10/3B9EF814/shara2.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center"><img height="246" alt="" width="350" border="1" src="http://vnexpress.net/Vietnam/The-thao/2006/10/3B9EF814/06_msharapova_19.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center"><img height="235" alt="" width="350" border="1" src="http://vnexpress.net/Vietnam/The-thao/2006/10/3B9EF814/06_msharapova_20.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center"><img height="228" alt="" width="350" border="1" src="http://vnexpress.net/Vietnam/The-thao/2006/10/3B9EF814/06_msharapova_22.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center"><img height="264" alt="" width="350" border="1" src="http://vnexpress.net/Vietnam/The-thao/2006/10/3B9EF814/06_msharapova_01.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center"><img height="450" alt="" width="300" border="0" src="http://vnexpress.net/Vietnam/The-thao/2006/10/3B9EF814/06_msharapova_14.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center"><img height="450" alt="" width="300" border="0" src="http://vnexpress.net/Vietnam/The-thao/2006/10/3B9EF814/06_msharapova_16.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center"><img height="450" alt="" width="300" border="0" src="http://vnexpress.net/Vietnam/The-thao/2006/10/3B9EF814/06_msharapova_21.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center"><img height="378" alt="" width="300" border="0" src="http://vnexpress.net/Vietnam/The-thao/2006/10/3B9EF814/06_msharapova_08.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center"><img height="377" alt="" width="300" border="0" src="http://vnexpress.net/Vietnam/The-thao/2006/10/3B9EF814/shara3.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center"><img height="373" alt="" width="300" border="0" src="http://vnexpress.net/Vietnam/The-thao/2006/10/3B9EF814/shara4.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center"><img height="374" alt="" width="300" border="0" src="http://vnexpress.net/Vietnam/The-thao/2006/10/3B9EF814/shara5.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center"><img height="376" alt="" width="300" border="0" src="http://vnexpress.net/Vietnam/The-thao/2006/10/3B9EF814/shara6.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center"><img height="374" alt="" width="300" border="0" src="http://vnexpress.net/Vietnam/The-thao/2006/10/3B9EF814/shara7.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center"><img height="450" alt="" width="300" border="0" src="http://vnexpress.net/Vietnam/The-thao/2006/10/3B9EF814/shara8.jpg" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="BreakLine" align="center" bgcolor="#ffffff"><font color="#ffffff">&nbsp;</font></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="Image" align="center" bgcolor="#ffffff"><a class="PnLTitle" href="http://vnexpress.net/Vietnam/The-thao/Tennis/2004/02/3B9CFAA5/"><font color="#800080">* ''MÃ¡t máº»'' cÃ¹ng Anna Kournikova vÃ  Serena Williams</font></a></td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p class="Normal" align="right"><strong>T.H.</strong> (theo <em>CNN</em>)</p>', '8.jpg', 'Sharapova Ä‘ua sáº¯c vá»›i biá»ƒn trong trang phá»¥c Ã¡o táº¯m', 4, 1, 1, '2008-01-18 16:31:18', '2008-01-18 16:31:18', 0);

-- --------------------------------------------------------

--
-- Table structure for table `newscategory`
--

DROP TABLE IF EXISTS `newscategory`;
CREATE TABLE IF NOT EXISTS `newscategory` (
  `Id` int(10) NOT NULL auto_increment,
  `Name` varchar(255) collate latin1_general_ci default NULL,
  `Position` int(10) default NULL,
  `Status` int(2) default '1',
  `RootId` int(10) default '0',
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `newscategory`
--

INSERT INTO `newscategory` (`Id`, `Name`, `Position`, `Status`, `RootId`) VALUES
(1, 'PhÃ¡p luáº­t', 1, 1, 0),
(2, 'Tháº¿ giá»›i', 2, 1, 1),
(3, 'Trong nÆ°á»›c', 1, 1, 1),
(4, 'XÃ£ há»™i', 3, 1, 0),
(5, 'Kinh táº¿', 2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `Id` int(10) NOT NULL auto_increment,
  `CreateDate` datetime default NULL,
  `PayDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `Status` int(2) default '0',
  `Money` double default NULL,
  `memberId` int(10) default NULL,
  `Address` text,
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Id`, `CreateDate`, `PayDate`, `Status`, `Money`, `memberId`, `Address`) VALUES
(1, '2008-02-15 11:45:42', '2008-02-15 11:45:42', 1, 460000, 1, '19h ngÃ y 15 thÃ¡ng 2 nÄƒm 2008, táº¡i 11A ngÃµ 46 Äá»™i Cáº¥n - Ba ÄÃ¬nh - HÃ  Ná»™i'),
(2, '2008-02-24 16:10:56', '2008-02-24 16:10:56', 1, 425700, 16, '18h ngÃ y 24 thÃ¡ng 2 nÄƒm 2008, táº¡i Cáº§u Diá»…n, HÃ  Ná»™i'),
(3, '2008-02-24 16:12:28', '2008-02-24 16:12:28', 1, 522500, 16, '18h ngÃ y 24 thÃ¡ng 2 nÄƒm 2008, táº¡i Cáº§u Diá»…n'),
(4, '2008-02-24 16:32:22', '2008-02-24 16:32:22', 1, 522500, 17, '19h ngÃ y 24 thÃ¡ng 2 nÄƒm 2008, táº¡i Cáº§u Diá»…n'),
(5, '2008-02-24 16:39:22', '2008-02-24 16:39:22', 1, 792500, 17, '0h ngÃ y 24 thÃ¡ng 2 nÄƒm 2008, táº¡i Cáº§u Diá»…n'),
(6, '2008-02-25 08:10:09', '2008-02-25 08:10:09', 1, 4700, 1, '0h ngÃ y 25 thÃ¡ng 2 nÄƒm 2008, táº¡i ha noi');

-- --------------------------------------------------------

--
-- Table structure for table `ordersdetail`
--

DROP TABLE IF EXISTS `ordersdetail`;
CREATE TABLE IF NOT EXISTS `ordersdetail` (
  `Id` int(10) NOT NULL auto_increment,
  `Quantity` int(10) default NULL,
  `ordersId` int(10) default NULL,
  `productId` int(10) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `ordersdetail`
--

INSERT INTO `ordersdetail` (`Id`, `Quantity`, `ordersId`, `productId`) VALUES
(2, 40, 1, 162),
(1, 1, 2, 293),
(3, 1, 2, 179),
(4, 1, 2, 41),
(5, 1, 2, 162),
(6, 1, 2, 165),
(7, 1, 2, 285),
(8, 1, 2, 282),
(9, 1, 3, 286),
(10, 1, 3, 288),
(11, 1, 4, 288),
(12, 1, 4, 286),
(13, 2, 5, 288),
(14, 1, 5, 286),
(15, 1, 6, 165);

-- --------------------------------------------------------

--
-- Table structure for table `percent`
--

DROP TABLE IF EXISTS `percent`;
CREATE TABLE IF NOT EXISTS `percent` (
  `Id` int(10) NOT NULL auto_increment,
  `Point` int(10) default NULL,
  `Percent` double default NULL,
  `Loop` int(10) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `percent`
--

INSERT INTO `percent` (`Id`, `Point`, `Percent`, `Loop`) VALUES
(1, 500, 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `Id` int(10) NOT NULL auto_increment,
  `Name` varchar(255) collate latin1_general_ci default NULL,
  `Code` varchar(255) collate latin1_general_ci default NULL,
  `Description` text collate latin1_general_ci,
  `Detail` text collate latin1_general_ci,
  `Image` varchar(255) collate latin1_general_ci default NULL,
  `ImageNote` text collate latin1_general_ci,
  `Status` int(2) default '1',
  `Views` int(10) default '0',
  `Orders` int(10) default '0',
  `Price` varchar(255) collate latin1_general_ci default NULL,
  `PriceQTM` varchar(255) collate latin1_general_ci default '0',
  `HotProduct` int(2) default NULL,
  `CreateDate` datetime default NULL,
  `ModifyDate` datetime default NULL,
  `categoryId` int(10) default NULL,
  `unitId` int(10) default '0',
  `currencyId` int(10) default '0',
  `providerId` int(10) default '0',
  `manufacturerId` int(10) default '0',
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=300 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Id`, `Name`, `Code`, `Description`, `Detail`, `Image`, `ImageNote`, `Status`, `Views`, `Orders`, `Price`, `PriceQTM`, `HotProduct`, `CreateDate`, `ModifyDate`, `categoryId`, `unitId`, `currencyId`, `providerId`, `manufacturerId`) VALUES
(11, 'Dáº§u gá»™i Clear men', NULL, 'Dáº§u gá»™i Clear men', 'Dáº§u gá»™i Clear men', '11.jpg', '', 1, 5, 0, '60000', '58500', 0, '2008-01-27 12:49:59', '2008-01-27 12:49:59', 57, 4, 2, 1, 0),
(10, 'Dáº§u gá»™i Clear men', NULL, 'Dáº§u gá»™i Clear men Ä‘áº·c biá»‡t dÃ nh cho phÃ¡i nam', 'Dáº§u gá»™i Clear men vá»›i nhá»¯ng dÆ°á»¡ng cháº¥t dÃ nh riÃªng cho phÃ¡i nam giÃºp chÄƒm sÃ³c mÃ¡i tÃ³c tá»« gá»‘c Ä‘áº¿n ngá»n', '10.jpg', '', 1, 2, 0, '35000', '33000', 0, '2008-01-27 12:17:30', '2008-01-27 12:17:30', 57, 4, 2, 1, 0),
(9, 'Dáº§u gá»™i trá»‹ gáº§u Clear báº¡c hÃ ', NULL, 'Dáº§u gá»™i trá»‹ gáº§u Clear báº¡c hÃ  sáº£ng khoÃ¡i vá»›i cáº£m giÃ¡c mÃ¡t láº¡nh', 'Dáº§u gá»™i trá»‹ gáº§u Clear báº¡c hÃ  cung cáº¥p Vitamin vÃ  dÆ°á»¡ng cháº¥t báº¡c hÃ  cho mÃ¡i tÃ³c sáº¡ch gÃ u vÃ  luÃ´n bÃ³ng mÆ°á»£t', '9.jpg', '', 1, 1, 0, '56000', '54000', 0, '2008-01-27 12:11:45', '2008-01-27 12:11:45', 57, 4, 2, 1, 0),
(5, 'Sá»¯a táº¯m Romano classic', NULL, 'Sá»¯a táº¯m Romano classic giá»¯ áº©m da', 'Sá»¯a táº¯m Romano classic giá»¯ áº©m da', '5.jpg', '', 1, 1, 0, '99000', '96000', 0, '2008-01-27 11:39:43', '2008-01-27 11:39:43', 60, 4, 2, 1, 0),
(6, 'Dáº§u gá»™i Enchanteur', NULL, 'Dáº§u gá»™i Enchanteur Charming', 'Dáº§u gá»™i Enchanteur Charming', '6.jpg', '', 1, 3, 0, '99000', '94000', 0, '2008-01-27 11:41:54', '2008-01-27 11:41:54', 57, 4, 2, 1, 0),
(7, 'XÃ  bÃ´ng Romano', NULL, 'XÃ  bÃ´ng Romano', 'XÃ  bÃ´ng Romano', '7.jpg', '', 1, 9, 0, '13000', '12500', 0, '2008-01-27 11:44:23', '2008-01-27 11:44:23', 56, 3, 2, 1, 0),
(8, 'Dáº§u gá»™i trá»‹ gáº§u Clear báº¡c hÃ ', NULL, 'Dáº§u gá»™i trá»‹ gáº§u Clear báº¡c hÃ  sáº£ng khoÃ¡i vá»›i cáº£m giÃ¡c mÃ¡t láº¡nh', 'Vitamin ACE vÃ  báº¡c hÃ  giÃºp mang láº¡i cáº£m giÃ¡c mÃ¡t láº¡nh vÃ  mÃ¡i tÃ³c sáº¡ch gÃ u bÃ³ng mÆ°á»£t', '8.jpg', '', 1, 10, 0, '32000', '30000', 2, '2008-01-27 11:48:31', '2008-01-27 11:48:31', 57, 4, 2, 1, 0),
(1, 'XÃ  bÃ´ng Camay', 'A1', 'Má»—i sáº£n pháº©m Camay sáº½ mang láº¡i cho báº¡n má»™t phong cÃ¡ch má»›i. Hay dÃ¹ng vÃ  cáº£m nháº­n', 'Tinh cháº¥t hoa há»“ng mang láº¡i hÆ°Æ¡ng thÆ¡m ná»“ng nÃ n, sáº£n pháº©m khÃ´ng gÃ¢y dÃ­t da, nhá»n da...', '1.jpg', '', 1, 10, 0, '7000', '6500', 0, '2008-01-27 11:06:03', '2008-02-01 00:04:47', 56, 1, 2, 1, 0),
(2, 'Dáº§u gá»™i Romano Icy Cool', '2', 'Dáº§u gá»™i Romano Icy Cool cao cáº¥p', 'Dáº§u gá»™i Romano Icy Cool cao cáº¥p', '2.jpg', '', 1, 4, 0, '35000', '33000', 0, '2008-01-27 11:19:29', '2008-01-30 21:19:34', 57, 4, 2, 1, 0),
(3, 'MÃ¬ kim chi heo', 'ALOHA', 'MÃ¬ kim chi heo', 'MÃ¬ kim chi heo', '3.jpg', '', 1, 8, 0, '3000', '2800', 0, '2008-01-27 11:23:25', '2008-02-18 08:59:11', 45, 4, 2, 1, 0),
(4, 'Dáº§u gá»™i Romano trá»‹ gÃ u', NULL, 'Dáº§u gá»™i Romano trá»‹ gÃ u chiáº¿t xuáº¥t tá»« báº¡c hÃ  mang láº¡i cáº£m giÃ¡c mÃ¡t láº¡nh Ä‘áº¿n báº¥t ngá»', 'Dáº§u gá»™i Romano trá»‹ gÃ u, chiáº¿t xuáº¥t báº¡c hÃ .', '4.jpg', '', 1, 1, 0, '34500', '33000', 0, '2008-01-27 11:34:28', '2008-01-27 11:36:14', 57, 4, 2, 1, 0),
(12, 'Gel Romano Pro series', NULL, 'GiÃºp báº¡n táº¡o nhá»¯ng kiá»ƒu tÃ³c thá»i trang nháº¥t trong thá»i gian ngáº¯n nháº¥t', 'Gel Romano Pro series 50g', '12.jpg', '', 1, 4, 0, '14500', '14000', 2, '2008-01-28 13:46:38', '2008-01-28 13:55:17', 62, 10, 2, 1, 0),
(13, 'Dáº§u gá»™i Ä‘áº§u X Men', NULL, 'Dáº§u gá»™i cho phÃ¡i máº¡nh', 'Dáº§u gá»™i X-Men 400ml', '13.jpg', '', 1, 1, 0, '59000', '56000', 2, '2008-01-28 14:00:46', '2008-01-28 14:00:46', 57, 4, 2, 1, 0),
(14, 'Dáº§u gá»™i X men sport 200ml', NULL, 'Phong cÃ¡ch má»›i. Phong cÃ¡ch thá»ƒ thao', 'Dáº§u gá»™i X-men sport 200ml', '14.jpg', '', 1, 0, 0, '35000', '34000', 0, '2008-01-28 14:16:52', '2008-01-28 14:16:52', 57, 2, 2, 1, 0),
(15, 'Gel Taft styling', NULL, 'GiÃºp báº¡n táº¡o nhá»©ng kiá»ƒu tÃ³c thá»i trang nháº¥t', 'Gel Taft styling', '15.jpg', '', 1, 0, 0, '12000', '11000', 0, '2008-01-28 14:26:07', '2008-01-28 14:26:07', 62, 10, 2, 1, 0),
(16, 'Dáº§u gá»™i Xmen Boss', NULL, 'Dáº§u gá»™i Xmen Boss. Dáº§u gá»™i Ä‘áº§u dÃ nh cho phÃ¡i máº¡nh', 'Dáº§u gá»™i Xmen Boss 200ml', '16.jpg', '', 1, 0, 0, '40000', '38000', 0, '2008-01-28 17:22:31', '2008-01-28 17:22:31', 57, 4, 2, 1, 0),
(17, 'Thuá»‘c nhuá»™m Double Rich Blooming', NULL, 'Double Rich Blooming sáº½ giÃºp báº¡n táº¡o ra phong cÃ¡ch má»›i cho mÃ¡i tÃ³c', 'Thuá»‘c nhuá»™m Double Rich Blooming', '17.jpg', '', 1, 0, 0, '85000', '83000', 0, '2008-01-28 17:40:19', '2008-01-28 17:40:19', 63, 2, 2, 1, 0),
(18, 'Dáº§u gá»™i Double rich trá»‹ gÃ u', NULL, 'Dáº§u gá»™i Double rich dÃ nh cho tÃ³c gÃ u', 'Dáº§u gá»™i Double rich trá»‹ gÃ u 200ml', '18.jpg', '', 1, 0, 0, '27000', '26000', 2, '2008-01-28 17:43:05', '2008-01-28 17:43:05', 57, 4, 2, 1, 0),
(19, 'Dáº§u gá»™i double má»m muá»£t', 'A2', 'Dáº§u gá»™i double má»m muá»£t dÃ nh cho tÃ³c thÆ°á»ng', 'Dáº§u gá»™i double má»m muá»£t 200ml', '19.jpg', '', 1, 0, 0, '27000', '26000', 0, '2008-01-28 17:45:26', '2008-02-24 19:43:05', 57, 4, 2, 1, 0),
(20, 'Dáº§u xáº£ Double Rich phá»¥c há»“i tÃ³c', NULL, 'Dáº§u xáº£ Double Rich phá»¥c há»“i tÃ³c dÃ nh cho tÃ³c bá»‹ hÆ° tá»•n', 'Dáº§u xáº£ Double Rich phá»¥c há»“i tÃ³c 400ml', '20.jpg', '', 1, 0, 0, '52000', '50000', 0, '2008-01-28 17:51:26', '2008-01-28 17:51:26', 61, 4, 2, 1, 0),
(21, 'Dáº§u gá»™i Double Rich nuÃ´i dÆ°á»¡ng tÃ³c', NULL, 'Dáº§u gá»™i Double Rich nuÃ´i dÆ°á»¡ng tÃ³c giÃºp phÃºc há»“i tÃ³c bá»‹ hÆ° tá»•n vÃ  chÄƒm sÃ³c tÃ³c tá»« gá»‘c Ä‘áº¿n ngá»n', 'Dáº§u gá»™i Double Rich nuÃ´i dÆ°á»¡ng tÃ³c 600ml', '21.jpg', '', 1, 5, 0, '70000', '67000', 2, '2008-01-28 17:55:01', '2008-01-28 17:55:01', 57, 4, 2, 1, 0),
(22, 'Gel Double Rich táº¡o kiá»ƒu tÃ³c for men', NULL, 'Gel Double Rich táº¡o kiá»ƒu tÃ³c dÃ nh riÃªng cho phÃ¡i máº¡nh', 'Gel Double Rich táº¡o kiá»ƒu tÃ³c for men 250ml', '22.jpg', '', 1, 0, 0, '55000', '53000', 2, '2008-01-28 17:56:49', '2008-01-28 17:56:49', 62, 4, 2, 1, 0),
(23, 'Dáº§u gá»™i Double Rich phá»¥c há»“i nuÃ´i dÆ°á»¡ng tÃ³c', NULL, 'Dáº§u gá»™i Double Rich phá»¥c há»“i tÃ³c nuÃ´i dÆ°á»¡ng tÃ³c giÃºp chÄƒm sÃ³c vÃ  phá»¥c há»“i nhá»¯ng pháº§n tÃ³c bá»‹ hÆ° tá»•n', 'Dáº§u gá»™i Double Rich phá»¥c há»“i tÃ³c 600ml', '23.jpg', '', 1, 0, 0, '70000', '67000', 2, '2008-01-28 17:58:43', '2008-01-28 17:58:43', 57, 4, 2, 1, 0),
(24, 'Sá»¯a táº¯m Double Rich hoa há»“ng', NULL, 'Sá»¯a táº¯m Double Rich hoa há»“ng giÃºp giá»¯ áº©m vÃ  mang láº¡i lÃ n da má»m máº¡i quyáº¿n rÅ©', 'Sá»¯a táº¯m Double Rich hoa há»“ng 200ml', '24.jpg', '', 1, 6, 1, '25000', '24000', 2, '2008-01-28 18:00:51', '2008-01-28 18:00:51', 60, 4, 2, 1, 0),
(25, 'Dáº§u gá»™i Double Rich suÃ´n mÆ°á»£t', NULL, 'Dáº§u gá»™i Double Rich suÃ´n mÆ°á»£t vÃ  dÆ°á»¡ng áº©m chÄƒm sÃ³c mÃ¡i tÃ³c tá»« gá»‘c Ä‘áº¿n ngá»n', 'Dáº§u gá»™i Double Rich suÃ´n mÆ°á»£t 400ml', '25.jpg', '', 1, 0, 0, '52000', '50000', 2, '2008-01-28 18:03:13', '2008-01-28 18:03:13', 57, 4, 2, 1, 0),
(26, 'Gel vuá»‘t tÃ³c Double rich dÃ nh cho tÃ³c tháº³ng', NULL, 'Gel vuá»‘t tÃ³c Double rich dÃ nh cho tÃ³c tháº³ng, giÃºp táº¡o kiá»ƒu tÃ³c theo Ã½ muá»‘n', 'Gel vvuá»‘t tÃ³c Double rich dÃ nh cho tÃ³c tháº³ng 250ml', '26.jpg', '', 1, 0, 0, '55000', '53000', 2, '2008-01-28 18:06:06', '2008-01-28 18:06:06', 62, 4, 2, 1, 0),
(27, 'Gel vuá»‘t tÃ³c Double rich dÃ nh cho tÃ³c uá»‘n', NULL, 'Gel vuá»‘t tÃ³c Double rich dÃ nh cho tÃ³c uá»‘n giÃºp giá»¯ náº¿p tÃ³c vÃ  táº¡o kiá»ƒu tÃ³c theo Ã½ muá»‘n', 'Gel vuá»‘t tÃ³c Double rich dÃ nh cho tÃ³c uá»‘n 250ml', '27.jpg', '', 1, 0, 0, '55000', '53000', 2, '2008-01-28 18:08:57', '2008-01-28 18:08:57', 62, 4, 2, 1, 0),
(28, 'Dáº§u xáº£ dÆ°á»¡ng tÃ³c Double Rich', NULL, 'Dáº§u xáº£ dÆ°á»¡ng tÃ³c Double Rich giÃºp chÄƒm sÃ³c mÃ¡i tÃ³c suÃ´n mÆ°á»£t tá»« gá»‘c Ä‘áº¿n ngá»n', 'Dáº§u xáº£ dÆ°á»¡ng tÃ³c Double Rich 80ml', '28.jpg', '', 1, 0, 0, '15000', '14500', 2, '2008-01-28 18:11:09', '2008-01-28 18:11:09', 61, 10, 2, 1, 0),
(29, 'Sá»¯a táº¯m Double Rich táº£o biá»ƒn', NULL, 'Sá»¯a táº¯m Double Rich táº£o biá»ƒn vá»›i tinh cháº¥t táº£o biá»ƒn giÃºp giá»¯ áº©m vÃ  lÃ m má»m da Ä‘áº·c biá»‡t vá»›i lÃ n da nháº¡y cáº£m', 'Sá»¯a táº¯m Double Rich táº£o biá»ƒn 200', '29.jpg', '', 1, 2, 0, '25000', '24000', 2, '2008-01-28 18:13:31', '2008-01-28 18:13:31', 60, 4, 2, 1, 0),
(30, 'Gel bá»t Double rich giá»¯ náº¿p tÃ³c', NULL, 'Gel bá»t Double rich giÃºp táº¡o náº¿p tÃ³c theo Ã½ muá»‘n', 'Gel bá»t Double rich giá»¯ náº¿p tÃ³c 150ml', '30.jpg', '', 1, 0, 0, '48000', '46000', 2, '2008-01-28 18:17:58', '2008-01-28 18:17:58', 62, 4, 2, 1, 0),
(31, 'NÆ°á»›c dÆ°á»¡ng tÃ³c Double rich', NULL, 'NÆ°á»›c dÆ°á»¡ng tÃ³c Double rich giÃºp báº¡n chÄƒm sÃ³c tÃ³c chuyÃªn nghiá»‡p', 'NÆ°á»›c dÆ°á»¡ng tÃ³c Double rich 250ml', '31.jpg', '', 1, 0, 0, '58000', '56000', 2, '2008-01-28 18:21:04', '2008-01-28 18:21:04', 62, 4, 2, 1, 0),
(32, 'NÆ°á»›c dÆ°á»¡ng tÃ³c Double rich', NULL, 'NÆ°á»›c dÆ°á»¡ng tÃ³c Double rich dÃ nh cho tÃ³c khÃ´ vÃ  cháº» ngá»n', 'NÆ°á»›c dÆ°á»¡ng tÃ³c Double rich 250ml', '32.jpg', '', 1, 0, 0, '58000', '56000', 2, '2008-01-28 18:26:26', '2008-01-28 18:26:26', 62, 4, 2, 1, 0),
(33, 'Dáº§u háº¥p tÃ³c Double Rich', NULL, 'Báº¡n cÃ³ thá»ƒ háº¥p dáº§u ngay táº¡i nhÃ  vá»›i dáº§u háº¥p tÃ³c suÃ´n mÆ°á»£t cá»§a Double Rich', 'Dáº§u háº¥p tÃ³c Double Rich 50gr', '33.jpg', '', 1, 0, 0, '50000', '48000', 2, '2008-01-28 18:50:46', '2008-01-28 18:50:46', 61, 2, 2, 1, 0),
(34, 'Kem háº¥p dáº§u cho tÃ³c Ã³ng áº£ Double Rich', NULL, 'Kem háº¥p dáº§u cho tÃ³c Ã³ng áº£ Double Rich. Phong cÃ¡ch chÄƒm sÃ³c tÃ³c chuyÃªn nghiá»‡p dÃ nh cho báº¡n', 'Kem háº¥p dáº§u cho tÃ³c Ã³ng áº£ Double Rich 50ml', '34.jpg', '', 1, 3, 0, '50000', '48000', 2, '2008-01-28 18:52:30', '2008-01-28 18:52:30', 61, 4, 2, 1, 0),
(35, 'Dáº§u gá»™i Sunsilk trá»‹ gáº§u', NULL, 'Tá»± tin vá»›i mÃ¡i tÃ³c sáº¡ch gÃ u nhá» dáº§u gá»™i Sunsilk trá»‹ gáº§u @_@', 'Dáº§u gá»™i Sunsilk trá»‹ gáº§u 200g', '35.jpg', '', 1, 0, 0, '20000', '19500', 2, '2008-01-28 18:54:36', '2008-01-28 18:54:36', 57, 4, 2, 1, 0),
(36, 'Dáº§u gá»™i Sunsilk Ä‘en Ã³ng áº£', NULL, 'MÃ¡i tÃ³c Ã³ng áº£ vá»›i dáº§u gá»™i Sunsilk Ä‘en Ã³ng áº£ ^_^', 'Dáº§u gá»™i Sunsilk Ä‘en Ã³ng áº£ 400g', '36.jpg', '', 1, 0, 0, '35000', '34000', 2, '2008-01-28 18:56:02', '2008-01-28 18:56:02', 57, 4, 2, 1, 0),
(37, 'Dáº§u gá»™i Dove tháº³ng mÆ°á»£t mÃ ', NULL, 'HÃ£y nuÃ´i dÆ°á»¡ng vÃ  giá»¯ áº©m cho mÃ¡i tÃ³c vá»›i dáº§u gá»™i Dove tháº³ng mÆ°á»£t mÃ ', 'Dáº§u gá»™i Dove tháº³ng mÆ°á»£t mÃ  400g', '37.jpg', '', 1, 4, 0, '49000', '46500', 2, '2008-01-28 18:58:00', '2008-01-28 18:58:00', 57, 4, 2, 1, 0),
(38, 'Dáº§u gá»™i Dove phá»¥c há»“i tÃ³c hÆ° tá»•n', NULL, 'HÃ£y chÄƒm sÃ³c mÃ¡i tÃ³c bá»‹ hÆ° tá»•n vá»›i dáº§u gá»™i Dove phá»¥c há»“i tÃ³c hÆ° tá»•n', 'Dáº§u gá»™i Dove phá»¥c há»“i tÃ³c hÆ° tá»•n 700ml', '38.jpg', '', 1, 1, 0, '75000', '73000', 2, '2008-01-28 18:59:21', '2008-01-28 18:59:21', 57, 4, 2, 1, 0),
(39, 'Bá»™t giáº·t Omo hÆ°Æ¡ng ngÃ n hoa', NULL, 'Quáº§n Ã¡o tráº¯ng sáº¡ch vÃ  ngÃ¡t hÆ°Æ¡ng thÆ¡m vá»›i bá»™t giáº·t Omo hÆ°Æ¡ng ngÃ n hoa', 'Bá»™t giáº·t Omo hÆ°Æ¡ng ngÃ n hoa', '39.jpg', '', 1, 1, 0, '18500', '18000', 2, '2008-01-28 19:03:49', '2008-01-28 19:05:20', 55, 9, 2, 1, 0),
(40, 'Bá»™t giáº­t Omo matic', NULL, 'Bá»™t giáº­t Omo matic sáº£n pháº©m dÃ nh riÃªng cho mÃ¡y giáº·t', 'Bá»™t giáº­t Omo matic 3kg', '40.jpg', '', 1, 8, 0, '80000', '78500', 2, '2008-01-28 19:08:42', '2008-01-28 19:08:42', 55, 2, 2, 1, 0),
(41, 'Miáº¿n sáº¡ch 200g', NULL, 'Miáº¿n sáº¡ch dai thÆ¡m ngon, khÃ´ng hÃ³a cháº¥t', 'Miáº¿n sáº¡ch 200g', '41.jpg', '', 1, 3, 1, '5500', '5000', 2, '2008-01-28 19:12:00', '2008-01-30 11:34:58', 44, 9, 2, 1, 0),
(42, 'BÄƒng vá»‡ sinh superguard', NULL, 'LuÃ´n tá»± tin vÃ o ngÃ y áº¥y vá»›i bÄƒng vá»‡ sinh superguard', 'BÄƒng vá»‡ sinh superguard', '42.jpg', '', 1, 5, 0, '14500', '14000', 2, '2008-01-28 19:16:47', '2008-01-28 19:16:47', 64, 7, 2, 1, 0),
(43, 'BÄƒng vá»‡ sinh Dianna Soft', NULL, 'BÄƒng vá»‡ sinh Dianna Soft giÃºp báº¡n luÃ´n tá»± tin trong nhá»¯ng ngÃ y áº¥y', 'BÄƒng vá»‡ sinh Dianna Soft', '43.jpg', '', 1, 0, 0, '8000', '7500', 2, '2008-01-28 19:19:37', '2008-01-28 19:19:37', 64, 7, 2, 1, 0),
(44, 'BÄƒng vá»‡ sinh Kotex freedom maxi cÃ³ cÃ¡nh', NULL, 'BÄƒng vá»‡ sinh Kotex freedom maxi cÃ³ cÃ¡nh khÃ´ thoÃ¡ng vÃ  khÃ´ng tháº¥m ngÆ°á»£c trá»Ÿ láº¡i', 'BÄƒng vá»‡ sinh Kotex freedom maxi cÃ³ cÃ¡nh', '44.jpg', '', 1, 1, 0, '8500', '8200', 2, '2008-01-28 19:21:45', '2008-01-28 19:21:45', 64, 7, 2, 1, 0),
(45, 'BÄƒng vá»‡ sinh Laurier siÃªu má»ng cÃ¡nh', NULL, 'BÄƒng vá»‡ sinh Laurier siÃªu má»ng cÃ¡nh giÃºp báº¡n luÃ´n tá»± tin vÃ o nhá»¯ng ngÃ y áº¥y', 'BÄƒng vá»‡ sinh Laurier siÃªu má»ng cÃ¡nh', '45.jpg', '', 1, 0, 0, '9000', '8700', 2, '2008-01-28 19:22:49', '2008-01-28 19:22:49', 64, 7, 2, 1, 0),
(46, 'BÄƒng vá»‡ sinh Diana siÃªu tháº¯m má»ng', NULL, 'BÄƒng vá»‡ sinh Diana siÃªu tháº¯m má»ng khÃ´ng tháº¥m ngÆ°á»£c trá»Ÿ láº¡i, khÃ´ thoÃ¡ng vÃ  dá»… chá»‹u', 'BÄƒng vá»‡ sinh Diana siÃªu tháº¯m má»ng', '46.jpg', '', 1, 1, 0, '7500', '7000', 2, '2008-01-28 19:24:38', '2008-01-28 19:24:38', 64, 7, 2, 1, 0),
(47, 'BÄƒng vá»‡ sinh Kotex hÃ ng ngÃ y siÃªu má»ng', NULL, 'BÄƒng vá»‡ sinh Kotex hÃ ng ngÃ y siÃªu má»ng giÃºp cho ngÃ y dÃ i luÃ´n khÃ´ thoÃ¡ng vÃ  sáº¡ch sáº½', 'BÄƒng vá»‡ sinh Kotex hÃ ng ngÃ y siÃªu má»ng', '47.jpg', '', 1, 2, 0, '6000', '5800', 2, '2008-01-28 19:27:03', '2008-01-28 21:37:20', 64, 2, 2, 1, 0),
(48, 'BÄƒng vá»‡ sinh Diana lÆ°á»›i 4 teen cÃ³ lÆ°á»›i', NULL, 'BÄƒng vá»‡ sinh Diana lÆ°á»›i 4 teen cÃ³ lÆ°á»›i sáº£n pháº©m dÃ nh riÃªng cho tuá»•i teel', 'BÄƒng vá»‡ sinh Diana lÆ°á»›i 4 teen cÃ³ lÆ°á»›i', '48.jpg', '', 1, 1, 0, '8500', '8000', 2, '2008-01-28 19:29:55', '2008-01-28 19:29:55', 64, 7, 2, 1, 0),
(49, 'BÄƒng vá»‡ sinh Kotex S tyle khÃ´ng cÃ¡nh', NULL, 'BÄƒng vá»‡ sinh Kotex S- tyle khÃ´ng cÃ¡nh giÃºp báº¡n luÃ´n tá»± tin trong nhá»¯ng ngÃ y áº¥y', 'BÄƒng vá»‡ sinh Kotex S- tyle khÃ´ng cÃ¡nh', '49.jpg', '', 1, 3, 0, '7000', '6800', 2, '2008-01-28 19:35:45', '2008-01-28 19:35:45', 64, 7, 2, 1, 0),
(50, 'CÃ  phÃª G7 3 in 1 Trung NguyÃªn 20 gÃ³i 17g', NULL, 'CÃ  phÃª G7 3 in 1 Trung NguyÃªn 20 gÃ³i 17g', 'CÃ  phÃª G7 3 in 1 Trung NguyÃªn 20 gÃ³i 17g', '50.jpg', '', 1, 3, 0, '25000', '24500', 2, '2008-01-28 21:44:12', '2008-01-28 21:44:12', 38, 2, 2, 1, 0),
(51, 'Khoai lang mÃ´n sáº¥y há»™p', NULL, 'Khoai lang mÃ´n sáº¥y há»™p hÆ°Æ¡ng vá»‹ tá»± nhiÃªn', 'Khoai lang mÃ´n sáº¥y há»™p 250g', '51.jpg', '', 1, 1, 0, '24000', '23000', 2, '2008-01-28 21:47:58', '2008-01-28 21:47:58', 66, 2, 2, 1, 0),
(52, 'MÃ­t sáº¥y khÃ´', NULL, 'MÃ­t sáº¥y khÃ´ hÆ°Æ¡ng vá»‹ tá»± nhiÃªn', 'MÃ­t sáº¥y khÃ´ lon 200g', '52.jpg', '', 1, 1, 0, '27500', '26500', 2, '2008-01-28 21:53:00', '2008-01-28 21:53:00', 66, 2, 2, 1, 0),
(53, 'BÃ¡nh trá»©ng Fudo', NULL, 'BÃ¡nh trá»©ng Fudo vá»‹ trá»©ng', 'BÃ¡nh trá»©ng Fudo vá»‹ trá»©ng', '53.jpg', '', 1, 0, 0, '32000', '32000', 2, '2008-01-28 21:54:37', '2008-01-28 21:54:37', 33, 2, 2, 1, 0),
(54, 'BÃ¡nh Trá»©ng Ymmmies', NULL, 'BÃ¡nh Trá»©ng Ymmmies', 'BÃ¡nh Trá»©ng Ymmmies', '54.jpg', '', 1, 0, 0, '29000', '28000', 0, '2008-01-28 21:58:52', '2008-01-28 21:58:52', 33, 2, 2, 1, 0),
(55, 'BÃ¡nh TrÃ ng An PhÃ¡p há»™p cÃ³ quai 384g', NULL, 'BÃ¡nh TrÃ ng An PhÃ¡p há»™p cÃ³ quai 384g', 'BÃ¡nh TrÃ ng An PhÃ¡p há»™p cÃ³ quai 384g', '55.jpg', '', 1, 0, 0, '26000', '25000', 2, '2008-01-28 22:01:30', '2008-01-28 22:01:30', 33, 2, 2, 1, 0),
(56, 'BÃ¡nh quy vÃ  crackers', NULL, 'BÃ¡nh quy vÃ  crakers', 'BÃ¡nh quy vÃ  crackers', '56.jpg', '', 1, 2, 0, '26000', '25000', 2, '2008-01-28 22:05:16', '2008-01-28 22:05:16', 33, 2, 2, 1, 0),
(57, 'Giáº¥y rÃºt Watersilk 100 tá»', NULL, 'Giáº¥y rÃºt Watersilk 100 tá»', 'Giáº¥y rÃºt Watersilk 100 tá»', '57.jpg', '', 1, 0, 0, '6500', '6000', 2, '2008-01-28 22:08:59', '2008-01-28 22:08:59', 65, 2, 2, 1, 0),
(58, 'Giáº¥y vá»‡ sinh Soft 9 cuá»™n', NULL, 'Giáº¥y vá»‡ sinh Soft 9 cuá»™n', 'Giáº¥y vá»‡ sinh Soft 9 cuá»™n', '58.jpg', '', 1, 0, 0, '14000', '13000', 2, '2008-01-28 22:10:31', '2008-01-28 22:10:31', 65, 8, 2, 1, 0),
(59, 'Giáº¥y vá»‡ sinh Háº£i anh 12 cuá»™n', NULL, 'Giáº¥y vá»‡ sinh Háº£i anh 12 cuá»™n', 'Giáº¥y vá»‡ sinh Háº£i anh 12 cuá»™n', '59.jpg', '', 1, 0, 0, '13000', '12000', 2, '2008-01-28 22:15:12', '2008-01-28 22:15:12', 65, 8, 2, 1, 0),
(60, 'Giáº¥y Äƒn bá» tÃºi loáº¡i nhá» My Lan', NULL, 'Giáº¥y Äƒn bá» tÃºi loáº¡i nhá» My Lan', 'Giáº¥y Äƒn bá» tÃºi loáº¡i nhá» My Lan', '60.jpg', '', 1, 0, 0, '7000', '6500', 2, '2008-01-28 22:17:01', '2008-01-28 22:17:01', 65, 8, 2, 1, 0),
(61, 'Giáº¥y Äƒn Apple 100 tá»', NULL, 'Giáº¥y Äƒn Apple 100 tá»', 'Giáº¥y Äƒn Apple 100 tá»', '61.jpg', '', 1, 0, 0, '9500', '9200', 2, '2008-01-28 22:18:06', '2008-01-28 22:18:06', 65, 2, 2, 1, 0),
(62, 'Giáº¥y Äƒn Apple 180 tá» 2 lá»›p', NULL, 'Giáº¥y Äƒn Apple 180 tá» 2 lá»›p', 'Giáº¥y Äƒn Apple 180 tá» 2 lá»›p', '62.jpg', '', 1, 0, 0, '10500', '10000', 0, '2008-01-28 22:19:55', '2008-01-28 22:20:38', 65, 2, 2, 1, 0),
(63, 'Giáº¥y Äƒn Kentex nhá»', NULL, 'Giáº¥y Äƒn Kentex nhá»', 'Giáº¥y Äƒn Kentex nhá»', '63.jpg', '', 1, 0, 0, '3500', '3500', 2, '2008-01-28 22:24:34', '2008-01-28 22:24:34', 65, 8, 2, 1, 0),
(64, 'ChÃ¨ váº¡n tuáº¿ há»™p Ä‘á» 100g', NULL, 'ChÃ¨ váº¡n tuáº¿ há»™p Ä‘á» 100g', 'ChÃ¨ váº¡n tuáº¿ há»™p Ä‘á» 100g', '64.jpg', '', 1, 3, 0, '14000', '13500', 2, '2008-01-28 22:26:32', '2008-01-28 22:26:32', 41, 2, 2, 1, 0),
(65, 'Káº¹o TrÃ ng An Chewy Socola sá»¯a', '123', 'Káº¹o TrÃ ng An Chewy Socola sá»¯a', 'Káº¹o TrÃ ng An Chewy Socola sá»¯a', '65.jpg', '', 1, 3, 0, '34500', '33500', 1, '2008-01-28 22:34:06', '2008-02-14 11:03:24', 34, 9, 2, 1, 0),
(66, 'ChÃ¨ xanh tri ká»· há»™p', NULL, 'ChÃ¨ xanh tri ká»· há»™p', 'ChÃ¨ xanh tri ká»· há»™p', '66.jpg', '', 1, 0, 0, '14000', '13000', 2, '2008-01-28 22:35:47', '2008-01-28 22:35:47', 41, 2, 2, 1, 0),
(67, 'Milo há»™p 285g máº§m lÃºa máº¡ch', NULL, 'Milo há»™p 285g máº§m lÃºa máº¡ch', 'Milo há»™p 285g máº§m lÃºa máº¡ch', '67.jpg', '', 1, 0, 0, '24000', '23500', 2, '2008-01-28 22:37:27', '2008-01-28 22:37:27', 32, 2, 2, 1, 0),
(68, 'ChÃ¨ kim anh Ä‘á» 80g', NULL, 'ChÃ¨ kim anh Ä‘á» 80g', 'ChÃ¨ kim anh Ä‘á» 80g', '68.jpg', '', 1, 0, 0, '15000', '14500', 2, '2008-01-28 22:39:24', '2008-01-28 22:39:24', 41, 2, 2, 1, 0),
(69, 'ChÃ¨ Ä‘Ã´ng Ä‘Ã´ 100g', NULL, 'ChÃ¨ Ä‘Ã´ng Ä‘Ã´ 100g', 'ChÃ¨ Ä‘Ã´ng Ä‘Ã´ 100g', '69.jpg', '', 1, 1, 0, '15000', '14500', 2, '2008-01-28 22:41:31', '2008-01-28 22:41:31', 41, 2, 2, 1, 0),
(70, 'Sá»¯a bá»™t Milo lá» thuá»· tinh 400g', NULL, 'Sá»¯a bá»™t Milo vá»›i máº§m lÃºa máº¡ch, canxi vÃ  dÆ°á»¡ng cháº¥t cáº§n thiáº¿t giÃºp cÆ¡ thá»ƒ cao lá»›n vÃ  thÃ´ng minh', 'Sá»¯a bá»™t Milo lá» thuá»· tinh 400g', '70.jpg', '', 1, 0, 0, '33000', '32500', 2, '2008-01-28 22:44:13', '2008-01-28 22:44:13', 32, 2, 2, 1, 0),
(71, 'BÃ¡nh TrÃ ng An PhÃ¡p', NULL, 'BÃ¡nh TrÃ ng An PhÃ¡p 290g', 'BÃ¡nh TrÃ ng An PhÃ¡p 290g', '71.jpg', '', 1, 3, 0, '13000', '12500', 2, '2008-01-28 22:46:08', '2008-01-28 22:46:08', 33, 7, 2, 1, 0),
(72, 'BÃ¡nh quáº¿ TrÃ ng An vani', NULL, 'BÃ¡nh quáº¿ TrÃ ng An vani 200g', 'BÃ¡nh quáº¿ TrÃ ng An vani 200g', '72.jpg', '', 1, 0, 0, '6500', '6000', 2, '2008-01-28 22:48:55', '2008-01-28 22:48:55', 33, 7, 2, 1, 0),
(73, 'Sá»¯a Milo tÃºi', NULL, 'Sá»¯a Milo tÃºi 10 gÃ³i', 'Sá»¯a Milo tÃºi 10 gÃ³i', '73.jpg', '', 1, 1, 0, '19000', '18500', 2, '2008-01-28 22:51:41', '2008-01-29 21:58:44', 32, 9, 2, 1, 0),
(74, 'Háº¡t hÆ°á»›ng dÆ°Æ¡ng', NULL, 'Háº¡t hÆ°á»›ng dÆ°Æ¡ng 120g', 'Háº¡t hÆ°á»›ng dÆ°Æ¡ng 120g', '74.jpg', '', 1, 1, 0, '5500', '5200', 2, '2008-01-28 22:57:40', '2008-01-28 22:57:40', 67, 7, 2, 1, 0),
(75, 'Hat hÆ°á»›ng dÆ°Æ¡ng', NULL, 'Hat hÆ°á»›ng dÆ°Æ¡ng 400g', 'Hat hÆ°á»›ng dÆ°Æ¡ng 400g', '75.jpg', '', 1, 1, 0, '16000', '15000', 2, '2008-01-28 22:58:35', '2008-01-28 22:58:35', 67, 7, 2, 1, 0),
(76, 'Háº¡t Ä‘iá»u gia vá»‹ muá»‘i', NULL, 'Háº¡t Ä‘iá»u gia vá»‹ muá»‘i 56g', 'Háº¡t Ä‘iá»u gia vá»‹ muá»‘i 56g', '76.jpg', '', 1, 2, 0, '9000', '8600', 2, '2008-01-28 23:00:55', '2008-01-28 23:00:55', 67, 7, 2, 1, 0),
(77, 'Háº¡t bÃ­', NULL, 'Háº¡t bÃ­ 450g', 'Háº¡t bÃ­ 450g', '77.jpg', '', 1, 0, 0, '20000', '19500', 2, '2008-01-28 23:02:22', '2008-01-28 23:02:22', 67, 7, 2, 1, 0),
(78, 'ÄÆ°á»ng tráº¯ng BiÃªn HoÃ  que', NULL, 'ÄÆ°á»ng tráº¯ng BiÃªn HoÃ  que', 'ÄÆ°á»ng tráº¯ng BiÃªn HoÃ  que', '78.jpg', '', 1, 2, 1, '8500', '8000', 2, '2008-01-28 23:04:31', '2008-01-28 23:04:31', 47, 7, 2, 1, 0),
(79, 'ÄÆ°á»ng tráº¯ng BiÃªn HoÃ ', NULL, 'ÄÆ°á»ng tráº¯ng BiÃªn HoÃ  bá»• sung VitaminA 1kg', 'ÄÆ°á»ng tráº¯ng BiÃªn HoÃ  bá»• sung VitaminA 1kg', '79.jpg', '', 1, 1, 0, '11500', '10800', 2, '2008-01-28 23:06:11', '2008-01-28 23:06:11', 47, 7, 2, 1, 0),
(80, 'ÄÆ°á»ng tráº¯ng BiÃªn HoÃ ', NULL, 'ÄÆ°á»ng tráº¯ng BiÃªn HoÃ  1kg', 'ÄÆ°á»ng tráº¯ng BiÃªn HoÃ  1kg', '80.jpg', '', 1, 0, 0, '10000', '9500', 2, '2008-01-28 23:09:34', '2008-01-28 23:09:34', 47, 7, 2, 1, 0),
(81, 'ChÃ¨ xanh lÃª minh', NULL, 'ChÃ¨ xanh lÃª minh 100g', 'ChÃ¨ xanh lÃª minh 100g', '81.jpg', '', 1, 0, 0, '6300', '6000', 2, '2008-01-28 23:12:22', '2008-01-28 23:12:22', 41, 7, 2, 1, 0),
(82, 'ChÃ¨ xanh lÃª minh', NULL, 'ChÃ¨ xanh lÃª minh 500g', 'ChÃ¨ xanh lÃª minh 500g', '82.jpg', '', 1, 1, 0, '30000', '28000', 2, '2008-01-28 23:13:34', '2008-01-28 23:13:34', 41, 7, 2, 1, 0),
(83, 'ChÃ¨ sen phÃºc lá»™c thá»', NULL, 'ChÃ¨ sen phÃºc lá»™c thá»', 'ChÃ¨ sen phÃºc lá»™c thá»', '83.jpg', '', 1, 0, 0, '8000', '7500', 2, '2008-01-28 23:15:35', '2008-01-28 23:15:35', 41, 7, 2, 1, 0),
(84, 'BÃ¡nh Háº£i HÃ  Romance', NULL, 'BÃ¡nh Háº£i HÃ  Romance', 'BÃ¡nh Háº£i HÃ  Romance', '84.jpg', '', 1, 0, 0, '24000', '23000', 2, '2008-01-29 09:09:24', '2008-01-29 09:09:24', 33, 2, 2, 1, 0),
(85, 'BÃ¡nh Háº£i HÃ  Happy táº¿t', NULL, 'BÃ¡nh Háº£i HÃ  Happy táº¿t', 'BÃ¡nh Háº£i HÃ  Happy táº¿t', '85.jpg', '', 1, 0, 0, '17000', '16500', 2, '2008-01-29 09:10:07', '2008-01-29 09:10:07', 33, 2, 2, 1, 0),
(86, 'BÃ¡nh Háº£i HÃ  Eclass', NULL, 'BÃ¡nh Háº£i HÃ  Eclass', 'BÃ¡nh Háº£i HÃ  Eclass', '86.jpg', '', 1, 0, 0, '24000', '23000', 2, '2008-01-29 09:10:59', '2008-01-29 09:10:59', 33, 2, 2, 1, 0),
(87, 'BÃ¡nh Háº£i HÃ  Miniwaf', NULL, 'BÃ¡nh Háº£i HÃ  Miniwaf', 'BÃ¡nh Háº£i HÃ  Miniwaf', '87.jpg', '', 1, 2, 0, '28000', '27000', 2, '2008-01-29 09:11:50', '2008-01-29 09:11:50', 33, 2, 2, 1, 0),
(88, 'BÃ¡nh Cream crackers', NULL, 'BÃ¡nh Cream crackers 500g', 'BÃ¡nh Cream crackers 500g', '88.jpg', '', 1, 0, 0, '27000', '25000', 2, '2008-01-29 09:13:20', '2008-01-29 09:13:20', 33, 2, 2, 1, 0),
(89, 'Sá»¯a Ä‘áº·c cÃ³ Ä‘Æ°á»ng NgÃ´i sao phÆ°Æ¡ng nam há»™p giáº¥y', NULL, 'Sá»¯a Ä‘áº·c cÃ³ Ä‘Æ°á»ng NgÃ´i sao phÆ°Æ¡ng nam há»™p giáº¥y 1284g', 'Sá»¯a Ä‘áº·c cÃ³ Ä‘Æ°á»ng NgÃ´i sao phÆ°Æ¡ng nam há»™p giáº¥y 1284g', '89.jpg', '', 1, 1, 0, '29000', '28500', 2, '2008-01-29 09:16:45', '2008-01-29 15:25:53', 70, 2, 2, 1, 0),
(90, 'BÃ¡nh TrÃ ng An PhÃ¡p', NULL, 'BÃ¡nh TrÃ ng An PhÃ¡p khÃ´ng quai 384g', 'BÃ¡nh TrÃ ng An PhÃ¡p khÃ´ng quai 384g', '90.jpg', '', 1, 0, 0, '26000', '25000', 2, '2008-01-29 09:20:12', '2008-01-29 09:20:12', 33, 2, 2, 1, 0),
(91, 'NÆ°á»›c khoÃ¡ng Lavie 250ml', NULL, 'NÆ°á»›c khoÃ¡ng Lavie chai nhá»', 'NÆ°á»›c khoÃ¡ng Lavie chai nhá»', '91.jpg', '', 1, 0, 0, '2500', '2400', 2, '2008-01-29 09:22:09', '2008-01-30 12:06:35', 37, 4, 2, 1, 0),
(92, 'NÆ°á»›c khoÃ¡ng Lavie 550ml', NULL, 'NÆ°á»›c khoÃ¡ng Lavie chai 550ml', 'NÆ°á»›c khoÃ¡ng Lavie chai nhá» 550ml', '92.jpg', '', 1, 0, 0, '4500', '4200', 2, '2008-01-29 09:23:14', '2008-01-30 12:06:51', 37, 4, 2, 1, 0),
(93, 'NÆ°á»›c khoÃ¡ng Lavie chai to 1500ml', NULL, 'NÆ°á»›c khoÃ¡ng Lavie chai to 1.5 lÃ­t', 'NÆ°á»›c khoÃ¡ng Lavie chai to 1.5 lÃ­t', '93.jpg', '', 1, 0, 0, '8500', '8000', 2, '2008-01-29 09:24:23', '2008-01-30 12:07:07', 37, 4, 2, 1, 0),
(94, 'NÆ°á»›c khoÃ¡ng Lavie chai Ä‘áº¡i 5000ml', NULL, 'NÆ°á»›c khoÃ¡ng Lavie 5l', 'NÆ°á»›c khoÃ¡ng Lavie 5l', '94.jpg', '', 1, 0, 0, '15000', '13500', 2, '2008-01-29 09:25:34', '2008-01-30 12:07:59', 37, 4, 2, 1, 0),
(95, 'NÆ°á»›c khoÃ¡ng Aquafina chai nhá»', NULL, 'NÆ°á»›c khoÃ¡ng Aquafina 500ml', 'NÆ°á»›c khoÃ¡ng Aquafina 500ml', '95.jpg', '', 1, 0, 0, '4000', '3500', 2, '2008-01-29 09:26:39', '2008-01-29 09:26:39', 37, 4, 2, 1, 0),
(96, 'NÆ°á»›c khoÃ¡ng AQUAFINA chai to', NULL, 'NÆ°á»›c khoÃ¡ng AQUAFINA 1,5 l', 'NÆ°á»›c khoÃ¡ng AQUAFINA 1,5 l', '96.jpg', '', 1, 0, 0, '7500', '7000', 2, '2008-01-29 09:27:38', '2008-01-29 09:27:38', 37, 4, 2, 1, 0),
(97, 'Tháº¡ch sá»¯a chua ABC', NULL, 'Tháº¡ch sá»¯a chua ABC 12 vien', 'Tháº¡ch sá»¯a chua ABC 12 vien', '97.jpg', '', 1, 0, 0, '22000', '20000', 2, '2008-01-29 09:31:38', '2008-01-29 09:31:38', 68, 7, 2, 1, 0),
(98, 'Bá»™t ngÅ© cá»‘c Äƒn kiÃªng', NULL, 'Bá»™t ngÅ© cá»‘c Äƒn kiÃªng thÃ­ch há»£p cho má»i lá»©a tuá»•i, nháº¥t lÃ  vá»›i ngÆ°á»i Äƒn kiÃªng', 'Bá»™t ngÅ© cá»‘c Äƒn kiÃªng cung cáº¥p cháº¥t xÆ¡, khoÃ¡ng cháº¥t vÃ  nÄƒng lÆ°á»£ng cáº§n cáº§n thiáº¿t cho cÆ¡ thá»ƒ', '98.jpg', '', 1, 0, 0, '43000', '42000', 2, '2008-01-29 09:36:40', '2008-01-29 09:36:40', 69, 7, 2, 1, 0),
(99, 'Bá»™t ngÅ© cá»‘c dinh dÆ°á»¡ng', NULL, 'Cung cáº¥p cho cÆ¡ thá»ƒ Ä‘áº§y Ä‘á»§ dÆ°á»¡ng cháº¥t chá»‰ vá»›i má»™t ly Bá»™t ngÅ© cá»‘c dinh dÆ°á»¡ng', 'Bá»™t NgÅ© cá»‘c dinh dÆ°á»¡ng cung cáº¥p canxi, cháº¥t xÆ¡, khoÃ¡ng cháº¥t cho cÆ¡ thá»ƒ', '99.jpg', '', 1, 0, 0, '32000', '31000', 2, '2008-01-29 09:40:18', '2008-01-29 09:40:18', 69, 7, 2, 1, 0),
(100, 'BÃ¡nh quy bÆ¡ Ä‘á»“ng tiá»n TrÃ ng An', NULL, 'BÃ¡nh quy bÆ¡ Ä‘á»“ng tiá»n vá»›i máº§m lÃºa máº¡ch giáº§u dÆ°á»¡ng cháº¥t hÆ°Æ¡ng vá»‹ thÆ¡m ngon bá»• dÆ°á»¡ng', 'BÃ¡nh quy bÆ¡ Ä‘á»“ng tiá»n 225g TrÃ ng An', '100.jpg', '', 1, 0, 0, '8000', '7500', 2, '2008-01-29 09:43:31', '2008-01-29 09:43:31', 33, 7, 2, 1, 0),
(101, 'Káº¹o dá»«a Yáº¿n hÆ°Æ¡ng sá»¯a dá»©a', NULL, 'Káº¹o dá»«a Yáº¿n HÆ°Æ¡ng Ä‘áº·c sáº£n Báº¿n Tre', 'Káº¹o dá»«a Yáº¿n hÆ°Æ¡ng vá»‹ sá»¯a dá»©a hÆ°Æ¡ng cá»‘m', '101.jpg', '', 1, 0, 0, '8500', '8000', 2, '2008-01-29 09:49:42', '2008-01-29 09:49:42', 34, 7, 2, 1, 0),
(102, 'Káº¹o dá»«a Yáº¿n HÆ°Æ¡ng', NULL, 'Káº¹o dá»«a Yáº¿n HÆ°Æ¡ng Ä‘áº·c sáº£n Báº¿n Tre', 'Káº¹o dá»«a Yáº¿n HÆ°Æ¡ng', '102.jpg', '', 1, 0, 0, '8500', '8000', 2, '2008-01-29 09:51:22', '2008-01-29 09:51:22', 34, 7, 2, 1, 0),
(103, 'Káº¹o dá»«a bÃ©o', NULL, 'Káº¹o dá»«a Yáº¿n FÆ°Æ¡ng Ä‘áº·c sáº£n Báº¿n Tre', 'Káº¹o dá»«a bÃ©o Yáº¿n HÆ°Æ¡ng vá»‹ sá»¯a sáº§u riÃªng', '103.jpg', '', 1, 0, 0, '8500', '8000', 2, '2008-01-29 09:52:40', '2008-01-29 09:52:40', 34, 7, 2, 1, 0),
(104, 'Bá»™t ngÅ© cá»‘c dinh dÆ°á»¡ng canxi', NULL, 'Bá»™t ngÅ© cá»‘c dinh dÆ°á»¡ng canxi thÃ­ch há»£p cho má»i lá»©a tuá»•i', 'Bá»™t ngÅ© cá»‘c dinh dÆ°á»¡ng canxi vá»›i canxi vÃ  sá»¯a báº¯p, hÆ°Æ¡ng vá»‹ tá»± nhiÃªn', '104.jpg', '', 1, 0, 0, '33000', '32000', 2, '2008-01-29 09:54:57', '2008-01-29 09:54:57', 69, 7, 2, 1, 0),
(105, 'Bá»‰m Bobby fresh L', NULL, 'Bá»‰m Bobby fresh L siÃªu tháº¥m, thÃ¡m hÃºt nhiá»u vÃ  khÃ´ thoÃ¡ng giÃºp bÃ© ngá»§ ngon, khÃ´ng bá»‹ hÄƒm', 'Bá»‰m Bobby fresh 28 miáº¿ng cá»¡ L', '105.jpg', '', 1, 0, 0, '81000', '79000', 2, '2008-01-29 09:57:13', '2008-01-29 09:57:13', 22, 8, 2, 1, 0),
(106, 'Bá»‰m Huggies dry cá»¡ L 34 miáº¿ng', NULL, 'Bá»‰m Huggies dry dÃ¡n cháº¯c cháº¯n Ä‘á»“ng thá»i cÃ³ thá»ƒ dÃ¡n láº¡i dá»… dÃ ng má»i lÃºc má»i nÆ¡i, tháº¥m hÃºt tá»‘t, khÃ´ thoÃ¡ng vÃ  thoáº£i mÃ¡i cho bÃ© suá»‘t cáº£ ngÃ y', 'Bá»‰m Huggies dry cá»¡ L 34 miáº¿ng', '106.jpg', '', 1, 0, 0, '81000', '75000', 2, '2008-01-29 09:59:22', '2008-01-29 09:59:22', 22, 8, 2, 1, 0),
(107, 'Bá»‰m Pampers FreshvDry L32', NULL, 'Bá»‰m Pampers Fresh&Dry vá»›i lá»›p siÃªu tháº¥m thÃ´ng minh giÃºp khÃ´ thoÃ¡ng suá»‘t 10 giá», khÃ´nglÃ m bÃ© bá»‹ hÄƒm', 'Bá»‰m Pampers Fresh&Dry L32', '107.jpg', '', 1, 0, 0, '88000', '84000', 2, '2008-01-29 10:01:44', '2008-01-29 10:01:44', 22, 8, 2, 1, 0),
(108, 'Bá»‰m unidry S34', NULL, 'Bá»‰m unidry tháº¥m hÃºt nhiá»u hÆ¡n, khÃ´ thoÃ¡ng hÆ¡n, cho bÃ© yÃªu thoáº£i mÃ¡i vui chÆ¡i, khÃ´ng sá»£ hÄƒm', 'Bá»‰m unidry S34 dÃ nh cho tráº» 0 Ä‘áº¿n 7kg', '108.jpg', '', 1, 0, 0, '56000', '55000', 2, '2008-01-29 10:04:20', '2008-01-29 10:04:20', 22, 8, 2, 1, 0),
(109, 'Bá»‰m Baby soft Premium L24', NULL, 'Bá»‰m Baby soft Premium tháº¥m hÃºt nhanh vÃ  khÃ´ thoÃ¡ng', 'Bá»‰m Baby soft Premium L24 dÃ nh cho tráº» tá»« 9 Ä‘áº¿n 14kg', '109.jpg', '', 1, 1, 0, '77000', '75000', 2, '2008-01-29 10:08:10', '2008-01-29 10:08:10', 22, 8, 2, 1, 0),
(110, 'Bá»‰m Baby soft Premium M28', NULL, 'Bá»‰m Baby soft Premium M28tháº¥m hÃºt nhanh vÃ  khÃ´ thoÃ¡ng', 'Bá»‰m Baby soft Premium M28 dÃ nh cho tráº» 6 thÃ¡ng tuá»•i', '110.jpg', '', 1, 0, 0, '77000', '75000', 0, '2008-01-29 10:11:29', '2008-01-29 10:11:29', 22, 7, 2, 1, 0),
(111, 'Bá»‰m Baby soft Premium XL20', NULL, 'Bá»‰m Baby soft Premium XL20 tháº¥m hÃºt nhanh vÃ  khÃ´ thoÃ¡ng', 'Bá»‰m Baby soft Premium XL20 dÃ nh cho tráº» tá»« 17kh trá»Ÿ lÃªn', '111.jpg', '', 1, 0, 0, '77000', '75000', 2, '2008-01-29 10:14:21', '2008-01-29 10:14:21', 22, 7, 2, 1, 0),
(112, 'Bá»‰m Baby soft economy M12', NULL, 'Bá»‰m Baby soft economy M12 sáº¡ch sáº½ khÃ´ thoÃ¡ng suá»‘t cáº£ ngÃ y, khÃ´ng tháº¥m ngÆ°á»£c trá»Ÿ láº¡i', 'Bá»‰m Baby soft economy M12 dÃ nh cho tráº» tá»« 6 Ä‘áº¿n 11kg', '112.jpg', '', 1, 0, 0, '27000', '26000', 2, '2008-01-29 10:16:16', '2008-01-29 10:16:16', 22, 7, 2, 1, 0),
(113, 'Bá»‰m Huggies ultra cá»¡ XL 16 miáº¿ng', NULL, 'Bá»‰m Huggies ultra cá»¡ XL 16 miáº¿ng lÃµi siÃªu tháº¥m thÃ´ng minh giÃºp khÃ´ thoÃ¡ng Ä‘áº¿n 12 giá»', 'Bá»‰m Huggies ultra cá»¡ XL 16 miáº¿ng dÃ nh cho tráº» trÃªn 11kg', '113.jpg', '', 1, 1, 0, '90000', '84000', 2, '2008-01-29 10:17:58', '2008-01-29 10:17:58', 22, 8, 2, 1, 0),
(114, 'RÆ°á»£u vang ÄÃ  Láº¡t Ä‘á» bá»‹ch 3 lÃ­t', NULL, 'RÆ°á»£u vang ÄÃ  Láº¡t Ä‘á» rá»™n rÃ ng sáº¯c xuÃ¢n tá»«ng bá»«ng báº±ng há»¯u', 'RÆ°á»£u vang ÄÃ  Láº¡t Ä‘á» bá»‹ch 3 lÃ­t', '114.jpg', '', 1, 0, 0, '138000', '13000', 2, '2008-01-29 10:22:54', '2008-01-29 10:22:54', 39, 8, 2, 1, 0),
(115, 'RÆ°á»£u vang ÄÃ  Láº¡t tráº¯ng bá»‹ch 3 lÃ­t', NULL, 'RÆ°á»£u vang ÄÃ  Láº¡t tráº¯ng tÆ°ng bá»«ng sáº¯c xuÃ¢n rá»™n rÃ ng báº±ng há»¯u', 'RÆ°á»£u vang ÄÃ  Láº¡t tráº¯ng bá»‹ch 3 lÃ­t', '115.jpg', '', 1, 0, 0, '13000', '119000', 2, '2008-01-29 10:24:14', '2008-01-29 10:24:14', 39, 8, 2, 1, 0),
(116, 'RÆ°á»£u vang Camanchaca bá»‹ch 3l', NULL, 'RÆ°á»£u vang Camanchaca tÆ°ng bá»«ng sáº¯c xuÃ¢n rá»™n rÃ ng báº±ng há»¯u', 'RÆ°á»£u vang Camanchaca bá»‹ch 3l', '116.jpg', '', 1, 0, 0, '250000', '240000', 2, '2008-01-29 10:25:41', '2008-01-29 10:25:41', 39, 8, 2, 1, 0),
(117, 'RÆ°á»£u vang Merot 3l', NULL, 'RÆ°á»£u vang Meriot tÆ°ng bá»«ng sáº¯c xuÃ¢n rá»™n rÃ ng báº±ng há»¯u', 'RÆ°á»£u vang Meriot 3l', '117.jpg', '', 1, 0, 0, '235000', '225000', 2, '2008-01-29 10:27:35', '2008-01-29 10:27:35', 39, 8, 2, 1, 0),
(118, 'RÆ°á»£u vang Chardonnay 750ml', NULL, 'RÆ°á»£u vang Chardonnay mÃ³n quÃ  ngÃ y xuÃ¢n', 'RÆ°á»£u vang Chardonnay (PhÃ¡p) 750ml', '118.jpg', '', 1, 1, 0, '120000', '115000', 2, '2008-01-29 10:31:43', '2008-01-29 10:31:43', 39, 4, 2, 1, 0),
(119, 'RÆ°á»£u vang CHARDONNAY SEMILLON', NULL, 'RÆ°á»£u vang CHARDONNAY SEMILLON mÃ³n quÃ  Ã½ nghÄ©a ngÃ y xuÃ¢n', 'RÆ°á»£u vang CHARDONNAY SEMILLON 750ml', '119.jpg', '', 1, 0, 0, '118000', '110000', 2, '2008-01-29 10:33:04', '2008-01-29 10:33:04', 39, 4, 2, 1, 0),
(120, 'RÆ°á»£u vang Merlot', NULL, 'RÆ°á»£u vang Merlot mÃ³n quÃ  Ã½ nghÄ©a ngÃ y xuÃ¢n', 'RÆ°á»£u vang Merlot (Chile) 750ml', '120.jpg', '', 1, 1, 0, '180000', '171000', 2, '2008-01-29 10:34:18', '2008-01-29 10:34:18', 39, 4, 2, 1, 0),
(121, 'RÆ°á»£u vang Cbernet carmenere', NULL, 'RÆ°á»£u vang Cbernet--carmenere mÃ³n quÃ  Ã½ nghÄ©a ngÃ y xuÃ¢n', 'RÆ°á»£u vang Cbernet--carmenere (Chile) 750ml', '121.jpg', '', 1, 0, 0, '163000', '155000', 2, '2008-01-29 10:39:55', '2008-01-29 10:39:55', 39, 4, 2, 1, 0),
(122, 'RÆ°á»£u vang CHATEAU LAVERGE', NULL, 'RÆ°á»£u vang CHATEAU LAVERGE mÃ³n quÃ  Ã½ nghÄ©a ngÃ y xuÃ¢n', 'RÆ°á»£u vang CHATEAU LAVERGE 750ml', '122.jpg', '', 1, 0, 0, '100000', '92000', 2, '2008-01-29 10:42:03', '2008-01-29 10:42:03', 39, 4, 2, 1, 0),
(123, 'Sá»¯a rá»­a máº·t Ponds chá»‘ng nhá»n', NULL, 'Sá»¯a rá»­a máº·t Ponds chá»‘ng nhá»n _ táº¡m biá»‡t dáº§u', 'Sá»¯a rá»­a máº·t Ponds chá»‘ng nhá»n 50ml', '123.jpg', '', 1, 3, 0, '20000', '19000', 2, '2008-01-29 10:49:48', '2008-01-29 10:49:48', 58, 10, 2, 1, 0),
(124, 'Sá»¯a rá»­a máº·t tráº¯ng da Hazeline dÃ¢u táº±m', NULL, 'Sá»¯a rá»­a máº·t tráº¯ng da Hazeline dÃ¢u táº±m cho da sáº¡ch vÃ  tráº¯ng má»‹n tá»± nhiÃªn', 'Sá»¯a rá»­a máº·t tráº¯ng da Hazeline dÃ¢u táº±m 50ml', '124.jpg', '', 1, 8, 0, '18000', '17500', 2, '2008-01-29 10:52:22', '2008-01-29 10:52:22', 58, 10, 2, 1, 0),
(125, 'Sá»¯a rá»­a máº·t cÃ¡t tráº¯ng da ban Ä‘Ãªm Pond', NULL, 'Sá»¯a rá»­a máº·t Pond Ä‘áº·c biá»‡t dÃ nh cho ban Ä‘Ãªm vá»›i nhá»¯ng háº¡t cÃ¡t thÃ´ng minh giÃºp táº©y sáº¡ch cháº¥t báº©n', 'Sá»¯a rá»­a máº·t cÃ¡t tráº¯ng da ban Ä‘Ãªm Pond 50ml', '125.jpg', '', 1, 1, 0, '20000', '19000', 2, '2008-01-29 10:58:04', '2008-01-29 10:58:04', 58, 10, 2, 1, 0),
(126, 'Sá»¯a rá»­a máº·t Ponds tráº¯ng da', NULL, 'Sá»¯a rá»­a máº·t Ponds tráº¯ng da giáº£ phÃ¡p tráº¯ng da chuyÃªn nghiá»‡p', 'Sá»¯a rá»­a máº·t Ponds tráº¯ng da 50ml', '126.jpg', '', 1, 1, 0, '20000', '19000', 2, '2008-01-29 10:59:07', '2008-01-29 10:59:07', 58, 10, 2, 1, 0),
(127, 'Sá»¯a rá»­a máº·t Ponds tráº¯ng da thanh khiáº¿t', NULL, 'Sá»¯a rá»­a máº·t Ponds tráº¯ng da thanh khiáº¿t giáº£i phÃ¡p chÄƒm sÃ³c da chuyÃªn nghiá»‡p', 'Sá»¯a rá»­a máº·t Ponds tráº¯ng da thanh khiáº¿t 50ml', '127.jpg', '', 1, 6, 0, '20000', '19000', 2, '2008-01-29 11:01:45', '2008-01-29 11:01:45', 58, 10, 2, 1, 0),
(128, 'NÆ°á»›c ngá»t Fanta cam 1500ml', NULL, 'NÆ°á»›c ngá»t Fanta cam thá»a mÃ£n cÆ¡n khÃ¡t cá»§a báº¡n', 'NÆ°á»›c ngá»t Fanta 1,5lÃ­t', '128.jpg', '', 1, 0, 0, '11000', '10000', 2, '2008-01-29 11:03:37', '2008-01-30 12:04:26', 35, 4, 2, 1, 0),
(129, 'NÆ°á»›c ngá»t Pepsi Cola 1500nl', NULL, 'NÆ°á»›c ngá»t Pepsi Cola thá»a mÃ£n cÆ¡n khÃ¡t cá»§a báº¡n', 'NÆ°á»›c ngá»t Pepsi Cola1.5 lÃ­t', '129.jpg', '', 1, 1, 0, '11000', '9500', 2, '2008-01-29 11:06:08', '2008-01-30 12:04:43', 35, 4, 2, 1, 0),
(130, 'NÆ°á»›c ngá»t Coca 1500ml', NULL, 'NÆ°á»›c ngá»t Coca chai to thá»a mÃ£n cÆ¡n khÃ¡t cá»§a báº¡n', 'NÆ°á»›c ngá»t Coca chai to 1.5lÃ­t', '130.jpg', '', 1, 0, 0, '11000', '10000', 2, '2008-01-29 11:14:33', '2008-01-30 12:05:42', 35, 4, 2, 1, 0),
(131, 'NÆ°á»›c ngá»t BÃ² hÃºc', NULL, 'NÆ°á»›c ngá»t BÃ² hÃºc 250ml', 'NÆ°á»›c ngá»t BÃ² hÃºc 250ml', '131.jpg', '', 1, 0, 0, '6500', '5900', 2, '2008-01-29 12:56:27', '2008-01-29 12:56:27', 35, 15, 2, 1, 0),
(132, 'Sá»¯a tÆ°Æ¡i Vinamilk sÃ´cola 180ml', NULL, 'Sá»¯a tÆ°Æ¡i Vinamilk sÃ´cola _ Milk khá»e máº¡nh', 'Sá»¯a tÆ°Æ¡i Vinamilk sÃ´cola 180ml', '132.jpg', '', 1, 6, 0, '16500', '15800', 2, '2008-01-29 12:59:06', '2008-01-30 12:48:38', 52, 3, 2, 1, 0),
(133, 'Sá»¯a Ä‘áº­u nÃ nh Vinamilk Soya', NULL, 'Sá»¯a Ä‘áº­u nÃ nh Vinamilk Ã­t bÃ©o khÃ´ng cholesterol, giÃ u cháº¥t Ä‘áº¡m', 'Sá»¯a Ä‘áº­u nÃ nh Vinamilk 180ml', '133.jpg', '', 1, 0, 0, '12000', '10500', 2, '2008-01-29 13:06:01', '2008-01-29 13:06:01', 53, 3, 2, 1, 0),
(134, 'Sá»¯a tÆ°Æ¡i Vinamilk', NULL, 'Sá»¯a tÆ°Æ¡i 95% Vinamilk cÃ³ Ä‘Æ°á»ng', 'Sá»¯a tÆ°Æ¡i 95% Vinamilk cÃ³ Ä‘Æ°á»ng', '134.jpg', '', 1, 1, 0, '18000', '17800', 2, '2008-01-29 13:07:35', '2008-01-29 13:07:35', 52, 3, 2, 1, 0),
(135, 'sá»¯a vinaMilk dÃ¢u', NULL, 'sá»¯a vinaMilk dÃ¢u _ Milk nhanh nháº¹n', 'sá»¯a vinaMilk dÃ¢u 180ml', '135.jpg', '', 1, 0, 0, '16000', '15800', 2, '2008-01-29 13:09:15', '2008-01-29 13:09:15', 53, 3, 2, 1, 0),
(136, 'Sá»¯a tÆ°Æ¡i Flex', NULL, 'Sá»¯a tÆ°Æ¡i Flex giÃ u canxi', 'Sá»¯a tÆ°Æ¡i Flex 4 há»™p 200ml, giÃ u canxi, khÃ´ng Ä‘Æ°á»ng', '136.jpg', '', 1, 0, 0, '16000', '15500', 2, '2008-01-29 13:11:13', '2008-01-29 13:12:35', 52, 3, 2, 1, 0),
(137, 'Sá»¯a tÆ°Æ¡i vinamilk', NULL, 'Sá»¯a tÆ°Æ¡i vinamilk 100%, khÃ´ng Ä‘Æ°á»ng', 'Sá»¯a tÆ°Æ¡i vinamilk 10%, khÃ´ng Ä‘Æ°á»ng, 180ml', '137.jpg', '', 1, 2, 0, '18000', '17500', 2, '2008-01-29 13:16:00', '2008-01-29 13:16:00', 52, 3, 2, 1, 0),
(138, 'Sá»¯a tÆ°Æ¡i Vinamilk', NULL, 'Sá»¯a tÆ°Æ¡i Vinamilk _ Cao lá»›n', 'Sá»¯a tÆ°Æ¡i Vinamilk cÃ³ Ä‘Æ°á»ng 110ml', '138.jpg', '', 1, 3, 0, '11000', '10500', 2, '2008-01-29 13:17:53', '2008-01-29 13:17:53', 52, 3, 2, 1, 0),
(139, 'Sá»¯a tÆ°Æ¡i Vinamilk xanh nhá»', NULL, 'Sá»¯a tÆ°Æ¡i Vinamilk xanh nhá» cÃ³ Ä‘Æ°á»ng', 'Sá»¯a tÆ°Æ¡i Vinamilk xanh nhá», cÃ³ Ä‘Æ°á»ng, 110ml', '139.jpg', '', 1, 0, 0, '11000', '10500', 2, '2008-01-29 13:20:02', '2008-01-29 13:20:02', 52, 3, 2, 1, 0),
(140, 'Sá»­a tÆ°Æ¡i Má»™c ChÃ¢u', NULL, 'Sá»­a tÆ°Æ¡i Má»™c ChÃ¢u hÆ°Æ¡ng cam', 'Sá»­a tÆ°Æ¡i Má»™c ChÃ¢u hÆ°Æ¡ng cam 180ml', '140.jpg', '', 1, 0, 0, '16000', '15600', 2, '2008-01-29 13:22:38', '2008-01-29 13:22:38', 52, 3, 2, 1, 0),
(141, 'Sá»¯a tÆ°Æ¡i Má»™c ChÃ¢u dá»«a', NULL, 'Sá»¯a tÆ°Æ¡i Má»™c ChÃ¢u vá»‹ dá»«a', 'Sá»¯a tÆ°Æ¡i Má»™c ChÃ¢u vá»‹ dá»«a 180ml', '141.jpg', '', 1, 3, 0, '16000', '15600', 2, '2008-01-29 13:23:58', '2008-01-29 19:43:01', 52, 3, 2, 1, 0),
(142, 'Sá»¯a tÆ°Æ¡i Má»™c ChÃ¢u Kid', NULL, 'Sá»¯a tÆ°Æ¡i Má»™c ChÃ¢u Kid vá»‹ dÃ¢u', 'Sá»¯a tÆ°Æ¡i Má»™c ChÃ¢u Kid vá»‹ dÃ¢u, 118ml', '142.jpg', '', 1, 1, 0, '11000', '10400', 2, '2008-01-29 13:26:26', '2008-01-29 13:26:26', 52, 3, 2, 1, 0),
(143, 'Sá»¯a Ä‘áº­u nÃ nh Vinasoy', NULL, 'Sá»¯a Ä‘áº­u nÃ nh mÃ¨ Ä‘en Vinasoy', 'Sá»¯a Ä‘áº­u nÃ nh mÃ¨ Ä‘en Vinasoy 200ml', '143.jpg', '', 1, 0, 0, '21500', '19800', 2, '2008-01-29 13:28:27', '2008-01-29 13:28:27', 53, 3, 2, 1, 0),
(144, 'Sá»¯a tÆ°Æ¡i AncoVinamilk', NULL, 'Sá»¯a tÆ°Æ¡i AncoVinamilk vá»‹ dÃ¢u', 'Sá»¯a tÆ°Æ¡i AncoVinamilk dÃ¢u 180ml', '144.jpg', '', 1, 0, 0, '16000', '15500', 2, '2008-01-29 13:29:28', '2008-01-29 13:29:28', 52, 3, 2, 1, 0),
(145, 'Sá»¯a tÆ°Æ¡i Ancomilk', NULL, 'Sá»¯a tÆ°Æ¡i Ancomilk socola', 'Sá»¯a tÆ°Æ¡i Ancomilk socola 180ml', '145.jpg', '', 1, 1, 0, '16000', '15500', 2, '2008-01-29 13:30:16', '2008-01-29 13:30:16', 52, 3, 2, 1, 0),
(146, 'Sá»¯a Ä‘áº­u lÃ nh Fami 200ml', NULL, 'Sá»¯a Ä‘áº­u lÃ nh Fami 200ml', 'Sá»¯a Ä‘áº­u lÃ nh Fami 200ml', '146.jpg', '', 1, 0, 0, '3000', '2700', 2, '2008-01-29 13:31:34', '2008-01-29 13:31:34', 53, 2, 2, 1, 0),
(147, 'Sá»¯a Vinamilk tiá»‡t trÃ¹ng', NULL, 'Sá»¯a Vinamilk tiá»‡t trÃ¹ng cÃ³ Ä‘Æ°á»ng', 'Sá»¯a Vinamilk tiá»‡t trÃ¹ng cÃ³ Ä‘Æ°á»ng 200ml', '147.jpg', '', 1, 0, 0, '3800', '3600', 2, '2008-01-29 13:33:16', '2008-01-29 13:38:44', 53, 9, 2, 1, 0),
(148, 'Sá»¯a Vinamilk tiá»‡t trÃ¹ng', NULL, 'Sá»¯a vinamilk tiá»‡t trÃ¹ng dÃ¢u tÃºi 200ml', 'Sá»¯a vinamilk tiá»‡t trÃ¹ng dÃ¢u tÃºi 200ml', '148.jpg', '', 1, 0, 0, '3800', '3600', 2, '2008-01-29 13:34:02', '2008-01-29 13:38:04', 53, 9, 2, 1, 0),
(149, 'Sá»­a Ä‘áº­u nÃ nh Fami', NULL, 'Sá»­a Ä‘áº­u nÃ nh Fami 200ml', 'Sá»­a Ä‘áº­u nÃ nh Fami 200ml', '149.jpg', '', 1, 0, 0, '2500', '2300', 2, '2008-01-29 13:35:55', '2008-01-29 13:35:55', 53, 9, 2, 1, 0),
(150, 'Sá»¯a Vinamilk tiá»‡t trÃ¹ng', NULL, 'Sá»¯a Vinamilk tiá»‡t trÃ¹ng khÃ´ng Ä‘Æ°á»ng', 'Sá»¯a Vinamilk tiá»‡t trÃ¹ng khÃ´ng Ä‘Æ°á»ng, 200ml', '150.jpg', '', 1, 0, 0, '3800', '3600', 2, '2008-01-29 13:37:18', '2008-01-29 13:37:18', 53, 9, 2, 1, 0),
(151, 'Sá»¯a Vinamilk tiá»‡t trÃ¹ng', NULL, 'Sá»¯a Vinamilk tiá»‡t trÃ¹ng socola', 'Sá»¯a Vinamilk tiá»‡t trÃ¹ng socola 200ml', '151.jpg', '', 1, 0, 0, '3800', '3600', 2, '2008-01-29 13:40:10', '2008-01-29 13:40:10', 53, 9, 2, 1, 0),
(152, 'Háº¡t nÃªm 2gÃ³i 250g', NULL, 'Háº¡t nÃªm 2gÃ³i 250g xÆ°Æ¡ng háº§m vÃ  thá»‹t', 'Háº¡t nÃªm 2gÃ³i 250g', '152.jpg', '', 1, 0, 0, '32000', '30000', 2, '2008-01-29 13:42:51', '2008-01-29 13:42:51', 49, 9, 2, 1, 0),
(153, 'Háº¡t nÃªm Knor 2 tÃºi 500g', NULL, 'Háº¡t nÃªm Knor 2 tÃºi 500g háº¡t nÃªm tá»« thá»‹t lÃ m cÃ¡c mÃ³n canh thÃªm ngon ngá»t', 'Háº¡t nÃªm Knor 2 tÃºi 500g', '153.jpg', '', 1, 1, 0, '36500', '35700', 2, '2008-01-29 13:44:43', '2008-01-29 23:07:09', 49, 9, 2, 1, 0),
(154, 'Háº¡t nÃªm Knorr 2 tÃºi 1kg', NULL, 'Háº¡t nÃªm Knorr lÃ m tá»« thá»‹t giÃºp cÃ¡c mÃ³n Äƒn thÃªm ngon ngá»t', 'Háº¡t nÃªm Knorr 2 tÃºi 1kg', '154.jpg', '', 1, 2, 0, '75000', '72000', 2, '2008-01-29 13:46:17', '2008-01-29 13:46:17', 49, 9, 2, 1, 0),
(155, 'Háº¡t nÃªm Knorr 2 tÃºi 300g', NULL, 'Háº¡t nÃªm Knorr lÃ m tá»« thá»‹t nguyÃªn cháº¥t giÃºp cÃ¡c mÃ³n Äƒn thÃªm ngon ngá»t', 'Háº¡t nÃªm Knorr 2 tÃºi 300g', '155.jpg', '', 1, 1, 0, '28000', '26000', 2, '2008-01-29 13:47:10', '2008-01-29 13:47:10', 49, 9, 2, 1, 0),
(156, 'Háº¡t nÃªm Ajingon xÆ°Æ¡ng háº§m 90g', NULL, 'Háº¡t nÃªm Ajingon xÆ°Æ¡ng háº§m vÃ  thá»‹t _ Ngon tá»« thá»‹t ngá»t tá»« xÆ°Æ¡ng', 'Háº¡t nÃªm Ajingon xÆ°Æ¡ng háº§m vÃ  thá»‹t 90g', '156.jpg', '', 1, 0, 0, '4000', '3600', 2, '2008-01-29 13:48:57', '2008-01-30 11:38:28', 49, 9, 2, 1, 0),
(157, 'Bá»™t canh Háº£i ChÃ¢u', NULL, 'Bá»™t canh Háº£i ChÃ¢u 200g', 'Bá»™t canh Háº£i ChÃ¢u 200g', '157.jpg', '', 1, 0, 0, '2300', '1900', 2, '2008-01-29 13:50:39', '2008-01-29 13:50:39', 49, 9, 2, 1, 0),
(158, 'Bá»™t canh Iá»‘t Háº£i chÃ¢u', NULL, 'Bá»™t canh I-á»‘t Háº£i chÃ¢u 200g', 'Bá»™t canh I-á»‘t Háº£i chÃ¢u 200g', '158.jpg', '', 1, 1, 0, '2300', '1900', 2, '2008-01-29 13:52:09', '2008-01-29 13:52:09', 49, 9, 2, 1, 0),
(159, 'Muá»‘i tinh i á»‘t Visalco', NULL, 'Muá»‘i tinh i á»‘t Visalco', 'Muá»‘i tinh i á»‘t Visalco', '159.jpg', '', 1, 1, 0, '2300', '1900', 2, '2008-01-29 13:53:09', '2008-01-29 13:53:09', 49, 9, 2, 1, 0),
(160, 'Muá»‘i musa', NULL, 'Muá»‘i musa, máº·n dá»‹u, tinh sáº¡ch, thuáº§n khiáº¿t', 'Muá»‘i musa', '160.jpg', '', 1, 1, 0, '2300', '1900', 2, '2008-01-29 13:55:11', '2008-01-29 13:55:11', 49, 9, 2, 1, 0),
(161, 'Muá»‘i Äƒn sáº¡ch Isalco', NULL, 'Muá»‘i Äƒn sáº¡ch Isalco', 'Muá»‘i Äƒn sáº¡ch Isalco', '161.jpg', '', 1, 1, 0, '2300', '1900', 2, '2008-01-29 13:56:26', '2008-01-29 13:56:26', 49, 9, 2, 1, 0),
(162, 'Pa tÃª gan', '123', 'Pa tÃª gan 170g', 'Pa tÃª gan 170g', '162.jpg', '', 1, 6, 4, '13000', '11500', 2, '2008-01-29 14:16:25', '2008-01-29 14:16:25', 42, 2, 2, 1, 0),
(163, 'Muá»‘i á»›t Háº£o', NULL, 'Muá»‘i á»›t Háº£o 140g', 'Muá»‘i á»›t Háº£o 140g', '163.jpg', '', 1, 2, 0, '4000', '3500', 2, '2008-01-29 14:17:47', '2008-01-29 14:21:01', 49, 2, 2, 1, 0),
(164, 'Muá»‘i á»›t tiÃªu Ä‘á» Trung ThÃ nh', NULL, 'Muá»‘i á»›t tiÃªu Ä‘á» Trung ThÃ nh 220g', 'Muá»‘i á»›t tiÃªu Ä‘á» Trung ThÃ nh 220g', '164.jpg', '', 1, 8, 0, '6000', '5500', 2, '2008-01-29 14:19:41', '2008-01-29 14:19:41', 49, 2, 2, 1, 0),
(165, 'Muá»‘i tiÃªu Visalco', NULL, 'Muá»‘i tiÃªu Visalco', 'Muá»‘i tiÃªu Visalco', '165.jpg', '', 1, 23, 8, '5000', '4700', 2, '2008-01-29 14:23:14', '2008-01-29 14:23:14', 49, 2, 2, 1, 0),
(166, 'MÃ­t sáº¥y 100g', NULL, 'MÃ­t sáº¥y hÆ°Æ¡ng vá»‹ tá»± nhiÃªn', 'MÃ­t sáº¥y 100g', '166.jpg', '', 1, 0, 0, '11000', '10500', 2, '2008-01-29 14:24:29', '2008-01-29 14:24:29', 66, 9, 2, 1, 0),
(167, 'MÃ­t sáº¥y 230g', NULL, 'MÃ­t sáº¥y hÆ°Æ¡ng vá»‹ tá»± nhiÃªn', 'MÃ­t sáº¥y 230g', '167.jpg', '', 1, 0, 0, '23000', '21000', 2, '2008-01-29 14:25:59', '2008-01-29 14:25:59', 66, 9, 2, 1, 0);
INSERT INTO `product` (`Id`, `Name`, `Code`, `Description`, `Detail`, `Image`, `ImageNote`, `Status`, `Views`, `Orders`, `Price`, `PriceQTM`, `HotProduct`, `CreateDate`, `ModifyDate`, `categoryId`, `unitId`, `currencyId`, `providerId`, `manufacturerId`) VALUES
(168, 'MÃ­t sáº¥y 250g', NULL, 'MÃ­t sáº¥y hÆ°Æ¡ng vá»‹ tá»± nhiÃªn', 'MÃ­t sáº¥y 250g', '168.jpg', '', 1, 0, 0, '26000', '24500', 2, '2008-01-29 14:27:11', '2008-01-29 14:27:11', 66, 9, 2, 1, 0),
(169, 'MÃ­t sáº¥y 35g', NULL, 'MÃ­t sáº¥y hÆ°Æ¡ng vá»‹ tá»± nhiÃªn', 'MÃ­t sáº¥y 35g', '169.jpg', '', 1, 0, 0, '4000', '3500', 2, '2008-01-29 14:27:52', '2008-01-29 14:27:52', 66, 9, 2, 1, 0),
(170, 'TrÃ¡i cÃ¢y sáº¥y', NULL, 'TrÃ¡i cÃ¢y sáº¥y hÆ°Æ¡ng vá»‹ tá»± nhiÃªn', 'TrÃ¡i cÃ¢y sáº¥y 35g', '170.jpg', '', 1, 0, 0, '4000', '3500', 2, '2008-01-29 14:29:38', '2008-01-29 14:29:38', 66, 9, 2, 1, 0),
(171, 'TrÃ¡i cÃ¢y sáº¥y 100g', NULL, 'TrÃ¡i cÃ¢y sáº¥y hÆ°Æ¡ng vá»‹ tá»± nhiÃªn', 'TrÃ¡i cÃ¢y sáº¥y 100g', '171.jpg', '', 1, 0, 0, '9000', '8500', 2, '2008-01-29 14:31:01', '2008-01-29 14:31:01', 66, 9, 2, 1, 0),
(172, 'BÃ¡nh Butter 454g', NULL, 'BÃ¡nh Butter 454g', 'BÃ¡nh Butter 454g', '172.jpg', '', 1, 0, 0, '55000', '50000', 2, '2008-01-29 14:36:11', '2008-01-29 14:36:11', 33, 2, 2, 1, 0),
(173, 'TrÃ  Nestea chanh', NULL, 'TrÃ  Nestea chanh bá»• sung Vitamin C mÃ¡t láº¡nh háº¿t Ã½', 'TrÃ  Nestea chanh 20gÃ³i x 18g', '173.jpg', '', 1, 0, 0, '19000', '18000', 2, '2008-01-29 14:38:57', '2008-01-29 14:38:57', 41, 2, 2, 1, 0),
(174, 'Káº¹o háº£i hÃ  filling 400g', NULL, 'Káº¹o háº£i hÃ  filling 400g', 'Káº¹o háº£i hÃ  filling 400g', '174.jpg', '', 1, 0, 0, '17000', '15000', 2, '2008-01-29 14:48:57', '2008-01-29 14:54:08', 34, 2, 2, 1, 0),
(175, 'Káº¹o Háº£i HÃ  toffee caramen', NULL, 'Káº¹o Háº£i HÃ  toffee caramen', 'Káº¹o Háº£i HÃ  toffee caramen', '175.jpg', '', 1, 1, 0, '17000', '15000', 2, '2008-01-29 14:49:57', '2008-01-29 14:55:44', 34, 2, 2, 1, 0),
(176, 'Káº¹o Háº£i HÃ  Filling 200g', NULL, 'Káº¹o Háº£i HÃ  Filling 200g', 'Káº¹o Háº£i HÃ  Filling 200g', '176.jpg', '', 1, 0, 0, '13000', '12000', 2, '2008-01-29 14:50:45', '2008-01-29 14:56:25', 34, 2, 2, 1, 0),
(177, 'Káº¹o Háº£i HÃ  Caffe Moka', NULL, 'Káº¹o Háº£i HÃ  Caffe Moka', 'Káº¹o Háº£i HÃ  Caffe Moka', '177.jpg', '', 1, 0, 0, '17000', '15000', 2, '2008-01-29 14:52:32', '2008-01-29 14:57:22', 34, 2, 2, 1, 0),
(178, 'Káº¹o Háº£i HÃ  Chew', NULL, 'Káº¹o Háº£i HÃ  Chew', 'Káº¹o Háº£i HÃ  Chew', '178.jpg', '', 1, 0, 0, '18000', '17000', 2, '2008-01-29 14:58:37', '2008-01-29 14:58:37', 34, 2, 2, 1, 0),
(179, 'Káº¹o chewy há»—n há»£p TrÃ ng An 475g', NULL, 'Káº¹o chewy há»—n há»£p TrÃ ng An 475g', 'Káº¹o chewy há»—n há»£p TrÃ ng An 475g', '179.jpg', '', 1, 0, 1, '35000', '33500', 2, '2008-01-29 14:59:55', '2008-01-29 15:06:42', 34, 2, 2, 1, 0),
(180, 'Káº¹o hÆ°Æ¡ng cá»‘m TrÃ ng An 475g', NULL, 'Káº¹o hÆ°Æ¡ng cá»‘m TrÃ ng An 475g', 'Káº¹o hÆ°Æ¡ng cá»‘m TrÃ ng An 475g', '180.jpg', '', 1, 0, 0, '35000', '33500', 2, '2008-01-29 15:00:48', '2008-01-29 15:00:48', 34, 2, 2, 1, 0),
(181, 'Káº¹o Háº£i HÃ  Gift', NULL, 'Káº¹o Háº£i HÃ  nhÃ¢n cafe, socola, nho Ä‘en', 'Káº¹o Háº£i HÃ  Gift', '181.jpg', '', 1, 0, 0, '17000', '15000', 2, '2008-01-29 15:02:01', '2008-01-29 15:02:01', 34, 2, 2, 1, 0),
(182, 'Káº¹o TrÃ ng An Chewy Socola sá»¯a', NULL, 'Káº¹o TrÃ ng An Chewy Socola sá»¯a', 'Káº¹o TrÃ ng An Chewy Socola sá»¯a', '182.jpg', '', 1, 0, 0, '35000', '33500', 2, '2008-01-29 15:08:13', '2008-01-29 15:08:13', 34, 2, 2, 1, 0),
(183, 'Háº¡t Ä‘iá»u gia vá»‹ muá»‘i 240g', NULL, 'Háº¡t Ä‘iá»u gia vá»‹ muá»‘i 240g', 'Háº¡t Ä‘iá»u gia vá»‹ muá»‘i 240g', '183.jpg', '', 1, 0, 0, '30000', '27000', 2, '2008-01-29 15:09:55', '2008-01-29 15:09:55', 67, 2, 2, 1, 0),
(184, 'Háº¡t Ä‘iá»u chiÃªn gia vá»‹ muá»‘i 500g', NULL, 'Háº¡t Ä‘iá»u chiÃªn gia vá»‹ muá»‘i 500g', 'Háº¡t Ä‘iá»u chiÃªn gia vá»‹ muá»‘i 500g', '184.jpg', '', 1, 0, 0, '56000', '54000', 2, '2008-01-29 15:11:02', '2008-01-29 15:11:02', 67, 2, 2, 1, 0),
(185, 'BÃ¡nh Háº£i HÃ  Alpella', NULL, 'BÃ¡nh Háº£i HÃ  Alpella', 'BÃ¡nh Háº£i HÃ  Alpella', '185.jpg', '', 1, 0, 0, '45000', '42000', 2, '2008-01-29 15:15:06', '2008-01-29 15:15:06', 33, 2, 2, 1, 0),
(186, 'BÃ¡nh Orion Fresh Pie', NULL, 'BÃ¡nh Orion Fresh Pie', 'BÃ¡nh Orion Fresh Pie', '186.jpg', '', 1, 0, 0, '32000', '29500', 2, '2008-01-29 15:30:22', '2008-01-29 15:52:55', 33, 2, 2, 1, 0),
(187, 'BÃ¡nh Orion Custas', NULL, 'BÃ¡nh Orion Custas', 'BÃ¡nh Orion Custas', '187.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 15:31:23', '2008-01-29 15:31:23', 33, 2, 2, 1, 0),
(188, 'BÃ¡nh Orion Choco Pie', NULL, 'BÃ¡nh Orion Choco Pie', 'BÃ¡nh Orion Choco Pie', '188.jpg', '', 1, 0, 0, '28000', '26000', 2, '2008-01-29 15:33:29', '2008-01-29 22:09:08', 33, 2, 2, 1, 0),
(189, 'BÃ¡nh trá»©ng Rodaz', NULL, 'BÃ¡nh trá»©ng Rodaz', 'BÃ¡nh trá»©ng Rodaz', '189.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 15:34:13', '2008-01-29 15:34:13', 33, 2, 2, 1, 0),
(190, 'BÃ¡nh Apollo', NULL, 'BÃ¡nh Apollo', 'BÃ¡nh Apollo', '190.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 15:35:48', '2008-01-29 15:35:48', 33, 2, 2, 1, 0),
(191, 'BÃ¡nh Apollo dá»©a', NULL, 'BÃ¡nh Apollo dá»©a', 'BÃ¡nh Apollo dá»©a', '191.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 15:36:52', '2008-01-29 15:36:52', 33, 2, 2, 1, 0),
(192, 'MÃ­t sáº¥y khÃ´ lon 200g', NULL, 'MÃ­t sáº¥y khÃ´ hÆ°Æ¡ng vá»‹ tá»± nhiÃªn', 'MÃ­t sáº¥y khÃ´ lon 200g', '192.jpg', '', 1, 0, 0, '28000', '26500', 2, '2008-01-29 15:42:43', '2008-01-29 15:42:43', 66, 2, 2, 1, 0),
(193, 'TrÃ¡i cÃ¢y sáº¥y khÃ´ 250g dáº¡ng há»™p', NULL, 'TrÃ¡i cÃ¢y sáº¥y khÃ´ hÆ°Æ¡ng vá»‹ tá»± nhiÃªn', 'TrÃ¡i cÃ¢y sáº¥y khÃ´ 250g dáº¡ng há»™p', '193.jpg', '', 1, 0, 0, '18000', '16500', 2, '2008-01-29 15:44:39', '2008-01-29 15:44:39', 66, 2, 2, 1, 0),
(194, 'BÃ¡nh Arcor nÆ¡', NULL, 'BÃ¡nh Arcor nÆ¡', 'BÃ¡nh Arcor nÆ¡ 350g', '194.jpg', '', 1, 0, 0, '80000', '77000', 2, '2008-01-29 15:46:34', '2008-01-29 15:46:34', 33, 2, 2, 1, 0),
(195, 'Káº¹o chewy há»—n há»£p kim cÆ°Æ¡ng', NULL, 'Káº¹o chewy há»—n há»£p kim cÆ°Æ¡ng 325g', 'Káº¹o chewy há»—n há»£p kim cÆ°Æ¡ng 325g', '195.jpg', '', 1, 0, 0, '23000', '21500', 2, '2008-01-29 15:48:01', '2008-01-29 15:48:01', 34, 2, 2, 1, 0),
(196, 'BÃ¡nh kem quáº¿ sá»¯a dá»«a TrÃ ng An 350g', NULL, 'BÃ¡nh kem quáº¿ sá»¯a dá»«a TrÃ ng An 350g', 'BÃ¡nh kem quáº¿ sá»¯a dá»«a TrÃ ng An 350g', '196.jpg', '', 1, 0, 0, '20000', '18500', 2, '2008-01-29 15:49:32', '2008-01-29 15:49:32', 33, 2, 2, 1, 0),
(197, 'BÃ¡nh kem quáº¿ nhÃ¢n socola 360g', NULL, 'BÃ¡nh kem quáº¿ nhÃ¢n socola 360g', 'BÃ¡nh kem quáº¿ nhÃ¢n socola 360g', '197.jpg', '', 1, 1, 0, '21000', '19500', 2, '2008-01-29 15:51:19', '2008-01-29 15:51:19', 33, 2, 2, 1, 0),
(198, 'BÃ¡nh Kinh ÄÃ´ First Pie', NULL, 'BÃnh phá»§ socola nhÃ¢n kem dá»e thÆ¡m, hÆ°Æ¡ng vani dÃ¢u', 'BÃ¡nh Kinh ÄÃ´ First Pie 336g', '198.jpg', '', 1, 1, 0, '0', '0', 2, '2008-01-29 15:59:47', '2008-01-29 15:59:47', 33, 2, 2, 1, 0),
(199, 'Káº¹o Arcor bon bon', NULL, 'Káº¹o Arcor bon bon', 'Káº¹o Arcor bon bon', '199.jpg', '', 1, 0, 0, '58000', '55000', 2, '2008-01-29 16:00:43', '2008-01-29 16:00:43', 34, 2, 2, 1, 0),
(200, 'Káº¹o Accor Butter Toffees 350g', NULL, 'Káº¹o Accor Butter Toffees 350g', 'Káº¹o Accor Butter Toffees 350g', '200.jpg', '', 1, 0, 0, '55000', '53000', 2, '2008-01-29 16:03:25', '2008-01-29 16:03:25', 34, 2, 2, 1, 0),
(201, 'BÃ¡nh Festive', NULL, 'BÃ¡nh Festive', 'BÃ¡nh Festive', '201.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 16:05:07', '2008-01-29 16:05:07', 33, 2, 2, 1, 0),
(202, 'BÃ¡nh Beatitude Vodka', NULL, 'BÃ¡nh Beatitude Vodka', 'BÃ¡nh Beatitude Vodka', '202.jpg', '', 1, 2, 0, '48000', '45000', 2, '2008-01-29 16:06:40', '2008-01-29 16:06:40', 33, 2, 2, 1, 0),
(203, 'BÃ¡nh Beatitude Chocolates', NULL, 'BÃ¡nh Beatitude Chocolates', 'BÃ¡nh Beatitude Chocolates', '203.jpg', '', 1, 6, 0, '48000', '45000', 2, '2008-01-29 16:07:39', '2008-01-29 16:07:39', 33, 2, 2, 1, 0),
(204, 'Vinacafe 3 trong 1', NULL, 'Vinacafe bay cÃ¹ng cáº£m xÃºc', 'Vinacafe 3 trong 1 24gÃ³i x 20g', '204.jpg', '', 1, 0, 0, '30000', '26000', 2, '2008-01-29 16:10:40', '2008-01-29 16:10:40', 38, 8, 2, 1, 0),
(205, 'CÃ  phÃª vina há»™p nhá»±a', NULL, 'CÃ  phÃª vina há»™p nhá»±a 20g x 18 gÃ³i', 'CÃ  phÃª vina há»™p nhá»±a 20g x 18 gÃ³i', '205.jpg', '', 1, 0, 0, '26000', '24000', 2, '2008-01-29 16:12:03', '2008-01-29 16:12:03', 38, 2, 2, 1, 0),
(206, 'CÃ  phÃª Nescafe há»™p giáº¥y', NULL, 'CÃ  phÃª Nescafe thÆ¡m ngon hÆ¡n! Vá»‹ cafe Ä‘áº­m Ä‘Ã  hÆ¡n!', 'CÃ  phÃª Nescafe há»™p giáº¥y 3 trong 1, 20gÃ³i x 17g', '206.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 16:14:22', '2008-01-29 16:14:22', 38, 2, 2, 1, 0),
(207, 'CÃ  phÃª vina xay 200g', NULL, 'CÃ  phÃª vina hÆ°Æ¡ng vá»‹ cá»§a thiÃªn nhiÃªn', 'CÃ  phÃª vina xay 200g', '207.jpg', '', 1, 0, 0, '16000', '15000', 2, '2008-01-29 16:15:38', '2008-01-29 16:15:38', 38, 2, 2, 1, 0),
(208, 'CÃ  phÃª trung nguyÃªn khÆ¡i nguá»“n sÃ¡ng táº¡o', NULL, 'CÃ  phÃª trung nguyÃªn khÆ¡i nguá»“n sÃ¡ng táº¡o', 'CÃ  phÃª trung nguyÃªn khÆ¡i nguá»“n sÃ¡ng táº¡o 250g', '208.jpg', '', 1, 0, 0, '26000', '24500', 2, '2008-01-29 16:18:26', '2008-01-29 16:18:26', 38, 2, 2, 1, 0),
(209, 'CÃ  phÃª Vina hÃ²a tan há»™p giáº¥y', NULL, 'CÃ  phÃª Vina hÆ°Æ¡ng vá»‹ cá»§a thiÃªn nhiÃªn', 'CÃ  phÃª Vina hÃ²a tan 2g x 20gÃ³i', '209.jpg', '', 1, 1, 0, '13000', '12000', 2, '2008-01-29 16:19:57', '2008-01-29 16:27:24', 38, 2, 2, 1, 0),
(210, 'CÃ  phÃª Vina sÃ¢m', NULL, 'CÃ  phÃª Vina sÃ¢m 4 trong 1 bá»• dÆ°á»¡ng', 'CÃ  phÃª Vina sÃ¢m 18gÃ³i x 17g', '210.jpg', '', 1, 0, 0, '30000', '28000', 2, '2008-01-29 16:21:25', '2008-01-29 16:21:25', 38, 2, 2, 1, 0),
(211, 'CÃ  phÃª trung nguyÃªn house', NULL, 'Vá»‹ Ä‘áº­m Ä‘Ã  hÆ°Æ¡ng thÆ¡m ná»“ng', 'CÃ  phÃª trung nguyÃªn house 500g', '211.jpg', '', 1, 0, 0, '38500', '37000', 2, '2008-01-29 16:22:47', '2008-01-29 16:22:47', 38, 2, 2, 1, 0),
(212, 'CÃ  phÃª cappuccino hazelnut', NULL, 'CÃ  phÃª cappuccino hazelnut _ ThÆ°á»Ÿng thá»©c phong cÃ¡ch má»›i cá»§a Trung NguyÃªn', 'CÃ  phÃª cappuccino hazelnut 12 gÃ³i', '212.jpg', '', 1, 0, 0, '28500', '27300', 2, '2008-01-29 16:24:15', '2008-01-29 16:24:15', 38, 2, 2, 1, 0),
(213, 'CÃ  phÃª Vina hÃ²a tan há»™p nhá»±a', NULL, 'CÃ  phÃª Vina hÃ²a tan hÆ°Æ¡ng vá»‹ cá»§a thiÃªn nhiÃªn', 'CÃ  phÃª Vina hÃ²a tan 2g x 20gÃ³i', '213.jpg', '', 1, 0, 0, '15000', '14000', 2, '2008-01-29 16:29:22', '2008-01-29 16:29:22', 38, 2, 2, 1, 0),
(214, 'CÃ  phÃª Vina sÃ¢m bá»‹ch rá»i', NULL, 'CÃ  phÃª Vina sÃ¢m 4 trong 1 bá»• dÆ°á»¡ng hÆ¡n', 'CÃ  phÃª Vina sÃ¢m 17g/gÃ³i', '214.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 16:31:27', '2008-01-29 16:31:27', 38, 8, 2, 1, 0),
(215, 'TrÃ  Nestea chanh lite', NULL, 'TrÃ  Nestea chanh cÃ¹ng vui cÃ¹ng thÆ°á»Ÿng thá»©c', 'TrÃ  Nestea chanh lite giáº£m Ä‘Æ°á»ng, bá»• xung thÃªm vitamin C vÃ  cháº¥t xÆ¡', '215.jpg', '', 1, 0, 0, '20000', '18000', 2, '2008-01-29 16:34:10', '2008-01-29 16:34:10', 41, 2, 2, 1, 0),
(216, 'TrÃ  Lipton Ice tea chanh', NULL, 'TrÃ  Lipton Ice tea tá»‰nh tÃ¡o hÆ¡n sáº£ng khoÃ¡i hÆ¡n', 'TrÃ  Lipton Ice tea 20gÃ³i', '216.jpg', '', 1, 0, 0, '26000', '25000', 2, '2008-01-29 16:37:56', '2008-01-29 16:37:56', 41, 2, 2, 1, 0),
(217, 'Cafe Moment hÃ²a tan', NULL, 'Cafe Moment sáº£ng khoÃ¡i vÃ  tá»‰nh tÃ¡o', 'Cafe Moment 3in1', '217.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 16:39:45', '2008-01-29 16:39:45', 38, 2, 2, 1, 0),
(218, 'CÃ  phÃª Nescafe lá» thuá»· tinh 200g', NULL, 'CÃ  phÃª Nescafe sÃ£n sÃ ng ngÃ y má»›i', 'CÃ  phÃª Nescafe lá» thuá»· tinh 200g', '218.jpg', '', 1, 0, 0, '52000', '50600', 2, '2008-01-29 16:41:19', '2008-01-29 16:41:19', 38, 14, 2, 1, 0),
(219, 'CÃ  phÃª Nesfcafe lá» thuá»· tinh 100g', NULL, 'CÃ  phÃª Nesfcafe sáºµn sÃ ng ngÃ y má»›i', 'CÃ  phÃª Nesfcafe lá» thuá»· tinh 100g', '219.jpg', '', 1, 0, 0, '31000', '30000', 2, '2008-01-29 16:42:13', '2008-01-29 22:31:34', 38, 14, 2, 1, 0),
(220, 'TrÃ  Lipton trÃ¡i cÃ¢y', NULL, 'Cáº£m há»©ng dÃ¢ng trÃ n NÄƒm má»›i bá»«ng sÃ¡ng', 'TrÃ  Lipton trÃ¡i cÃ¢y', '220.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 16:44:28', '2008-01-29 16:44:28', 41, 2, 2, 1, 0),
(221, 'TrÃ  Lipton Ice tea chanh', NULL, 'Cáº£m há»©ng dÃ¢ng trÃ n\r\nNÄƒm má»›i bá»«ng sÃ¡ng', 'TrÃ  Lipton Ice tea chanh dáº¡ng lon', '221.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 16:48:33', '2008-01-29 16:48:33', 41, 15, 2, 1, 0),
(222, 'TrÃ  Dilmah bÃ¡ tÆ°á»›c', NULL, 'HÆ°Æ¡ng vá»‹ Ä‘áº­m Ä‘Ã , cáº£ nhÃ  cÃ¹ng vui', 'TrÃ  Dilmah bÃ¡ tÆ°á»›c 25 gÃ³i', '222.jpg', '', 1, 0, 0, '21000', '20800', 2, '2008-01-29 16:50:37', '2008-01-29 16:50:37', 41, 2, 2, 1, 0),
(223, 'TrÃ  Dilmah dÃ¢u', NULL, 'HÆ°Æ¡ng vá»‹ Ä‘áº­m Ä‘Ã , cáº£ nhÃ  Ä‘á»u vui', 'TrÃ  Dilmah dÃ¢u 25 gÃ³i', '223.jpg', '', 1, 0, 0, '21000', '20800', 0, '2008-01-29 16:51:39', '2008-01-29 16:51:39', 41, 2, 2, 1, 0),
(224, 'TrÃ  Dimah Ä‘Ã o', NULL, 'HÆ°Æ¡ng vá»‹ Ä‘áº­m Ä‘Ã , cáº£ nhÃ  Ä‘á»u vui', 'TrÃ  Dimah Ä‘Ã o 25 tÃºi', '224.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 16:52:41', '2008-01-29 16:52:41', 41, 2, 2, 1, 0),
(225, 'TrÃ  Dimah tÃ¡o', NULL, 'HÆ°Æ¡ng vá»‹ Ä‘áº­m Ä‘Ã , cáº£ nhÃ  Ä‘á»u vui', 'TrÃ  Dimah Ä‘Ã o 25 tÃºi', '225.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 16:53:33', '2008-01-29 16:53:33', 41, 2, 2, 1, 0),
(226, 'ChÃ¨ váº¡n sá»± nhÆ° Ã½', NULL, 'ChÃ¨ váº¡n sá»± nhÆ° Ã½ Ä‘á» 50g', 'ChÃ¨ váº¡n sá»± nhÆ° Ã½ Ä‘á» 50g', '226.jpg', '', 1, 0, 0, '3800', '3500', 2, '2008-01-29 16:55:34', '2008-01-29 16:55:34', 41, 2, 2, 1, 0),
(227, 'ChÃ¨ sen giáº¥y 50g', NULL, 'ChÃ¨ sen giáº¥y 50g', 'ChÃ¨ sen giáº¥y 50g', '227.jpg', '', 1, 0, 0, '5300', '5000', 2, '2008-01-29 16:56:58', '2008-01-29 16:56:58', 41, 2, 2, 1, 0),
(228, 'TrÃ  Lipton vÃ ng', NULL, 'TrÃ  Lipton vÃ ng', 'TrÃ  Lipton vÃ ng nhÃºng 25 tÃºi', '228.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 17:03:29', '2008-01-29 17:05:45', 41, 2, 2, 1, 0),
(229, 'TrÃ  Lipton sá»¯a', NULL, 'TrÃ  Lipton sá»¯a 12 gÃ³i x 16,5g', 'TrÃ  Lipton sá»¯a 12 gÃ³i x 16,5g', '229.jpg', '', 1, 0, 0, '25000', '24000', 2, '2008-01-29 17:04:53', '2008-01-29 17:04:53', 41, 2, 2, 1, 0),
(230, 'TrÃ  Lipton vÃ ng nhÃºng 35 tÃºi', NULL, 'TrÃ  Lipton vÃ ng nhÃºng 35 tÃºi', 'TrÃ  Lipton vÃ ng nhÃºng 35 tÃºi', '230.jpg', '', 1, 0, 0, '29000', '28000', 2, '2008-01-29 17:06:41', '2008-01-29 17:06:41', 41, 2, 2, 1, 0),
(231, 'TrÃ  Lipton vÃ ng nhÃºng 50 tÃºi', NULL, 'TrÃ  Lipton vÃ ng nhÃºng 50 tÃºi', 'TrÃ  Lipton vÃ ng nhÃºng 50 tÃºi', '231.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 17:07:42', '2008-01-29 17:07:42', 41, 2, 2, 0, 0),
(232, 'Káº¹o Láº¡c xá»‘p chá»¯ nháº­t TrÃ ng An 350g', 'A1', 'Káº¹o Láº¡c xá»‘p chá»¯ nháº­t TrÃ ng An 350g', 'Káº¹o Láº¡c xá»‘p chá»¯ nháº­t TrÃ ng An 350g', '232.jpg', '', 1, 13, 2, '21000', '20000', 1, '2008-01-29 17:10:22', '2008-02-02 22:03:26', 34, 2, 2, 1, 3),
(233, 'NÆ°á»›c rá»­a chÃ©n Sunlight chanh 771ml', NULL, 'Sáº¡ch bÃ³ng dáº§u má»¡, má»m dá»‹u vá»›i da tay', 'NÆ°á»›c rá»­a chÃ©n Sunlight chanh 771ml', '233.jpg', '', 1, 0, 0, '10000', '9700', 2, '2008-01-29 17:16:02', '2008-01-29 17:16:02', 71, 4, 2, 1, 0),
(234, 'Káº¹o láº¡c xá»‘p gÃ³i TrÃ ng An 375g', NULL, 'Káº¹o láº¡c xá»‘p gÃ³i TrÃ ng An 375g', 'Káº¹o láº¡c xá»‘p gÃ³i TrÃ ng An 375g', '234.jpg', '', 1, 0, 0, '13500', '13000', 2, '2008-01-29 17:17:04', '2008-01-29 17:17:04', 34, 2, 2, 1, 0),
(235, 'Káº¹o KhÃ³m Ä‘áº·c sáº£n miá»n tÃ¢y 360g', NULL, 'Káº¹o KhÃ³m Ä‘áº·c sáº£n miá»n tÃ¢y 360g', 'Káº¹o KhÃ³m Ä‘áº·c sáº£n miá»n tÃ¢y 360g', '235.jpg', '', 1, 1, 0, '11500', '11300', 2, '2008-01-29 17:18:02', '2008-01-29 17:18:02', 34, 7, 2, 1, 0),
(236, 'Káº¹o mÃ­t Ä‘áº·c sáº£n miá»n tÃ¢y 360g', NULL, 'Káº¹o mÃ­t Ä‘áº·c sáº£n miá»n tÃ¢y 360g', 'Káº¹o mÃ­t Ä‘áº·c sáº£n miá»n tÃ¢y 360g', '236.jpg', '', 1, 0, 0, '11500', '11300', 2, '2008-01-29 17:19:06', '2008-01-29 17:19:06', 34, 7, 2, 1, 0),
(237, 'NÆ°á»›c rá»­a bÃ¡t Sunglight trÃ  xanh 800g', NULL, 'NÆ°á»›c rá»­a bÃ¡t Sunglight trÃ  xanh 800g', 'NÆ°á»›c rá»­a bÃ¡t Sunglight trÃ  xanh 800g', '237.jpg', '', 1, 1, 0, '13000', '12000', 2, '2008-01-29 17:20:54', '2008-01-29 17:20:54', 71, 4, 2, 1, 0),
(238, 'NÆ°á»›c rá»­a bÃ¡t Sunlight trÃ  xanh 450g', NULL, 'NÆ°á»›c rá»­a bÃ¡t Sunlight trÃ  xanh 450g', 'NÆ°á»›c rá»­a bÃ¡t Sunlight trÃ  xanh 450g', '238.jpg', '', 1, 0, 0, '7500', '7200', 2, '2008-01-29 17:21:46', '2008-01-29 17:24:50', 71, 4, 2, 1, 0),
(239, 'NÆ°á»›c rá»­a bÃ¡t Sunlight chanh 450g', NULL, 'NÆ°á»›c rá»­a bÃ¡t Sunlight chanh 450g', 'NÆ°á»›c rá»­a bÃ¡t Sunlight chanh 450g', '239.jpg', '', 1, 0, 0, '6500', '6300', 2, '2008-01-29 17:22:42', '2008-01-29 17:22:42', 71, 4, 2, 1, 0),
(240, 'NÆ°á»›c rá»­a bÃ¡t Má»¹ háº£o 900g', NULL, 'NÆ°á»›c rá»­a bÃ¡t Má»¹ háº£o 900g', 'NÆ°á»›c rá»­a bÃ¡t Má»¹ háº£o 900g', '240.jpg', '', 1, 0, 0, '9000', '8500', 2, '2008-01-29 17:26:19', '2008-01-29 17:26:19', 71, 4, 2, 1, 0),
(241, 'NÆ°á»›c rá»­a bÃ¡t Má»¹ Háº£o 450g', NULL, 'NÆ°á»›c rá»­a bÃ¡t Má»¹ Háº£o 450g', 'NÆ°á»›c rá»­a bÃ¡t Má»¹ Háº£o 450g', '241.jpg', '', 1, 0, 0, '5500', '5000', 2, '2008-01-29 17:31:47', '2008-01-29 17:31:47', 71, 4, 2, 1, 0),
(242, 'Sá»¯a bá»™t GROW tÄƒng trÆ°á»Ÿng 1000g', NULL, 'ThÃ´ng minh hÆ¡n cao lá»›n hÆ¡n', 'Bá»• sung 28 loáº¡i vitamin vÃ  khoÃ¡ng cháº¥t, giÃºp cÆ¡ thá»ƒ phÃ¡t triá»ƒn vÃ  tÄƒng trÆ°á»Ÿng', '242.jpg', '', 1, 0, 0, '194000', '184000', 2, '2008-01-29 17:35:38', '2008-01-29 17:35:38', 32, 2, 2, 1, 0),
(243, 'Sá»¯a bá»™t PediaSureBA 400g', NULL, 'Dinh dÆ°Æ¡ng Ä‘áº§y Ä‘á»§ vÃ  cÃ¢n Ä‘á»‘i. GiÃºp tráº» á»‘m, tráº» biáº¿ng Äƒn báº¯t ká»‹p Ä‘Ã  tÄƒng trÆ°á»Ÿng', 'Sá»¯a bá»™t PediaSureBA bá»• sung MCT vÃ  synbiotics, hÆ°Æ¡ng vani', '243.jpg', '', 1, 0, 0, '151000', '141000', 2, '2008-01-29 17:38:30', '2008-01-29 17:38:30', 32, 2, 2, 1, 0),
(244, 'Sá»¯a bá»™t Milmax 2 900g', NULL, 'GiÃºp tráº» phÃ¡t triá»ƒn toÃ n diá»‡n', 'Sá»¯a bá»™t Milmax 2 900g', '244.jpg', '', 1, 0, 0, '188000', '178000', 2, '2008-01-29 17:44:14', '2008-01-30 11:40:31', 32, 2, 2, 1, 0),
(245, 'Sá»¯a bá»™t PediasureBA 900g', NULL, 'Dinh dÆ°á»¡ng Ä‘áº§y Ä‘á»§ vÃ  cÃ¢n Ä‘á»‘i', 'Sá»¯a bá»™t PediasureBA 900g', '245.jpg', '', 1, 2, 0, '286000', '276000', 2, '2008-01-29 17:46:20', '2008-01-30 11:40:47', 32, 2, 2, 1, 0),
(246, 'Sá»¯a bá»™t Similac Advance 1 900g', NULL, 'DÃ nh cho tráº» tá»« 0 Ä‘áº¿n 6 thÃ¡ng tuá»•i', 'Sá»¯a bá»™t Similac Advance 1 900g', '246.jpg', '', 1, 0, 0, '270000', '260000', 2, '2008-01-29 17:47:53', '2008-01-30 11:41:04', 32, 2, 2, 1, 0),
(247, 'Sá»¯a bá»™t Similac Advance 1 400g', NULL, 'SDÃ€nh cho tráº» tá»« 0 Ä‘áº¿n 6 thÃ¡ng tuá»•i', 'Sá»¯a bá»™t Similac Advance 1 400g', '247.jpg', '', 1, 0, 0, '137000', '127500', 2, '2008-01-29 17:51:43', '2008-01-30 11:41:29', 32, 2, 2, 1, 0),
(248, 'Sá»¯a bá»™t Gain Advance IQ 2 400g', NULL, 'Sá»¯a bá»™t cho tráº» 6 thÃ¡ng tuá»•i trá»Ÿ lÃªn', 'Sá»¯a bá»™t Gain Advance IQ 2 400g', '248.jpg', '', 1, 0, 0, '135000', '125500', 2, '2008-01-29 17:53:16', '2008-01-30 11:41:53', 32, 2, 2, 1, 0),
(249, 'Sá»¯a bá»™t Gain Advance IQ 2 900', NULL, 'DÃ nh cho tráº» tá»« 6 thÃ¡ng tuá»•i trá»Ÿ lÃªn', 'Sá»¯a bá»™t Gain Advance IQ 2 900g', '249.jpg', '', 1, 0, 0, '268000', '258000', 2, '2008-01-29 17:55:29', '2008-01-30 11:42:49', 32, 2, 2, 1, 0),
(250, 'Sá»¯a bá»™t Gain Plus IQ3 900g', NULL, 'DÃ nh cho tráº» tá»« 1 Ä‘áº¿n 3 tuá»•i', 'Sá»¯a bá»™t Gain Plus IQ3 900g', '250.jpg', '', 1, 0, 0, '262000', '252500', 2, '2008-01-29 17:57:21', '2008-01-30 11:43:28', 32, 2, 2, 1, 0),
(251, 'Sá»¯a bá»™t Gain Plus IQ3 400g', NULL, 'Sá»¯a bá»™t dÃ nh cho tráº» tá»« 1 Ä‘áº¿n 3 tuá»•i', 'Sá»¯a bá»™t Gain Plus IQ3 400g', '251.jpg', '', 1, 0, 0, '133000', '123500', 2, '2008-01-29 18:04:50', '2008-01-30 11:43:45', 32, 2, 2, 1, 0),
(252, 'Sá»¯a bá»™t Grow IQ 900g', NULL, 'DÃ nh cho tráº» tá»« 3 Ä‘áº¿n 7 tuá»•i', 'Sá»¯a bá»™t Grow IQ 900g', '252.jpg', '', 1, 0, 0, '227000', '217500', 2, '2008-01-29 18:06:48', '2008-01-30 11:44:28', 32, 2, 2, 1, 0),
(253, 'Sá»¯a bá»™t Milmax 3 400g', NULL, 'DÃ nh cho tráº» tá»« 1 Ä‘áº¿n 3 tuá»•i', 'Sá»¯a bá»™t Milmax 3 400g', '253.jpg', '', 1, 0, 0, '0', '0', 0, '2008-01-29 18:10:37', '2008-01-29 20:25:37', 32, 2, 2, 1, 0),
(254, 'Sá»¯a bá»™t Similacmom 400g', NULL, 'DÃ nh cho bÃ  máº¹ mang thai vÃ  cho con bÃº', 'Sá»¯a bá»™t Similacmom 400g', '254.jpg', '', 1, 0, 0, '100000', '90000', 2, '2008-01-29 18:12:53', '2008-01-29 18:12:53', 32, 2, 2, 1, 0),
(255, 'Sá»¯a bá»™t Enfakid A sá»‘ 4 900g', NULL, 'Há»— trá»£ phÃ¡t triá»ƒn trÃ­ tuá»‡ cung cáº¥p cháº¥t xÆ¡ vÃ  cÃ¡c dÆ°á»¡ng cháº¥t cáº§n thiáº¿t giÃºp tráº» phÃ¡t triá»ƒn', 'Sá»¯a bá»™t Enfakid A+ sá»‘ 4 900g', '255.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 18:17:16', '2008-01-30 11:55:05', 32, 2, 2, 1, 0),
(256, 'Sá»¯a bá»™t Enfakid A sá»‘ 4 400g', NULL, 'GiÃºp tráº» phÃ¡t triá»ƒn trÃ­ tuá»‡, cung cáº¥p cháº¥t xÆ¡ vÃ  cÃ¡c dÆ°á»¡ng cháº¥t cáº§n thiáº¿t cho tráº»', 'Sá»¯a bá»™t Enfakid A+ sá»‘ 4 400g', '256.jpg', '', 1, 0, 0, '115000', '105000', 2, '2008-01-29 18:18:19', '2008-01-30 11:55:34', 32, 2, 2, 1, 0),
(257, 'Sá»¯a bá»™t Ensure gold 400g', NULL, 'Dinh dÆ°á»¡ng Ä‘áº§y Ä‘á»§ vÃ  cÃ¢n Ä‘á»‘i', 'Sá»¯a bá»™t Ensure gold 400g', '257.jpg', '', 1, 0, 0, '177000', '167000', 2, '2008-01-29 18:20:25', '2008-01-30 11:56:45', 32, 2, 2, 1, 0),
(258, 'Sá»¯a bá»™t Ensure gold 900g', NULL, 'Dinh dÆ°á»¡ng Ä‘áº§y Ä‘á»§ vÃ  cÃ¢n Ä‘á»‘i', 'Sá»¯a bá»™t Ensure gold 900g', '258.jpg', '', 1, 0, 0, '370000', '360000', 2, '2008-01-29 18:21:53', '2008-01-29 20:05:57', 32, 2, 2, 1, 0),
(259, 'Sá»¯a bá»™t Enfalac A sá»‘ 1 900g', NULL, 'Há»— trá»£ phÃ¡t triá»ƒn trÃ­ nÃ£o vÃ  thá»‹ lá»±c, dÃ nh cho tráº» tá»« 0 - 6 thÃ¡ng tuá»•i', 'Sá»¯a bá»™t Enfalac A+ sá»‘ 1 990g', '259.jpg', '', 1, 0, 0, '246500', '236500', 2, '2008-01-29 18:23:49', '2008-01-30 11:57:14', 32, 2, 2, 1, 0),
(260, 'Sá»¯a bá»™t Enfalac A sá»‘ 1 400g', NULL, 'Há»— trá»£ phÃ¡t triá»ƒn thá»‹ lá»±c vÃ  trÃ­ nÃ£o, dÃ nh cho tráº» tá»« 0 - 6 thÃ¡ng tuá»•i', 'Sá»¯a bá»™t Enfalac A+ sá»‘ 1 400g', '260.jpg', '', 1, 0, 0, '128000', '118000', 2, '2008-01-29 18:25:24', '2008-01-30 11:58:36', 32, 2, 2, 1, 0),
(261, 'Sá»¯a bá»™t Enfapro A 900g', NULL, 'Há»— trá»£ phÃ¡t trá»ƒn trÃ­ nÃ£o vÃ  thá»‹ lá»±c, dÃ nh cho tráº» tá»« 6 Ä‘áº¿n 12 thÃ¡ng tuá»•i', 'Sá»¯a bá»™t Enfapro A 900g', '261.jpg', '', 1, 3, 0, '235000', '225000', 2, '2008-01-29 18:39:16', '2008-01-30 11:59:01', 32, 2, 2, 1, 0),
(262, 'Sá»¯a bá»™t Enfapro A 400g', NULL, 'Há»— trá»£ phÃ¡t triá»ƒn trÃ­ nÃ£o vÃ  thá»‹ lá»±c, dÃ nh cho tráº» tá»« 6 Ä‘áº¿n 12 thÃ¡ng tuá»•i', 'Sá»¯a bá»™t Enfapro A 400g', '262.jpg', '', 1, 2, 0, '122000', '120000', 2, '2008-01-29 18:44:05', '2008-01-29 20:04:05', 32, 2, 2, 1, 0),
(263, 'Sá»¯a bá»™t ENFAGROWN A 900g', NULL, 'Há»— trá»£ phÃ¡t triá»ƒn trÃ­ tuá»‡, hÆ°Æ¡ng vani, dÃ nh cho tráº» tá»« 1 -3 tuá»•i', 'Sá»¯a bá»™t ENFAGROWN A+ 900G', '263.jpg', '', 1, 0, 0, '231000', '221000', 2, '2008-01-29 18:55:38', '2008-01-30 11:59:26', 32, 2, 2, 0, 0),
(264, 'Sá»¯a bá»™t ENFAGROWN A 400g', NULL, 'Há»— trá»£ phÃ¡t triá»ƒn trÃ­ tuá»‡, hÆ°Æ¡ng vani, dÃ nh cho tráº» tá»« 1 - 3 tuá»•i', 'Sá»¯a bá»™t ENFAGROWN A+ 400G', '264.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 18:56:44', '2008-01-30 11:59:42', 32, 2, 2, 1, 0),
(265, 'Sá»¯a bá»™t ENFA MAMA A 900g', NULL, 'DÆ°á»¡ng cháº¥t thiáº¿t yáº¿u há»— trá»£ phÃ¡t triá»ƒn trÃ­ nÃ£o tráº»', 'Sá»¯a bá»™t ENFA MAMA A+900G', '265.jpg', '', 1, 0, 0, '191500', '181500', 2, '2008-01-29 18:58:16', '2008-01-30 12:00:04', 32, 2, 2, 1, 0),
(266, 'Sá»¯a bá»™t ENFA MAMA A 400g', NULL, 'DÆ°á»¡ng cháº¥t thiáº¿t yáº¿u giÃºp há»— trá»£ phÃ¡t triá»ƒn trÃ­ nÃ£o tráº»', 'Sá»¯a bá»™t ENFA MAMA A+ 400G', '266.jpg', '', 1, 0, 0, '100000', '91000', 2, '2008-01-29 18:59:29', '2008-01-30 12:00:22', 32, 2, 2, 0, 0),
(267, 'Sá»¯a bá»™t NAN 1 400g', NULL, 'Sá»¯a bá»™t khá»Ÿi Ä‘áº§u cao cáº¥p, dÃ nh cho tráº» dÆ°á»›i 6 thÃ¡ng tuá»•i', 'Sá»¯a bá»™t NAN-1 400g', '267.jpg', '', 1, 0, 0, '148000', '138500', 2, '2008-01-29 19:02:32', '2008-01-30 12:00:41', 32, 2, 2, 1, 0),
(268, 'Sá»¯a bá»™t NAN 1 900g', NULL, 'Sá»¯a bá»™t khá»Ÿi Ä‘áº§u cao cáº¥p, cho tráº» dÆ°á»›i 6 thÃ¡ng tuá»•i', 'Sá»¯a bá»™t NAN-1 900g', '268.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 19:03:38', '2008-01-30 12:00:57', 32, 2, 2, 1, 0),
(269, 'Sá»¯a bá»™t Friso gold 3 400g', NULL, 'DÃ nh cho tráº» tá»« 1 tuá»•i trá»Ÿ lÃªn', 'Sá»¯a bá»™t Friso gold 3 400g', '269.jpg', '', 1, 2, 0, '133000', '123500', 2, '2008-01-29 19:06:22', '2008-01-30 12:03:09', 32, 2, 2, 1, 0),
(270, 'Sá»¯a bá»™t Friso gold 3 900g', NULL, 'DÃ nh cho tráº» tá»« 1 tuá»•i trá»Ÿ lÃªn', 'Sá»¯a bá»™t Friso gold 3 900g', '270.jpg', '', 1, 0, 0, '256000', '246000', 0, '2008-01-29 19:07:33', '2008-01-30 12:03:33', 32, 2, 2, 1, 0),
(271, 'Sá»¯a bá»™t Friso 2 900g', NULL, 'DÃ nh cho tráº» tá»« 6 thÃ¡ng tuá»•i trá»Ÿ lÃªn', 'Sá»¯a bá»™t Friso 2 900g', '271.jpg', '', 1, 0, 0, '191000', '181500', 2, '2008-01-29 19:12:54', '2008-01-29 19:15:04', 32, 2, 2, 1, 0),
(272, 'Sá»¯a bá»™t Friso 2 400g', NULL, 'DÃ nh cho tráº» tá»« 6 thÃ¡ng tuá»•i trá»Ÿ lÃªn', 'Sá»¯a bá»™t Friso 2 400g', '272.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 19:14:12', '2008-01-29 19:14:12', 32, 2, 2, 1, 0),
(273, 'Sá»¯a bá»™t Friso gold 2 400g', NULL, 'DÃ nh cho tráº» tá»« 6 thÃ¡ng tuá»•i trá»Ÿ lÃªn', 'Sá»¯a bá»™t Friso gold 2 400g', '273.jpg', '', 1, 1, 0, '150000', '140000', 2, '2008-01-29 19:16:27', '2008-01-29 19:16:27', 32, 2, 2, 1, 0),
(274, 'Sá»¯a bá»™t Friso gold 2 900g', NULL, 'DÃ nh cho tráº» tá»« 6 thÃ¡ng tuá»•i trá»Ÿ lÃªn', 'Sá»¯a bá»™t Friso gold 2 900g', '274.jpg', '', 1, 0, 0, '289000', '279000', 2, '2008-01-29 19:17:56', '2008-01-29 19:17:56', 32, 2, 2, 1, 0),
(275, 'Sá»¯a bá»™t NAN2 400g', NULL, 'DÃ nh cho tráº» tá»« 6 thÃ¡ng tuá»•i trá»Ÿ lÃªn', 'Sá»¯a bá»™t NAN-2 400g', '275.jpg', '', 1, 0, 0, '138500', '128500', 2, '2008-01-29 19:19:12', '2008-01-29 19:19:12', 32, 2, 2, 1, 0),
(276, 'Sá»¯a bá»™t NAN2 900g', NULL, 'DÃ nh cho tráº» tá»« 6 thÃ¡ng tuá»•i trá»Ÿ lÃªn', 'Sá»¯a bá»™t NAN2 900g', '276.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 19:20:12', '2008-01-29 19:20:12', 32, 2, 2, 1, 0),
(277, 'Sá»¯a bá»™t Frisolac 1 900g', NULL, 'DÃ nh cho tráº» 0 Ä‘áº¿n 6 thÃ¡ng tuá»•i', 'Sá»¯a bá»™t Frisolac 1 900g', '277.jpg', '', 1, 0, 0, '193500', '183500', 2, '2008-01-29 19:21:31', '2008-01-29 19:21:31', 32, 2, 2, 1, 0),
(278, 'Sá»¯a bá»™t Frisolac 1 400g', NULL, 'DÃ nh cho tráº» tá»« 0 Ä‘áº¿n 6 thÃ¡ng tuá»•i', 'Sá»¯a bá»™t Frisolac 1 400g', '278.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 19:22:31', '2008-01-29 19:22:31', 32, 2, 2, 1, 0),
(279, 'Sá»¯a bá»™t Dumex miá»…n dá»‹ch gold 4 900g', NULL, 'DÃ nh cho tráº» tá»« 3 tuá»•i trá»Ÿ lÃªn', 'Sá»¯a bá»™t Dumex miá»…n dá»‹ch gold 4 900g', '279.jpg', '', 1, 0, 0, '234500', '224500', 2, '2008-01-29 19:24:00', '2008-01-29 19:24:00', 32, 2, 2, 1, 0),
(280, 'Sá»¯a bá»™t Dumex miá»…n dá»‹ch gold 4 400g', NULL, 'DÃ nh cho tráº» tá»« 3 tuá»•i trá»Ÿ lÃªn', 'Sá»¯a bá»™t Dumex miá»…n dá»‹ch gold 4 400g', '280.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 19:24:49', '2008-01-29 19:24:49', 32, 2, 2, 1, 0),
(281, 'Sá»¯a bá»™t Friso gold 3 400g', NULL, 'DÃ nh cho tráº» tá»« 1 tuá»•i trá»Ÿ lÃªn', 'Sá»¯a bá»™t Friso gold 3 400g', '281.jpg', '', 1, 0, 0, '133500', '123500', 2, '2008-01-29 19:25:52', '2008-01-29 19:25:52', 32, 2, 2, 1, 0),
(282, 'Sá»¯a bá»™t Friso gold 3 900g', NULL, 'DÃ nh cho tráº» tá»« 1 tuá»•i trá»Ÿ lÃªn', 'Sá»¯a bá»™t Friso gold 3 900g', '282.jpg', '', 1, 0, 1, '256000', '246000', 2, '2008-01-29 19:26:43', '2008-01-29 19:26:43', 32, 2, 2, 1, 0),
(283, 'Sá»¯a bá»™t Friso 3 900g', NULL, 'DÃ nh cho tráº» tá»« 1 tuá»•i trá»Ÿ lÃªn', 'Sá»¯a bá»™t Friso 3 900g', '283.jpg', '', 1, 0, 0, '168500', '158500', 2, '2008-01-29 19:27:57', '2008-01-29 19:27:57', 32, 2, 2, 1, 0),
(284, 'Sá»¯a bá»™t Friso 3 400g', NULL, 'DÃ nh cho tráº» tá»« 1 tuá»•i trá»Ÿ lÃªn', 'Sá»¯a bá»™t Friso 3 400g', '284.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 19:28:47', '2008-01-29 19:28:47', 32, 2, 2, 1, 0),
(285, 'Sá»¯a bá»™t Dumex miáº¿n dá»‹ch gold 3 400g', NULL, 'Cho tráº» tá»« 1 Ä‘Ã©n 3 tuá»•i', 'Sá»¯a bá»™t Dumex miáº¿n dá»‹ch gold 3 400g', '285.jpg', '', 1, 0, 1, '135000', '125000', 2, '2008-01-29 19:30:04', '2008-01-29 19:30:04', 32, 2, 2, 1, 0),
(286, 'Sá»¯a bá»™t Dumex miá»…n dá»‹ch gold 3 900g', NULL, 'DÃ nh cho tráº» tá»« 1 Ä‘áº¿n 3 tuá»•i trá»Ÿ lÃªn', 'Sá»¯a bá»™t Dumex miá»…n dá»‹ch gold 3 900g', '286.jpg', '', 1, 0, 3, '262500', '252500', 2, '2008-01-29 19:31:05', '2008-01-29 19:31:05', 32, 2, 2, 1, 0),
(287, 'Sá»¯a bá»™t Dumex miá»…n dá»‹ch gold 2 400g', NULL, 'DÃ nh cho tráº» tá»« 6 Ä‘áº¿n 12 thÃ¡ng tuá»•i', 'Sá»¯a bá»™t Dumex miá»…n dá»‹ch gold 2 400g', '287.jpg', '', 1, 0, 0, '143000', '133500', 2, '2008-01-29 19:32:15', '2008-01-29 19:32:15', 32, 2, 2, 1, 0),
(288, 'Sá»¯a bá»™t Dumex miá»…n dá»‹ch gold 2 900g', NULL, 'DÃ nh cho tráº» tá»« 6 Ä‘áº¿n 12 thÃ¡ng tuá»•i', 'Sá»¯a bá»™t Dumex miá»…n dá»‹ch gold 2 900g', '288.jpg', '', 1, 0, 3, '280000', '270000', 2, '2008-01-29 19:33:12', '2008-01-29 19:33:12', 32, 2, 2, 1, 0),
(289, 'TÄƒm bÃ´ng Soft Tip 280 sticks', NULL, 'TÄƒm bÃ´ng Soft Tip 280 sticks', 'TÄƒm bÃ´ng Soft Tip 280 sticks', '289.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 19:37:57', '2008-01-29 19:37:57', 72, 2, 2, 1, 0),
(290, 'TÄƒm bÃ´ng Soft Tip 200 sticks', NULL, 'TÄƒm bÃ´ng Soft Tip 200 sticks', 'TÄƒm bÃ´ng Soft Tip 200 sticks', '290.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 19:38:36', '2008-01-29 19:38:36', 72, 2, 2, 1, 0),
(291, 'Sá»¯a tÆ°Æ¡i má»™c chÃ¢u dá»«a 118ml', NULL, 'Sá»¯a tÆ°Æ¡i má»™c chÃ¢u dá»«a 118ml', 'Sá»¯a tÆ°Æ¡i má»™c chÃ¢u dá»«a 118ml', '291.jpg', '', 1, 0, 0, '2800', '2600', 2, '2008-01-29 19:45:21', '2008-01-29 19:45:21', 52, 2, 2, 1, 0),
(292, 'Sá»¯a tÆ°Æ¡i Vinamilk sÃ´cola 110ml', NULL, 'Sá»¯a tÆ°Æ¡i Vinamilk sÃ´cola 110ml', 'Sá»¯a tÆ°Æ¡i Vinamilk sÃ´cola 110ml', '292.jpg', '', 1, 0, 0, '11000', '10500', 2, '2008-01-29 19:52:53', '2008-01-29 19:52:53', 52, 3, 2, 1, 0),
(293, 'Sá»¯a bá»™t Similacmom 900g', NULL, 'dÃ nh cho bÃ  máº¹ mang thai vÃ  cho con bÃº', 'Sá»¯a bá»™t Similacmom 900g', '293.jpg', '', 1, 0, 1, '0', '0', 2, '2008-01-29 20:08:08', '2008-01-29 20:08:08', 32, 2, 2, 1, 0),
(294, 'Sá»¯a bá»™t Grow 3 Ä‘Ã©n 7 tuá»•i 400g', NULL, 'DÃ nh cho tráº» tá»« 3 Ä‘áº¿n 7 tuá»•i', 'Sá»¯a bá»™t Grow 3 Ä‘Ã©n 7 tuá»•i 400g', '294.jpg', '', 1, 0, 0, '0', '0', 2, '2008-01-29 20:10:42', '2008-01-29 20:10:42', 32, 2, 2, 1, 0),
(295, 'Sá»¯a bá»™t Milmax 3 900g', NULL, 'DÃ nh cho tráº» tá»« 1 Ä‘áº¿n 3tuá»•i', 'Sá»¯a bá»™t Milmax 3 900g', '295.jpg', '', 1, 2, 0, '0', '0', 0, '2008-01-29 20:14:18', '2008-01-29 20:14:18', 32, 2, 2, 1, 0),
(296, 'Giáº¥y Äƒn bá» tÃºi My Lan loáº¡i to 20 to 2 lop', NULL, 'Giáº¥y Äƒn bá» tÃºi My Lan loáº¡i to 20 to 2 lop', 'Giáº¥y Äƒn bá» tÃºi My Lan loáº¡i to 20 to 2 lop', '296.jpg', '', 1, 0, 0, '10000', '9000', 2, '2008-01-29 20:21:59', '2008-01-29 20:21:59', 65, 8, 2, 1, 0),
(297, 'Giáº¥y Äƒn Apple 100 tá»', NULL, 'Giáº¥y Äƒn Apple 100 tá»', 'Giáº¥y Äƒn Apple 100 tá»', '297.jpg', '', 1, 0, 0, '6700', '6500', 2, '2008-01-29 20:23:54', '2008-01-29 20:23:54', 65, 2, 2, 1, 0),
(298, 'BÃ¡nh quáº¿ TrÃ ng An vani 75g', NULL, 'BÃ¡nh quáº¿ TrÃ ng An vani 75g', 'BÃ¡nh quáº¿ TrÃ ng An vani 75g', '298.jpg', '', 1, 0, 0, '3000', '2800', 2, '2008-01-29 22:01:29', '2008-01-29 22:01:29', 33, 2, 2, 1, 0),
(299, 'Thuoc la Vina', '01213456789', 'sdadasdasdggf', 'dadsadasdsadasdasdagsgg ', '299.jpg', 'hut thuoc la co hai cho suc khoe', 1, 0, 0, '11000', '10500', 0, '2008-02-02 00:05:03', '2008-02-02 00:05:03', 5, 7, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `productproperty`
--

DROP TABLE IF EXISTS `productproperty`;
CREATE TABLE IF NOT EXISTS `productproperty` (
  `Id` int(10) NOT NULL,
  `productId` int(10) NOT NULL,
  `propertyId` int(10) NOT NULL,
  `Value` text collate latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `productproperty`
--

INSERT INTO `productproperty` (`Id`, `productId`, `propertyId`, `Value`) VALUES
(12, 21, 4, '600'),
(16, 8, 4, '180'),
(2, 13, 4, '400'),
(13, 6, 4, '700'),
(9, 20, 4, '400'),
(11, 5, 4, '700'),
(8, 19, 4, '200'),
(3, 14, 4, '200'),
(10, 2, 4, '200'),
(7, 18, 4, '200'),
(6, 4, 4, '200'),
(15, 23, 4, '600'),
(14, 22, 4, '250'),
(1, 12, 4, '50'),
(18, 9, 4, '380'),
(20, 10, 4, '180'),
(5, 16, 4, '200'),
(22, 11, 4, '380'),
(4, 15, 4, '50'),
(17, 24, 4, '200'),
(19, 25, 4, '400'),
(21, 26, 4, '250'),
(23, 27, 4, '250'),
(24, 28, 4, '80'),
(25, 29, 4, '200'),
(26, 30, 4, '150'),
(27, 31, 4, '250'),
(28, 32, 4, '250'),
(29, 33, 4, '50'),
(30, 34, 4, '50'),
(31, 35, 4, '200'),
(32, 36, 4, '400'),
(33, 37, 4, '400'),
(34, 38, 4, '700'),
(35, 39, 19, '0,8'),
(36, 40, 19, '3'),
(37, 41, 2, '200'),
(38, 50, 2, '560'),
(39, 51, 2, '250'),
(40, 52, 2, '250'),
(41, 64, 2, '100'),
(42, 66, 2, '100'),
(43, 67, 2, '285'),
(44, 68, 2, '80'),
(45, 69, 2, '100'),
(46, 70, 2, '400'),
(47, 74, 2, '120'),
(48, 75, 2, '400'),
(49, 76, 2, '56'),
(50, 77, 2, '450'),
(51, 78, 19, '0,4'),
(52, 79, 19, '1'),
(53, 80, 19, '1'),
(54, 81, 2, '100'),
(55, 82, 2, '500'),
(56, 83, 2, '8'),
(57, 91, 4, '250'),
(58, 92, 4, '550'),
(59, 93, 4, '1500'),
(60, 94, 4, '5000'),
(61, 95, 4, '500'),
(62, 96, 4, '1500'),
(63, 114, 4, '30000'),
(64, 115, 4, '3000'),
(65, 116, 4, '3000'),
(66, 117, 4, '3000'),
(67, 118, 4, '750'),
(68, 119, 4, '750'),
(69, 120, 4, '750'),
(70, 121, 4, '750'),
(71, 122, 4, '750'),
(72, 123, 4, '50'),
(73, 124, 4, '50'),
(74, 125, 4, '50'),
(75, 126, 4, '50'),
(76, 127, 4, '50'),
(77, 128, 4, '1500'),
(78, 129, 4, '1500'),
(79, 130, 4, '1500'),
(80, 131, 4, '250'),
(81, 132, 4, '180'),
(82, 133, 4, '180'),
(83, 134, 4, '180'),
(84, 135, 4, '180'),
(85, 136, 4, '180'),
(86, 137, 4, '180'),
(87, 138, 4, '110'),
(88, 139, 4, '110'),
(89, 140, 4, '180'),
(90, 141, 4, '180'),
(91, 142, 4, '118'),
(92, 143, 4, '200'),
(93, 144, 4, '180'),
(94, 145, 4, '180'),
(95, 146, 4, '200'),
(96, 147, 4, '200'),
(97, 148, 4, '200'),
(98, 149, 4, '200'),
(99, 150, 4, '200'),
(100, 151, 4, '200'),
(101, 152, 2, '250'),
(102, 153, 2, '500'),
(103, 154, 2, '1000'),
(104, 155, 2, '300'),
(105, 156, 2, '90'),
(106, 157, 2, '200'),
(107, 158, 2, '200'),
(108, 159, 2, '00'),
(109, 160, 2, '00'),
(110, 161, 2, '00'),
(111, 162, 2, '170'),
(112, 163, 2, '140'),
(113, 164, 2, '220'),
(114, 165, 2, '00'),
(115, 166, 2, '100'),
(116, 167, 2, '230'),
(117, 168, 2, '250'),
(118, 169, 2, '35'),
(119, 170, 2, '35'),
(120, 171, 2, '100'),
(121, 173, 2, '00'),
(122, 183, 2, '240'),
(123, 184, 2, '500'),
(124, 89, 2, '00'),
(125, 192, 2, '200'),
(126, 193, 2, '250'),
(127, 204, 2, '00'),
(128, 205, 2, '00'),
(129, 206, 2, '00'),
(130, 207, 2, '200'),
(131, 208, 2, '250'),
(132, 209, 2, '00'),
(133, 210, 2, '00'),
(134, 211, 2, '500'),
(135, 212, 2, '00'),
(136, 213, 2, '00'),
(137, 214, 2, '00'),
(138, 215, 2, '00'),
(139, 216, 2, '00'),
(140, 217, 2, '00'),
(141, 218, 2, '200'),
(142, 219, 2, '100'),
(143, 220, 2, '00'),
(144, 221, 2, '00'),
(145, 222, 2, '00'),
(146, 223, 2, '00'),
(147, 224, 2, '00'),
(148, 225, 2, '00'),
(149, 226, 2, '50'),
(150, 227, 2, '50'),
(151, 228, 2, '00'),
(152, 229, 2, '00'),
(153, 230, 2, '00'),
(154, 231, 2, '00'),
(156, 233, 4, '771'),
(157, 237, 4, '800'),
(158, 238, 4, '450'),
(159, 239, 4, '450'),
(160, 240, 4, '900'),
(161, 241, 4, '450'),
(162, 242, 2, '1000'),
(163, 243, 2, '400'),
(164, 244, 2, '900'),
(165, 245, 2, '900'),
(166, 246, 2, '900'),
(167, 247, 2, '400'),
(168, 248, 2, '400'),
(169, 249, 2, '900'),
(170, 250, 2, '900'),
(171, 251, 2, '400'),
(172, 252, 2, '900'),
(173, 253, 2, '400'),
(174, 254, 2, '400'),
(175, 255, 2, '900'),
(176, 256, 2, '400'),
(177, 257, 2, '400'),
(178, 258, 2, '900'),
(179, 259, 2, '900'),
(180, 260, 2, '400'),
(181, 261, 2, '900'),
(182, 262, 2, '400'),
(183, 263, 2, '900'),
(184, 264, 2, '400'),
(185, 265, 2, '900'),
(186, 266, 2, '400'),
(187, 267, 2, '400'),
(188, 268, 2, '900'),
(189, 269, 2, '400'),
(190, 270, 2, '900'),
(191, 271, 2, '900'),
(192, 272, 2, '400'),
(193, 273, 2, '400'),
(194, 274, 2, '900'),
(195, 275, 2, '400'),
(196, 276, 2, '900'),
(197, 277, 2, '900'),
(198, 278, 2, '400'),
(199, 279, 2, '900'),
(200, 280, 2, '400'),
(201, 281, 2, '400'),
(202, 282, 2, '900'),
(203, 283, 2, '900'),
(204, 284, 2, '400'),
(205, 285, 2, '400'),
(206, 286, 2, '900'),
(207, 287, 2, '400'),
(208, 288, 2, '900'),
(209, 291, 4, '118'),
(210, 292, 4, '110'),
(211, 293, 2, '900'),
(212, 294, 2, '400'),
(213, 295, 2, '900'),
(214, 73, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `Id` int(10) NOT NULL auto_increment,
  `Name` varchar(255) collate latin1_general_ci default NULL,
  `Detail` text collate latin1_general_ci,
  `Unit` varchar(255) collate latin1_general_ci default NULL,
  `Value` varchar(255) collate latin1_general_ci default NULL,
  `Status` int(2) default '1',
  `Position` int(10) default NULL,
  `RootId` int(10) NOT NULL default '0',
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`Id`, `Name`, `Detail`, `Unit`, `Value`, `Status`, `Position`, `RootId`) VALUES
(4, 'Thá»ƒ tÃ­ch', '', 'ml', '', 1, 3, 1),
(1, 'Khá»‘i lÆ°á»£ng vÃ  thá»ƒ tÃ­ch', '', '', '', 1, 1, 0),
(2, 'Khá»‘i lÆ°á»£ng', 'Khá»‘i lÆ°á»£ng', 'gram', 'ml,gram', 1, 2, 1),
(19, 'Khá»‘i lÆ°á»£ng', '', 'kg', '', 1, 17, 1),
(20, 'Thá»ƒ tÃ­ch', '', 'lÃ­t', '', 1, 18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
CREATE TABLE IF NOT EXISTS `provider` (
  `Id` int(10) NOT NULL auto_increment,
  `Name` varchar(255) collate latin1_general_ci default NULL,
  `Telephone` varchar(255) collate latin1_general_ci default NULL,
  `Mobile` varchar(255) collate latin1_general_ci default NULL,
  `Fax` varchar(255) collate latin1_general_ci default NULL,
  `Email` varchar(255) collate latin1_general_ci default NULL,
  `Website` varchar(255) collate latin1_general_ci default NULL,
  `Address` varchar(255) collate latin1_general_ci default NULL,
  `Image` varchar(255) collate latin1_general_ci default NULL,
  `Info` varchar(255) collate latin1_general_ci default NULL,
  `Position` int(10) default NULL,
  `Status` int(10) default '1',
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `provider`
--

INSERT INTO `provider` (`Id`, `Name`, `Telephone`, `Mobile`, `Fax`, `Email`, `Website`, `Address`, `Image`, `Info`, `Position`, `Status`) VALUES
(1, 'QTM', '', '', '', '', '', '', NULL, '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
CREATE TABLE IF NOT EXISTS `rate` (
  `Id` int(11) NOT NULL auto_increment,
  `Point` int(11) default NULL,
  `Percent` double default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `rate`
--

INSERT INTO `rate` (`Id`, `Point`, `Percent`) VALUES
(2, 26, 3),
(4, 40, 9),
(1, 30, 6);

-- --------------------------------------------------------

--
-- Table structure for table `rules`
--

DROP TABLE IF EXISTS `rules`;
CREATE TABLE IF NOT EXISTS `rules` (
  `Id` int(10) NOT NULL,
  `Name` varchar(255) collate latin1_general_ci default NULL,
  `Detail` text collate latin1_general_ci,
  `WriteDate` datetime default NULL,
  `Status` int(2) default '1',
  `Position` int(10) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `rules`
--

INSERT INTO `rules` (`Id`, `Name`, `Detail`, `WriteDate`, `Status`, `Position`) VALUES
(1, 'Qui Ä‘á»‹nh chung', 'ban vui long dang ky truoc khi chon gio hang ma ban can mua', '2008-01-16 23:52:01', 1, 1),
(2, 'Giao nháº­n hÃ ng hÃ³a', 'ad Ã¡dÃ¡da ds d 8888888888888', '2008-01-17 00:08:23', 1, 2),
(3, 'Thanh toÃ¡n', 'sfdg sdg sdfg dfsg&nbsp; sfg', '2008-01-17 00:10:17', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
CREATE TABLE IF NOT EXISTS `unit` (
  `Id` int(10) NOT NULL auto_increment,
  `Name` varchar(255) collate latin1_general_ci default NULL,
  `Info` text collate latin1_general_ci,
  `Status` int(2) default '1',
  `Position` int(10) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`Id`, `Name`, `Info`, `Status`, `Position`) VALUES
(1, 'Chiáº¿c', 'Chiáº¿c', 1, 1),
(2, 'Há»™p', 'Há»™p', 1, 2),
(3, 'Lá»‘c', 'Lá»‘c', 1, 3),
(4, 'Chai', 'Chai', 1, 4),
(5, 'CÃ¡i', '', 1, 5),
(6, 'Cuá»™n', '', 1, 6),
(7, 'GÃ³i', '', 1, 7),
(8, 'Bá»‹ch', '', 1, 8),
(9, 'TÃºi', '', 1, 9),
(10, 'TuÃ½p', '', 1, 10),
(11, 'HÅ©', '', 1, 11),
(12, 'Thá»i', '', 1, 12),
(13, 'Vá»‰', '', 1, 13),
(14, 'Lá»', '', 1, 14),
(15, 'Lon', '', 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `usersonline`
--

DROP TABLE IF EXISTS `usersonline`;
CREATE TABLE IF NOT EXISTS `usersonline` (
  `Id` int(10) NOT NULL auto_increment,
  `TimeStamp` int(15) NOT NULL default '0',
  `SessionID` varchar(100) NOT NULL default '',
  `File` varchar(100) NOT NULL,
  PRIMARY KEY  (`Id`),
  KEY `timestamp` (`TimeStamp`),
  KEY `SessionID` (`SessionID`),
  KEY `FILE` (`File`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `usersonline`
--

INSERT INTO `usersonline` (`Id`, `TimeStamp`, `SessionID`, `File`) VALUES
(2, 1204182689, '35q5snb20tqu4544utj2ug94s0', '/qtmgroup/index.php'),
(1, 1204182667, '35q5snb20tqu4544utj2ug94s0', '/qtmgroup/index.php'),
(4, 1204182659, '35q5snb20tqu4544utj2ug94s0', '/qtmgroup/index.php');

-- --------------------------------------------------------

--
-- Table structure for table `websiteconfig`
--

DROP TABLE IF EXISTS `websiteconfig`;
CREATE TABLE IF NOT EXISTS `websiteconfig` (
  `Id` int(11) NOT NULL auto_increment,
  `YahooMessenger` varchar(255) collate latin1_general_ci default NULL,
  `Skype` varchar(255) collate latin1_general_ci default NULL,
  `HotLine` varchar(255) collate latin1_general_ci default NULL,
  `Fax` varchar(255) collate latin1_general_ci default NULL,
  `Telephone` varchar(255) collate latin1_general_ci default NULL,
  `Email` varchar(255) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `websiteconfig`
--

INSERT INTO `websiteconfig` (`Id`, `YahooMessenger`, `Skype`, `HotLine`, `Fax`, `Telephone`, `Email`) VALUES
(1, 'ninhgio', 'ninhgio', '(+84)904683850 ', '84-4-6407015', '84-912-460200', 'ninhgio@yahoo.com');
