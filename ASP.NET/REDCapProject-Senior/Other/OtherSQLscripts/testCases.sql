select * from Guest;
select * from ProgramManager;
select * from Admin;
select * from Program;
select * from ContactPerson;
select * from ProgLoc;
select * from FieldOfStudy;
select * from Duration;
select * from Grades;
select * from Season;
select * from Stipend;
select * from ManagerRole;
select * from Residental;
select * from ProgramCost;
select * from ServiceArea;


SELECT * FROM Search




INSERT INTO  Guest  (prefix, firstName, middleName, lastName, sufix, email, password, altEmail, altPassword, phone,address, registerDate, lastLogin, approved, currLoggedIn, rndCode)values('' , 'guestFirst', '','guestLast', '' ,'guest@gmail.com','test123!!!', '', '', '', '', '3/10/2020 9:41:28 PM', NULL, 'no', 'no', 'EYUQPWTHICQMGMSHVAKMFDGJQHUGKADTNWIHEAPLIULOTIHYDE');

INSERT INTO  ProgramManager(prefix, firstName, middleName, lastName, sufix, email, password, altEmail, altPassword, phone,address, registerDate, lastLogin, approved, currLoggedIn, rndCode)values('' , 'pmFirst', '','pmLast', '' ,'pm@gmail.com','test123!!!', '', '', '', '', '3/10/2020 9:41:28 PM', NULL, 'no', 'no', 'EYUQPWTHICQMGMSHVAKMFDGJQHUGKADTNWIHEAPLIULOTIHYDE');

INSERT INTO  Admin  (accessLevel, prefix, firstName, middleName, lastName, sufix, email, password, altEmail, altPassword, phone,address, registerDate, lastLogin, currLoggedIn)values('a','' , 'adminFirst', '','adminLast', '' ,'admin@gmail.com','test123!!!', '', '', '', '', '3/11/2020 4:20:20 PM', NULL, 'no');

INSERT INTO  Admin  (accessLevel, prefix, firstName, middleName, lastName, sufix, email, password, altEmail, altPassword, phone,address, registerDate, lastLogin, currLoggedIn)values('s','' , 'superAdminFirst', '','superAdminLast', '' ,'super@gmail.com','test123!!!', '', '', '', '', '3/11/2020 4:20:20 PM', NULL, 'no');





