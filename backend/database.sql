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
    ('Sony', 'Sony Corporation est une entreprise japonaise de l???industrie ??lectronique, de l?????lectronique grand public et des jeux vid??o. Elle est l???un des principaux fabricants de consoles de jeux vid??o, de t??l??viseurs, de lecteurs Blu-ray, de smartphones, de cam??scopes, de cam??ras num??riques, de lecteurs MP3, de baladeurs, de lecteurs de disques optiques, de lecteurs de disques Blu-ray, de lecteurs de disques DVD, de lecteurs de disques CD, de lecteurs de disques miniDisc, de lecteurs de disques magn??tiques, de lecteurs de disques Super Audio CD, de lecteurs de disques vid??o'),
    ('Nintendo', 'Nintendo est une entreprise multinationale japonaise fond??e en 1889 par Fusajir?? Yamauchi3 pr??s de Kyoto au Japon. Elle est sp??cialis??e dans la fabrication de consoles de jeu vid??o depuis 1977 avec la sortie de la Color TV-Game, ainsi que dans la conception de jeux vid??o, dont les s??ries Super Mario ou The Legend of Zelda.'),
    ('Sega', 'Sega Corporation, abr??viation de Service Games, couramment stylis?? SEGA est une soci??t?? japonaise de d??veloppement et d??dition de jeux vid??o, ainsi qu???un fabricant de bornes et syst??mes d???arcade. Sega est ??galement un fabricant de consoles de jeux vid??o, mais ?? la suite de l?????chec commercial de la console de salon Saturn ainsi qu????? l???indiff??rence du public envers la Dreamcast, la soci??t?? s???est retir??e de ce march?? en date du 31 janvier 2001 pour se consacrer exclusivement au d??veloppement de jeux pour d???autres consoles et pour ordinateur, et de jeux d???arcade2.'),
    ('Microsoft', 'Microsoft Corporation est une multinationale informatique et micro-informatique am??ricaine, fond??e en 1975 par Bill Gates et Paul Allen. Microsoft fait partie des principales capitalisations boursi??res du NASDAQ8, aux c??t??s d???Apple et d???Amazon. En 2018, le chiffre d???affaires s?????levait ?? 110,36 milliards de dollars. Elle est dirig??e, depuis le 4 f??vrier 2014, par Satya Nadella qui succ??de ?? Steve Ballmer et Bill Gates en qualit?? de directeur g??n??ral. En 2020, l???entreprise emploie 148 000 personnes dans 120 pays.');

INSERT INTO consoles (title, firm_id, photo, photoName, description, quantity, price) VALUES 
    ('Playstation 5', 1, 'https://static.actugaming.net/media/2020/06/ps5-reveal-e1656496437734.jpg', 'playstation5.jpg', 'La PlayStation 5 est une console de jeux vid??o de huiti??me g??n??ration d??velopp??e par Sony Interactive Entertainment. Elle succ??de ?? la PlayStation 4 et est sortie le 19 novembre 2020 en Am??rique du Nord, le 20 novembre 2020 en Europe et en Australie, et le 23 novembre 2020 au Japon. Elle est la premi??re console de la famille PlayStation ?? utiliser une architecture personnalis??e, la PlayStation 5 utilise un processeur AMD Zen 2 et une carte graphique AMD RDNA 2. La PlayStation 5 est compatible avec les jeux PlayStation 4', 10, 10),
    ('Xbox Series X', 4, 'https://images.frandroid.com/wp-content/uploads/2019/12/xbox-series-x-fond-blanc.jpg', 'xboxseriesx.jpg', 'La Xbox Series X est une console de jeux vid??o de huiti??me g??n??ration d??velopp??e par Microsoft. Elle succ??de ?? la Xbox One. Elle est sortie le 10 novembre 2020 en Am??rique du Nord, le 10 novembre 2020 en Europe, le 10 novembre 2020 en Australie et le 12 novembre 2020 au Japon. Elle est la premi??re console de la famille Xbox ?? utiliser une architecture personnalis??e, la Xbox Series X utilise un processeur AMD Zen 2 et une carte graphique AMD RDNA 2. La Xbox Series X est compatible avec les jeux Xbox One', 10, 10),
    ('Nintendo Switch', 2, 'https://fs-prod-cdn.nintendo-europe.com/media/images/08_content_images/systems_5/nintendo_switch_3/nintendo_switch_oled/CI_NSwitch_product_switch_neon.jpg', 'nintendoswitch.jpg', 'La Nintendo Switch est une console de jeux vid??o de huiti??me g??n??ration d??velopp??e par Nintendo. Elle succ??de ?? la Nintendo 3DS et ?? la Wii U. Elle est sortie le 3 mars 2017 en Am??rique du Nord, le 3 mars 2017 en Europe, le 3 mars 2017 en Australie et le 3 mars 2017 au Japon. Elle est la premi??re console de la famille Nintendo ?? utiliser une architecture personnalis??e, la Nintendo Switch utilise un processeur Nvidia Tegra et une carte graphique Nvidia Maxwell. La Nintendo Switch est compatible avec les jeux Nintendo 3DS et Wii U', 10, 8);
    
INSERT INTO games (title, firm_id, consoles_id, photo, photoName, description, quantity, price) VALUES 
    ('Call of Duty: Black Ops Cold War', NULL, 1, 'https://image.api.playstation.com/vulcan/ap/rnd/202112/0618/cFLNC3xYfEdDl7D1Wvu4MVb1.png', 'callofdutyblackopscoldwar.jpg', 'Call of Duty: Black Ops Cold War est un jeu vid??o de tir ?? la premi??re personne d??velopp?? par Treyarch et Raven Software et ??dit?? par Activision. Il est sorti le 13 novembre 2020 sur PlayStation 4, Xbox One, PlayStation 5, Xbox Series X et Microsoft Windows. Il s???agit du douzi??me opus de la s??rie Call of Duty et du sixi??me de la sous-s??rie Black Ops. Il est le premier jeu de la s??rie ?? se d??rouler dans les ann??es 1980', 10, 2),
    ('Call of Duty: Black Ops Cold War', NULL, 2, 'https://image.api.playstation.com/vulcan/ap/rnd/202112/0618/cFLNC3xYfEdDl7D1Wvu4MVb1.png', 'callofdutyblackopscoldwar.jpg', 'Call of Duty: Black Ops Cold War est un jeu vid??o de tir ?? la premi??re personne d??velopp?? par Treyarch et Raven Software et ??dit?? par Activision. Il est sorti le 13 novembre 2020 sur PlayStation 4, Xbox One, PlayStation 5, Xbox Series X et Microsoft Windows. Il s???agit du douzi??me opus de la s??rie Call of Duty et du sixi??me de la sous-s??rie Black Ops. Il est le premier jeu de la s??rie ?? se d??rouler dans les ann??es 1980', 10, 2),
    ('Assassin???s Creed Valhalla', NULL, 1, 'https://image.api.playstation.com/vulcan/ap/rnd/202006/1520/EDtkdijFRwbmGKk1G9lrDoEF.png', 'assassinscreedvalhalla.jpg', 'Assassin???s Creed Valhalla est un jeu vid??o d???action-aventure d??velopp?? par Ubisoft Montr??al et ??dit?? par Ubisoft. Il est sorti le 10 novembre 2020 sur PlayStation 4, Xbox One, PlayStation 5, Xbox Series X et Microsoft Windows. Il s???agit du dixi??me opus de la s??rie Assassin???s Creed et du troisi??me de la sous-s??rie Assassin???s Creed Valhalla. Il est le premier jeu de la s??rie ?? se d??rouler dans l???Angleterre du IXe si??cle', 10, 2),
    ('Assassin???s Creed Valhalla', NULL, 2, 'https://image.api.playstation.com/vulcan/ap/rnd/202006/1520/EDtkdijFRwbmGKk1G9lrDoEF.png', 'assassinscreedvalhalla.jpg', 'Assassin???s Creed Valhalla est un jeu vid??o d???action-aventure d??velopp?? par Ubisoft Montr??al et ??dit?? par Ubisoft. Il est sorti le 10 novembre 2020 sur PlayStation 4, Xbox One, PlayStation 5, Xbox Series X et Microsoft Windows. Il s???agit du dixi??me opus de la s??rie Assassin???s Creed et du troisi??me de la sous-s??rie Assassin???s Creed Valhalla. Il est le premier jeu de la s??rie ?? se d??rouler dans l???Angleterre du IXe si??cle', 10, 2),
    ('Cyberpunk 2077', NULL, 1, 'https://image.api.playstation.com/vulcan/ap/rnd/202111/3013/cKZ4tKNFj9C00giTzYtH8PF1.png', 'cyberpunk2077.jpg', 'Cyberpunk 2077 est un jeu vid??o d???action-RPG d??velopp?? par CD Projekt Red et ??dit?? par CD Projekt. Il est sorti le 10 d??cembre 2020 sur PlayStation 4, Xbox One, PlayStation 5, Xbox Series X et Microsoft Windows. Il s???agit du sixi??me opus de la s??rie Cyberpunk et du premier ?? se d??rouler dans un monde ouvert.', 10, 2),
    ('Cyberpunk 2077', NULL, 2, 'https://image.api.playstation.com/vulcan/ap/rnd/202111/3013/cKZ4tKNFj9C00giTzYtH8PF1.png', 'cyberpunk2077.jpg', 'Cyberpunk 2077 est un jeu vid??o d???action-RPG d??velopp?? par CD Projekt Red et ??dit?? par CD Projekt. Il est sorti le 10 d??cembre 2020 sur PlayStation 4, Xbox One, PlayStation 5, Xbox Series X et Microsoft Windows. Il s???agit du sixi??me opus de la s??rie Cyberpunk et du premier ?? se d??rouler dans un monde ouvert.', 10, 2),
    ('The Legend of Zelda: Breath of the Wild', 2, 3,'https://img-eshop.cdn.nintendo.net/i/d3c210e61e8487200fc4c344987243a60257838187a69a6a81c42d7447d5d192.jpg', 'botw.jpg','The Legend of Zelda: Breath of the Wild est un jeu d???action-aventure d??velopp?? par la division Nintendo EPD, assist?? par Monolith Soft, et publi?? par Nintendo le 3 mars 2017 sur Nintendo Switch lors du lancement de la console, ainsi que sur Wii U dont il est le dernier jeu produit par Nintendo.', 10, 2),
    ('Elden Ring', NULL,1,'https://static-pepper.dealabs.com/threads/raw/OFBhw/2475531_1/re/1024x1024/qt/60/2475531_1.jpg','eldenring.jpg','Elden Ring est un jeu vid??o d???action-RPG d??velopp?? par FromSoftware et ??dit?? par Bandai Namco Entertainment, issu de la collaboration entre le cr??ateur de jeux vid??o Hidetaka Miyazaki et l?????crivain George R. R. Martin. Il sort le 25 f??vrier 2022 sur PlayStation 4, PlayStation 5, Xbox One, Xbox Series et Windows. ', 10, 2),
    ('Grand Theft Auto V', NULL, 1, 'https://cdn.wallpapersafari.com/53/95/1wtK8v.jpg', 'grandtheftautov.jpg', 'Grand Theft Auto V est un jeu vid??o d???action-aventure d??velopp?? par Rockstar North et ??dit?? par Rockstar Games. Il est sorti en septembre 2013 sur PlayStation 3 et Xbox 360 et plus tard sur PlayStation 4, Xbox One et Microsoft Windows. Il se d??roule dans la ville fictive de Los Santos et s???articule autour de trois personnages principaux.', 10, 2),
    ('Red Dead Redemption 2', NULL, 1, 'https://apollo2.dl.playstation.net/cdn/UP1004/CUSA03041_00/Hpl5MtwQgOVF9vJqlfui6SDB5Jl4oBSq.png', 'reddeadredemption2.jpg', 'Red Dead Redemption 2 est un jeu vid??o d???action-aventure d??velopp?? par Rockstar Studios et ??dit?? par Rockstar Games. Il est sorti en octobre 2018 sur PlayStation 4 et Xbox One et plus tard sur Microsoft Windows. Il se d??roule dans l???Ouest am??ricain et suit les aventures d???Arthur Morgan, un membre de la bande de hors-la-loi du Dutch Van der Linde.', 10, 2),
    ('The Witcher 3: Wild Hunt', NULL, 1, 'https://vulcan.dl.playstation.net/img/rnd/202009/2913/TQKAd8U6hnIFQIIcz6qnFh8C.png', 'thewitcher3wildhunt.jpg', 'The Witcher 3: Wild Hunt est un jeu vid??o d???action-RPG d??velopp?? par CD Projekt RED et ??dit?? par CD Projekt. Il est sorti en mai 2015 sur PlayStation 4, Xbox One et Microsoft Windows. Il s???agit du troisi??me opus de la s??rie The Witcher et suit les aventures du sorceleur Geralt de Riv dans un monde m??di??val-fantastique.', 10, 2),
    ('Destiny 2', NULL, 1, 'https://live.staticflickr.com/1891/44323618892_79a8c0d4be_b.jpg', 'destiny2.jpg', 'Destiny 2 est un jeu vid??o de tir ?? la premi??re personne d??velopp?? par Bungie et ??dit?? par Activision. Il est sorti en septembre 2017 sur PlayStation 4, Xbox One et Microsoft Windows et plus tard sur PlayStation 5 et Xbox Series X. Il s???agit d???un jeu en ligne coop??ratif dans lequel les joueurs incarnent des Gardiens de la Ville et doivent sauver la Terre d???une menace extraterrestre.', 10, 2)
                              