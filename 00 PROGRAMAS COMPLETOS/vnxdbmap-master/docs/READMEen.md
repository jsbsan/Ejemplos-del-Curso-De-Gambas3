Vnxdbmap: Database Mapper to Code
===============================================

Mini framework, which generates the database code for Gambas development.

Creates the entity-relationship code of each table and view in two layers of data access,
The "DAO" classes of the data layer and the "VO" classes of the application layer.
The software is originally in: http://mapbdvistas.blogspot.com.es/

About the generated DAO/VO code
---------------------------------

This generated code is the entity-relationship representation, defined in two layers,
one closer to database (DAO) and one closer to the application (VO).

* *VO classes* abstracts or represents the contents of the database elements.
* *DAO classes* to create, update, delete and get data in the database.

The closest equivalent is the combination of Java Bean Classes and Hibernate, this is similar.

Use and operation
--------------------

Requires to have the software Gambas of the series or release 3 and Linux preferably.
Simple, install the program or download the executable, when you boot the database schema,
This one after analyzing it, will generate the source code in a new Gambas project.

If you prefer the latest fashion, you can compile it from the git:

`Git clone https: // github.com / venenux / vnxdbmap.git`

Once cloned the repository open it with the Gambas IDE and execute it.

HISTORY
=======

Julio Sánchez Berro is the creator, the program is here because some limitations 
and development had been staled, now Extend its functionality cos the 
program assumed sqlite databases with specific characteristics.
It said was the program that took more time to develop in prawns. It came about when creating 
applications that used databases with several tables, generated many lines of code very similar 
and therefore a lot of work to "code" and type everything, changes in the tables
(Name of fields, increase or decrease the number of fields), generated a very tedious work of
Checking and reviewing the code to adapt it to the new conditions of the tables.

Then created a program that was able to read the database and generate the code to be 
able to manipulate records of the tables and views. Thus, if there were a change in the database, 
simply by using the program again, it would generate the "new" code, which would 
simply have to be replaced by the old one in the program that we were doing

Time later had too many limitations, it did not support SQL 2000 data types, definitions
should ve a new line at the scheme definition, and additional each field could not have comments 
also does not support initial values.
So I continued the development for instead of just supporting SQLite, trying to support any
database, especially ODBC and PostgreSQL which will lead the program to true usefulness,
This because SQLite is a small DB system, and support was required for large DBMS with scalar capabilites.
