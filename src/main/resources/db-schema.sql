 
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `roo_crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `CART_ORDER`
--

CREATE TABLE IF NOT EXISTS `CART_ORDER` (
  `CART_ORDER_ID` bigint(20) NOT NULL DEFAULT '0',
  `DATE_OF_ORDER` date DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CART_ORDER_ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CART_ORDER`
--


-- --------------------------------------------------------

--
-- Table structure for table `COMPANY`
--

CREATE TABLE IF NOT EXISTS `COMPANY` (
  `COMPANY_ID` bigint(20) NOT NULL DEFAULT '0',
  `COMPANY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COMPANY`
--


-- --------------------------------------------------------

--
-- Table structure for table `CUSTOMER`
--

CREATE TABLE IF NOT EXISTS `CUSTOMER` (
  `CUSTOMER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LAST_NAME` varchar(30) DEFAULT NULL,
  `FIRST_NAME` varchar(30) DEFAULT NULL,
  `COMPANY_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  KEY `COMPANY_ID` (`COMPANY_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `CUSTOMER`
--
 
-- --------------------------------------------------------

--
-- Table structure for table `LINE_ITEM`
--

CREATE TABLE IF NOT EXISTS `LINE_ITEM` (
  `LINE_ITEM_ID` bigint(20) NOT NULL DEFAULT '0',
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `QUANTITY` bigint(20) DEFAULT NULL,
  `CART_ORDER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`LINE_ITEM_ID`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  KEY `CART_ORDER_ID` (`CART_ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `LINE_ITEM`
--


-- --------------------------------------------------------

--
-- Table structure for table `PRODUCT`
--

CREATE TABLE IF NOT EXISTS `PRODUCT` (
  `PRODUCT_ID` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(30) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PRODUCT`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `CART_ORDER`
--
ALTER TABLE `CART_ORDER`
  ADD CONSTRAINT `CART_ORDER_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMER` (`CUSTOMER_ID`);

--
-- Constraints for table `CUSTOMER`
--
ALTER TABLE `CUSTOMER`
  ADD CONSTRAINT `CUSTOMER_ibfk_1` FOREIGN KEY (`COMPANY_ID`) REFERENCES `COMPANY` (`COMPANY_ID`);

--
-- Constraints for table `LINE_ITEM`
--
ALTER TABLE `LINE_ITEM`
  ADD CONSTRAINT `LINE_ITEM_ibfk_1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`),
  ADD CONSTRAINT `LINE_ITEM_ibfk_2` FOREIGN KEY (`CART_ORDER_ID`) REFERENCES `CART_ORDER` (`CART_ORDER_ID`);
