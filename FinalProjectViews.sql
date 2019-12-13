 /* Final Project Views */
 USE DiscDB
 GO
 --Updateable View--
 CREATE VIEW FrolfBag
 AS
 SELECT DiscID
 FROM CourseDisc
 GO
 --original data--
 SELECT * FROM CourseDisc

 --Updating DiscID--
UPDATE FrolfBag
SET DiscID = 18
WHERE DiscID = 14
GO
--diplaying new data--
SELECT * FROM FrolfBag

/*  View #2  */
GO
--  creating view --
CREATE VIEW Prices
AS
SELECT CostCode, Material, Cost
FROM Cost
GO
-- using the view to display the data --
SELECT * FROM Prices

/* View #3 */
GO
-- creating view --
CREATE VIEW Teams
AS
SELECT LeagueName
FROM League
GO
-- using the view to display the data --
SELECT * FROM Teams
GO
/* View #4 */
-- creating view --
CREATE VIEW PlacesToGo
AS
SELECT Name
FROM Course
GO
-- using the view to display the data --
SELECT * FROM PlacesToGo