USE jobs;

-- ADEL KHorramrouz
-- HW5
-- ISTE 608
-- ak8480@rit.edu



-- q1
SELECT companyName,division,listing FROM interview
WHERE listing = 'y'
UNION
SELECT companyName,division,listing FROM interview
WHERE listing = 'n';


-- q2
SELECT companyname, division, statecode FROM employer
INNER JOIN interview USING(companyname,division);

-- q3
SELECT * FROM state
WHERE stateCode NOT IN (
SELECT stateCode FROM state JOIN employer USING(stateCode)
);

-- q4
SELECT location, qtrCode FROM quarter;

-- q5
SELECT * FROM quarter
WHERE qtrCode in("20201","20204");

-- q6
SELECT companyname, statecode,description FROM employer
JOIN state USING(statecode);

-- q7
SELECT description, companyname
FROM state
LEFT OUTER JOIN employer USING(statecode);