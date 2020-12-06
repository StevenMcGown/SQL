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
 
 
/* Constraints on Attributes and Tuples */
// e.g. Studio(name,address, presC#)
// Express the Not-null constraint for the attribute president number (presC#)

CREATE TABLE Studio (
    name VARCHAR(30) PRIMARY KEY,
    address VARCHAR(255),
    presC# INT REFERENCES MovieExec(cert#) NOT NULL,
);

//Consequences: You cannot insert a tupe into studio by specifying only the name and address, as the
//inserted tuple coud have NULL in the presC# component
// We could not use the set-null policy to fix foreign key violations

/* Attribute-based CHECK constraints */
// e.g. 1) Suppose we require presC# to be at least 5 digits

CREATE TABLE Studio (
    ...
    presC# INT REFERENCES MovieExec(cert#)
        CHECK(presC# >= 10000) //10000 is the lowest 5 digit number
);

// e.g. 2) Suppose we expect the gender attribute to contain one of the characters 'M' or 'F'
CREATE TABLE MovieStar(
    ...
    gender CHAR(1)
        CHECK (gender IN('F','M')) // everytime a tuple gers a new value for the gender attribute, the
                                   // attribute based CHECK is evaluated
);
               
/* Tuple based CHECK constraints */
               
               
