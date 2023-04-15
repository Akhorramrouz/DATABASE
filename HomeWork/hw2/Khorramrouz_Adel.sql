-- Khorramrouz, Adel
-- ISTE 608
-- ak8480@rit.edu

CREATE DATABASE HW2;
USE HW2;

CREATE TABLE ITEM(
itemID VARCHAR(25),
itemName VARCHAR(25),
name VARCHAR(25),
street VARCHAR(25),
city VARCHAR(25),
state CHAR(2),
zipcode VARCHAR(10),
cost DECIMAL(7,2),
retailPrice DECIMAL(7,2),
colors VARCHAR(25),
notes VARCHAR(255),
profit DECIMAL(7,2),
shelfQty SMALLINT UNSIGNED,
perishable BOOL,
returnable BOOL,
description MEDIUMTEXT);