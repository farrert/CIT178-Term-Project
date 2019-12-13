/*Tom Farrer*/

/* Final Project Procedures */

USE DiscDB
GO
CREATE PROC spDiscs
AS
SELECT * FROM Discs
GO
EXEC spDiscs
GO
CREATE PROC spGetDisc
	@DiscID int
AS
BEGIN
	SELECT * FROM Discs
	WHERE DiscID = @DiscID;
END
GO
EXEC spGetDisc 8
GO
CREATE PROC spCourse
	@CourseID int,
	@Name varchar(20) OUTPUT
AS
SELECT @Name = Name
FROM Course 
WHERE CourseID = @CourseID;
GO
DECLARE @Name varchar(20);
EXEC spCourse 3, @Name OUTPUT;
SELECT @Name AS 'Course Name';
GO
CREATE PROC spDiscCount
AS
DECLARE @DiscCount int;
SELECT @DiscCount = COUNT(*)
FROM Discs
RETURN @DiscCount;
GO
DECLARE @DiscCount int;
EXEC @DiscCount = spDiscCount;
PRINT 'There are ' + CONVERT(varchar, @DiscCount) + ' discs in your database';


/* Final Project User Defined Functions */ 

GO
CREATE FUNCTION fnGetDiscID
    (@DiscID int = '%')
    RETURNS int
BEGIN
    RETURN (SELECT DiscID FROM Discs WHERE DiscID Like @DiscID);
END; 
GO
SELECT DiscID, Name FROM Discs 
WHERE DiscID = dbo.fnGetDiscID('1');
GO
CREATE FUNCTION fnDiscs
	(@Discs varchar(20) = '%')
	RETURNS table
RETURN
	(SELECT * FROM Discs WHERE Name LIKE @Discs);
GO
SELECT * FROM dbo.fnDiscs('%B%');  

 
 /* Final Project Triggers */

 SELECT DiscID INTO CourseArchive
 FROM CourseDisc
 WHERE 1=0;
 GO
  ALTER TABLE CourseArchive
 ADD Activity varchar(50);
 GO
 CREATE TRIGGER Course_DELETE ON CourseDisc
    AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @DiscID int
    SELECT @DiscID =DELETED.DiscID
    FROM DELETED

    INSERT INTO CourseArchive
    VALUES(@DiscID, 'Deleted')
END
GO
DELETE FROM CourseDisc WHERE DiscID = 1;
SELECT * FROM CourseArchive
GO
 SELECT Name INTO DiscArchive
 FROM Discs
 WHERE 1=0;
 GO
 ALTER TABLE DiscArchive
 ADD Activity varchar(50);

GO
 CREATE TRIGGER DiscArchive_INSERT ON Discs
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @Named varchar(20)

    SELECT @Named = INSERTED.Name 
	FROM INSERTED

    INSERT INTO DiscArchive VALUES(@Named, 'Inserted' )
END
GO
INSERT INTO Discs VALUES (19, 'Zephyr', 'Innova', 'Fairway', 'Stable', 2, 250)
SELECT * FROM DiscArchive

 GO
CREATE TRIGGER Discs_UPDATE ON Discs
    AFTER UPDATE
AS
BEGIN
    DECLARE @Name varchar(20)
	    DECLARE @Activity varchar(50)
    SELECT @Name = INSERTED.Name
    FROM INSERTED 

    IF UPDATE(Name)

		SET @Activity = 'Updated Name'   

    INSERT INTO DiscArchive
    VALUES(@Name, @Activity)
END
UPDATE Discs SET Name='Thief' WHERE Name = 'Aviar';

SELECT * FROM DiscArchive


