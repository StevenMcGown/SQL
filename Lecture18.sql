// CONSTRAINTS ON RELATIONS
CREATE TABLE <relation> (
    title VARCHAR(100),
    year 2010,
    ...
    PRIMARY KEY(title, year)
);

ALTER TABLE Movies ADD PRIMARY KEY(title, year);

// REFERENTIAL INTEGRITY CONSTRAINT
/* asserts that the calue appearing in 1 context also appears in another rleated context */

//FOREIGN KEY
/* acts as a cross reference between 2 relations because it references the primary key of another relation, thus establishes a link between them. */

e.g. A(P,Q,F) B(G,R)
2nd relation -> referenced attributes -> PRIMARY KEY OR UNIQUE

CREATE TABLE Studio(    //
    name VARCHAR(30),
    address VARCHAR(255),
    presC# INT REFERENCES MovieEXEC(cert#)
);

CREATE TABLE Studio (   // If multiple attributes make up  the foreign key, use this method
    name VARCHAR(100).
    ...
    presC# INT,
    FOREIGN KEY(presC#) REFERENCES MovieExec(cert#)
);

// add foreign key to an existing relation
ALTER TABLE Studio ADD FOREIGN KEY(presC#) 
    REFERENCES MovieExec(cert#);
    
// So whenever a value appears in presC# component of a studio tuple, that value must also appear in cert# of some MovieExec tuple.
// Only 1 exception, if the value of presC# is NULL for a tuple in Studio, there is no requirement that NULL appears as the value of a cert# component.
