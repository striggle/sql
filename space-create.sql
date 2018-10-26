-- create and select the database
DROP DATABASE IF EXISTS space;
CREATE DATABASE space;
USE space;

-- create the commander table
CREATE TABLE commander (
  ID                 int                PRIMARY KEY   auto_increment,
  firstname          varchar(20)        NOT NULL,
  lastname           varchar(20)        not null,
  birthday           datetime           not null,
  nationality        varchar(20)        not null
);

-- create the program table
CREATE TABLE program (
  ID                      int                 PRIMARY KEY   auto_increment,
  name                    varchar(50)         NOT NULL,
  startyear               int                 NOT NULL,
  endyear                 int                 not null,
  flights                 int                 not null
);

-- create the spacecraft table
CREATE TABLE spacecraft (
  ID                        INT                 PRIMARY KEY   auto_increment,
  type                      VARCHAR(50)         NOT NULL,
  country                   VARCHAR(50)         NOT NULL,
  debut                     int                 not null,
  retirement                int                 not null,
  flights                   int                 not null
);

-- create the mission table
CREATE TABLE mission (
  ID                          INT                      PRIMARY KEY   auto_increment,
  name                        varchar(50)              not null,
  launch                      datetime                 not null,
  return                      datetime                 not null,
  commanderid                 INT                      NOT NULL,
  programid                   int                      NOT NULL,
  spacecraftid                int                      NOT NULL
  foreign key(commanderid) references commander(id),
  foreign key(programid) references program(id),
  foreign key(spacecraftid) references spacecraft(id)
);

-- insert commanders
INSERT INTO commander (ID, firstname, lastname, birthday, nationality) VALUES 
(1,'SYSTEM','xxxxx','System','System','XXX-XXX-XXXX','system@test.com',1,1),
(2,'sblessing','login','Sean','Blessing','513-600-7096','sean@blessingtechnology.com',1,1);

-- insert programs
INSERT INTO program (ID, name, startyear, endyear, flights) 
VALUES 
(1,'BB-1001','Best Buy','100 Best Buy Street','Louisville','KY','40207','502-111-9099','geeksquad@bestbuy.com',1),
(2,'AP-1001','Apple Inc','1 Infinite Loop','Cupertino','CA','95014','800-123-4567','genius@apple.com',1),
(3,'AM-1001','Amazon','410 Terry Ave. North','Seattle','WA','98109','206-266-1000','amazon@amazon.com',0),
(4,'ST-1001','Staples','9550 Mason Montgomery Rd','Mason','OH','45040','513-754-0235','support@orders.staples.com',0),
(5,'MC-1001','Micro Center','11755 Mosteller Rd','Sharonville','OH','45241','513-782-8500','support@microcenter.com',0);

-- insert spacecrafts
INSERT INTO spacecraft (ID, type, debut, retirement, flights) 
VALUES 
(1,'BB-1001','Best Buy','100 Best Buy Street','Louisville','KY','40207','502-111-9099','geeksquad@bestbuy.com',1),
(2,'AP-1001','Apple Inc','1 Infinite Loop','Cupertino','CA','95014','800-123-4567','genius@apple.com',1),
(3,'AM-1001','Amazon','410 Terry Ave. North','Seattle','WA','98109','206-266-1000','amazon@amazon.com',0),
(4,'ST-1001','Staples','9550 Mason Montgomery Rd','Mason','OH','45040','513-754-0235','support@orders.staples.com',0),
(5,'MC-1001','Micro Center','11755 Mosteller Rd','Sharonville','OH','45241','513-782-8500','support@microcenter.com',0);

-- insert missions
INSERT INTO mission (ID, name, launch, return, commanderid, programid, spacecraftid) 
VALUES 
(1,'BB-1001','Best Buy','100 Best Buy Street','Louisville','KY','40207','502-111-9099','geeksquad@bestbuy.com',1),
(2,'AP-1001','Apple Inc','1 Infinite Loop','Cupertino','CA','95014','800-123-4567','genius@apple.com',1),
(3,'AM-1001','Amazon','410 Terry Ave. North','Seattle','WA','98109','206-266-1000','amazon@amazon.com',0),
(4,'ST-1001','Staples','9550 Mason Montgomery Rd','Mason','OH','45040','513-754-0235','support@orders.staples.com',0),
(5,'MC-1001','Micro Center','11755 Mosteller Rd','Sharonville','OH','45241','513-782-8500','support@microcenter.com',0);

CREATE USER space_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON space.* TO space_user@localhost;