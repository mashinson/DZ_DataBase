IF EXISTS (SELECT 1 FROM dbo.sysobjects  WHERE ID = OBJECT_ID(N'[dbo].[sp_UpdateData]'))
BEGIN
  DROP PROCEDURE sp_UpdateData
END
GO
CREATE PROCEDURE sp_UpdateData (
@idPerson int,
@name nvarchar(100),
@surname nvarchar(100),
@dateBirth date,
@address nvarchar(200),

@idTelephone int,
@telephoneNumber nvarchar(200),

@idJob int,
@jobName nvarchar(200),
@jobAddress nvarchar(200))
AS
BEGIN

  IF EXISTS (SELECT 1 FROM Telephone WHERE TelephoneId = @idTelephone)
    AND EXISTS (SELECT 1 FROM Job WHERE JobId = @idJob)
    AND EXISTS (SELECT 1 FROM Person  WHERE PersonId = @idPerson)
  BEGIN
    UPDATE Job
    SET Name = @jobName,
        Address = @jobAddress
    WHERE JobId = @idJob

    UPDATE Person
    SET Name = @name,
        Surname = @surname,
        DateOfBirth = @dateBirth,
        HomeAdrress = @address,
        JobId = @idJob
    WHERE PersonId = @idPerson

    UPDATE Telephone
    SET Number = @telephoneNumber,
        PersonId = @idPerson
    WHERE TelephoneId = @idTelephone

  END
END

--exec sp_UpdateData '1', 'wseewe', 'ererrr',  '12-12-2016', '4545454545', '10', '566767676767',  '1', 'eeeee', 'eeee'

--exec sp_UpdateData '1', '454545', 'fdgfgdfgfg',  '12-12-2016', 'szdasdsd', '10', '03069990222',  '1', 'eeeee', 'eeee'

--exec sp_UpdateData '122', '454545', 'fdgfgdfgfg',  '12-12-2016', 'szdasdsd', '10', '03069990222',  '1', 'eeeee', 'eeee'

--exec sp_UpdateData '122', '454545', 'fdgfgdfgfg',  '12-12-2016', 'szdasdsd', '10', '03069990222',  '1', 'eeeee', 'eeee'