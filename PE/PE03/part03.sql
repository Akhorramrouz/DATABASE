CREATE DATABASE PE3;
USE PE3;

-- KHORRAMROUZ ADEL, ak8480@rit.edu
-- DATABASE PE03
-- ISTE 608,
-- FEB 6TH, 2023


CREATE TABLE Automobile(
VIN SMALLINT(5) UNSIGNED ZEROFILL AUTO_INCREMENT PRIMARY KEY,
Make VARCHAR(15),
Model VARCHAR(15),
Year VARCHAR(4),
Color VARCHAR(15),
MSRP DOUBLE,
Style VARCHAR(15));
