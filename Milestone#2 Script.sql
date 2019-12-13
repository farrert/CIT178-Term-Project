CREATE DATABASE DiscDB
GO
USE DiscDB

CREATE TABLE Discs(
DiscID INT NOT NULL,
Name VarChar(20) NOT NULL,
Brand VarChar(20) NOT NULL,
Speed VarChar(20) NULL,
Tendency VarChar(20) NULL,
CostCode VarChar(3) NOT NULL,
Weight VarChar(20) NOT NULL
PRIMARY KEY (DiscID)
CONSTRAINT CHK_Weight CHECK(Weight >=100)
);
CREATE TABLE CourseDisc(
CourseID int NOT NULL,
DiscID int NOT NULL
PRIMARY KEY (CourseID, DiscID)

CONSTRAINT FK_DiscID FOREIGN KEY (DiscID) REFERENCES Discs(DiscID)
);
CREATE TABLE Course(
CourseID int NOT NULL,
Name VarChar(20) NOT NULL,
Address VarChar(20) NOT NULL,
Zipcode VarChar(5) NOT NULL,
PRIMARY KEY (CourseID),

);
CREATE TABLE Zip(
Zipcode VarChar(5) NOT NULL,
City VarChar(20) NOT NULL,
State VarChar(20) NOT NULL,
PRIMARY KEY (Zipcode)
);
CREATE TABLE League(
LeagueID VarChar(3) NOT NULL,
LeagueName VarChar(20) NOT NULL,
CourseID int NOT NULL,
#ofMembers int NULL,
Primary KEY (LeagueID),
CONSTRAINT FK_LeagueCourseID FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
CREATE TABLE Cost(
CostCode VarChar(3) NOT NULL,
Material VarChar(20) NOT NULL,
Cost money NOT NULL,
PRIMARY KEY (CostCode),
CONSTRAINT CHK_Cost CHECK(Cost >0)
);
ALTER TABLE Discs
ADD CONSTRAINT FK_CostCode FOREIGN KEY (CostCode) REFERENCES Cost(CostCode)

ALTER TABLE CourseDisc
ADD CONSTRAINT FK_CourseID FOREIGN KEY (CourseID) REFERENCES Course(CourseID)

ALTER TABLE Course
ADD CONSTRAINT FK_Zipcode FOREIGN KEY (Zipcode) REFERENCES Zip(Zipcode)

CREATE INDEX idx_Zipcode ON Course(Zipcode);
CREATE INDEX idx_CostCode ON Discs(Costcode);
CREATE INDEX idx_DiscID ON CourseDisc(DiscID);
CREATE INDEX idx_CourseID ON CourseDisc(CourseID);
CREATE INDEX idx_CourseID ON League(CourseID);