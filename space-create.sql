-- create and select the database
DROP DATABASE IF EXISTS space;
CREATE DATABASE space;
USE space;

-- create the commander table
CREATE TABLE commander (
  ID                 int                PRIMARY KEY   auto_increment,
  firstname          varchar(20)        NOT NULL,
  lastname           varchar(20)        not null,
  birthday           date               not null,
  homestate          varchar(20)        not null,
  military           varchar(20)        not null
);

-- create the program table
CREATE TABLE program (
  ID                      int                 PRIMARY KEY   auto_increment,
  name                    varchar(20)         NOT NULL,
  startyear               int                 NOT NULL,
  endyear                 int                 not null,
  flights                 int                 not null
);

-- create the spacecraft table
CREATE TABLE spacecraft (
  ID                        INT                 PRIMARY KEY   auto_increment,
  name                      VARCHAR(20)         NOT NULL,
  debut                     int                 not null,
  retirement                int                 not null,
  flights                   int                 not null
);

-- create the mission table
CREATE TABLE mission (
  ID                          INT                      PRIMARY KEY   auto_increment,
  name                        varchar(20)              not null,
  launch                      date                     not null,
  commanderid                 INT                      NOT NULL,
  programid                   int                      NOT NULL,
  spacecraftid                int                      NOT NULL
  foreign key(commanderid) references commander(id),
  foreign key(programid) references program(id),
  foreign key(spacecraftid) references spacecraft(id)
);

-- insert commanders
INSERT INTO commander (ID, firstname, lastname, birthday, homestate, military) VALUES 
(1, 'Malcom', 'Carpenter', '1925-05-01', 'Colorado', 'Navy'),
(2, 'Leroy', 'Cooper', '1927-03-06', 'Oklahoma', 'Air Force'),
(3, 'John', 'Glenn', '1921-07-18', 'Ohio', 'Marines'),
(4, 'Virgil', 'Grisom', '1926-04-03', 'Indiana', 'Air Force'),
(5, 'Walter', 'Schirra', '1923-03-12', 'New Jersey', 'Navy'),
(6, 'Alan', 'Shepard', '1923-11-18', 'New Hampshire', 'Navy'),

-- insert programs
INSERT INTO program (ID, name, startyear, endyear, flights) 
VALUES 
(1,'Mercury', 1959, 1963, 6),
(2,'Gemini', 1963, 1966, 10),
(3,'Apollo', 1961, 1972, 11),
(4,'Skylab', 1973, 1974, 3),
(5,'Space Shuttle', 1981, 2011, 135);

-- insert spacecrafts
INSERT INTO spacecraft (ID, name, debut, retirement, flights) 
VALUES 
(1, 'Freedom 7', 1961, 1961, 1),
(2, 'Liberty Bell 7', 1961, 1961, 1),
(3, 'Friendship 7', 1962, 1962, 1),
(4, 'Aurora 7', 1962, 1962, 1),
(5, 'Sigma 7', 1962, 1962, 1),
(6, 'Faith 7', 1963, 1963, 1);

-- insert missions
INSERT INTO mission (ID, name, launch, commanderid, programid, spacecraftid) 
VALUES 
(1, 'MR-3', '1961-05-05', !, 1, 1),
(2,'MR-4','1961-07-21', !, 1, 2),
(3,'MA-6','1962-02-20', !, 1, 3),
(4,'MA-7','1962-05-24', !, 1, 4),
(5,'MA-8','1962-10-03', !, 1, 5),
(6,'MA-9','1963-05-15', !, 1, 6);

CREATE USER space_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON space.* TO space_user@localhost;