
IF NOT EXISTS (SELECT 1 FROM Job)
BEGIN
    INSERT INTO Job
	VALUES 
	(
	    'FLATIRONS RESOURCES LLC'
		,'11080 CIRCLE POINT RD STE 180 WESTMINSTER, CO 80020 2771'
	),
	(
	    'ELK OPERATING COMPANY LLC'
		,'123 W 1ST ST STE 490 CASPER, WY 82601 7500'
	),
	(
	    'P & H OIL CO, LLC'
		,'PO BOX 645 PINE BLUFFS, WY 82082 0645'
	)
END


IF NOT EXISTS (SELECT 1 FROM Person)
BEGIN
    INSERT INTO Person
	VALUES 
	(
	    'Peter'
		,'Maes'
		,'7-8-1971'
		,'123 6th St. Melbourne, FL 32904'
		,'1'

	),
	(
	    'Dorthea'
		,'Johnson'
		,'5-4-1989'
		,'123 6th St. Melbourne, FL 32904'
		,'2'

	),
	(
	    'Rudy'
		,'Pinto'
		,'5-21-1990'
		,'123 6th St. Melbourne, FL 32904'
		,'2'

	),
	(
	    'Lucas'
		,'Reid'
		,'6-24-1973'
		,'123 6th St. Melbourne, FL 32904'
		,'3'

	),
	(
	    'Jack'
		,'Taylor'
		,'10-14-1973'
		,'123 6th St. Melbourne, FL 32904'
		,'3'

	),
		(
	    'Dorothy'
		,'Lowe'
		,'2-2-1999'
		,'123 6th St. Melbourne, FL 32904'
		,'2'

	)
END



IF NOT EXISTS (SELECT 1 FROM Telephone)
BEGIN
    INSERT INTO Telephone
	VALUES 
	(
	    '03069990222'
		,'1'
	),
	(
	    '+443069990222'
		,'1'
	),
	(
	    '+443069990436'
		,'2'
	),
	(
	    '03069990169'
		,'2'
	),
		(
	    '03069990234'
		,'3'
	),
		(
	    '+443069990338'
		,'4'
	),
		(
	    '+443069990272'
		,'5'
	),
		(
	    '03064490222'
		,'6'
	),
		(
	    '03069930244'
		,'3'
	),
		(
	    '+443069934722'
		,'2'
	),
		(
	    '+443069990125'
		,'5'
	),
		(
	    '03069395222'
		,'4'
	)
END