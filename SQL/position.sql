ALTER TABLE `arma3life`.`players`,
ADD COLUMN `alive` TINYINT(1) NOT NULL DEFAULT '0' AFTER `jail_time`,
ADD COLUMN `position` TEXT NULL DEFAULT NULL AFTER `alive`;
