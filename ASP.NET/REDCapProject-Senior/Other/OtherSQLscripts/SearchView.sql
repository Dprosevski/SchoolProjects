--CREATE VIEW Search as

SELECT progID, ProgramManager.firstName as 'progManagerFirstName', 
	ProgramManager.middleName as 'progManagerMiddleName', 
	ProgramManager.lastName as 'progManagerLastName',
	Program.name as 'progName', Program.acronym as 'progAcronym', 
	ContactPerson.firstName as 'contactPersonFullName',
	ContactPerson.email as 'contactPersonEmail', 
	ContactPerson.phone as 'contactPersonPhone', 
	State.name as 'stateName', State.stateCode, ProgLoc.county, ProgLoc.city, Program.zipcode,
	FieldOfStudy.value as 'fieldOfStudy', fieldDescription,
	Grades.value as 'grade', Residental.value as 'residental', 
	residentalDescription,
	ProgramCost.value  as 'cost', Duration.value as 'duration', 
	Season.value as 'season', ServiceArea.value as 'serviceArea', 
	serviceAreaDescription,
	Stipend.value as 'stipend', stipendEligibility, stipendAmount,
	affiliation, affiliationDescription, 
	restrictions, restrictionsDescription,
	streetAddress, progWebsite, ProgDescription,
	startDate, appDeadline, lastUpdated
FROM 
	Program, ProgramManager, ContactPerson, ProgLoc, State, FieldOfStudy, Grades, 
	Residental, ProgramCost, Duration, Season, ServiceArea, Stipend
WHERE 
	Program.progManagerID = ProgramManager.progManagerID
	and Program.contactID = ContactPerson.contactID
	and ProgLoc.stateID = State.stateID
	and Program.progLocID = ProgLoc.progLocID
	and Program.fieldID = FieldOfStudy.fieldID
	and Program.gradesID = Grades.gradesID
	and Program.resiID = Residental.resiID
	and Program.programCostID = ProgramCost.programCostID
	and Program.durationID = Duration.durationID
	and Program.seasonID = Season.seasonID
	and Program.serviceAreaID = ServiceArea.serviceAreaID
	and Program.stipendID = Stipend.stipendID
	and Program.approved = 'approved'
	and Program.status = 'active';
--DROP VIEW Search;

--select * from program