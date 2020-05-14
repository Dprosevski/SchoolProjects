--1) What is the largest height observed for Maple?
SELECT MAX(measurementHeight) as 'Maple Max Height'
FROM Measurement
WHERE SpeciesCode = 'MP';


--2) For each tree, list all of its measured heights (along with its tree number) in chronological (date) order.
SELECT DISTINCT Measurement.measurementDate, Tree.treeNum, Measurement.measurementHeight
FROM Measurement, Tree
WHERE Tree.treeNum = Measurement.treeNum;


--3) What forest does NSF company manage?
SELECT Company.companyCode, Forest.forestCode, Forest.name 
FROM Company, Forest
WHERE Company.companyCode = Forest.companyCode
and Company.companyCode = 'NSF';


--4) List the trees that are within 5 feet of their maximum height.
SELECT DISTINCT Tree.treeNum, Measurement.measurementHeight, Species.maxHeight
FROM Measurement, Tree, Species
WHERE Tree.treeNum = Measurement.treeNum
and Species.SpeciesCode = Tree.SpeciesCode
and Species.SpeciesCode = Measurement.SpeciesCode
and measurementHeight >= maxHeight - 5;


--5) List the measurements in the Indiana forest made in 2015 and 2018
SELECT measurementNum, measurementHeight, measurementDate, Forest.name as 'Forest Name'
FROM Measurement, Forest
WHERE Measurement.forestCode = Forest.forestCode
and Forest.name = 'Indiana Forest'
and (YEAR(Measurement.measurementDate) = '2015' or YEAR(Measurement.measurementDate) = '2018')


--6) What companies planted Maples in 1996?
SELECT Forest.companyCode, Species.name, Tree.datePlanted
FROM Tree, Forest, Species
WHERE Forest.forestCode = Tree.forestCode
and Species.SpeciesCode = Tree.SpeciesCode
and (YEAR(Tree.datePlanted) = '1996' and MONTH(Tree.datePlanted) = '01')
and Tree.SpeciesCode = 'MP';


--7) Where is the Indiana Forest located and how big is it?
SELECT forestCode, name, location, size
FROM Forest
WHERE name = 'Indiana forest';


--8) Who (Name and EMP code) manages South State Forest?
SELECT Employee.name as 'Employee name', ForestManager.employeeCode as 'Employee code', Forest.name as 'Forest name'
FROM Forest, ForestManager, Employee
WHERE Forest.employeeCode = ForestManager.employeeCode
and Employee.employeeCode = ForestManager.employeeCode
and Forest.name = 'South State Forest';


--9) Who (Name and EMP code) has access to data about Indiana Forest?
SELECT Employee.name as 'Employee name', Employee.employeeCode as 'Employee code', Forest.name as 'Forest name'
FROM Forest, Employee
WHERE Forest.employeeCode = Employee.employeeCode
and Forest.name = 'Indiana Forest';


--10) How many trees are assigned to each data collector (Name and EMP code)?
SELECT Employee.name as 'Employee name', Employee.employeeCode as 'Employee code', DataCollector.numOfTrees as 'Trees assigned'
FROM Employee, DataCollector
WHERE Employee.employeeCode = DataCollector.employeeCode;


--11) List the measurements made by EMP1015.
SELECT Employee.name as 'Employee name', Employee.employeeCode as 'Employee code', measurementNum, measurementHeight, measurementDate
FROM Employee, DataCollector, Measurement
WHERE Employee.employeeCode = DataCollector.employeeCode
and Employee.employeeCode = Measurement.employeeCode
and Employee.employeeCode = 'EMP1015';


--Universal view
SELECT DISTINCT Species.SpeciesCode, Species.name, Forest.forestCode, Forest.name, Company.companyCode,
	Company.name, Tree.datePlanted, Forest.size, Forest.location, Measurement.measurementHeight, 	Species.maxHeight,
	Measurement.measurementDate, Measurement.measurementNum, Tree.treeNum, Tree.location, 
	Employee.employeeCode, Employee.name, Employee.beginDate, Employee.endDate, DataCollector.numOfTrees
FROM Measurement, Tree, Forest, Species, Company, Employee, DataCollector, ContactPerson, ForestManager
WHERE
	Species.SpeciesCode = Tree.SpeciesCode
	and Forest.forestCode = Tree.forestCode
	and Tree.treeNum = Measurement.treeNum
	and Tree.location = Measurement.location
	and Tree.SpeciesCode = Measurement.SpeciesCode
	and Tree.forestCode = Measurement.forestCode
	and Company.companyCode = Forest.companyCode
	and Measurement.employeeCode = DataCollector.employeeCode
	and DataCollector.employeeCode = Employee.employeeCode
	and ForestManager.employeeCode = Forest.employeeCode;
