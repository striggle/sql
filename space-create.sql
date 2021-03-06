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
  spacecraftid                int                      NOT NULL,
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
(7, 'James', 'McDivitt', '1929-06-10', 'Illinois', 'Air Force'),
(8, 'Frank', 'Borman', '1928-03-14', 'Indiana', 'Air Force'),
(9, 'Neil', 'Armstrong', '1930-08-05', 'Ohio', 'Navy'),
(10, 'Thomas', 'Stafford', '1930-09-17', 'Oklahoma', 'Air Force'),
(11, 'John', 'Young', '1930-09-24', 'California', 'Navy'),
(12, 'Charles', 'Conrad', '1930-06-02', 'Pennsylvania', 'Navy'),
(13, 'James', 'Lovell', '1928-03-25', 'Ohio', 'Navy'),
(14, 'David', 'Scott', '1932-06-06', 'Texas', 'Air Force'),
(15, 'Eugene', 'Cernan', '1934-03-14', 'Illinois', 'Navy'),
(16, 'Alan', 'Bean', '1932-03-15', 'Texas', 'Navy'),
(17, 'Gerald', 'Carr', '1932-08-22', 'California', 'Marines');

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
(6, 'Faith 7', 1963, 1963, 1),
(7, 'GLV-3', 1965, 1965, 1),
(8, 'GLV-4', 1965, 1965, 1),
(9, 'GLV-5', 1965, 1965, 1),
(10, 'GLV-7', 1965, 1965, 1),
(11, 'GLV-6', 1965, 1965, 1),
(12, 'GLV-8', 1966, 1966, 1),
(13, 'GLV-9', 1966, 1966, 1),
(14, 'GLV-10', 1966, 1966, 1),
(15, 'GLV-11', 1966, 1966, 1),
(16, 'GLV-12', 1966, 1966, 1),
(17, 'CSM-101', 1968, 1968, 1),
(18, 'CSM-103', 1968, 1968, 1),
(19, 'CSM-104', 1969, 1969, 1),
(20, 'CSM-106', 1969, 1969, 1),
(21, 'CSM-107', 1969, 1969, 1),
(22, 'CSM-108', 1969, 1969, 1),
(23, 'CSM-109', 1970, 1970, 1),
(24, 'CSM-110', 1971, 1971, 1),
(25, 'CSM-112', 1971, 1971, 1),
(26, 'CSM-113', 1972, 1972, 1),
(27, 'CSM-114', 1972, 1972, 1),
(28, 'Skylab 2', 1973, 1973, 1),
(29, 'Skylab 3', 1973, 1973, 1),
(30, 'Skylab 4', 1973, 1974, 1);

-- insert missions
INSERT INTO mission (ID, name, launch, commanderid, programid, spacecraftid) 
VALUES 
(1, 'MR-3', '1961-05-05', 6, 1, 1),
(2, 'MR-4', '1961-07-21', 4, 1, 2),
(3, 'MA-6', '1962-02-20', 3, 1, 3),
(4, 'MA-7', '1962-05-24', 1, 1, 4),
(5, 'MA-8', '1962-10-03', 5, 1, 5),
(6, 'MA-9', '1963-05-15', 2, 1, 6),
(7, 'Gemini 3', '1965-03-23', 4, 2, 7),
(8, 'Gemini IV', '1965-06-03', 7, 2, 8),
(9, 'Gemini V', '1965-08-21', 2, 2, 9),
(10, 'Gemini VII', '1965-03-23', 8, 2, 10),
(11, 'Gemini VI', '1965-12-15', 5, 2, 11),
(12, 'Gemini VIII', '1966-03-16', 9, 2, 12),
(13, 'Gemini IX', '1966-06-03', 10, 2, 13),
(14, 'Gemini X', '1966-07-18', 11, 2, 14),
(15, 'Gemini XI', '1966-09-12', 12, 2, 15),
(16, 'Gemini XII', '1966-11-11', 13, 2, 16),
(17, 'Apollo 7', '1968-10-11', 5, 3, 17),
(18, 'Apollo 8', '1968-12-21', 8, 3, 18),
(19, 'Apollo 9', '1969-03-03', 7, 3, 19),
(20, 'Apollo 10', '1969-05-18', 10, 3, 20),
(21, 'Apollo 11', '1969-07-16', 9, 3, 21),
(22, 'Apollo 12', '1969-11-14', 12, 3, 22),
(23, 'Apollo 13', '1970-04-11', 13, 3, 23),
(24, 'Apollo 14', '1971-01-31', 6, 3, 24),
(25, 'Apollo 15', '1971-07-26', 14, 3, 25),
(26, 'Apollo 16', '1972-04-16', 11, 3, 26),
(27, 'Apollo 17', '1972-12-07', 15, 3, 27),
(28, 'SLM-1', '1973-05-25', 12, 4, 28),
(29, 'SLM-2', '1973-07-28', 16, 4, 29),
(30, 'SLM-3', '1973-11-16', 17, 4, 30);

-- CREATE USER space_user@localhost IDENTIFIED BY 'sesame';
-- GRANT SELECT, INSERT, DELETE, UPDATE ON space.* TO space_user@localhost;