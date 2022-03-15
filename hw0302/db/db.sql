SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+08:00";

-- ---------------
-- Define Tables
-- ---------------

CREATE TABLE `imgs` (
  `id` int(11) NOT NULL auto_increment,
  `filename` varchar(64) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `files` (
  `id` int(11) NOT NULL auto_increment,
  `filename` VARCHAR(50),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `img_id` int(11),
  PRIMARY KEY (id),
  FOREIGN KEY (img_id) REFERENCES imgs (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `post` (
  `id` int(11) NOT NULL auto_increment,
  `contents` varchar(10000) NOT NULL,
  `poster_id` int(11) NOT NULL,
  `file_id` int(11),
  PRIMARY KEY (id),
  FOREIGN KEY (poster_id) REFERENCES users (id),
  FOREIGN KEY (file_id) REFERENCES files (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ------------------
-- Define Functions
-- ------------------

CREATE FUNCTION GetUserId(uesrName varchar(64)) RETURNS int(11)
RETURN (SELECT `id` FROM `users` WHERE username = uesrName);

CREATE FUNCTION GetUsername(uers_id int(11)) RETURNS varchar(64)
RETURN (SELECT `username` FROM `users` WHERE id = uers_id);

CREATE PROCEDURE AddNewPost(user_id int(11), post_contents varchar(10000))
INSERT INTO `post` (`poster_id`, `contents`) VALUES (user_id, post_contents);

CREATE FUNCTION UserLogin(userName varchar(64), passwd varchar(64)) RETURNS int(11)
RETURN (SELECT `id` FROM `users` WHERE `username` = userName and `password` = passwd);



-- ---------------
-- Insert data
-- ---------------

INSERT INTO `users` (`username`, `password`) VALUES ("admin", "123456");
INSERT INTO `users` (`username`, `password`) VALUES ("nqgr", "abcdef");
INSERT INTO `users` (`username`, `password`) VALUES ("ombz", "qazwsx");
INSERT INTO `users` (`username`, `password`) VALUES ("pgid", "edcrfv");
INSERT INTO `users` (`username`, `password`) VALUES ("fsfw", "tgbyhn");

INSERT INTO `post` (`contents`, `poster_id`, `file_id`) VALUES ("Hello, it's admin.", GetUserId('admin'), NULL);
INSERT INTO `post` (`contents`, `poster_id`, `file_id`) VALUES ("Hello, it's ombz.", GetUserId('ombz'), NULL);