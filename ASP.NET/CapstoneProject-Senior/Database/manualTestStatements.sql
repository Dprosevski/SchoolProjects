--all of these scripts are for manual input purposes
--there are 4 entities and one view called "IO"
SELECT * FROM cap.Person
SELECT * FROM cap.Consumables
SELECT * FROM cap.Activities

SELECT * FROM IO


--to insert test data
INSERT INTO  cap.Person ([type], [prefix], [firstName], [middleName], [lastName], [sufix], [gender], [DOB], [parentPassword], [email], [password], [altEmail], [altPassword], [phone], [address], [registerDate], [lastLogin], [approved], [currLoggedIN], [rndCode])values('user', '' , 'firstuser', '','lastuser', '' ,'', '', '', 'test@gmail.com','test123!!!', '', '', '', '', '3/15/2020 10:21:19 PM', NULL, 'no', 'no', 'AAGUBTMKJPUQTFPWHAXOJWPSCHEHEIHRPKOPGKILMWAHXEWRBQ');
INSERT INTO  cap.Person ([type], [prefix], [firstName], [middleName], [lastName], [sufix], [gender], [DOB], [parentPassword], [email], [password], [altEmail], [altPassword], [phone], [address], [registerDate], [lastLogin], [approved], [currLoggedIN], [rndCode])values('admin', '' , 'firstadmin', '','lastadmin', '' ,'', '', '', 'admin@gmail.com','test123!!!', '', '', '', '', '3/15/2020 10:21:19 PM', NULL, 'no', 'no', 'AAGUBTMKJPUQTFPWHAXOJWPSCHEHEIHRPKOPGKILMWAHXEWRBQ');
INSERT INTO  cap.Person ([type], [prefix], [firstName], [middleName], [lastName], [sufix], [gender], [DOB], [parentPassword], [email], [password], [altEmail], [altPassword], [phone], [address], [registerDate], [lastLogin], [approved], [currLoggedIN], [rndCode])values('super', '' , 'firstsuper', '','lastsuper', '' ,'', '', '', 'super@gmail.com','test123!!!', '', '', '', '', '3/15/2020 10:21:19 PM', NULL, 'no', 'no', 'AAGUBTMKJPUQTFPWHAXOJWPSCHEHEIHRPKOPGKILMWAHXEWRBQ');

INSERT INTO cap.Consumables (name, sugar, calories, GI, status) 
	values ('Apple', 2, 30, 5, 'active'),
		 ('Pear', 3, 45, 6, 'active'),
		 ('Banana', 4, 55, 7, 'active'),
		 ('Orange', 5, 44, 6, 'active');

INSERT INTO cap.Activities(name, status) 
	values ('Sports', 'active'),
		 ('Walking', 'active'),
		 ('Running', 'active'),
		 ('Strenght Training', 'active');


--to drop tables
--DROP TABLE cap.Activities
--DROP TABLE cap.Consumables
--DROP TABLE cap.MedInfo
--DROP TABLE cap.Person
