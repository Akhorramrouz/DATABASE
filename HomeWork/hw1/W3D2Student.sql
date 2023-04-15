# Week 3 - Database

USE college;

INSERT INTO departments values ("2000","BUS - HR");
INSERT INTO departments values ("500","Physician Assistant");


DROP TABLE IF EXISTS student;
CREATE TABLE student(
studentID varchar(9),
lastName varchar(20) NOT NULL,
firstName varchar(20),
homeAddress varchar(30),
collegeAddress varchar(30),
advisorID char(9) COMMENT "WILL BE FK CONNECTING TO ADVISOR TABLE",
departmentID varchar(4) NOT NULL COMMENT "WILL BE FK CONNECTING TO MAJOR TABLE",
CONSTRAINT chk_deptID CHECK (departmentID <> '0000'),
graduated tinyint(1) unsigned DEFAULT 0 NOT NULL,
CONSTRAINT studentIDPK PRIMARY KEY(studentID),
CONSTRAINT fk_advisorID FOREIGN KEY (advisorID) REFERENCES advisor(employeeID),
CONSTRAINT fk_departmentID FOREIGN KEY (departmentID) REFERENCES departments(departmentID)
);

INSERT INTO student values
("123123123","Burns","Jeff","8015 Arlington, Plymouth, MI", "Haffey Hall Apt 503",
 "345678901","500",1);

INSERT INTO student values
("987654321","Wilcox","Dawn","31 Captiva, Rochester, NY", "Haffey Hall Apt 301",
 "012345678","2000",0);
 
INSERT INTO student values
("233333333","French","Bryan","3243 Main, Avon, NY", "Haffey Hall Apt 503",
 "345678901","500",1);

INSERT INTO student values
("120050789","Floeser","Michael","2 Main, Honeoy,Falls NY", "Brigs Hall Apt 503",
 "012345678","4002",0);


INSERT INTO student values
("987659009","Smith","Dawn","202 South St., Rochester, NY", "Haffey Hall Apt 301",
 "012345678","2000",0);

INSERT INTO student values
("133333330","Miller","Guy","32 Oak St., Plymouth, MI", "Haffey Hall Apt 503",
 "345678901","500",1);

INSERT INTO student values
("987220220","Wilcox","Kim","2299 West Main, Rochester, NY", "Haffey Hall Apt 301",
 "012345678","4002",0);
 
 INSERT INTO student values
("121212121","Habermas","Jim","32 Main, Plymouth, MI", "Haffey Hall Apt 503",
 "234567890","4003",1);

SELECT TABLE_SCHEMA, TABLE_NAME, CONSTRAINT_NAME,  COLUMN_NAME
    FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
     WHERE REFERENCED_TABLE_SCHEMA IS NOT NULL
         ORDER BY TABLE_SCHEMA DESC, TABLE_NAME;
         
         

