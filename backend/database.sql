DROP DATABASE IF EXISTS checkpoint4;
CREATE DATABASE checkpoint4;
USE checkpoint4;

CREATE TABLE `user` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `firstname` VARCHAR(50)  NOT NULL ,
    `lastname` VARCHAR(50)  NOT NULL ,
    `photo`  VARCHAR(500)  NULL ,
    `photoName`  VARCHAR(500)  NULL ,
    `role_id` int  NOT NULL ,
    `email` VARCHAR(50)  NOT NULL ,
    `password` VARCHAR(100)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);
CREATE TABLE `admin` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `firstname` VARCHAR(50)  NOT NULL ,
    `lastname` VARCHAR(50)  NOT NULL ,
    `photo`  VARCHAR(500)  NULL ,
    `photoName`  VARCHAR(500)  NULL ,
    `role_id` int  NOT NULL ,
    `email` VARCHAR(40)  NOT NULL ,
    `password` VARCHAR(100)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);
CREATE TABLE `role` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `role` VARCHAR(60)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);
CREATE TABLE `firm` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `name` VARCHAR(50)  NOT NULL ,
    `description` VARCHAR(3000)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);
CREATE TABLE `consoles` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `title` VARCHAR(100)  NOT NULL ,
    `firm_id` int  NOT NULL ,
    `photo`  VARCHAR(500)  NULL ,
    `photoName`  VARCHAR(500)  NULL ,
    `description` VARCHAR(3000)  NOT NULL ,
    `quantity` int  NOT NULL ,
    `price` int  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `games` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `title` VARCHAR(100)  NOT NULL ,
    `firm_id` int  NOT NULL ,
    `consoles_id` int  NOT NULL ,
    `photo`  VARCHAR(500)  NULL ,
    `photoName`  VARCHAR(500)  NULL ,
    `description` VARCHAR(3000)  NOT NULL ,
    `quantity` int  NOT NULL ,
    `price` int  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);
CREATE TABLE `userGames` (
    `id` int AUTO_INCREMENT NOT NULL ,
    `isFavorite` BOOLEAN  NOT NULL DEFAULT FALSE ,
    `isRent` BOOLEAN  NOT NULL DEFAULT FALSE,
    `games_id` int  NOT NULL ,
    `user_id` int  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

ALTER TABLE `user` ADD CONSTRAINT `fk_user_role_id` FOREIGN KEY(`role_id`)
REFERENCES `role` (`id`);
ALTER TABLE `admin` ADD CONSTRAINT `fk_admin_role_id` FOREIGN KEY(`role_id`)
REFERENCES `role` (`id`);
ALTER TABLE `consoles` ADD CONSTRAINT `fk_consoles_firm_id` FOREIGN KEY(`firm_id`)
REFERENCES `firm` (`id`);
ALTER TABLE `games` ADD CONSTRAINT `fk_games_firm_id` FOREIGN KEY(`firm_id`)
REFERENCES `firm` (`id`);
ALTER TABLE `games` ADD CONSTRAINT `fk_games_consoles_id` FOREIGN KEY(`consoles_id`)
REFERENCES `consoles` (`id`);

ALTER TABLE `userGames` ADD CONSTRAINT `fk_userGames_games_id` FOREIGN KEY(`games_id`)
REFERENCES `games` (`id`);
ALTER TABLE `userGames` ADD CONSTRAINT `fk_userGames_user_id` FOREIGN KEY(`user_id`)
REFERENCES `user` (`id`);

INSERT INTO role (role) VALUES ('user'),
                               ('admin'),


                              