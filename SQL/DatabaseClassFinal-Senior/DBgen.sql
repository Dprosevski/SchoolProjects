CREATE TABLE Company
( 
	companyCode          char(3)  NOT NULL ,
	name                 char(30)  NULL ,
	PRIMARY KEY  CLUSTERED (companyCode ASC)
)

Execution Successful


CREATE TABLE Employee
( 
	employeeCode         char(7)  NOT NULL ,
	name                 char(20)  NULL ,
	beginDate            date  NULL ,
	endDate              date  NULL ,
	PRIMARY KEY  CLUSTERED (employeeCode ASC)
)

Execution Successful


CREATE TABLE ForestManager
( 
	employeeCode         char(7)  NOT NULL ,
	lastDateAccessed     datetime  NULL ,
	PRIMARY KEY  CLUSTERED (employeeCode ASC),
	 FOREIGN KEY (employeeCode) REFERENCES Employee(employeeCode)
)

Execution Successful


CREATE TABLE Forest
( 
	forestCode           char(2)  NOT NULL ,
	companyCode          char(3)  NULL ,
	employeeCode         char(7)  NULL ,
	size                 integer  NULL ,
	location             char(8)  NULL ,
	name                 char(20)  NULL ,
	PRIMARY KEY  CLUSTERED (forestCode ASC),
	 FOREIGN KEY (companyCode) REFERENCES Company(companyCode),
	 FOREIGN KEY (employeeCode) REFERENCES ForestManager(employeeCode)
)

Execution Successful


CREATE TABLE Species
( 
	SpeciesCode          char(2)  NOT NULL ,
	maxHeight            integer  NULL ,
	name                 char(20)  NULL ,
	PRIMARY KEY  CLUSTERED (SpeciesCode ASC)
)

Execution Successful


CREATE TABLE Tree
( 
	treeNum              char(5)  NOT NULL ,
	location             char(4)  NOT NULL ,
	SpeciesCode          char(2)  NOT NULL ,
	forestCode           char(2)  NOT NULL ,
	datePlanted          date  NULL ,
	PRIMARY KEY  CLUSTERED (treeNum ASC,location ASC,SpeciesCode ASC,forestCode ASC),
	 FOREIGN KEY (forestCode) REFERENCES Forest(forestCode),
	 FOREIGN KEY (SpeciesCode) REFERENCES Species(SpeciesCode)
)

Execution Successful


CREATE TABLE DataCollector
( 
	employeeCode         char(7)  NOT NULL ,
	numOfTrees           integer  NULL ,
	PRIMARY KEY  CLUSTERED (employeeCode ASC),
	 FOREIGN KEY (employeeCode) REFERENCES Employee(employeeCode)
)

Execution Successful


CREATE TABLE Measurement
( 
	measurementNum       char(5)  NOT NULL ,
	treeNum              char(5)  NOT NULL ,
	location             char(4)  NOT NULL ,
	SpeciesCode          char(2)  NOT NULL ,
	forestCode           char(2)  NOT NULL ,
	employeeCode         char(7)  NOT NULL ,
	measurementDate      date  NULL ,
	measurementHeight    integer  NULL ,
	PRIMARY KEY  CLUSTERED (measurementNum ASC,treeNum ASC,location ASC,SpeciesCode ASC,forestCode ASC,employeeCode ASC),
	 FOREIGN KEY (treeNum,location,SpeciesCode,forestCode) REFERENCES Tree(treeNum,location,SpeciesCode,forestCode),
	 FOREIGN KEY (employeeCode) REFERENCES DataCollector(employeeCode)
)

Execution Successful


CREATE TABLE ContactPerson
( 
	employeeCode         char(7)  NOT NULL ,
	visitDate            datetime  NULL ,
	PRIMARY KEY  CLUSTERED (employeeCode ASC),
	 FOREIGN KEY (employeeCode) REFERENCES Employee(employeeCode)
)

Execution Successful

Schema Generation Complete
9 query succeeded.