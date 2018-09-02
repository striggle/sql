-- create and select the database
DROP DATABASE IF EXISTS prs;
CREATE DATABASE prs;
USE prs;

-- create the user table
CREATE TABLE user (
  ID                 INT                PRIMARY KEY   auto_increment,
  username           VARCHAR(20)        NOT NULL      unique,
  password           VARCHAR(10)        NOT NULL,
  firstname          varchar(20)        NOT NULL,
  lastname           varchar(20)        not null,
  phonenumber        varchar(12)        not null,
  email              varchar(75)        not null,
  isreviewer         tinyint(1)         not null,     
  isadmin            tinyint(1)         not null,
  isactive           tinyint(1)         not null      default 1,
  datecreated        datetime           not null      default current_timestamp,
  dateupdated        datetime           not null      default current_timestamp on update current_timestamp,
  updatedbyuser      int                not null      default 1
);

-- create the vendor table
CREATE TABLE vendor (
  ID                      INT                 PRIMARY KEY   auto_increment,
  code                    VARCHAR(10)         NOT NULL      unique,
  name                    VARCHAR(255)        NOT NULL,
  address                 varchar(255)        NOT NULL,
  city                    varchar(255)        not null,
  state                   varchar(2)          not null,
  zip                     varchar(5)          not null,
  phonenumber             varchar(12)         not null,     
  email                   varchar(100)        not null,
  ispreapproved           tinyint(1)          not null,
  isactive                tinyint(1)          not null      default 1,
  datecreated             datetime            not null      default current_timestamp,
  dateupdated             datetime            not null      default current_timestamp on update current_timestamp ,
  updatedbyuser           int                 not null      default 1
);

-- create the purchaserequest table
CREATE TABLE purchaserequest (
  ID                        INT                 PRIMARY KEY   auto_increment,
  userid                    INT                 NOT NULL,
  description               VARCHAR(100)        NOT NULL,
  justification             VARCHAR(255)        NOT NULL,
  dateneeded                DATE                not null,
  deliverymode              VARCHAR(25)         not null,
  status                    VARCHAR(20)         not null,
  total                     DECIMAL(10,2)       not null,
  submitteddate             DATETIME,     
  reasonforrejection        VARCHAR(100)        not null,
  isactive                  TINYINT(1)          not null      default 1,
  datecreated               DATETIME            not null      default current_timestamp,
  dateupdated               DATETIME            not null      default current_timestamp on update current_timestamp ,
  updatedbyuser             INT                 not null      default 1,
  foreign key(userid) references user(id)
);

-- create the product table
CREATE TABLE product (
  ID                        INT                      PRIMARY KEY   auto_increment,
  vendorid                  INT                      NOT NULL,
  partnumber                VARCHAR(50)              NOT NULL,
  name                      VARCHAR(150)             NOT NULL,
  price                     DECIMAL(10,2)            not null,
  unit                      VARCHAR(255),
  photopath                 VARCHAR(255),
  isactive                  TINYINT(1)               not null      default 1,
  datecreated               DATETIME                 not null      default current_timestamp,
  dateupdated               DATETIME                 not null      default current_timestamp on update current_timestamp ,
  updatedbyuser             INT                      not null      default 1,
  foreign key(vendorid) references vendor(id),
  CONSTRAINT vendor_part unique (VendorID, PartNumber)

);

-- create the purchaserequestlineitem table
CREATE TABLE purchaserequestlineitem (
  ID                        INT                      PRIMARY KEY   auto_increment,
  purchaserequestid         INT                      NOT NULL,
  productid                 INT                      NOT NULL,
  quantity                  INT                      NOT NULL,
  isactive                  TINYINT(1)               not null      default 1,
  datecreated               DATETIME                 not null      default current_timestamp,
  dateupdated               DATETIME                 not null      default current_timestamp on update current_timestamp ,
  updatedbyuser             INT                      not null      default 1,
  foreign key(purchaserequestid) references purchaserequest(id),
  foreign key(productid) references product(id),
  CONSTRAINT req_pdt unique (PurchaseRequestID, ProductID)

);



INSERT INTO user (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin) VALUES 
(1,'SYSTEM','xxxxx','System','System','XXX-XXX-XXXX','system@test.com',1,1),
(2,'sblessing','login','Sean','Blessing','513-600-7096','sean@blessingtechnology.com',1,1);

-- insert vendors
INSERT INTO `vendor` (ID, Code, Name, Address, City, State, Zip, PhoneNumber, Email, isPreApproved) 
VALUES 
(1,'BB-1001','Best Buy','100 Best Buy Street','Louisville','KY','40207','502-111-9099','geeksquad@bestbuy.com',1),
(2,'AP-1001','Apple Inc','1 Infinite Loop','Cupertino','CA','95014','800-123-4567','genius@apple.com',1),
(3,'AM-1001','Amazon','410 Terry Ave. North','Seattle','WA','98109','206-266-1000','amazon@amazon.com',0),
(4,'ST-1001','Staples','9550 Mason Montgomery Rd','Mason','OH','45040','513-754-0235','support@orders.staples.com',0),
(5,'MC-1001','Micro Center','11755 Mosteller Rd','Sharonville','OH','45241','513-782-8500','support@microcenter.com',0);

-- insert base products
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (1,1,'ME280LL','iPad Mini 2',296.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (2,2,'ME280LL','iPad Mini 2',299.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (3,3,'105810','Hammermill Paper, Premium Multi-Purpose Paper Poly Wrap',8.99,'1 Ream / 500 Sheets',NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (4,4,'122374','HammerMill® Copy Plus Copy Paper, 8 1/2\" x 11\", Case',29.99,'1 Case, 10 Reams, 500 Sheets per ream',NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (5,4,'784551','Logitech M325 Wireless Optical Mouse, Ambidextrous, Black ',14.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (6,4,'382955','Staples Mouse Pad, Black',2.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (7,4,'2122178','AOC 24-Inch Class LED Monitor',99.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (8,4,'2460649','Laptop HP Notebook 15-AY163NR',529.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (9,4,'2256788','Laptop Dell i3552-3240BLK 15.6\"',239.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (10,4,'IM12M9520','Laptop Acer Acer™ Aspire One Cloudbook 14\"',224.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (11,4,'940600','Canon imageCLASS Copier (D530)',99.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (12,5,'228148','Acer Aspire ATC-780A-UR12 Desktop Computer',399.99,'','/images/AcerAspireDesktop.jpg');
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (13,5,'279364','Lenovo IdeaCentre All-In-One Desktop',349.99,'','/images/LenovoIdeaCenter.jpg');



-- create a user and grant privileges to that user
-- GRANT SELECT, INSERT, DELETE, UPDATE
-- ON mma.*
-- TO mma_user@localhost
-- IDENTIFIED BY 'sesame';