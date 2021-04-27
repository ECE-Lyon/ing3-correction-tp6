# ************************************************************
# Sequel Ace SQL dump
# Version 2104
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 8.0.22)
# Database: tp6
# Generation Time: 2020-11-11 18:03:54 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table album
# ------------------------------------------------------------

CREATE TABLE `album` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `artist_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `release_year` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;

INSERT INTO `album` (`id`, `title`, `artist_name`, `release_year`)
VALUES
	(1,'Toto IV','Toto',1982),
	(2,'Poems, Prayers and Promises','John Denver',1971),
	(3,'The Black Market','Rise Against',2014),
	(4,'The Eminem Show','Eminem',2002),
	(5,'Wolves','Rise Against',2017);

/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table track
# ------------------------------------------------------------

CREATE TABLE `track` (
  `id` int unsigned NOT NULL,
  `id_album` int unsigned NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `duration` int NOT NULL,
  PRIMARY KEY (`id`,`id_album`),
  KEY `id_album` (`id_album`),
  CONSTRAINT `track_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `album` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `track` WRITE;
/*!40000 ALTER TABLE `track` DISABLE KEYS */;

INSERT INTO `track` (`id`, `id_album`, `title`, `duration`)
VALUES
	(1,1,'Rosanna',331),
	(1,2,'Poems, Prayers and Promises',247),
	(1,3,'The Great Die-Off',220),
	(1,4,'Curtains Up - Skit',30),
	(1,5,'Wolves',218),
	(2,1,'Make Believe',223),
	(2,2,'Let It Be',219),
	(2,3,'I Don\'t Want To Be Here Anymore',240),
	(2,4,'White America',325),
	(2,5,'House On Fire',195),
	(3,1,'I Won\'t Hold You Back',293),
	(3,2,'My Sweet Lady',264),
	(3,3,'Tragedy + Time',257),
	(3,4,'Business',252),
	(3,5,'The Violence',229),
	(4,1,'Good for You',197),
	(4,2,'Wooden Indian',99),
	(4,3,'The Black Market',256),
	(4,4,'Cleanin\' Out My Closet',298),
	(4,5,'Welcome To The Breakdown',183),
	(5,1,'It\'s a Feeling',185),
	(5,2,'Junk',103),
	(5,3,'The Eco-Terrorist In Me',165),
	(5,4,'Square Dance',324),
	(5,5,'Far From Perfect',213),
	(6,1,'Afraid of Love',232),
	(6,2,'Gospel Changes',207),
	(6,3,'Sudden Life',248),
	(6,4,'The Kiss - Skit',76),
	(6,5,'Bullshit',252),
	(7,1,'Lovers in the Night',265),
	(7,2,'Take Me Home, Country Roads',190),
	(7,3,'A Beautiful Indifference',205),
	(7,4,'Soldier',226),
	(7,5,'Politics Of Love',249),
	(8,1,'We Made It',236),
	(8,2,'I Guess He\'d Rather Be in Colorado',127),
	(8,3,'Methadone',229),
	(8,4,'Say Goodbye Hollywood',273),
	(8,5,'Parts Per Million',221),
	(9,1,'Waiting for Your Love',253),
	(9,2,'Sunshine On My Shoulders',312),
	(9,3,'Zero Visibility',278),
	(9,4,'Drips',286),
	(9,5,'Mourning In Amerika',200),
	(10,1,'Africa',296),
	(10,2,'Around an Around',138),
	(10,3,'Awake Too Long',192),
	(10,4,'Without Me',290),
	(10,5,'How Many Walls',231),
	(11,2,'Fire and Rain',225),
	(11,3,'People Live Here',249),
	(11,4,'Paul Rosenberg - Skit',23),
	(11,5,'Miracle',220),
	(12,2,'The Box',168),
	(12,3,'Bridges',247),
	(12,4,'Sing For The Moment',340),
	(13,4,'Superman',350),
	(14,4,'Hailie\'s Song',321),
	(15,4,'Steve Berman - Skit',33),
	(16,4,'When The Muse Stops',269),
	(17,4,'Say What You Say',310),
	(18,4,'\'Till I Collapse',298),
	(19,4,'My Dad\'s Gone Crazy',267),
	(20,4,'Curtains Close',62);

/*!40000 ALTER TABLE `track` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
