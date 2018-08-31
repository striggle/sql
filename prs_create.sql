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
  isactive           tinyint(1)         not null  default 1,
  datecreated        datetime           not null  default current_timestamp,
  dateupdated        datetime           not null  default current_timestamp on update current_timestamp,
  updatedbyuser      int                not null  default 1
);

-- create the vendor table
CREATE TABLE vendor (
  ID                      INT                 PRIMARY KEY   auto_increment,
  code                    VARCHAR(10)         NOT NULL      unique,
  name                    VARCHAR(255)        NOT NULL,
  address                  varchar(255)        NOT NULL,
  city                    varchar(255)        not null,
  state                   varchar(2)          not null,
  zip                     varchar(5)          not null,
  phonenumber             varchar(12)         not null,     
  email                   varchar(100)        not null,
  ispreapproved           tinyint(1)          not null,
  isactive                tinyint(1)          not null  default 1,
  datecreated             datetime            not null  default current_timestamp,
  dateupdated             datetime            not null  default current_timestamp on update current_timestamp ,
  updatedbyuser           int                 not null  default 1
);

-- create the purchaserequest table
CREATE TABLE purchaserequest (
  ID                        INT                 PRIMARY KEY   auto_increment,
  userid                    int                 NOT NULL,
  description               VARCHAR(100)        NOT NULL,
  justification             varchar(255)        NOT NULL,
  dateneeded                date                not null,
  deliverymode              varchar(25)         not null,
  status                    varchar(20)         not null,
  total                     decimal(10,2)       not null,
  submitteddate             datetime,     
  reasonforrejection        varchar(100)        not null,
  isactive                  tinyint(1)          not null  default 1,
  datecreated               datetime            not null  default current_timestamp,
  dateupdated               datetime            not null  default current_timestamp on update current_timestamp ,
  updatedbyuser             int                 not null  default 1,
  foreign key(userid) references user(id)
);

-- create the product table
CREATE TABLE product (
  ID                        INT                      PRIMARY KEY   auto_increment,
  vendorid                  int                      NOT NULL,
  partnumber                VARCHAR(50)              NOT NULL,
  name                      varchar(150)             NOT NULL,
  price                     decimal(10,2)            not null,
  unit                      varchar(255),
  photopath                 varchar(255),
  isactive                  tinyint(1)               not null  default 1,
  datecreated               datetime                 not null  default current_timestamp,
  dateupdated               datetime                 not null  default current_timestamp on update current_timestamp ,
  updatedbyuser             int                      not null  default 1,
  foreign key(vendorid) references vendor(id),
  CONSTRAINT vendor_part unique (VendorID, PartNumber)

);

-- create the purchaserequestlineitem table
CREATE TABLE purchaserequestlineitem (
  ID                        INT                      PRIMARY KEY   auto_increment,
  purchaserequestid         int                      NOT NULL,
  productid                 int                      NOT NULL,
  quantity                  int                      NOT NULL,
  isactive                  tinyint(1)               not null  default 1,
  datecreated               datetime                 not null  default current_timestamp,
  dateupdated               datetime                 not null  default current_timestamp on update current_timestamp ,
  updatedbyuser             int                      not null  default 1,
  foreign key(purchaserequestid) references purchaserequest(id),
  foreign key(productid) references product(id),
  CONSTRAINT req_pdt unique (PurchaseRequestID, ProductID)

);



-- insert some rows into the user table
INSERT INTO user (id, username, password, firstname, lastname, phonenumber, email, isreviewer, isadmin) VALUES
(1, 'davet', 'wendys', 'dave', 'thomas', '513-654-9875', 'davet@gmail.com', 1, 1),
(2, 'tigerw', 'golf', 'tiger', 'woods', '513-321-9712', 'tigerw@gmail.com', 1, 1);


-- insert some rows into the vendor table
INSERT INTO vendor (id, code, name, address, city, state, zip, phonenumber, email, ispreapproved) VALUES
(1, 'fries', 'potatoefarmer', '123 main st', 'hamilton', 'oh', '45011', '465-987-9621', 'potatoefarmer@gmail.com', 1),
(2, 'clubs', 'clubmaker', '452 green st', 'dallas', 'tx', '32645', '967-522-6451', 'clubmaker@gmail.com', 1);


-- insert some rows into the product table
INSERT INTO product (id, vendorid, partnumber, name, price) VALUES
(1, 1, 'fry123', 'frenchfry', '21.35'),
(2, 2, 'clubs789', 'golfclub', '99.87');


-- create a user and grant privileges to that user
GRANT SELECT, INSERT, DELETE, UPDATE
ON mma.*
TO mma_user@localhost
IDENTIFIED BY 'sesame';