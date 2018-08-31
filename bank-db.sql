-- create and select the database
DROP DATABASE IF EXISTS bank_db;
CREATE DATABASE bank_db;
USE bank_db;

-- create the Product table
CREATE TABLE accounts (
  ID                       INT            PRIMARY KEY  AUTO_INCREMENT,
  account_holder           VARCHAR(20)    NOT NULL,
  balance                  decimal(10,2)  NOT NULL,
  fees                     DECIMAL(10,2)  NOT NULL
);

CREATE TABLE transactions (
  ID                       INT             PRIMARY KEY  AUTO_INCREMENT,
  amount                   decimal(10,2)   NOT NULL,
  txn_type                 varchar(20)     NOT NULL,
  account_id			   int             NOT NULL, 
  foreign key(account_id) references accounts(id)
);
-- insert some rows into the Product table
INSERT INTO accounts values
(1, 'Rachael Baumann', '8888.00', '250.00'),
(2, 'Michael Page', '5444.00', '175.00'),
(3, 'Angie Snyder', '3333.00', '88.00'),
(4, 'Robert Mahoney', '3322.00', '88.00');

INSERT INTO transactions values
(1, '500.00', 'deposit', '3'),
(2, '-200.00', 'withdraw', '4'),
(3, '200.00', 'deposit', '4'),
(4, '248.00', 'deposit', '1');
-- create a user and grant privileges to that user
GRANT SELECT, INSERT, DELETE, UPDATE
ON bank_db.*
TO bank_db_user@localhost
IDENTIFIED BY 'sesame';