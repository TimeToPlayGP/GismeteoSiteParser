﻿--
-- Script was generated by Devart dbForge Studio 2020 for MySQL, Version 9.0.304.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 6/1/2020 11:35:37 PM
-- Server version: 5.6.47
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE parser;

--
-- Drop procedure `ForecastBySity`
--
DROP PROCEDURE IF EXISTS ForecastBySity;

--
-- Drop table `forecast`
--
DROP TABLE IF EXISTS forecast;

--
-- Drop table `dateforecast`
--
DROP TABLE IF EXISTS dateforecast;

--
-- Drop procedure `CitiesList`
--
DROP PROCEDURE IF EXISTS CitiesList;

--
-- Drop procedure `InsertCity`
--
DROP PROCEDURE IF EXISTS InsertCity;

--
-- Drop table `city`
--
DROP TABLE IF EXISTS city;

--
-- Set default database
--
USE parser;

--
-- Create table `city`
--
CREATE TABLE city (
  Id int(11) NOT NULL,
  NameCity varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

DELIMITER $$

--
-- Create procedure `InsertCity`
--
CREATE DEFINER = 'Daniil'@'localhost'
PROCEDURE InsertCity (IN CityId int, IN CityName nvarchar(255))
BEGIN

  IF NOT EXISTS (SELECT
        c.Id
      FROM city c
      WHERE c.Id = CityId) THEN
    INSERT INTO city (Id, NameCity)
      VALUES (CityId, CityName);
  END IF;
END
$$

--
-- Create procedure `CitiesList`
--
CREATE DEFINER = 'Daniil'@'localhost'
PROCEDURE CitiesList ()
BEGIN
  SELECT
    C.Id AS Id,
    c.NameCity AS NameCity
  FROM city c;
END
$$

DELIMITER ;

--
-- Create table `dateforecast`
--
CREATE TABLE dateforecast (
  Id int(11) NOT NULL AUTO_INCREMENT,
  CityId int(11) DEFAULT NULL,
  DateForecast datetime DEFAULT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 82,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

--
-- Create foreign key
--
ALTER TABLE dateforecast
ADD CONSTRAINT dateforecast_ibfk_1 FOREIGN KEY (CityId)
REFERENCES city (Id);

--
-- Create table `forecast`
--
CREATE TABLE forecast (
  Id int(11) NOT NULL AUTO_INCREMENT,
  DateForecastId int(11) DEFAULT NULL,
  TimeForecast int(11) DEFAULT NULL,
  Temperature varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  Wind varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  Pressure varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 571,
AVG_ROW_LENGTH = 85,
CHARACTER SET latin1,
COLLATE latin1_swedish_ci;

--
-- Create foreign key
--
ALTER TABLE forecast
ADD CONSTRAINT forecast_ibfk_1 FOREIGN KEY (DateForecastId)
REFERENCES dateforecast (Id);

DELIMITER $$

--
-- Create procedure `ForecastBySity`
--
CREATE DEFINER = 'Daniil'@'localhost'
PROCEDURE ForecastBySity (CityId int)
BEGIN
  SET @Tomorrow = DATE(NOW() + INTERVAL 1 DAY);

  SELECT
    f.TimeForecast AS TimeForecast,
    f.Temperature AS Temperature,
    f.Pressure AS Pressure,
    f.Wind AS Wind
  FROM dateforecast d
    INNER JOIN forecast f
      ON f.DateForecastId = d.Id
  WHERE d.CityId = CityId
  AND DATE(D.DateForecast) = @Tomorrow;
END
$$

DELIMITER ;

-- 
-- Dumping data for table city
--
INSERT INTO city VALUES
(4079, 'Санкт-Петербург'),
(4225, 'Калининград'),
(4355, 'Нижний Новгород'),
(4364, 'Казань'),
(4368, 'Москва'),
(4429, 'Тольятти'),
(4445, 'Пенза'),
(4476, 'Пермь'),
(4501, 'Тюмень'),
(4517, 'Екатеринбург'),
(4565, 'Челябинск'),
(4578, 'Омск'),
(4588, 'Уфа'),
(4618, 'Самара'),
(4674, 'Красноярск'),
(4690, 'Новосибирск'),
(4720, 'Барнаул'),
(5026, 'Воронеж'),
(5032, 'Саратов'),
(5039, 'Белгород'),
(5089, 'Волгоград'),
(5110, 'Ростов-на-Дону'),
(5136, 'Краснодар'),
(5159, 'Оренбург');

-- 
-- Dumping data for table dateforecast
--
INSERT INTO dateforecast VALUES
(58, 4720, '2020-06-02 00:00:00'),
(59, 5039, '2020-06-02 00:00:00'),
(60, 5089, '2020-06-02 00:00:00'),
(61, 5026, '2020-06-02 00:00:00'),
(62, 4517, '2020-06-02 00:00:00'),
(63, 4364, '2020-06-02 00:00:00'),
(64, 4225, '2020-06-02 00:00:00'),
(65, 5136, '2020-06-02 00:00:00'),
(66, 4674, '2020-06-02 00:00:00'),
(67, 4368, '2020-06-02 00:00:00'),
(68, 4355, '2020-06-02 00:00:00'),
(69, 4690, '2020-06-02 00:00:00'),
(70, 4578, '2020-06-02 00:00:00'),
(71, 5159, '2020-06-02 00:00:00'),
(72, 4445, '2020-06-02 00:00:00'),
(73, 4476, '2020-06-02 00:00:00'),
(74, 5110, '2020-06-02 00:00:00'),
(75, 4618, '2020-06-02 00:00:00'),
(76, 4079, '2020-06-02 00:00:00'),
(77, 5032, '2020-06-02 00:00:00'),
(78, 4429, '2020-06-02 00:00:00'),
(79, 4501, '2020-06-02 00:00:00'),
(80, 4588, '2020-06-02 00:00:00'),
(81, 4565, '2020-06-02 00:00:00');

-- 
-- Dumping data for table forecast
--
INSERT INTO forecast VALUES
(379, 58, 1, '+17', '4', '737'),
(380, 58, 4, '+18', '5', '735'),
(381, 58, 7, '+21', '5', '736'),
(382, 58, 10, '+23', '6', '737'),
(383, 58, 13, '+25', '6', '737'),
(384, 58, 16, '+26', '8', '737'),
(385, 58, 19, '+23', '7', '739'),
(386, 58, 22, '+18', '5', '740'),
(387, 59, 1, '+13', '4', '742'),
(388, 59, 4, '+12', '4', '742'),
(389, 59, 7, '+13', '5', '742'),
(390, 59, 10, '+15', '4', '743'),
(391, 59, 13, '+16', '3', '743'),
(392, 59, 16, '+18', '4', '743'),
(393, 59, 19, '+17', '3', '743'),
(394, 59, 22, '+13', '2', '744'),
(395, 60, 1, '+15', '3', '747'),
(396, 60, 4, '+14', '2', '746'),
(397, 60, 7, '+16', '2', '746'),
(398, 60, 10, '+20', '2', '746'),
(399, 60, 13, '+24', '2', '746'),
(400, 60, 16, '+25', '2', '745'),
(401, 60, 19, '+25', '2', '744'),
(402, 60, 22, '+20', '3', '743'),
(403, 61, 1, '+15', '4', '743'),
(404, 61, 4, '+13', '3', '743'),
(405, 61, 7, '+14', '3', '743'),
(406, 61, 10, '+18', '4', '743'),
(407, 61, 13, '+21', '4', '743'),
(408, 61, 16, '+20', '5', '743'),
(409, 61, 19, '+18', '1', '743'),
(410, 61, 22, '+15', '2', '743'),
(411, 62, 1, '+9', '2', '737'),
(412, 62, 4, '+8', '3', '738'),
(413, 62, 7, '+8', '3', '739'),
(414, 62, 10, '+9', '3', '740'),
(415, 62, 13, '+10', '3', '741'),
(416, 62, 16, '+11', '2', '742'),
(417, 62, 19, '+11', '0', '742'),
(418, 62, 22, '+7', '2', '742'),
(419, 63, 1, '+9', '3', '755'),
(420, 63, 4, '+7', '3', '755'),
(421, 63, 7, '+9', '3', '756'),
(422, 63, 10, '+13', '4', '756'),
(423, 63, 13, '+16', '3', '756'),
(424, 63, 16, '+17', '4', '755'),
(425, 63, 19, '+15', '4', '755'),
(426, 63, 22, '+12', '5', '755'),
(427, 64, 1, '+12', '4', '762'),
(428, 64, 4, '+9', '3', '761'),
(429, 64, 7, '+12', '3', '761'),
(430, 64, 10, '+15', '4', '760'),
(431, 64, 13, '+16', '3', '759'),
(432, 64, 16, '+15', '5', '758'),
(433, 64, 19, '+13', '3', '757'),
(434, 64, 22, '+11', '3', '757'),
(435, 65, 1, '+15', '2', '755'),
(436, 65, 4, '+13', '2', '755'),
(437, 65, 7, '+14', '0', '755'),
(438, 65, 10, '+19', '0', '755'),
(439, 65, 13, '+20', '1', '754'),
(440, 65, 16, '+21', '2', '753'),
(441, 65, 19, '+20', '2', '752'),
(442, 65, 22, '+17', '1', '752'),
(443, 66, 1, '+7', '2', '741'),
(444, 66, 4, '+5', '1', '741'),
(445, 66, 7, '+9', '2', '740'),
(446, 66, 10, '+13', '2', '738'),
(447, 66, 13, '+15', '3', '736'),
(448, 66, 16, '+17', '3', '735'),
(449, 66, 19, '+15', '1', '734'),
(450, 66, 22, '+13', '3', '735'),
(451, 67, 1, '+10', '6', '748'),
(452, 67, 4, '+10', '6', '747'),
(453, 67, 7, '+10', '7', '747'),
(454, 67, 10, '+9', '6', '747'),
(455, 67, 13, '+10', '6', '747'),
(456, 67, 16, '+12', '6', '747'),
(457, 67, 19, '+12', '7', '747'),
(458, 67, 22, '+11', '6', '746'),
(459, 68, 1, '+10', '4', '755'),
(460, 68, 4, '+8', '5', '755'),
(461, 68, 7, '+8', '4', '755'),
(462, 68, 10, '+12', '5', '755'),
(463, 68, 13, '+14', '5', '755'),
(464, 68, 16, '+13', '5', '755'),
(465, 68, 19, '+11', '5', '755'),
(466, 68, 22, '+10', '5', '755'),
(467, 69, 1, '+14', '6', '737'),
(468, 69, 4, '+16', '6', '735'),
(469, 69, 7, '+17', '6', '736'),
(470, 69, 10, '+18', '6', '737'),
(471, 69, 13, '+18', '6', '738'),
(472, 69, 16, '+18', '7', '740'),
(473, 69, 19, '+15', '6', '741'),
(474, 69, 22, '+12', '4', '743'),
(475, 70, 1, '+18', '6', '747'),
(476, 70, 4, '+14', '5', '748'),
(477, 70, 7, '+12', '4', '749'),
(478, 70, 10, '+15', '4', '750'),
(479, 70, 13, '+18', '4', '751'),
(480, 70, 16, '+18', '4', '751'),
(481, 70, 19, '+17', '4', '752'),
(482, 70, 22, '+14', '3', '753'),
(483, 71, 1, '+15', '2', '749'),
(484, 71, 4, '+12', '2', '750'),
(485, 71, 7, '+19', '1', '750'),
(486, 71, 10, '+24', '2', '750'),
(487, 71, 13, '+27', '2', '750'),
(488, 71, 16, '+27', '4', '749'),
(489, 71, 19, '+25', '3', '749'),
(490, 71, 22, '+21', '5', '749'),
(491, 72, 1, '+12', '2', '746'),
(492, 72, 4, '+12', '2', '746'),
(493, 72, 7, '+14', '3', '746'),
(494, 72, 10, '+16', '3', '746'),
(495, 72, 13, '+16', '3', '746'),
(496, 72, 16, '+18', '4', '746'),
(497, 72, 19, '+18', '2', '746'),
(498, 72, 22, '+14', '1', '746'),
(499, 73, 1, '+8', '3', '748'),
(500, 73, 4, '+7', '2', '749'),
(501, 73, 7, '+9', '3', '750'),
(502, 73, 10, '+11', '3', '751'),
(503, 73, 13, '+13', '2', '751'),
(504, 73, 16, '+13', '2', '752'),
(505, 73, 19, '+12', '1', '751'),
(506, 73, 22, '+9', '2', '752'),
(507, 74, 1, '+13', '2', '750'),
(508, 74, 4, '+12', '2', '749'),
(509, 74, 7, '+14', '1', '750'),
(510, 74, 10, '+20', '1', '750'),
(511, 74, 13, '+22', '1', '749'),
(512, 74, 16, '+18', '1', '749'),
(513, 74, 19, '+19', '2', '749'),
(514, 74, 22, '+16', '1', '748'),
(515, 75, 1, '+14', '2', '749'),
(516, 75, 4, '+13', '2', '749'),
(517, 75, 7, '+15', '3', '749'),
(518, 75, 10, '+19', '3', '750'),
(519, 75, 13, '+21', '3', '750'),
(520, 75, 16, '+19', '2', '749'),
(521, 75, 19, '+19', '3', '749'),
(522, 75, 22, '+16', '2', '749'),
(523, 76, 1, '+7', '3', '767'),
(524, 76, 4, '+6', '3', '767'),
(525, 76, 7, '+8', '3', '767'),
(526, 76, 10, '+12', '5', '766'),
(527, 76, 13, '+14', '6', '765'),
(528, 76, 16, '+15', '5', '764'),
(529, 76, 19, '+15', '6', '763'),
(530, 76, 22, '+12', '5', '763'),
(531, 77, 1, '+17', '3', '750'),
(532, 77, 4, '+16', '3', '750'),
(533, 77, 7, '+17', '3', '750'),
(534, 77, 10, '+18', '3', '750'),
(535, 77, 13, '+20', '4', '750'),
(536, 77, 16, '+23', '3', '749'),
(537, 77, 19, '+22', '3', '749'),
(538, 77, 22, '+19', '4', '749'),
(539, 78, 1, '+14', '2', '756'),
(540, 78, 4, '+13', '2', '756'),
(541, 78, 7, '+15', '3', '757'),
(542, 78, 10, '+19', '3', '757'),
(543, 78, 13, '+19', '3', '757'),
(544, 78, 16, '+18', '3', '756'),
(545, 78, 19, '+19', '3', '756'),
(546, 78, 22, '+16', '2', '756'),
(547, 79, 1, '+8', '3', '752'),
(548, 79, 4, '+8', '3', '753'),
(549, 79, 7, '+9', '3', '754'),
(550, 79, 10, '+11', '3', '754'),
(551, 79, 13, '+13', '2', '755'),
(552, 79, 16, '+14', '3', '756'),
(553, 79, 19, '+13', '1', '756'),
(554, 79, 22, '+8', '2', '757'),
(555, 80, 1, '+13', '2', '749'),
(556, 80, 4, '+11', '2', '750'),
(557, 80, 7, '+13', '3', '751'),
(558, 80, 10, '+16', '3', '751'),
(559, 80, 13, '+17', '3', '752'),
(560, 80, 16, '+19', '2', '752'),
(561, 80, 19, '+17', '3', '752'),
(562, 80, 22, '+13', '3', '752'),
(563, 81, 1, '+14', '3', '738'),
(564, 81, 4, '+13', '3', '739'),
(565, 81, 7, '+16', '3', '740'),
(566, 81, 10, '+18', '5', '740'),
(567, 81, 13, '+18', '5', '741'),
(568, 81, 16, '+16', '5', '742'),
(569, 81, 19, '+14', '4', '742'),
(570, 81, 22, '+12', '2', '743');

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;