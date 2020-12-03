/* Enforcing a foreign key constraint with policies */

CREATE TABLE Studio (
  name VARCHAR(30) PRIMARY KEY,
  address VARCHAR(255),
  presC# INT REFERENCES MovieExec(cert#),
  ON UPDATE CASCADE,
  ON DELETE SET NULL
);

INSERT INTO Studio 
VALUES ('ABC','NewYork',1234); //CAUSES AN ERROR, VIOLATION OF FOREIGN KEY CONSTRAINT

//Possible Fixes:

//FIX #1:
//Step 1:
INSERT INTO Studio (name,address)
VALUES ('ABC','NewYork',1234);

//Step 2:
INSERT INTO MovieExec VALUES ('_','_',1234,5000000)

//Step 3:
UPDATE Studio
SET presC# = 1234
WHERE name = 'ABC';

//FIX #2
//Step 1:
INSERT INTO MovieExec VALUES ()
