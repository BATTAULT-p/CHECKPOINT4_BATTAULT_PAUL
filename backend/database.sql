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
    `firm_id` int  NULL ,
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

INSERT INTO role (role) VALUES ('user'), ('admin');
                              
INSERT INTO admin (firstname, lastname, photo, photoName, email, password, role_id) VALUES 
    ('Paul', 'BATTAULT', 'http://localhost:5002/uploads/photos/paulb.png', 'paulb.png', 'paulbattault@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$wLubu1w/HZ/IoOXLX/Dg+Q$Y6u3DEhcUo/Scr/b33V/5lgqc4VpeYbTr9rXx22EAGM', 2);

INSERT INTO user (firstname, lastname, photo, photoName, email, password, role_id) VALUES 
    ('David', 'FAURE', 'https://ca.slack-edge.com/T6SG2QGG2-U03TJJC82KH-2029c529ac23-512', 'faure.jpg', 'davidfaure@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$wLubu1w/HZ/IoOXLX/Dg+Q$Y6u3DEhcUo/Scr/b33V/5lgqc4VpeYbTr9rXx22EAGM', 1),
    ('Maxime', 'DUPIN', 'https://ca.slack-edge.com/T6SG2QGG2-U041SBCGE14-2df0deaf4b0c-512', 'dupin.jpg', 'maximedupin@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$wLubu1w/HZ/IoOXLX/Dg+Q$Y6u3DEhcUo/Scr/b33V/5lgqc4VpeYbTr9rXx22EAGM', 1);

INSERT INTO firm (name, description) VALUES 
    ('Sony', 'Sony Corporation est une entreprise japonaise de l’industrie électronique, de l’électronique grand public et des jeux vidéo. Elle est l’un des principaux fabricants de consoles de jeux vidéo, de téléviseurs, de lecteurs Blu-ray, de smartphones, de caméscopes, de caméras numériques, de lecteurs MP3, de baladeurs, de lecteurs de disques optiques, de lecteurs de disques Blu-ray, de lecteurs de disques DVD, de lecteurs de disques CD, de lecteurs de disques miniDisc, de lecteurs de disques magnétiques, de lecteurs de disques Super Audio CD, de lecteurs de disques vidéo'),
    ('Nintendo', 'Nintendo est une entreprise multinationale japonaise fondée en 1889 par Fusajirō Yamauchi3 près de Kyoto au Japon. Elle est spécialisée dans la fabrication de consoles de jeu vidéo depuis 1977 avec la sortie de la Color TV-Game, ainsi que dans la conception de jeux vidéo, dont les séries Super Mario ou The Legend of Zelda.'),
    ('Sega', 'Sega Corporation, abréviation de Service Games, couramment stylisé SEGA est une société japonaise de développement et dédition de jeux vidéo, ainsi qu’un fabricant de bornes et systèmes d’arcade. Sega est également un fabricant de consoles de jeux vidéo, mais à la suite de l’échec commercial de la console de salon Saturn ainsi qu’à l’indifférence du public envers la Dreamcast, la société s’est retirée de ce marché en date du 31 janvier 2001 pour se consacrer exclusivement au développement de jeux pour d’autres consoles et pour ordinateur, et de jeux d’arcade2.'),
    ('Microsoft', 'Microsoft Corporation est une multinationale informatique et micro-informatique américaine, fondée en 1975 par Bill Gates et Paul Allen. Microsoft fait partie des principales capitalisations boursières du NASDAQ8, aux côtés d’Apple et d’Amazon. En 2018, le chiffre d’affaires s’élevait à 110,36 milliards de dollars. Elle est dirigée, depuis le 4 février 2014, par Satya Nadella qui succède à Steve Ballmer et Bill Gates en qualité de directeur général. En 2020, l’entreprise emploie 148 000 personnes dans 120 pays.');

INSERT INTO consoles (title, firm_id, photo, photoName, description, quantity, price) VALUES 
    ('Playstation 5', 1, 'https://static.actugaming.net/media/2020/06/ps5-reveal-e1656496437734.jpg', 'playstation5.jpg', 'La PlayStation 5 est une console de jeux vidéo de huitième génération développée par Sony Interactive Entertainment. Elle succède à la PlayStation 4 et est sortie le 19 novembre 2020 en Amérique du Nord, le 20 novembre 2020 en Europe et en Australie, et le 23 novembre 2020 au Japon. Elle est la première console de la famille PlayStation à utiliser une architecture personnalisée, la PlayStation 5 utilise un processeur AMD Zen 2 et une carte graphique AMD RDNA 2. La PlayStation 5 est compatible avec les jeux PlayStation 4', 10, 10),
    ('Xbox Series X', 4, 'https://images.frandroid.com/wp-content/uploads/2019/12/xbox-series-x-fond-blanc.jpg', 'xboxseriesx.jpg', 'La Xbox Series X est une console de jeux vidéo de huitième génération développée par Microsoft. Elle succède à la Xbox One. Elle est sortie le 10 novembre 2020 en Amérique du Nord, le 10 novembre 2020 en Europe, le 10 novembre 2020 en Australie et le 12 novembre 2020 au Japon. Elle est la première console de la famille Xbox à utiliser une architecture personnalisée, la Xbox Series X utilise un processeur AMD Zen 2 et une carte graphique AMD RDNA 2. La Xbox Series X est compatible avec les jeux Xbox One', 10, 10),
    ('Nintendo Switch', 2, 'https://fs-prod-cdn.nintendo-europe.com/media/images/08_content_images/systems_5/nintendo_switch_3/nintendo_switch_oled/CI_NSwitch_main.jpg', 'nintendoswitch.jpg', 'La Nintendo Switch est une console de jeux vidéo de huitième génération développée par Nintendo. Elle succède à la Nintendo 3DS et à la Wii U. Elle est sortie le 3 mars 2017 en Amérique du Nord, le 3 mars 2017 en Europe, le 3 mars 2017 en Australie et le 3 mars 2017 au Japon. Elle est la première console de la famille Nintendo à utiliser une architecture personnalisée, la Nintendo Switch utilise un processeur Nvidia Tegra et une carte graphique Nvidia Maxwell. La Nintendo Switch est compatible avec les jeux Nintendo 3DS et Wii U', 10, 8);
    
INSERT INTO games (title, firm_id, consoles_id, photo, photoName, description, quantity, price) VALUES 
    ('Call of Duty: Black Ops Cold War', NULL, 1, 'https://www.jeuxvideo.com/medias-md/158000/158100/cover-avant.jpg', 'callofdutyblackopscoldwar.jpg', 'Call of Duty: Black Ops Cold War est un jeu vidéo de tir à la première personne développé par Treyarch et Raven Software et édité par Activision. Il est sorti le 13 novembre 2020 sur PlayStation 4, Xbox One, PlayStation 5, Xbox Series X et Microsoft Windows. Il s’agit du douzième opus de la série Call of Duty et du sixième de la sous-série Black Ops. Il est le premier jeu de la série à se dérouler dans les années 1980', 10, 2),
    ('Call of Duty: Black Ops Cold War', NULL, 2, 'https://www.jeuxvideo.com/medias-md/158000/158100/cover-avant.jpg', 'callofdutyblackopscoldwar.jpg', 'Call of Duty: Black Ops Cold War est un jeu vidéo de tir à la première personne développé par Treyarch et Raven Software et édité par Activision. Il est sorti le 13 novembre 2020 sur PlayStation 4, Xbox One, PlayStation 5, Xbox Series X et Microsoft Windows. Il s’agit du douzième opus de la série Call of Duty et du sixième de la sous-série Black Ops. Il est le premier jeu de la série à se dérouler dans les années 1980', 10, 2),
    ('Assassin’s Creed Valhalla', NULL, 1, 'https://www.jeuxvideo.com/medias-md/158000/158100/cover-avant.jpg', 'assassinscreedvalhalla.jpg', 'Assassin’s Creed Valhalla est un jeu vidéo d’action-aventure développé par Ubisoft Montréal et édité par Ubisoft. Il est sorti le 10 novembre 2020 sur PlayStation 4, Xbox One, PlayStation 5, Xbox Series X et Microsoft Windows. Il s’agit du dixième opus de la série Assassin’s Creed et du troisième de la sous-série Assassin’s Creed Valhalla. Il est le premier jeu de la série à se dérouler dans l’Angleterre du IXe siècle', 10, 2),
    ('Assassin’s Creed Valhalla', NULL, 2, 'https://www.jeuxvideo.com/medias-md/158000/158100/cover-avant.jpg', 'assassinscreedvalhalla.jpg', 'Assassin’s Creed Valhalla est un jeu vidéo d’action-aventure développé par Ubisoft Montréal et édité par Ubisoft. Il est sorti le 10 novembre 2020 sur PlayStation 4, Xbox One, PlayStation 5, Xbox Series X et Microsoft Windows. Il s’agit du dixième opus de la série Assassin’s Creed et du troisième de la sous-série Assassin’s Creed Valhalla. Il est le premier jeu de la série à se dérouler dans l’Angleterre du IXe siècle', 10, 2),
    ('Cyberpunk 2077', NULL, 1, 'https://www.jeuxvideo.com/medias-md/158000/158100/cover-avant.jpg', 'cyberpunk2077.jpg', 'Cyberpunk 2077 est un jeu vidéo d’action-RPG développé par CD Projekt Red et édité par CD Projekt. Il est sorti le 10 décembre 2020 sur PlayStation 4, Xbox One, PlayStation 5, Xbox Series X et Microsoft Windows. Il s’agit du sixième opus de la série Cyberpunk et du premier à se dérouler dans un monde ouvert.', 10, 2),
    ('Cyberpunk 2077', NULL, 2, 'https://www.jeuxvideo.com/medias-md/158000/158100/cover-avant.jpg', 'cyberpunk2077.jpg', 'Cyberpunk 2077 est un jeu vidéo d’action-RPG développé par CD Projekt Red et édité par CD Projekt. Il est sorti le 10 décembre 2020 sur PlayStation 4, Xbox One, PlayStation 5, Xbox Series X et Microsoft Windows. Il s’agit du sixième opus de la série Cyberpunk et du premier à se dérouler dans un monde ouvert.', 10, 2),
    ('The Legend of Zelda: Breath of the Wild', 2, 3,'https://assets.nintendo.com/image/upload/c_fill,w_1200/q_auto:best/f_auto/dpr_2.0/ncom/fr_CA/games/switch/t/the-legend-of-zelda-breath-of-the-wild-switch/hero', 'botw.jpg','The Legend of Zelda: Breath of the Wild est un jeu d’action-aventure développé par la division Nintendo EPD, assisté par Monolith Soft, et publié par Nintendo le 3 mars 2017 sur Nintendo Switch lors du lancement de la console, ainsi que sur Wii U dont il est le dernier jeu produit par Nintendo.', 10, 2);
                              