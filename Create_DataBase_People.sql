IF  NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = N'People')
BEGIN
    CREATE DATABASE People
END;

IF NOT EXISTS (SELECT 1 FROM sysobjects WHERE id = object_id(N'[dbo].[Job]'))
BEGIN
    CREATE TABLE Job(
	    JobId INT NOT NULL IDENTITY,
		Name NVARCHAR(200) NOT NULL,
		Address NVARCHAR(200) NOT NULL,
		CONSTRAINT PK_Job PRIMARY KEY (JobId)
	)
END

IF NOT EXISTS (SELECT 1 FROM sysobjects WHERE id = object_id(N'[dbo].[Person]'))
BEGIN
    CREATE TABLE Person(
	    PersonId INT NOT NULL IDENTITY,
		Name NVARCHAR(100) NOT NULL,
		Surname NVARCHAR(100) NOT NULL,
		DateOfBirth DATE  NOT NULL,
		HomeAdrress NVARCHAR(200) NOT NULL,
		JobId INT NOT NULL,
		CONSTRAINT PK_Person PRIMARY KEY (PersonId),
	    CONSTRAINT FK_Person_Job FOREIGN KEY (JobId) REFERENCES Job(JobId) 
	)
END

IF NOT EXISTS (SELECT 1 FROM sysobjects WHERE id = object_id(N'[dbo].[Telephone]'))
BEGIN
    CREATE TABLE Telephone(
	    TelephoneId INT NOT NULL IDENTITY,
		Number NVARCHAR(100) NOT NULL UNIQUE,
		PersonId INT NOT NULL,
		CONSTRAINT PK_Telephone PRIMARY KEY (TelephoneId),
	    CONSTRAINT FK_Person_Telephone FOREIGN KEY (PersonId) REFERENCES Person(PersonId) 
	)
END


