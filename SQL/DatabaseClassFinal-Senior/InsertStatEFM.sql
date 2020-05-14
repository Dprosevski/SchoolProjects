--Species
INSERT INTO Species VALUES
('OK',	50,		'Oak'),
('MP',	45,		'Maple'),
('PN',	50,		'Pine'),
('NA',	NULL, 	NULL);


--Company
INSERT INTO Company VALUES
('INF',	'Indiana Forest Company'),
('SSF',	'South State Forest Company'),
('NSF',	'North State Forest Company'),
('NA',	NULL);


--Employee
INSERT INTO Employee VALUES
	('EMP0000',	'Bob Bureaucrat', 	NULL, 			NULL),		
	('EMP0101',	'Sam Supervisor', 	NULL, 			NULL),		
	('EMP0102',	'Mary Manager', 	NULL, 			NULL),		
	('EMP0103',	'Fred Foreman', 	NULL, 			NULL),	
	('EMP1010',	'Bill',				'2011/02/12', 	NULL),	
	('EMP1011',	'Joe',				'2011/02/12', 	NULL),
	('EMP1012',	'Vern',				'2011/04/12', 	'2011/12/31'),
	('EMP1013',	'Ann',				'2011/04/12', 	'2011/12/31'),
	('EMP1014',	'Mike',				'2013/01/01', 	NULL),	
	('EMP1015',	'Kelly',			'2013/03/12', 	NULL),
	('EMP2025',	'Dimitrije',		'2001/01/12', 	NULL),	
	('NA', 		NULL, 				NULL, 		 	NULL);


--ForestManager
INSERT INTO ForestManager VALUES
	('EMP0101', NULL),	
	('EMP0102', NULL),	
	('EMP0103', NULL),	
	('NA', 		NULL);


--ContactPerson
INSERT INTO ContactPerson VALUES
	('EMP0000',	NULL),
	('EMP0101', NULL),
	('NA',		NULL);	


--DataCollector
INSERT INTO DataCollector VALUES 
	('EMP1010',	3),
	('EMP1011',	1),
	('EMP1012',	5),
	('EMP1013',	NULL),
	('EMP1014',	3),
	('EMP1015',	2),
	('EMP2025',	3),
	('NA', 		NULL);


--FOREST
INSERT INTO Forest VALUES 
	('IF',	'INF',	'EMP0101',	50,	 'Area-311',	'Indiana Forest'),
	('SS',	'SSF',	'EMP0102',	75,	 'Area-933',	'South State Forest'),
	('NS',	'NSF',	'EMP0103',	50,	 'Area-933',	'North State Forest'),
	('NA',	'NA',	'NA', 		NULL, NULL, 		NULL);	


--TREE
INSERT INTO Tree VALUES 
	('728',	'5W7S',	'OK',	'IF', '1996/11/01'),
	('191',	'5W7S',	'MP',	'SS', '1995/01/01'),
	('391',	'5W7S',	'MP',	'SS', '1996/01/01'),
	('836',	'3E5N',	'MP',	'IF', '1995/12/01'),
	('836',	'2W5N',	'PN',	'NS', '1996/01/01'),
	('837',	'2W5N',	'MP',	'NS', '1996/01/01'),
	('850',	'4W6N',	'PN',	'NS', '1996/02/01'),
	('859',	'2W5N',	'MP',	'IF', '1996/01/01'),
	('859',	'4W6N',	'PN',	'NS', '1996/02/01'),
	('859',	'4W6N',	'MP',	'SS', '1996/02/01'),
	('836',	'3E5N',	'PN',	'NS', '1995/01/01'),
	('NA',	'NA',	'NA',	'NA', NULL);


--MEASUREMENT
INSERT INTO Measurement VALUES 
	('77', '728', '5W7S', 'OK', 'IF', 'EMP1014', 	'2017/03/01', 40),
	('20', '391', '5W7S', 'MP', 'SS', 'NA', 		'2015/02/01', 31),
	('21', '836', '3E5N', 'MP', 'IF', 'NA', 		'2015/03/01', 33),
	('33', '836', '3E5N', 'MP', 'IF', 'NA', 		'2016/02/01', 38),
	('57', '859', '4W6N', 'PN', 'NS', 'EMP1015', 	'2017/04/01', 42),
	('54', '836', '3E5N', 'MP', 'IF', 'NA', 		'2017/03/01', 40),
	('98', '391', '5W7S', 'MP', 'SS', 'EMP1010', 	'2018/02/01', 39),
	('30', '728', '5W7S', 'OK', 'IF', 'NA', 		'2015/03/01', 35),
	('80', '836', '3E5N', 'MP', 'IF', 'EMP1014', 	'2018/02/01', 42),
	('44', '391', '5W7S', 'MP', 'SS', 'NA', 		'2016/02/01', 29),
	('45', '191', '5W7S', 'MP', 'SS', 'EMP1010', 	'2016/02/01', 35),
	('43', '859', '4W6N', 'MP', 'SS', 'EMP1010', 	'2018/03/01', 51),
	('20', '850', '4W6N', 'PN', 'NS', 'EMP1014', 	'2017/03/01', 46),
	('22', '837', '2W5N', 'MP', 'NS', 'NA', 		'2014/03/01', 31),
	('42', '837', '2W5N', 'MP', 'NS', 'NA', 		'2016/02/01', 33),
	('46', '837', '2W5N', 'MP', 'NS', 'NA', 		'2018/02/01', 46),
	('80', '728', '5W7S', 'OK', 'IF', 'EMP1015', 	'2017/03/01', 40),
	('54', '836', '2W5N', 'PN', 'NS', 'EMP1011', 	'2017/03/01', 36),
	('44', '859', '2W5N', 'MP', 'IF', 'EMP1011', 	NULL, 		  NULL),
	('NA', 'NA',  'NA',   'NA', 'NA', 'EMP1012', 	NULL, 		  NULL),
	('NA', 'NA',  'NA',   'NA', 'NA', 'EMP1013', 	NULL, 		  NULL),
	('54', '836', '3E5N', 'PN', 'NS', 'EMP2025',	'2017/03/01', 36);