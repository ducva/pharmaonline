-- phpMyAdmin SQL Dump
-- version 2.11.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 19, 2008 at 05:22 PM
-- Server version: 5.0.45
-- PHP Version: 5.2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `qtmgroup`
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
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=53 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Id`, `Name`, `Position`, `Status`, `ListPropertyId`, `RootId`) VALUES
(1, 'VÄƒn phÃ²ng pháº©m', 1, 1, '', 0),
(2, 'Äá»“ dÃ¹ng nhÃ  báº¿p', 2, 1, '', 0),
(3, 'Äá»“ dÃ¹ng cho tráº»', 3, 1, '', 0),
(4, 'BÃ¡nh káº¹o & Ä‘á»“ uá»‘ng', 4, 1, '', 0),
(5, 'LÆ°Æ¡ng thá»±c & thá»±c pháº©m', 5, 1, '', 0),
(6, 'Bá»™t giáº·t & dáº§u gá»™i Ä‘áº§u', 6, 1, '', 0),
(7, 'Má»¹ pháº©m & dá»¥ng cá»¥', 7, 1, '', 0),
(8, 'Sáº£n pháº©m & dá»‹ch vá»¥ khÃ¡c', 8, 1, '', 0),
(9, 'Vá»Ÿ táº­p', 1, 1, '', 1),
(10, 'CÃ¡c loáº¡i giáº¥y', 2, 1, '', 1),
(11, 'Phong bÃ¬ & giáº¥y viáº¿t thÆ°', 3, 1, '', 1),
(12, 'Compa & dá»¥ng cá»¥ ghim', 4, 1, '', 1),
(13, 'Dao kÃ©o & thÆ°á»›c', 5, 1, '', 1),
(14, 'BÃºt chÃ¬ & dá»¥ng cá»¥ gá»t', 6, 1, '', 1),
(15, 'BÃºt bi & viáº¿t nÆ°á»›c', 7, 1, '', 1),
(16, 'BÃºt lÃ´ng & bÃºt dáº¡', 8, 1, '', 1),
(17, 'BÄƒng keo & gÃ´m', 9, 1, '', 1),
(18, 'BÃ¬nh á»§ sá»¯a', 1, 1, '', 3),
(19, 'BÃ¬nh sá»¯a & NÃºm vÃº', 2, 1, '', 3),
(20, 'KhÄƒn Æ°á»›t & Táº¥m lÃ³t', 3, 1, '', 3),
(21, 'Thá»±c pháº©m dinh dÆ°á»¡ng', 4, 1, '', 3),
(22, 'TÃ£ lÃ³t', 5, 1, '', 3),
(23, 'Quáº§n Ã¡o', 6, 1, '', 3),
(24, 'BÃºp bÃª', 7, 1, '', 3),
(25, 'Xe giá»¯ bÃ©', 8, 1, '', 3),
(26, 'Xe mini cho bÃ©', 9, 1, '', 3),
(27, 'Äá»“ chÆ¡i cÆ¡ há»c', 10, 1, '', 3),
(28, 'Äá»“ uá»‘ng cho tráº»', 11, 1, '', 3),
(29, 'BÃ n cháº£i tráº» em', 12, 1, '', 3),
(30, 'Äá»“ Ä‘i chÆ¡i', 13, 1, '', 3),
(31, 'Äá»“ dÃ¹ng cho máº¹', 14, 1, '', 3),
(32, 'Sá»¯a bá»™t', 1, 1, '', 4),
(33, 'BÃ¡nh', 2, 1, '', 4),
(34, 'Káº¹o', 3, 1, '', 4),
(35, 'NÆ°á»›c giáº£i khÃ¡t', 4, 1, '', 4),
(36, 'NÆ°á»›c trÃ¡i cÃ¢y', 5, 1, '', 4),
(37, 'NÆ°á»›c tinh khiáº¿t', 6, 1, '', 4),
(38, 'Cafe', 7, 1, '', 4),
(39, 'RÆ°á»£u', 8, 1, '', 4),
(40, 'Bia', 9, 1, '', 4),
(41, 'TrÃ ', 10, 1, '', 4),
(42, 'Thá»±c pháº©m Ä‘Ã³ng há»™p', 1, 1, '', 5),
(43, 'Thá»±c pháº©m Ä‘Ã´ng láº¡nh', 2, 1, '', 5),
(44, 'Thá»©c pháº©m sáº¥y khÃ´', 3, 1, '', 5),
(45, 'ChÃ¡o & MÃ¬ Äƒn liá»n', 4, 1, '', 5),
(46, 'Gáº¡o', 5, 1, '', 5),
(47, 'ÄÆ°á»ng', 6, 1, '', 5),
(48, 'NÆ°á»›c máº¯m', 7, 1, '', 5),
(49, 'Gia vá»‹', 8, 1, '', 5),
(50, 'NÆ°á»›c tÆ°Æ¡ng', 9, 1, '', 5),
(51, 'Dáº§u Äƒn', 10, 1, '', 5);

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
(1, '<font face="Tahoma" color="#ff6600" size="5"><img alt="" src="http://www.360flower.net/images/upload/Image/Winter.jpg" />intro intro</font>', 'intro'),
(2, '<font face="Tahoma" color="#ff0000" size="7">service service</font>', 'service');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`Id`, `Name`, `Telephone`, `Mobile`, `Fax`, `Email`, `Website`, `Address`, `Image`, `Info`, `Position`, `Status`) VALUES
(1, 'Nokia', '', '', '', '', 'http://www.nokia.com', 'Äá»™i Cáº¥n', NULL, '', 1, 1),
(2, 'Sony', '', '', '', '', '', '', NULL, '', 2, 1);

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
(9, '12312321445435', 'd9b1d7db4cd6e70935368a1efb10e377', '12312', '1900-01-01', '2008-01-19', 'ninhgio@yahoo.com', '123', '123', '123123', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `method`
--

DROP TABLE IF EXISTS `method`;
CREATE TABLE IF NOT EXISTS `method` (
  `Id` int(11) NOT NULL auto_increment,
  `MinPoint` int(11) default NULL,
  `MinPercent` double default NULL,
  `MaxJump` int(11) default NULL,
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

INSERT INTO `method` (`Id`, `MinPoint`, `MinPercent`, `MaxJump`, `Money`, `YahooMessenger`, `Skype`, `Email`, `HotLine`, `Fax`, `Telephone`) VALUES
(1, 500, 3, 7, 50000, 'ninhgio', 'ninhgio', 'ninhgio@yahoo.com', '123456789', '123456789', '123456789');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=9 ;

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
(2, 'Tháº¿ giá»›i', 1, 1, 1),
(3, 'Trong nÆ°á»›c', 2, 1, 1),
(4, 'XÃ£ há»™i', 2, 1, 0),
(5, 'Kinh táº¿', 3, 1, 0);

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
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Id`, `CreateDate`, `PayDate`, `Status`, `Money`, `memberId`) VALUES
(4, '2008-01-19 14:02:29', '2008-01-19 14:02:29', 1, 10000000000, 2),
(3, '2008-01-19 14:01:03', '2008-01-19 14:01:03', 1, 125000000, 2),
(2, '2008-01-19 13:50:38', '2008-01-19 13:50:38', 1, 10250000, 1),
(1, '2008-01-19 13:49:20', '2008-01-19 13:49:20', 1, 7500000, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ordersdetail`
--

INSERT INTO `ordersdetail` (`Id`, `Quantity`, `ordersId`, `productId`) VALUES
(3, 200, 1, 9),
(2, 100, 1, 2),
(1, 100, 1, 3),
(4, 10, 2, 10),
(5, 100, 2, 5),
(6, 1000, 3, 10),
(7, 1000, 3, 5),
(8, 100000, 4, 5);

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
  `Description` text collate latin1_general_ci,
  `Detail` text collate latin1_general_ci,
  `Image` varchar(255) collate latin1_general_ci default NULL,
  `ImageNote` text collate latin1_general_ci,
  `Status` int(2) default '1',
  `Views` int(10) default '0',
  `Order` int(10) default '0',
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Id`, `Name`, `Description`, `Detail`, `Image`, `ImageNote`, `Status`, `Views`, `Order`, `Price`, `PriceQTM`, `HotProduct`, `CreateDate`, `ModifyDate`, `categoryId`, `unitId`, `currencyId`, `providerId`, `manufacturerId`) VALUES
(1, 'Äá»“ uá»‘ng', 'Äá»“ uá»‘ng', 'Äá»“ uá»‘ng', '1.jpg', 'ChÃº thÃ­ch áº£nh', 1, 1002, 0, '10000', '9000', 1, '2008-01-12 11:45:27', '0000-00-00 00:00:00', 35, 1, 2, 1, 1),
(2, 'Sáº£n pháº©m cÃ³ thuá»™c tÃ­nh', 'Sáº£n pháº©m cÃ³ thuá»™c tÃ­nh', 'Sáº£n pháº©m cÃ³ thuá»™c tÃ­nh', '2.jpg', 'Chu thÃ­ch áº£nh', 1, 7, 0, '100000', '50000', 1, '2008-01-12 12:04:22', '0000-00-00 00:00:00', 2, 1, 2, 1, 1),
(3, 'NÆ°á»›c máº¯m PhÃº Quá»‘c ', 'NÆ°á»›c máº¯m cao cáº¥p duy nháº¥t 60 Ä‘á»™ Ä‘áº¡m á»Ÿ Viá»‡t Nam Ä‘Æ°á»£c cáº¥p báº±ng Ä‘á»™c quyá»n sÃ¡ng cháº¿ dung tÃ­ch 50 ml', 'NÆ°á»›c máº¯m cao cáº¥p duy nháº¥t 60 Ä‘á»™ Ä‘áº¡m á»Ÿ Viá»‡t Nam Ä‘Æ°á»£c cáº¥p báº±ng Ä‘á»™c quyá»n sÃ¡ng cháº¿ dung tÃ­ch 50 ml', '3.jpg', 'ninhgio', 1, 4, 0, '100000', '5000', 1, '2008-01-14 09:15:08', '0000-00-00 00:00:00', 42, 1, 2, 1, 1),
(4, 'NÆ°á»›c máº¯m PhÃº Quá»‘c ', 'NÆ°á»›c máº¯m cao cáº¥p duy nháº¥t 60 Ä‘á»™ Ä‘áº¡m á»Ÿ Viá»‡t Nam Ä‘Æ°á»£c cáº¥p báº±ng Ä‘á»™c quyá»n sÃ¡ng cháº¿ dung tÃ­ch 50 ml', 'NÆ°á»›c máº¯m cao cáº¥p duy nháº¥t 60 Ä‘á»™ Ä‘áº¡m á»Ÿ Viá»‡t Nam Ä‘Æ°á»£c cáº¥p báº±ng Ä‘á»™c quyá»n sÃ¡ng cháº¿ dung tÃ­ch 50 ml', '4.jpg', '', 1, 4, 0, '200000', '150000', 1, '2008-01-14 09:16:20', '0000-00-00 00:00:00', 6, 1, 2, 1, 1),
(5, 'sáº£n pháº©m tiÃªu biá»ƒu', 'sáº£n pháº©m tiÃªu biá»ƒu', 'sáº£n pháº©m tiÃªu biá»ƒu', '5.jpg', '', 1, 2, 0, '144444', '100000', 2, '2008-01-14 09:18:44', '0000-00-00 00:00:00', 2, 1, 2, 1, 1),
(6, 'sáº£n pháº©m tiÃªu biá»ƒu', 'sáº£n pháº©m tiÃªu biá»ƒu', 'sáº£n pháº©m tiÃªu biá»ƒu', '6.jpg', 'eá»§w Æ°er á»­e', 1, 2, 0, '3434', '2000', 2, '2008-01-14 09:19:07', '0000-00-00 00:00:00', 3, 1, 2, 1, 1),
(7, 'sáº£n pháº©m tiÃªu biá»ƒu', 'sáº£n pháº©m tiÃªu biá»ƒu', 'sáº£n pháº©m tiÃªu biá»ƒu', '7.jpg', '234324', 1, 1, 0, '34324', '20000', 2, '2008-01-14 09:19:29', '0000-00-00 00:00:00', 2, 1, 2, 1, 1),
(8, 'sáº£n pháº©m tiÃªu biá»ƒu', 'sáº£n pháº©m tiÃªu biá»ƒu', 'sáº£n pháº©m tiÃªu biá»ƒu', '8.jpg', '3áº» á»­e á»­e', 1, 2, 0, '3443', '2000', 2, '2008-01-14 09:19:52', '0000-00-00 00:00:00', 2, 1, 2, 1, 1),
(9, 'sáº£n pháº©m tiÃªu biá»ƒu', 'sáº£n pháº©m tiÃªu biá»ƒu', 'sáº£n pháº©m tiÃªu biá»ƒu', '9.jpg', 'dfsdf', 1, 3, 0, '234', '10000', 2, '2008-01-14 09:20:37', '0000-00-00 00:00:00', 2, 1, 2, 1, 1),
(10, 'sáº£n pháº©m tiÃªu biá»ƒu', 'sáº£n pháº©m tiÃªu biá»ƒu', 'sáº£n pháº©m tiÃªu biá»ƒu', '10.jpg', '234 234 324', 1, 1, 0, '32423', '25000', 2, '2008-01-14 09:20:57', '0000-00-00 00:00:00', 2, 1, 2, 1, 1),
(11, '', '', '', '', '', 1, 0, 0, '0', '', 0, '2008-01-19 14:55:31', '2008-01-19 14:55:31', 0, 0, 0, 0, 0),
(12, '2321', '3123', '123', '', '', 1, 0, 0, '0', '', 0, '2008-01-19 14:57:48', '2008-01-19 14:57:48', 0, 0, 0, 0, 0);

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
(3, 2, 6, 'uá»‘ng 3'),
(2, 2, 5, 'uá»‘ng 2'),
(1, 2, 3, 'uá»‘ng 1'),
(10, 4, 4, '34 sfeÆ°'),
(11, 4, 6, '234sdf '),
(12, 5, 3, 'e213'),
(13, 5, 5, '123'),
(14, 5, 6, '123'),
(15, 6, 5, 'eá»­'),
(16, 6, 6, 'eá»­'),
(17, 7, 3, 'eá»­'),
(18, 7, 5, 'á»­e'),
(19, 7, 6, ' á»­e rÆ°e'),
(20, 8, 3, '4354'),
(21, 8, 5, '45'),
(22, 8, 6, '4354'),
(23, 9, 3, '324'),
(24, 9, 5, '234'),
(25, 9, 6, '34'),
(26, 10, 3, '32'),
(27, 10, 5, '324'),
(28, 10, 6, '324');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`Id`, `Name`, `Detail`, `Unit`, `Value`, `Status`, `Position`, `RootId`) VALUES
(1, 'ThÃ´ng sá»‘ ká»¹ thuáº­t', 'ThÃ´ng sá»‘ ká»¹ thuáº­t', 'ThÃ´ng sá»‘ ká»¹ thuáº­t', 'ThÃ´ng sá»‘ ká»¹ thuáº­t', 1, 1, 0),
(2, 'Chá»©c nÄƒng', 'Chá»©c nÄƒng', 'Chá»©c nÄƒng', 'Chá»©c nÄƒng', 1, 2, 0),
(3, 'KÃ­ch thÆ°á»›c', 'KÃ­ch thÆ°á»›c', 'KÃ­ch thÆ°á»›c', 'KÃ­ch thÆ°á»›c', 1, 1, 1),
(4, 'Trá»ng lÆ°á»£ng', 'Trá»ng lÆ°á»£ng', 'Trá»ng lÆ°á»£ng', 'Trá»ng lÆ°á»£ng', 1, 2, 1),
(5, 'Tháº¥u kÃ­nh CCD', 'Tháº¥u kÃ­nh CCD', 'Tháº¥u kÃ­nh CCD', 'Tháº¥u kÃ­nh CCD Tháº¥u kÃ­nh CCD', 1, 3, 1),
(6, 'Cá»•ng káº¿t ná»‘i', 'Cá»•ng káº¿t ná»‘i', 'Cá»•ng káº¿t ná»‘i', 'Cá»•ng káº¿t ná»‘i', 1, 1, 2);

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
(1, 'Vietsun Hi-tech', '23', '123', '1111', '12', '123', 'ÄÆ°á»ng lÃ¡ng', NULL, '123', 1, 1);

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
(1, 'Qui Ä‘á»‹nh chung', '<p>á»­eá»­eá»­e</p>', '2008-01-16 23:52:01', 1, 1),
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`Id`, `Name`, `Info`, `Status`, `Position`) VALUES
(1, 'Chiáº¿c', 'Chiáº¿c', 1, 1);

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
(1, 1200728818, '9551435da64f141207dabbd06914095d', '');

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
