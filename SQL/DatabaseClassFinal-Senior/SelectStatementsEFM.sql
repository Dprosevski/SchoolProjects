--DROP AND SELECT STATEMENTS

DROP TABLE Measurement;
DROP TABLE Tree;
DROP TABLE Species;
DROP TABLE Forest;
DROP TABLE DataCollector;
DROP TABLE ForestManager;
DROP TABLE ContactPerson;
DROP TABLE Employee;
DROP TABLE Company;


SELECT * FROM Measurement;
SELECT * FROM Tree;
SELECT * FROM Species;
SELECT * FROM Forest;
SELECT * FROM DataCollector;
SELECT * FROM ForestManager;
SELECT * FROM ContactPerson;
SELECT * FROM Employee;
SELECT * FROM Company;


measurementNum treeNum location SpeciesCode forestCode employeeCode measurementDate measurementHeight
-------------- ------- -------- ----------- ---------- ------------ --------------- -----------------
20             391     5W7S     MP          SS         NA           2015-02-01      31
20             850     4W6N     PN          NS         EMP1014      2017-03-01      46
21             836     3E5N     MP          IF         NA           2015-03-01      33
22             837     2W5N     MP          NS         NA           2014-03-01      31
30             728     5W7S     OK          IF         NA           2015-03-01      35
33             836     3E5N     MP          IF         NA           2016-02-01      38
42             837     2W5N     MP          NS         NA           2016-02-01      33
43             859     4W6N     MP          SS         EMP1010      2018-03-01      51
44             391     5W7S     MP          SS         NA           2016-02-01      29
44             859     2W5N     MP          IF         EMP1011      NULL            NULL
45             191     5W7S     MP          SS         EMP1010      2016-02-01      35
46             837     2W5N     MP          NS         NA           2018-02-01      46
54             836     2W5N     PN          NS         EMP1011      2017-03-01      36
54             836     3E5N     MP          IF         NA           2017-03-01      40
54             836     3E5N     PN          NS         EMP2025      2017-03-01      36
57             859     4W6N     PN          NS         EMP1015      2017-04-01      42
77             728     5W7S     OK          IF         EMP1014      2017-03-01      40
80             728     5W7S     OK          IF         EMP1015      2017-03-01      40
80             836     3E5N     MP          IF         EMP1014      2018-02-01      42
98             391     5W7S     MP          SS         EMP1010      2018-02-01      39
NA             NA      NA       NA          NA         EMP1012      NULL            NULL
NA             NA      NA       NA          NA         EMP1013      NULL            NULL

(22 rows affected)

treeNum location SpeciesCode forestCode datePlanted
------- -------- ----------- ---------- -----------
191     5W7S     MP          SS         1995-01-01
391     5W7S     MP          SS         1996-01-01
728     5W7S     OK          IF         1996-11-01
836     2W5N     PN          NS         1996-01-01
836     3E5N     MP          IF         1995-12-01
836     3E5N     PN          NS         1995-01-01
837     2W5N     MP          NS         1996-01-01
850     4W6N     PN          NS         1996-02-01
859     2W5N     MP          IF         1996-01-01
859     4W6N     MP          SS         1996-02-01
859     4W6N     PN          NS         1996-02-01
NA      NA       NA          NA         NULL

(12 rows affected)

SpeciesCode maxHeight   name
----------- ----------- --------------------
MP          45          Maple               
NA          NULL        NULL
OK          50          Oak                 
PN          50          Pine                

(4 rows affected)

forestCode companyCode employeeCode size        location name
---------- ----------- ------------ ----------- -------- --------------------
IF         INF         EMP0101      50          Area-311 Indiana Forest      
NA         NA          NA           NULL        NULL     NULL
NS         NSF         EMP0103      50          Area-933 North State Forest  
SS         SSF         EMP0102      75          Area-933 South State Forest  

(4 rows affected)

employeeCode numOfTrees
------------ -----------
EMP1010      3
EMP1011      1
EMP1012      5
EMP1013      NULL
EMP1014      3
EMP1015      2
EMP2025      3
NA           NULL

(8 rows affected)

employeeCode lastDateAccessed
------------ -----------------------
EMP0101      NULL
EMP0102      NULL
EMP0103      NULL
NA           NULL

(4 rows affected)

employeeCode visitDate
------------ -----------------------
EMP0000      NULL
EMP0101      NULL
NA           NULL

(3 rows affected)

employeeCode name                 beginDate  endDate
------------ -------------------- ---------- ----------
EMP0000      Bob Bureaucrat       NULL       NULL
EMP0101      Sam Supervisor       NULL       NULL
EMP0102      Mary Manager         NULL       NULL
EMP0103      Fred Foreman         NULL       NULL
EMP1010      Bill                 2011-02-12 NULL
EMP1011      Joe                  2011-02-12 NULL
EMP1012      Vern                 2011-04-12 2011-12-31
EMP1013      Ann                  2011-04-12 2011-12-31
EMP1014      Mike                 2013-01-01 NULL
EMP1015      Kelly                2013-03-12 NULL
EMP2025      Dimitrije            2001-01-12 NULL
NA           NULL                 NULL       NULL

(12 rows affected)

companyCode name
----------- ------------------------------
INF         Indiana Forest Company        
NA          NULL
NSF         North State Forest Company    
SSF         South State Forest Company    

(4 rows affected)


Completion time: 2019-11-22T11:57:19.2422881-05:00
