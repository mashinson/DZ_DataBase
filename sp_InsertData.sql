IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE ID = OBJECT_ID(N'[dbo].[sp_InsertData]'))
BEGIN
  DROP PROCEDURE sp_InsertData
END
GO
CREATE PROCEDURE sp_InsertData (@name nvarchar(100),
@surname nvarchar(100),
@dateBirth date,
@address nvarchar(200),
@telephoneNumber nvarchar(100),
@jobName nvarchar(200),
@jobAddress nvarchar(200))
AS
BEGIN
  DECLARE @idJob int;
  DECLARE @idPerson int;
  IF NOT EXISTS (SELECT 1 FROM Telephone WHERE Number = @telephoneNumber)
  BEGIN
    SET @idJob = (SELECT JobId FROM Job WHERE Name = @jobName AND Address = @jobAddress)
    IF @idJob IS NULL
    BEGIN
      INSERT INTO Job (
	    Name
      , Address)
        VALUES (@jobName, @jobAddress)
      SET @idJob = @@identity
    END
    INSERT INTO Person (
	  Name
    , Surname
    , DateOfBirth
    , HomeAdrress
    , JobId)
      VALUES (@name, @surname, @dateBirth, @address, @idJob)

    SET @idPerson = @@identity
    INSERT INTO Telephone (
	  Number
    , PersonId)
      VALUES (@telephoneNumber, @idPerson)
  END
END


--exec sp_InsertData 'Kate', 'Masggh', '12-12-2013', 'assddetrwttt', '324234434344', 'FLATIRONS RESOURCES LLC', '11080 CIRCLE POINT RD STE 180 WESTMINSTER, CO 80020 2771'
--exec sp_InsertData 'Kate', 'Masggh', '12-11-2013', 'assddetrwttt', '232323232333', 'FLATIRONS RESOURCES 2323', '11080 CIRCLE POINT RD STE 180 WESTMINSTER, 2333 80020 2771'
--exec sp_InsertData 'dsfdfd', 'wadewds', '12-11-2013', 'assddetrwttt', '232323232333', 'FLATIRONS RESOURCES 2323', '11080 CIRCLE POINT RD STE 180 WESTMINSTER, 2333 80020 2771'
--exec sp_InsertData '534', 'wadewds', '12-11-2013', 'assddetrwttt', '232323232333', 'FLATIRONS RESOURCES 2323', '11080 CIRCLE POINT RD STE 180 WESTMINSTER, 2333 80020 2771'
--exec sp_InsertData 'dsfdfd', 'wadewds', '12-11-2013', 'assddetrwttt', '343434343434', 'FLATIRONS RESOURCES 2323', '11080 CIRCLE POINT RD STE 180 WESTMINSTER, 2333 80020 2771'
--exec sp_InsertData 'rttttt', 'errtttt', '12-11-2013', 'assddetrwttt', '45455555', '56666 RESOURCES 2323', '11080 CIRCLE POINT 45454 STE 180 56456656, 2333 80020 2771'