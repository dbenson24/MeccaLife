CREATE TABLE `goverment` (
  `id` INT NOT NULL DEFAULT 1,
  `laws` TEXT NOT NULL,
  PRIMARY KEY (`id`));

INSERT INTO `goverment` VALUES (1,'[]');
INSERT INTO `goverment` VALUES (2,'4573834057905734');
INSERT INTO `goverment` VALUES (3,'0');
INSERT INTO `goverment` VALUES (4,'20');

ALTER TABLE `goverment`
MODIFY COLUMN `laws`  varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER `id`;