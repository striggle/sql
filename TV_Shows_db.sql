-- create and select the database
DROP DATABASE IF EXISTS TV_Shows_db;
CREATE DATABASE TV_Shows_db;
USE TV_Shows_db;

-- create the user Tv_Shows_db
CREATE TABLE TvShow (
  ID                 int                PRIMARY KEY   auto_increment,
  Name               varchar(100)       NOT NULL      unique,
  Rating             varchar(15)        NOT NULL,
  Length             int                NOT NULL,
  Genre              varchar(25)        not null,
  Network            varchar(25)        not null,
   CONSTRAINT name_network unique (Name, Network)
);



INSERT INTO TvShow Values

(1,'Seinfeld','TV-14',30,'Comedy','NBC'),
(2,'The Middle','TV-14',30,'Comedy','ABC'),
(3,'Curb Your Enthusiasm','TV-MA',30,'Comedy','HBO'),
(4,'Arrested Development','TV-14',30,'Comedy','Netflix'),
(5,'Archer','TV-MA',30,'Comedy','FX'),
(6,'Three''s Company','TV-14',30,'Comedy','TV Land'),
(7,'Buffy the Vampire Slayer','TV-14',60,'Action','FX'),
(8,'Game of Thrones','TV-MA',60,'Drama','HBO'),
(9,'Walking Dead','TV-MA',60,'Action','AMC'),
(10,'Star Trek','TV-14',60,'Sci-Fi','CBS');




CREATE USER tv_shows_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON tv_shows_db.* TO tv_shows_user@localhost;