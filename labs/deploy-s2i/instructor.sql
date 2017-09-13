 
USE instructor;

--
-- Table structure for table `instructors`
--


CREATE TABLE IF NOT EXISTS `instructors` (
  `instructorNumber` int(11) NOT NULL AUTO_INCREMENT,
  `instructorName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postalCode` varchar(15) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`instructorNumber`)
);

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`instructorNumber`, `instructorName`, `email`, `city`, `state`, `postalCode`, `country`) VALUES
(103, 'Douglas Silva', 'dsilva@redhat.com', 'Brasilia','DF', '72000-000', 'Brasil'),
(112, 'Fernando Lozano', 'flozano@redhat.com', 'Rio de Janeiro', 'RJ', '22021-000', 'Brasil'),
(114, 'Jim Rigsbee', 'jrigsbee@redhat.com', 'Raleigh', 'NC', '27605', 'United States'),
(123, 'Ricardo Jun Taniguchi', 'jtaniguc@redhat.com', 'Sao Paulo', 'SP', '01310-000', 'Brasil')
