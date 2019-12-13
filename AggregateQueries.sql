USE DiscDB;

SELECT  MIN (Cost.Cost) AS [Minimum Cost],
		MAX (Cost.Cost) AS [Maximum Cost],
		AVG (Cost.Cost) AS [Average Cost]
FROM Cost;

SELECT  SUM(League.#ofMembers) AS [Total Number of Members],
		COUNT(League.#ofMembers) AS [Leagues],
		AVG(League.#ofMembers) AS [Average Numbers of Members per League]
FROM League;

SELECT  COUNT(Discs.Name) AS [Discs in Database],
		COUNT(DISTINCT Discs.Brand) as [Number of Brands],
		MIN(Discs.Weight) AS [Minimum Weight of a Disc],
		MAX(Discs.Weight) AS [Maximum Weight of a Disc]
FROM Discs;

SELECT  COUNT(DISTINCT CourseDisc.DiscID) AS [Number of Distinct Discs in Bags],
		COUNT(DISTINCT CourseDisc.CourseID) AS [Number of Bags]
FROM CourseDisc;

