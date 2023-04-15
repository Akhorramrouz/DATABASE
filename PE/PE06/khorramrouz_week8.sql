
-- Author: Khorramrouz, Adel
-- Date: 03/19/2023
-- Description: Create the database and tables for the Week 8(PE06) assignment
-- ISTE 608
-- Spring 2023

-- To makesure that the database is not created before
DROP DATABASE IF EXISTS KHorramrouz_PE06;
-- Create the database
CREATE DATABASE KHorramrouz_PE06;
-- Use the database
USE KHorramrouz_PE06;


-- being NULL/NOT NULL is not mentioned in the PE06 assignment
-- data types are not mentioned in the PE06 assignment

-- Create the Customer table
CREATE TABLE Customer (
  CustID CHAR(10) PRIMARY KEY,
  CustName VARCHAR(255) ,
  CustContact VARCHAR(255)
);

-- Create the Product table
CREATE TABLE Product (
  ProdID CHAR(10) PRIMARY KEY,
  ProdDescription VARCHAR(255),
  UnitPrice DECIMAL(10,2)
);

-- Create the PO_Detail table
CREATE TABLE PO_Detail (
  PO INT PRIMARY KEY,
  CustID CHAR(10),
  ProductID CHAR(10),
  Quantity INT,
  CONSTRAINT custID_Customer_fk FOREIGN KEY (CustID) REFERENCES Customer(CustID),
  CONSTRAINT prodID_Product_fk FOREIGN KEY (ProductID) REFERENCES Product(ProdID)
);


-- Create the PO table
CREATE TABLE PO (
  PO INT PRIMARY KEY,
  OrderDate DATE,
  BillToAddress VARCHAR(255),
  ShipToAddress VARCHAR(255),
  CONSTRAINT PO_PO_Detail_fk FOREIGN KEY (PO) REFERENCES PO_Detail(PO)
);

-- Create the Paid_PO table
CREATE TABLE Paid_PO (
  PO INT,
  Date DATE,
  Amount DECIMAL(10,2),
  PRIMARY KEY (PO, Date),
  CONSTRAINT PO_Paid_PO_fk FOREIGN KEY (PO) REFERENCES PO_Detail(PO)
);