# Week 3 - Database

USE college;


DROP TABLE IF EXISTS ta;
CREATE TABLE ta(
    taid SMALLINT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY,
    lastName varchar(20) NOT NULL,
    firstName varchar(20),
    departmentID varchar(4) NOT NULL COMMENT "WILL BE FK CONNECTING TO DEPARTMENTS TABLE",
    CONSTRAINT ta_departments FOREIGN KEY (departmentID) REFERENCES departments(departmentID)
);

INSERT INTO ta(lastName,firstName,departmentID) values("Burns","Jeff","500");

INSERT INTO ta(lastName,firstName,departmentID) values("Wilcox","Dawn","2000");
 
INSERT INTO ta(lastName,firstName,departmentID) values("Desai","Veedhi","4002");

INSERT INTO ta(lastName,firstName,departmentID) values("Sturm","Isabella","4002");

INSERT INTO ta(lastName,firstName,departmentID) values("Wilcox","Kim","4003");
 
SELECT * FROM ta ORDER by lastname,firstname;

SELECT * FROM ta JOIN departments USING(departmentID);
         
         

