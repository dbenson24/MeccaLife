ALTER TABLE `players`
ADD COLUMN `admin_user` VARCHAR(50) NULL DEFAULT NULL AFTER `blacklist`,
ADD COLUMN `admin_pass` VARCHAR(50) NULL DEFAULT NULL AFTER `admin_user`,
ADD COLUMN `timeupdated` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `admin_pass`,
ADD COLUMN `timejoined` DATETIME NULL AFTER `timeupdated`;


CREATE TRIGGER player_create BEFORE INSERT ON `players`
FOR EACH ROW SET NEW.timejoined = NOW();