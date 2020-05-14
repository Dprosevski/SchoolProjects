/*
edit order:
species
company
employee
forest manager
contact person
data collector
forest
tree
measurement

drop table Measurement
drop table Tree
drop table Species
drop table Forest
drop table DataCollector
drop table ForestManager
drop table ContactPerson
drop table Employee
drop table Company


select * from Measurement
select * from Tree
select * from Species
select * from Forest
select * from DataCollector
select * from ForestManager
select * from ContactPerson
select * from Employee
select * from Company
*/


--test1
select * from Employee, DataCollector, Measurement
where Employee.employeeCode = DataCollector.employeeCode
and Employee.employeeCode = Measurement.employeeCode
and Employee.name = 'Dimitrije';

--test2
Select * from Measurement, Employee, DataCollector where Employee.employeeCode = 'EMP1012'
and Employee.employeeCode =  Measurement.employeeCode
and DataCollector.employeeCode =  Measurement.employeeCode


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
SELECT * FROM Company;
SELECT * FROM Employee;
SELECT * FROM DataCollector;
SELECT * FROM ContactPerson;
SELECT * FROM ForestManager;


