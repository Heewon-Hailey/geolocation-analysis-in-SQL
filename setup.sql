-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- uncomment and run these 3 SCHEMA commands if you are using your own server
-- -----------------------------------------------------
-- DROP SCHEMA IF EXISTS `Tracker` ;
-- CREATE SCHEMA IF NOT EXISTS `Tracker` DEFAULT CHARACTER SET utf8 ;
-- USE `Tracker` ;

-- -----------------------------------------------------
-- Table `City`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `City` ;

CREATE TABLE IF NOT EXISTS `City` (
  `id` TINYINT NOT NULL,
  `cityName` VARCHAR(50) NOT NULL,
  `state` CHAR(3) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Gym`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Gym` ;

CREATE TABLE IF NOT EXISTS `Gym` (
  `id` SMALLINT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `city` TINYINT NOT NULL,
  `longitude` DECIMAL(7,4) NOT NULL,
  `latitude` DECIMAL(7,4) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Workplace_City1_idx` (`city` ASC),
  CONSTRAINT `fk_Workplace_City1`
    FOREIGN KEY (`city`)
    REFERENCES `City` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `User` ;

CREATE TABLE IF NOT EXISTS `User` (
  `id` INT NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `gym` SMALLINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_User_Workplace1_idx` (`gym` ASC),
  CONSTRAINT `fk_User_Workplace1`
    FOREIGN KEY (`gym`)
    REFERENCES `Gym` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Location` ;

CREATE TABLE IF NOT EXISTS `Location` (
  `id` BIGINT NOT NULL,
  `user` INT NOT NULL,
  `whenRecorded` TIMESTAMP NOT NULL,
  `longitude` DECIMAL(7,4) NOT NULL,
  `latitude` DECIMAL(7,4) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Sample_User_idx` (`user` ASC),
  CONSTRAINT `fk_Sample_User`
    FOREIGN KEY (`user`)
    REFERENCES `User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO City VALUES(1,'Melbourne','Vic');
INSERT INTO City VALUES(2,'Geelong','Vic');
INSERT INTO City VALUES(3,'Sydney','NSW');
INSERT INTO City VALUES(4,'Brisbane','Qld');

INSERT INTO Gym VALUES(1,'Academia',1,144.9623,-37.7962);
INSERT INTO Gym VALUES(2,'Brunswick',1,144.9623,-37.7674);
INSERT INTO Gym VALUES(3,'Carlton',1,144.9679,-37.7981);
INSERT INTO Gym VALUES(4,'Drysdale',2,144.6048,-38.1742);
INSERT INTO Gym VALUES(5,'Edgecliff',3,151.2329,-33.8772);

INSERT INTO User VALUES(1,'Alice',1);
INSERT INTO User VALUES(2,'Bob',1);
INSERT INTO User VALUES(3,'Carol',2);
INSERT INTO User VALUES(4,'Dave',3);
INSERT INTO User VALUES(5,'Eve',5);
INSERT INTO User VALUES(6,'Fred',null);
INSERT INTO User VALUES(7,'Grace',null);

INSERT INTO Location VALUES(1,1,'2019-7-30 13:1:0',144.9633,-37.7983);
INSERT INTO Location VALUES(2,2,'2019-7-30 13:1:0',144.9643,-37.7979);
INSERT INTO Location VALUES(3,1,'2019-7-30 13:2:0',144.965,-37.7984);
INSERT INTO Location VALUES(4,2,'2019-7-30 13:2:0',144.9645,-37.7967);
INSERT INTO Location VALUES(5,1,'2019-7-30 13:3:0',144.9663,-37.7986);
INSERT INTO Location VALUES(6,2,'2019-7-30 13:3:0',144.9648,-37.7956);
INSERT INTO Location VALUES(7,1,'2019-7-30 13:4:0',144.9673,-37.7987);
INSERT INTO Location VALUES(8,2,'2019-7-30 13:4:0',144.9648,-37.7943);
INSERT INTO Location VALUES(9,1,'2019-7-30 13:5:0',144.9688,-37.7989);
INSERT INTO Location VALUES(10,2,'2019-7-30 13:5:0',144.9645,-37.7932);
INSERT INTO Location VALUES(11,1,'2019-7-30 13:6:0',144.97,-37.799);
INSERT INTO Location VALUES(12,2,'2019-7-30 13:6:0',144.9638,-37.7924);
INSERT INTO Location VALUES(13,1,'2019-7-30 13:7:0',144.9705,-37.7984);
INSERT INTO Location VALUES(14,2,'2019-7-30 13:7:0',144.9625,-37.7919);
INSERT INTO Location VALUES(15,1,'2019-7-30 13:8:0',144.9726,-37.7987);
INSERT INTO Location VALUES(16,2,'2019-7-30 13:8:0',144.9611,-37.7917);
INSERT INTO Location VALUES(17,1,'2019-7-30 13:9:0',144.9726,-37.7994);
INSERT INTO Location VALUES(18,2,'2019-7-30 13:9:0',144.9602,-37.7912);
INSERT INTO Location VALUES(19,1,'2019-7-30 13:10:0',144.9725,-37.8004);
INSERT INTO Location VALUES(20,2,'2019-7-30 13:10:0',144.9595,-37.7905);
INSERT INTO Location VALUES(21,1,'2019-7-30 13:11:0',144.9723,-37.801);
INSERT INTO Location VALUES(22,2,'2019-7-30 13:11:0',144.9588,-37.7899);
INSERT INTO Location VALUES(23,1,'2019-7-30 13:12:0',144.9706,-37.8022);
INSERT INTO Location VALUES(24,2,'2019-7-30 13:12:0',144.9588,-37.7889);
INSERT INTO Location VALUES(25,1,'2019-7-30 13:13:0',144.9695,-37.8032);
INSERT INTO Location VALUES(26,2,'2019-7-30 13:13:0',144.959,-37.7882);
INSERT INTO Location VALUES(27,1,'2019-7-30 13:14:0',144.9681,-37.8032);
INSERT INTO Location VALUES(28,2,'2019-7-30 13:14:0',144.9591,-37.7872);
INSERT INTO Location VALUES(29,1,'2019-7-30 13:15:0',144.9666,-37.8029);
INSERT INTO Location VALUES(30,2,'2019-7-30 13:15:0',144.9593,-37.7863);
INSERT INTO Location VALUES(31,1,'2019-7-30 13:16:0',144.9652,-37.8026);
INSERT INTO Location VALUES(32,2,'2019-7-30 13:16:0',144.9594,-37.7851);
INSERT INTO Location VALUES(33,1,'2019-7-30 13:17:0',144.9639,-37.8026);
INSERT INTO Location VALUES(34,2,'2019-7-30 13:17:0',144.9598,-37.7847);
INSERT INTO Location VALUES(35,1,'2019-7-30 13:18:0',144.9633,-37.8025);
INSERT INTO Location VALUES(36,2,'2019-7-30 13:18:0',144.9611,-37.7849);
INSERT INTO Location VALUES(37,1,'2019-7-30 13:19:0',144.9625,-37.8023);
INSERT INTO Location VALUES(38,2,'2019-7-30 13:19:0',144.9622,-37.785);
INSERT INTO Location VALUES(39,1,'2019-7-30 13:20:0',144.9615,-37.8023);
INSERT INTO Location VALUES(40,2,'2019-7-30 13:20:0',144.9633,-37.7851);
INSERT INTO Location VALUES(41,1,'2019-7-30 13:21:0',144.9607,-37.8021);
INSERT INTO Location VALUES(42,2,'2019-7-30 13:21:0',144.9632,-37.7862);
INSERT INTO Location VALUES(43,1,'2019-7-30 13:22:0',144.9608,-37.8014);
INSERT INTO Location VALUES(44,2,'2019-7-30 13:22:0',144.9629,-37.7872);
INSERT INTO Location VALUES(45,1,'2019-7-30 13:23:0',144.961,-37.8008);
INSERT INTO Location VALUES(46,2,'2019-7-30 13:23:0',144.9627,-37.7882);
INSERT INTO Location VALUES(47,1,'2019-7-30 13:24:0',144.9612,-37.8002);
INSERT INTO Location VALUES(48,2,'2019-7-30 13:24:0',144.9621,-37.7892);
INSERT INTO Location VALUES(49,1,'2019-7-30 13:25:0',144.9612,-37.7997);
INSERT INTO Location VALUES(50,2,'2019-7-30 13:25:0',144.962,-37.7909);
INSERT INTO Location VALUES(51,1,'2019-7-30 13:26:0',144.9613,-37.7991);
INSERT INTO Location VALUES(52,2,'2019-7-30 13:26:0',144.9619,-37.7919);
INSERT INTO Location VALUES(53,1,'2019-7-30 13:27:0',144.9619,-37.7983);
INSERT INTO Location VALUES(54,2,'2019-7-30 13:27:0',144.9618,-37.793);
INSERT INTO Location VALUES(55,1,'2019-7-30 13:28:0',144.9629,-37.7984);
INSERT INTO Location VALUES(56,2,'2019-7-30 13:28:0',144.962,-37.7936);
INSERT INTO Location VALUES(57,2,'2019-7-30 13:29:0',144.9628,-37.7942);
INSERT INTO Location VALUES(58,2,'2019-7-30 13:30:0',144.9624,-37.7953);
INSERT INTO Location VALUES(59,2,'2019-7-30 13:31:0',144.9626,-37.7964);
INSERT INTO Location VALUES(60,2,'2019-7-30 13:32:0',144.9633,-37.7978);
INSERT INTO Location VALUES(61,3,'2019-7-30 14:1:0',144.9713,-37.7681);
INSERT INTO Location VALUES(62,3,'2019-7-30 14:2:0',144.9723,-37.7682);
INSERT INTO Location VALUES(63,3,'2019-7-30 14:3:0',144.9725,-37.7672);
INSERT INTO Location VALUES(64,3,'2019-7-30 14:4:0',144.9727,-37.7666);
INSERT INTO Location VALUES(65,3,'2019-7-30 14:5:0',144.9728,-37.7658);
INSERT INTO Location VALUES(66,3,'2019-7-30 14:6:0',144.974,-37.7659);
INSERT INTO Location VALUES(67,3,'2019-7-30 14:7:0',144.9752,-37.766);
INSERT INTO Location VALUES(68,3,'2019-7-30 14:8:0',144.9763,-37.7661);
INSERT INTO Location VALUES(69,3,'2019-7-30 14:9:0',144.977,-37.7663);
INSERT INTO Location VALUES(70,3,'2019-7-30 14:10:0',144.9782,-37.7664);
INSERT INTO Location VALUES(71,3,'2019-7-30 14:11:0',144.9791,-37.7664);
INSERT INTO Location VALUES(72,3,'2019-7-30 14:12:0',144.9803,-37.7666);
INSERT INTO Location VALUES(73,3,'2019-7-30 14:13:0',144.9806,-37.7656);
INSERT INTO Location VALUES(74,3,'2019-7-30 14:14:0',144.9813,-37.7656);
INSERT INTO Location VALUES(75,3,'2019-7-30 14:15:0',144.9824,-37.7659);
INSERT INTO Location VALUES(76,3,'2019-7-30 14:16:0',144.9822,-37.7669);
INSERT INTO Location VALUES(77,3,'2019-7-30 14:17:0',144.982,-37.768);
INSERT INTO Location VALUES(78,3,'2019-7-30 14:18:0',144.9818,-37.7692);
INSERT INTO Location VALUES(79,3,'2019-7-30 14:19:0',144.9807,-37.7691);
INSERT INTO Location VALUES(80,3,'2019-7-30 14:20:0',144.9791,-37.7689);
INSERT INTO Location VALUES(81,3,'2019-7-30 14:21:0',144.9778,-37.7688);
INSERT INTO Location VALUES(82,3,'2019-7-30 14:22:0',144.9767,-37.7686);
INSERT INTO Location VALUES(83,3,'2019-7-30 14:23:0',144.9753,-37.7685);
INSERT INTO Location VALUES(84,3,'2019-7-30 14:24:0',144.9741,-37.7684);
INSERT INTO Location VALUES(85,3,'2019-7-30 14:25:0',144.9729,-37.7682);
INSERT INTO Location VALUES(86,3,'2019-7-30 14:26:0',144.9718,-37.7681);
INSERT INTO Location VALUES(87,4,'2019-7-30 15:1:0',144.9719,-37.7898);
INSERT INTO Location VALUES(88,4,'2019-7-30 15:2:0',144.9716,-37.7912);
INSERT INTO Location VALUES(89,4,'2019-7-30 15:3:0',144.9713,-37.7926);
INSERT INTO Location VALUES(90,4,'2019-7-30 15:4:0',144.9712,-37.7937);
INSERT INTO Location VALUES(91,4,'2019-7-30 15:5:0',144.971,-37.7945);
INSERT INTO Location VALUES(92,4,'2019-7-30 15:6:0',144.97,-37.795);
INSERT INTO Location VALUES(93,4,'2019-7-30 15:7:0',144.9687,-37.7956);
INSERT INTO Location VALUES(94,4,'2019-7-30 15:8:0',144.9673,-37.796);
INSERT INTO Location VALUES(95,4,'2019-7-30 15:9:0',144.9663,-37.7958);
INSERT INTO Location VALUES(96,4,'2019-7-30 15:10:0',144.9648,-37.7959);
INSERT INTO Location VALUES(97,4,'2019-7-30 15:11:0',144.9642,-37.7967);
INSERT INTO Location VALUES(98,4,'2019-7-30 15:12:0',144.963,-37.7965);
INSERT INTO Location VALUES(99,4,'2019-7-30 15:13:0',144.962,-37.7964);
INSERT INTO Location VALUES(100,4,'2019-7-30 15:14:0',144.9605,-37.7962);
INSERT INTO Location VALUES(101,4,'2019-7-30 15:15:0',144.9593,-37.7962);
INSERT INTO Location VALUES(102,4,'2019-7-30 15:16:0',144.9579,-37.7958);
INSERT INTO Location VALUES(103,4,'2019-7-30 15:17:0',144.9561,-37.7956);
INSERT INTO Location VALUES(104,4,'2019-7-30 15:18:0',144.9549,-37.7954);
INSERT INTO Location VALUES(105,4,'2019-7-30 15:19:0',144.954,-37.795);
INSERT INTO Location VALUES(106,4,'2019-7-30 15:20:0',144.9531,-37.7937);
INSERT INTO Location VALUES(107,5,'2019-7-30 15:1:0',151.2171,-33.8657);
INSERT INTO Location VALUES(108,5,'2019-7-30 15:2:0',151.2158,-33.8654);
INSERT INTO Location VALUES(109,5,'2019-7-30 15:3:0',151.2152,-33.8648);
INSERT INTO Location VALUES(110,5,'2019-7-30 15:4:0',151.2153,-33.8638);
INSERT INTO Location VALUES(111,5,'2019-7-30 15:5:0',151.2153,-33.8629);
INSERT INTO Location VALUES(112,5,'2019-7-30 15:6:0',151.2154,-33.8621);
INSERT INTO Location VALUES(113,5,'2019-7-30 15:7:0',151.2157,-33.8613);
INSERT INTO Location VALUES(114,5,'2019-7-30 15:8:0',151.2163,-33.8606);
INSERT INTO Location VALUES(115,5,'2019-7-30 15:9:0',151.2163,-33.8597);
INSERT INTO Location VALUES(116,5,'2019-7-30 15:10:0',151.2157,-33.859);
INSERT INTO Location VALUES(117,5,'2019-7-30 15:11:0',151.2149,-33.8583);
INSERT INTO Location VALUES(118,5,'2019-7-30 15:12:0',151.2149,-33.8572);
INSERT INTO Location VALUES(119,5,'2019-7-30 15:13:0',151.2134,-33.8586);
INSERT INTO Location VALUES(120,5,'2019-7-30 15:14:0',151.2127,-33.8597);
INSERT INTO Location VALUES(121,5,'2019-7-30 15:15:0',151.2128,-33.8605);
INSERT INTO Location VALUES(122,5,'2019-7-30 15:16:0',151.2125,-33.8613);
INSERT INTO Location VALUES(123,5,'2019-7-30 15:17:0',151.2112,-33.8615);
INSERT INTO Location VALUES(124,5,'2019-7-30 15:18:0',151.21,-33.8614);
INSERT INTO Location VALUES(125,5,'2019-7-30 15:19:0',151.2092,-33.8607);
INSERT INTO Location VALUES(126,5,'2019-7-30 15:20:0',151.2095,-33.8599);
INSERT INTO Location VALUES(127,5,'2019-7-30 15:21:0',151.2095,-33.8593);
INSERT INTO Location VALUES(128,5,'2019-7-30 15:22:0',151.2086,-33.8587);
INSERT INTO Location VALUES(129,7,'2019-7-30 16:1:0',144.9933,-37.8226);
INSERT INTO Location VALUES(130,7,'2019-7-30 16:2:0',144.9932,-37.8233);
INSERT INTO Location VALUES(131,7,'2019-7-30 16:3:0',144.9922,-37.8233);
INSERT INTO Location VALUES(132,7,'2019-7-30 16:4:0',144.9918,-37.8238);
INSERT INTO Location VALUES(133,7,'2019-7-30 16:5:0',144.9908,-37.8242);
INSERT INTO Location VALUES(134,7,'2019-7-30 16:6:0',144.9673,-37.818);
INSERT INTO Location VALUES(135,7,'2019-7-30 16:7:0',144.9674,-37.8175);
INSERT INTO Location VALUES(136,7,'2019-7-30 16:8:0',144.9672,-37.817);
INSERT INTO Location VALUES(137,7,'2019-7-30 16:9:0',144.967,-37.8165);
INSERT INTO Location VALUES(138,7,'2019-7-30 16:10:0',144.9668,-37.816);
INSERT INTO Location VALUES(139,7,'2019-7-30 16:11:0',144.9666,-37.8156);
INSERT INTO Location VALUES(140,7,'2019-7-30 16:12:0',144.9663,-37.815);
INSERT INTO Location VALUES(141,7,'2019-7-30 16:13:0',144.966,-37.8145);
INSERT INTO Location VALUES(142,7,'2019-7-30 16:14:0',144.9658,-37.814);
INSERT INTO Location VALUES(143,7,'2019-7-30 16:15:0',144.9656,-37.8134);
INSERT INTO Location VALUES(144,7,'2019-7-30 16:16:0',144.9654,-37.813);
INSERT INTO Location VALUES(145,7,'2019-7-30 16:17:0',144.9651,-37.8123);
INSERT INTO Location VALUES(146,7,'2019-7-30 16:18:0',144.9648,-37.8117);
INSERT INTO Location VALUES(147,7,'2019-7-30 16:19:0',144.9645,-37.8108);
INSERT INTO Location VALUES(148,7,'2019-7-30 16:20:0',144.9641,-37.8103);
INSERT INTO Location VALUES(149,7,'2019-7-30 16:21:0',144.9638,-37.8096);
INSERT INTO Location VALUES(150,7,'2019-7-30 16:22:0',144.9643,-37.8089);