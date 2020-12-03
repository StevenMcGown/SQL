// SUBQUERIES IN THE FROM CLAUSE
/* E.g. Find all producer names of movies where 'Robert Downy Jr.' has played a role in? */

SELECT name
FROM MovieExec, (SELECT producerC#
                 FROM Movies, StarsIn
                 WHERE starName - 'Robert Downey Jr.'
                 AND Movies.title = StarsIn.title
                 AND Movies.year = StarsIn.year)Prod //named prod
WHERE cert# = Prod.producerC#;

//ORDER BY IN THE FROM CLAUSE
/* Find all movies produced by Dreamworks in the year 2007. List the shortest length movie first and break ties by the alphabetical ordering of movie names. */

SELECT *
FROM Movies
WHERE studioName = 'Dreamworks' AND year = 2007
ORDER BY length, title ASC;

/* Order the tuples of R(A,B) by the sum of the 2 components in descending order. */

SELECT *
FROM R
ORDER BY A+B DESC; 

SELECT *
FROM R
ORDER BY A,B ASC; //ascending order

SELECT *
FROM R
ORDER BY A,B DESC; //descending order

SELECT *
FROM R
ORDER BY A ASC, B DESC; //a in ascending order, b in descending order

//HAVING CLAUSE
/* Find the sum of lengths of all movies for each producer with a networth of more than 10 million USD. List only the producers who made a film prior to 1990. */

SELECT name, SUM(length) AS totalDuration
FROM Movies, MovieExec
WHERE producerC# = cert# AND netWorth > 10000000
GROUP BY name
HAVING MIN(year) < 1990;
