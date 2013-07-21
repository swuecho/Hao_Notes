## Joins

## Natural Joins

Standard Joins return all data, even multiple occurences of the same column. A natural 
join simply eliminates those multiple occurances so only one of eah column is returned.

How does it do this? The answer is it does not -- you do it. A natural join is a join
in which you select only columns that are required. This is typically done using a wildcard
(SELECT * ) for one table and explict subsets of the columns for all other tables.



## Outer Joins

Most Joins relate rows in one table with rows in another. But occasionally, you
want to include rows that have no related rows. For example, you might use joins 
to accomplish the following tasks:
