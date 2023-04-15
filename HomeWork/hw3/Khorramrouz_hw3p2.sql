-- Adel Khorramrouz
-- ISTE 608
-- HW3, Part 2

USE conman;

-- q1
INSERT INTO contactinfo VALUES
(3,"Eli","T","Wallowby","etwallowby@concor.com","http://www.concor.com/~wallowby","1956-03-26","All meetings must be scheduled through his assistant."),
(4,"Eve","C","Sampson","esampson@concor.com",NULL,"1972-05-11","Very helpful."),
(5,"Carson","B","Campbell","cbc232@mvch.org",NULL,"1955-01-05","Wife: Lisa Kids: Lucas, Lucy, and Lucinda."),
(6,"Adel",NULL,"Khorramrouz","ak8480@rit.edu",NULL,"1999-05-13",NULL);


-- q2
ALTER TABLE contactinfo
ADD COLUMN nickname VARCHAR(20) DEFAULT "To Be Determined";

-- q3
ALTER TABLE contactinfo MODIFY firstName VARCHAR(15) NOT NULL;
ALTER TABLE contactinfo MODIFY lastName VARCHAR(25) NOT NULL;

-- q4
UPDATE contactinfo
SET nickname = "DAVE"
WHERE lastName = "Munson";

-- q5
DELETE FROM contactinfo WHERE url = "www.concor.com/~wallowby";