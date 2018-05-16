CREATE TABLE lessontrack.dbo.AchievementDefinition (
	Id int IDENTITY(1,1) NOT NULL,
	AchievementID uniqueidentifier NOT NULL,
	AchievementName nvarchar(50) NOT NULL,
	AchievementDesc text NOT NULL,
	ValidityMonths int DEFAULT ((0)) NOT NULL,
	PRIMARY KEY (Id)
)
GO

CREATE TABLE lessontrack.dbo.AchievementPrereq (
	Id int IDENTITY(1,1) NOT NULL,
	AchievementID uniqueidentifier NOT NULL,
	TaskID uniqueidentifier,
	RequiredAchievementID uniqueidentifier,
	PRIMARY KEY (Id)
)
GO

CREATE TABLE lessontrack.dbo.Aircrafts (
	TailNumber nchar(10) NOT NULL,
	Make nvarchar(50) NOT NULL,
	Model nvarchar(50) NOT NULL,
	Year nchar(10),
	LastHobbs decimal(7,1),
	LastMXHobbs decimal(7,1),
	Status int DEFAULT ((0)) NOT NULL,
	PRIMARY KEY (TailNumber)
)
GO

CREATE TABLE lessontrack.dbo.AppUsers (
	UserEmail nvarchar(50) NOT NULL,
	PasswordHash varbinary(100),
	IsAdmin bit NOT NULL,
	IsStudent bit NOT NULL,
	IsInstructor bit NOT NULL,
	LastName nvarchar(50) NOT NULL,
	FirstName nvarchar(50) NOT NULL,
	MI nvarchar(50),
	Gender nchar(10),
	DOB date,
	CellPhone nchar(20),
	HomePhone nchar(20),
	WorkPhone nchar(20),
	Address1 nvarchar(100),
	Address2 nvarchar(100),
	Address3 nvarchar(100),
	City nvarchar(50),
	State nvarchar(50),
	ZIP nvarchar(20),
	Country nvarchar(50),
	CreatedOn datetime NOT NULL,
	Employer nvarchar(50),
	PRIMARY KEY (UserEmail)
)
GO

CREATE TABLE lessontrack.dbo.CompletionLogs (
	Id int IDENTITY(1,1) NOT NULL,
	DateCompleted datetime NOT NULL,
	Student nvarchar(100) NOT NULL,
	Instructor nvarchar(100) NOT NULL,
	AircraftUsed nchar(10),
	LessonGUID nvarchar(50) NOT NULL,
	STAGEID int NOT NULL,
	LESSONID int NOT NULL,
	HoursSpent decimal(5,2) DEFAULT ((0.0)) NOT NULL,
	PRIMARY KEY (Id)
)
GO

CREATE TABLE lessontrack.dbo.Endorsements (
	UserEmail nvarchar(50) NOT NULL,
	EndorsementType nvarchar(50) NOT NULL,
	EndorsementSubtype nvarchar(50) NOT NULL,
	ValidityIfAny date,
	IssuedOn date NOT NULL,
	IssuingAuthority nvarchar(50),
	PRIMARY KEY (UserEmail)
)
GO

CREATE TABLE lessontrack.dbo.FAACerts (
	CertificationID nvarchar(50) NOT NULL,
	CertificationName nvarchar(50) NOT NULL,
	InfoLink nvarchar(500),
	FAAPart nchar(10) NOT NULL,
	PRIMARY KEY (CertificationID)
)
GO

CREATE TABLE lessontrack.dbo.LESSONITEMS (
	LineID int IDENTITY(1,1) NOT NULL,
	LESSONID int NOT NULL,
	STAGEID int NOT NULL,
	LESSONGUID nvarchar(50) DEFAULT ('1') NOT NULL,
	ItemName nvarchar(max) NOT NULL,
	IsGroup bit NOT NULL,
	IsReview bit NOT NULL,
	IsIntro bit NOT NULL,
	PRIMARY KEY (LineID)
)
GO

CREATE TABLE lessontrack.dbo.LESSONS (
	ROWID int IDENTITY(1,1) NOT NULL,
	LESSONID int NOT NULL,
	STAGEID int NOT NULL,
	IsGround bit NOT NULL,
	Title nvarchar(100) NOT NULL,
	Objective nvarchar(max),
	Standard nvarchar(max),
	duallocalday decimal(5,2) DEFAULT ((0)) NOT NULL,
	dualccday decimal(5,2) DEFAULT ((0)) NOT NULL,
	duallocalnight decimal(5,2) DEFAULT ((0)) NOT NULL,
	dualccnight decimal(5,2) DEFAULT ((0)) NOT NULL,
	sololocalday decimal(5,2) DEFAULT ((0)) NOT NULL,
	soloccday decimal(5,2) DEFAULT ((0)) NOT NULL,
	sololocalnight decimal(5,2) DEFAULT ((0)) NOT NULL,
	soloccnight decimal(5,2) DEFAULT ((0)) NOT NULL,
	briefing decimal(5,2) DEFAULT ((0)) NOT NULL,
	classvideo decimal(5,2) DEFAULT ((0)) NOT NULL,
	exams decimal(5,2) DEFAULT ((0)) NOT NULL,
	debrief decimal(5,2) DEFAULT ((0)) NOT NULL,
	PRIMARY KEY (ROWID)
)
GO

CREATE TABLE lessontrack.dbo.LessonTimeLog (
	Id int IDENTITY(1,1) NOT NULL,
	STAGEID int NOT NULL,
	LESSONID int NOT NULL,
	Student nvarchar(100) NOT NULL,
	Instructor nvarchar(100) NOT NULL,
	PerformedOn datetime NOT NULL,
	AircraftUsed nchar(10),
	duallocalday decimal(5,2) DEFAULT ((0)) NOT NULL,
	dualccday decimal(5,2) DEFAULT ((0)) NOT NULL,
	duallocalnight decimal(5,2) DEFAULT ((0)) NOT NULL,
	dualccnight decimal(5,2) DEFAULT ((0)) NOT NULL,
	sololocalday decimal(5,2) DEFAULT ((0)) NOT NULL,
	soloccday decimal(5,2) DEFAULT ((0)) NOT NULL,
	sololocalnight decimal(5,2) DEFAULT ((0)) NOT NULL,
	soloccnight decimal(5,2) DEFAULT ((0)) NOT NULL,
	briefing decimal(5,2) DEFAULT ((0)) NOT NULL,
	classvideo decimal(5,2) DEFAULT ((0)) NOT NULL,
	exams decimal(5,2) DEFAULT ((0)) NOT NULL,
	debrief decimal(5,2) DEFAULT ((0)) NOT NULL,
	PRIMARY KEY (Id)
)
GO

CREATE TABLE lessontrack.dbo.PilotAchievement (
	Id int IDENTITY(1,1) NOT NULL,
	PilotEmail nvarchar(50) NOT NULL,
	AchievementID uniqueidentifier NOT NULL,
	DateCompleted datetime NOT NULL,
	PRIMARY KEY (Id)
)
GO

CREATE TABLE lessontrack.dbo.PilotClass (
	Id int IDENTITY(1,1) NOT NULL,
	PilotEmail nvarchar(50) NOT NULL,
	PilotClassID uniqueidentifier NOT NULL,
	DateCompleted datetime NOT NULL,
	PRIMARY KEY (Id)
)
GO

CREATE TABLE lessontrack.dbo.PilotClassDefinition (
	Id int IDENTITY(1,1) NOT NULL,
	PilotClassID uniqueidentifier NOT NULL,
	PilotClassName nvarchar(50) NOT NULL,
	PilotClassDescription text NOT NULL,
	Logo nvarchar(100) DEFAULT ('Passenger'),
	PRIMARY KEY (Id)
)
GO

CREATE TABLE lessontrack.dbo.PilotClassPrereq (
	Id int IDENTITY(1,1) NOT NULL,
	PilotClassID uniqueidentifier NOT NULL,
	AchievementID uniqueidentifier NOT NULL,
	PRIMARY KEY (Id)
)
GO

CREATE TABLE lessontrack.dbo.PilotReward (
	Id int IDENTITY(1,1) NOT NULL,
	PilotEmail nvarchar(50) NOT NULL,
	RewardID uniqueidentifier NOT NULL,
	DateCompleted datetime NOT NULL,
	IsIssued bit DEFAULT ((0)) NOT NULL,
	IssuedOn datetime,
	IssuedBy nvarchar(50),
	Notes text,
	PRIMARY KEY (Id)
)
GO

CREATE TABLE lessontrack.dbo.PilotTask (
	Id int IDENTITY(1,1) NOT NULL,
	PilotEmail nvarchar(50) NOT NULL,
	TaskID uniqueidentifier NOT NULL,
	DateAdded datetime,
	IsCompleted bit NOT NULL,
	DateCompleted datetime,
	IsVerified bit DEFAULT ((0)) NOT NULL,
	InstructorEmail nvarchar(50),
	DateVerified datetime,
	VerificationNotes text,
	PRIMARY KEY (Id)
)
GO

CREATE TABLE lessontrack.dbo.RewardDefinition (
	Id int IDENTITY(1,1) NOT NULL,
	RewardID uniqueidentifier NOT NULL,
	RewardName nvarchar(50) NOT NULL,
	RewardDesc text NOT NULL,
	RewardType nvarchar(10) DEFAULT ('DISCOUNT') NOT NULL,
	RewardCount decimal(18) DEFAULT ((0)),
	RewardValidityTill date,
	RewardItem nvarchar(50),
	Logo nvarchar(100) DEFAULT ('Security Checked'),
	PRIMARY KEY (Id)
)
GO

CREATE TABLE lessontrack.dbo.RewardPrereq (
	Id int IDENTITY(1,1) NOT NULL,
	RewardID uniqueidentifier NOT NULL,
	RequiredAchievement uniqueidentifier NOT NULL,
	PRIMARY KEY (Id)
)
GO

CREATE TABLE lessontrack.dbo.STAGES (
	RowID int IDENTITY(1,1) NOT NULL,
	STAGEID int NOT NULL,
	Name nvarchar(50) NOT NULL,
	CertificationID nvarchar(50) NOT NULL,
	Objective varchar(max),
	Standard varchar(max),
	GroundObjective varchar(max),
	GroundStandard varchar(max),
	duallocalday decimal(5,2) DEFAULT ((0)) NOT NULL,
	dualccday decimal(5,2) DEFAULT ((0)) NOT NULL,
	duallocalnight decimal(5,2) DEFAULT ((0)) NOT NULL,
	dualccnight decimal(5,2) DEFAULT ((0)) NOT NULL,
	sololocalday decimal(5,2) DEFAULT ((0)) NOT NULL,
	soloccday decimal(5,2) DEFAULT ((0)) NOT NULL,
	sololocalnight decimal(5,2) DEFAULT ((0)) NOT NULL,
	soloccnight decimal(5,2) DEFAULT ((0)) NOT NULL,
	briefing decimal(5,2) DEFAULT ((0)) NOT NULL,
	classvideo decimal(5,2) DEFAULT ((0)) NOT NULL,
	exams decimal(5,2) DEFAULT ((0)) NOT NULL,
	debrief decimal(5,2) DEFAULT ((0)) NOT NULL,
	PRIMARY KEY (RowID)
)
GO

CREATE TABLE lessontrack.dbo.TaskDefinition (
	Id int IDENTITY(1,1) NOT NULL,
	TaskID uniqueidentifier NOT NULL,
	TaskName nvarchar(100) NOT NULL,
	TaskDescription text,
	TaskType int DEFAULT ((0)) NOT NULL,
	AircraftType nvarchar(50),
	TailNo nvarchar(10),
	Hours decimal(18) DEFAULT ((0)),
	Maneuver nvarchar(50),
	Airport nvarchar(10),
	Lesson nvarchar(50),
	Rating nvarchar(50),
	Course nvarchar(50),
	Detail nvarchar(100),
	Distance decimal(18) DEFAULT ((0)),
	IsNight bit DEFAULT ((0)),
	IsDual bit DEFAULT ((0)),
	IsCrossCountry bit DEFAULT ((0)),
	IsWithPassenger bit DEFAULT ((0)),
	ValidityStartDate datetime,
	ValidityEndDate datetime,
	PRIMARY KEY (Id)
)
GO

INSERT INTO lessontrack.dbo.AchievementDefinition(AchievementID, AchievementName, AchievementDesc, ValidityMonths) VALUES ('49B3C557-3C0A-4BD2-A1B5-D7EC8067AD1A', N'Took 3 Demo Flights', 'Student has taken a demo flight and is interested in pursuing', 0)
GO

INSERT INTO lessontrack.dbo.AchievementDefinition(AchievementID, AchievementName, AchievementDesc, ValidityMonths) VALUES ('BD6CAF12-E6A8-4CFD-8AA2-08C16BB35B9D', N'Hover the S300', 'Figured out how to hover in the S300', 0)
GO

INSERT INTO lessontrack.dbo.AchievementDefinition(AchievementID, AchievementName, AchievementDesc, ValidityMonths) VALUES ('B9965FB6-76C2-4E49-B7BD-E871FDE8E9C7', N'S300 Solo', 'Soloed the S300', 0)
GO

INSERT INTO lessontrack.dbo.AchievementPrereq(AchievementID, TaskID, RequiredAchievementID) VALUES ('BD6CAF12-E6A8-4CFD-8AA2-08C16BB35B9D', 'D8AF2F20-DD78-4E3B-B06D-9FB544FCF4DA', null)
GO

INSERT INTO lessontrack.dbo.AchievementPrereq(AchievementID, TaskID, RequiredAchievementID) VALUES ('49B3C557-3C0A-4BD2-A1B5-D7EC8067AD1A', '91F998F4-48AB-4C51-A4F5-E0C263E7AA58', null)
GO

INSERT INTO lessontrack.dbo.AchievementPrereq(AchievementID, TaskID, RequiredAchievementID) VALUES ('49B3C557-3C0A-4BD2-A1B5-D7EC8067AD1A', '15B2AC40-FB4E-4E30-9444-6B75DD77B0B7', null)
GO

INSERT INTO lessontrack.dbo.AchievementPrereq(AchievementID, TaskID, RequiredAchievementID) VALUES ('49B3C557-3C0A-4BD2-A1B5-D7EC8067AD1A', '1E979BDE-FF72-4CCA-8192-3FB689123F35', null)
GO

INSERT INTO lessontrack.dbo.AchievementPrereq(AchievementID, TaskID, RequiredAchievementID) VALUES ('B9965FB6-76C2-4E49-B7BD-E871FDE8E9C7', '1B2547C2-7AB5-4079-A957-15F1968602F2', null)
GO

INSERT INTO lessontrack.dbo.AchievementPrereq(AchievementID, TaskID, RequiredAchievementID) VALUES ('B9965FB6-76C2-4E49-B7BD-E871FDE8E9C7', '766D0FF2-ED53-4CF7-B3E7-6650759B2BC4', null)
GO

INSERT INTO lessontrack.dbo.Aircrafts(TailNumber, Make, Model, Year, LastHobbs, LastMXHobbs, Status) VALUES ('N144AH    ', N'Robinson', N'Raven 1', '          ', null, null, 1)
GO

INSERT INTO lessontrack.dbo.Aircrafts(TailNumber, Make, Model, Year, LastHobbs, LastMXHobbs, Status) VALUES ('N974CW    ', N'Schweizer', N'CB300', '1996      ', 3245.3, 762.3, 1)
GO

INSERT INTO lessontrack.dbo.AppUsers(UserEmail, PasswordHash, IsAdmin, IsStudent, IsInstructor, LastName, FirstName, MI, Gender, DOB, CellPhone, HomePhone, WorkPhone, Address1, Address2, Address3, City, State, ZIP, Country, CreatedOn, Employer) VALUES (N'anthony@atomichelicopters.com', 0x77617465723938, 1, 0, 1, N'Riley', N'Tony', N'', 'M         ', null, '  360-994-0300      ', '                    ', '                    ', N'', N'', N'', N'', N'Poulsbo', N'', N'', '2016-10-05 18:37:23.917', N'')
GO

INSERT INTO lessontrack.dbo.AppUsers(UserEmail, PasswordHash, IsAdmin, IsStudent, IsInstructor, LastName, FirstName, MI, Gender, DOB, CellPhone, HomePhone, WorkPhone, Address1, Address2, Address3, City, State, ZIP, Country, CreatedOn, Employer) VALUES (N'bryan@atomichelicopters.com', 0x746F6E79726F636B73, 1, 0, 1, N'Kaasa', N'Bryan', N'', null, N'1990-01-01', '425-555-6352        ', '                    ', '                    ', N'', N'', N'', N'', N'', N'', N'', '2016-01-01 00:00:00.0', N'Atomic Helicopters')
GO

INSERT INTO lessontrack.dbo.AppUsers(UserEmail, PasswordHash, IsAdmin, IsStudent, IsInstructor, LastName, FirstName, MI, Gender, DOB, CellPhone, HomePhone, WorkPhone, Address1, Address2, Address3, City, State, ZIP, Country, CreatedOn, Employer) VALUES (N'gsukumar@outlook.com', null, 1, 1, 0, N'Sukumar', N'Goutham', N'', null, N'2003-01-01', '4255556252          ', '                    ', '                    ', N'', N'', N'', N'', N'', N'', N'', '2016-01-01 00:00:00.0', N'')
GO

INSERT INTO lessontrack.dbo.AppUsers(UserEmail, PasswordHash, IsAdmin, IsStudent, IsInstructor, LastName, FirstName, MI, Gender, DOB, CellPhone, HomePhone, WorkPhone, Address1, Address2, Address3, City, State, ZIP, Country, CreatedOn, Employer) VALUES (N'jack@black.com', null, 0, 1, 0, N'Black', N'Jack', N'', null, N'1970-09-09', '425-555-8372        ', '425-999-0391        ', '425-777-7463        ', N'20440 Pearson Ave', N'Apt 32', N'Room 4', N'Redmond', N'WA', N'98052', N'USA', '2016-09-27 08:26:46.183', N'Microsoft')
GO

INSERT INTO lessontrack.dbo.AppUsers(UserEmail, PasswordHash, IsAdmin, IsStudent, IsInstructor, LastName, FirstName, MI, Gender, DOB, CellPhone, HomePhone, WorkPhone, Address1, Address2, Address3, City, State, ZIP, Country, CreatedOn, Employer) VALUES (N'matt@atomichelicopters.com', 0x746F6E79726F636B73, 1, 0, 1, N'Taylor', N'Matt', N'', null, N'1990-01-01', '425-555-9864        ', '                    ', '                    ', N'', N'', N'', N'', N'', N'', N'', '2016-01-01 00:00:00.0', N'Atomic Helicopters')
GO

INSERT INTO lessontrack.dbo.AppUsers(UserEmail, PasswordHash, IsAdmin, IsStudent, IsInstructor, LastName, FirstName, MI, Gender, DOB, CellPhone, HomePhone, WorkPhone, Address1, Address2, Address3, City, State, ZIP, Country, CreatedOn, Employer) VALUES (N'tours@atomichelicopters.com', 0x61746F6D696332303136, 0, 1, 0, N'galvin', N'pat ', N'', null, null, '                    ', '                    ', '                    ', N'', N'', N'', N'', N'', N'', N'', '2017-05-06 02:22:14.56', N'')
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:34:05.527', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:3', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:45.09', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:4', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:45.217', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:5', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:45.33', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:7', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:45.453', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:8', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:45.577', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:9', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:45.7', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:11', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:45.833', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:12', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:45.95', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:13', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:46.063', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:14', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:46.167', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:16', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:46.287', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:18', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:46.387', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:19', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:46.5', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:20', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:46.61', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:21', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:46.723', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:22', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:46.84', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:23', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:46.967', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:24', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:47.083', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:25', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:47.21', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:26', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:47.33', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:28', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:47.44', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:29', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:47.563', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:31', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:47.687', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:2:883', 1, 2, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:47.8', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:2:884', 1, 2, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:47.933', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:2:885', 1, 2, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:48.047', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:2:886', 1, 2, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:48.16', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:2:888', 1, 2, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:48.283', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:2:889', 1, 2, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:48.407', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:2:890', 1, 2, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:48.533', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:2:891', 1, 2, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:48.66', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:2:892', 1, 2, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:48.78', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:2:894', 1, 2, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:48.893', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:2:895', 1, 2, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:49.033', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:2:896', 1, 2, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:49.15', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:2:897', 1, 2, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:49.27', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:2:898', 1, 2, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:49.383', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:2:899', 1, 2, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:49.537', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:33', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:49.65', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:34', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:49.767', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:35', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:49.9', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:36', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:50.007', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:38', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:50.12', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:39', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:50.243', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:41', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:50.367', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:42', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:50.497', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:43', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:50.613', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:45', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:50.723', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:46', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:50.83', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:47', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:50.96', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:49', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:51.08', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:50', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:51.2', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:51', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:51.31', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:52', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:51.433', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:54', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:51.55', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:56', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:51.66', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:57', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:51.77', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:58', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:51.89', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:59', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:52.013', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:60', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:52.117', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:61', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:52.23', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:62', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:52.36', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:63', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:52.483', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:65', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:52.607', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:66', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:52.72', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:3:68', 1, 3, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:52.833', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:901', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:52.95', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:903', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:53.083', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:904', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:53.2', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:905', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:53.32', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:906', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:53.427', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:907', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:53.53', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:909', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:53.653', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:910', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:53.767', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:911', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:53.893', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:912', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:54.02', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:913', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:54.14', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:915', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:43:54.253', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:916', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:44:44.187', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:917', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:44:44.343', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:918', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:44:44.463', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:919', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:44:44.583', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:921', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:44:44.74', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:922', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:44:44.857', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:923', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:44:44.977', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:924', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:44:45.097', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:926', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:44:45.223', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:927', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:44:45.34', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:928', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 11:44:45.45', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:929', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 19:23:59.407', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:2:882', 1, 2, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 19:24:26.077', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:4:902', 1, 4, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 19:24:26.39', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:5:70', 1, 5, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 19:24:26.407', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:5:73', 1, 5, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 19:24:26.42', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:5:75', 1, 5, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 19:24:53.28', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:5:78', 1, 5, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 19:24:53.297', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:5:80', 1, 5, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 19:24:53.31', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:5:83', 1, 5, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 19:24:53.327', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:5:86', 1, 5, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 19:24:53.343', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:5:88', 1, 5, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 19:26:02.98', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:5:71', 1, 5, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 19:26:03.013', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:5:74', 1, 5, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 19:26:03.043', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:5:76', 1, 5, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 19:26:03.06', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:5:79', 1, 5, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 19:26:03.09', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:5:81', 1, 5, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 19:26:03.12', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:5:84', 1, 5, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 19:26:03.137', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:5:87', 1, 5, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-08 19:26:03.167', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:5:89', 1, 5, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:18:37.51', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:6:931', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:18:37.523', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:6:932', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:18:37.54', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:6:933', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:19:26.57', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:6:935', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:19:26.587', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:6:936', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:19:26.6', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:6:938', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:20:50.537', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:6:947', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:20:50.55', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:6:948', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:21:37.097', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:8:959', 1, 8, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:21:37.127', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:8:960', 1, 8, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.67', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:109', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.687', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:110', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.7', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:111', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.717', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:112', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.733', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:113', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.75', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:114', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.75', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:115', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.763', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:117', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.78', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:118', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.797', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:119', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.81', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:120', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.827', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:121', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.843', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:122', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.857', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:123', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.857', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:124', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.873', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:125', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.89', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:127', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.903', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:128', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.92', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:130', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.937', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:131', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.95', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:132', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.967', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:133', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.967', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:134', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:05.983', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:136', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:06.0', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:137', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:06.013', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:138', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:06.03', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:140', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:06.047', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:141', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-10 19:24:06.06', N'jack@black.com', N'anthony@atomichelicopters.com', null, N'1:9:143', 1, 9, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 15:28:36.81', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:6:934', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 15:28:37.467', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:6:939', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 15:28:37.653', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:6:940', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 15:28:37.827', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:6:941', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 15:28:37.997', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:6:942', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 15:28:38.17', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:6:943', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 15:28:38.31', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:6:944', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 15:28:38.497', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:6:946', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 15:28:38.997', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:6:949', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 15:28:39.153', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:6:950', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 15:28:39.31', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:6:951', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 15:28:39.497', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:6:952', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 15:28:39.653', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:6:953', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 15:28:39.81', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:6:954', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 15:28:39.967', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:6:955', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 15:28:40.137', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:6:956', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 15:28:40.31', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:6:957', 1, 6, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 18:05:39.163', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:10:145', 1, 10, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-16 18:05:39.32', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:10:146', 1, 10, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2016-10-17 01:10:26.197', N'jack@black.com', N'gsukumar@outlook.com', null, N'1:1:2', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2017-05-06 02:39:04.63', N'tours@atomichelicopters.com', N'anthony@atomichelicopters.com', null, N'1:1:2', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2017-05-06 02:39:04.643', N'tours@atomichelicopters.com', N'anthony@atomichelicopters.com', null, N'1:1:3', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2017-05-06 02:39:04.643', N'tours@atomichelicopters.com', N'anthony@atomichelicopters.com', null, N'1:1:4', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2017-05-06 02:39:04.643', N'tours@atomichelicopters.com', N'anthony@atomichelicopters.com', null, N'1:1:5', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.CompletionLogs(DateCompleted, Student, Instructor, AircraftUsed, LessonGUID, STAGEID, LESSONID, HoursSpent) VALUES ('2017-05-06 02:39:04.643', N'tours@atomichelicopters.com', N'anthony@atomichelicopters.com', null, N'1:1:31', 1, 1, 0.00)
GO

INSERT INTO lessontrack.dbo.FAACerts(CertificationID, CertificationName, InfoLink, FAAPart) VALUES (N'141-PVT', N'Private Pilot Helicopter', null, '141       ')
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:1', 'Preflight Preparation', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:2', 'Aircraft Logbooks', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:3', 'Certificates and Documents', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:4', 'Operation of Systems', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:5', 'Minimum Equipment List', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:6', 'Emergency Equipment and Survival Gear', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:7', 'Location of First Aid Kit', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:8', 'Location of Fire Extinguisher', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:9', 'Location of Survival Gear', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:10', 'Preflight Procedures', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:11', 'Preflight Inspection', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:12', 'Cockpit Management', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:13', 'Engine Starting and Rotor Engagement', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:14', 'Before Takeoff Check', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:15', 'Airport and Heliport Operations', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:16', 'Radio Communications', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:17', 'Basic Piloting Skills', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:18', 'Positive Exchange of Flight Controls', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:19', 'Use of Checklists', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:20', 'Climbs', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:21', 'Descents', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:22', 'Level-Off', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:23', 'Straight-and-Level Flight', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:24', 'Shallow Banked Turns In Both', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:25', 'Directions', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:26', 'Ground Safety Precautions', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:27', 'Takeoffs, Landings, and Go-Arounds', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:28', 'Normal Takeoff and Climb', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:29', 'Normal Approach', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:30', 'Postflight Procedures', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (1, 1, N'1:1:31', 'After Landing and Securing', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:32', 'Preflight Preparation', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:33', 'Aircraft Logbooks', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:34', 'Certificates and Documents', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:35', 'Operation of Systems', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:36', 'Minimum Equipment List', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:37', 'Preflight Preparations and Procedures', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:38', 'Helicopter Servicing', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:39', 'Fuel Grades', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:40', 'Basic Piloting Skills', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:41', 'Climbing and Descending Turns', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:42', 'Airspeed Transitions', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:43', 'Collision Avoidance', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:44', 'Emergency Equipment and Survival Gear', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:45', 'Location of First Aid Kit', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:46', 'Location of Fire Extinguisher', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:47', 'Location of Survival Gear', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:48', 'Preflight Procedures', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:49', 'Preflight Inspection', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:50', 'Cockpit Management', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:51', 'Engine Starting and Rotor Engagement', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:52', 'Before Takeoff Check', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:53', 'Airport and Heliport Operations', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:54', 'Radio Communications', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:55', 'Basic Piloting Skills', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:56', 'Positive Exchange of Flight Controls', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:57', 'Use of Checklists', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:58', 'Climbs', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:59', 'Descents', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:60', 'Level-Off', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:61', 'Straight-and-Level Flight', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:62', 'Shallow and Medium Banked Turns In Both Directions', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:63', 'Ground Safety Precautions', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:64', 'Takeoffs, Landings, and Go-Arounds', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:65', 'Normal Takeoff and Climb', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:66', 'Normal Approach', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:67', 'Postflight Procedures', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (3, 1, N'1:3:68', 'After Landing and Securing', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:69', 'Preflight Preparation', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:70', 'Helicopter Servicing', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:71', 'Fuel Grades', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:72', 'Preflight Procedures', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:73', 'Preflight Inspection', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:74', 'Cockpit Management', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:75', 'Engine Starting and Rotor Engagement', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:76', 'Before Takeoff Check', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:77', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:78', 'Positive Exchange of Flight Controls', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:79', 'Climbing and Descending Turns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:80', 'Airspeed Transitions', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:81', 'Collision Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:82', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:83', 'Normal Takeoff and Climb', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:84', 'Normal Approach', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:85', 'Postflight Procedures', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:86', 'After Landing and Securing', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:87', 'Vertical Takeoff to a Hover', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:88', 'Stationary Hovering', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (5, 1, N'1:5:89', 'Vertical Landing From a Hover', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (7, 1, N'1:7:90', 'Preflight Procedures', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (7, 1, N'1:7:91', 'Preflight Inspection', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (7, 1, N'1:7:92', 'Cockpit Management', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (7, 1, N'1:7:93', 'Engine Starting and Rotor Engagement', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (7, 1, N'1:7:94', 'Before Takeoff Ch', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (7, 1, N'1:7:95', 'eck', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (7, 1, N'1:7:96', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (7, 1, N'1:7:97', 'Vertical Takeoff to a Hover', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (7, 1, N'1:7:98', 'Stationary Hovering', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (7, 1, N'1:7:99', 'Vertical Landing From a Hover', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (7, 1, N'1:7:100', 'Postflight Procedures', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (7, 1, N'1:7:101', 'After Landing and Securing', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (7, 1, N'1:7:102', 'Forward, Rearward, and Sideward', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (7, 1, N'1:7:103', 'Hovering', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (7, 1, N'1:7:104', 'Hovering Turns', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (7, 1, N'1:7:105', 'Takeoffs, Landings, and Go-Arounds', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (7, 1, N'1:7:106', 'Crosswind Takeoff and Climb', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (7, 1, N'1:7:107', 'Crosswind Approach', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:108', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:109', 'Vertical Takeoffs and Landings', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:110', 'Forward, Rearward, and Sideward', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:111', 'Hovering', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:112', 'Hovering Turns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:113', 'Cockpit Management', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:114', 'Engine Starting and Rotor Engagement', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:115', 'Before Takeoff Check', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:116', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:117', 'Climbs', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:118', 'Descents', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:119', 'Level-Off', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:120', 'Straight-and-Level Flight', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:121', 'Shallow, Medium, and Steep Banked Turns In Both Directions', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:122', 'Climbing and Descending Turns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:123', 'Ground Safety Precautions', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:124', 'Airspeed Transitions', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:125', 'Collision Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:126', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:127', 'Crosswind Takeoff and Climb', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:128', 'Crosswind Approach', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:129', 'Airport and Heliport Operations', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:130', 'Radio Communications and ATC Light', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:131', 'Signals  Traffic Pattern', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:132', 'Airport and Heliport Markings and', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:133', 'Lighting', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:134', 'Runway Incursion Avoidance', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:135', 'Hovering Maneuvers', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:136', 'Surface Taxi (Applies only to helicopters equipped with wheel-type landing gear)', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:137', 'Hover Taxi', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:138', 'Air Taxi', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:139', 'Basic Piloting Skills', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:140', 'Wake Turbulence Avoidance', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:141', 'Low-Level Wind Shear Considerations', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:142', 'Takeoffs, Landings, and Go-Arounds', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (9, 1, N'1:9:143', 'Go-Around', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:144', 'Airport and Heliport Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:145', 'Radio Communications and ATC Light Signals', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:146', 'Traffic Pattern', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:147', 'Airport and Heliport Markings and Lighting', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:148', 'Runway Incursion Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:149', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:150', 'Vertical Takeoffs and Landings', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:151', 'Surface Taxi (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:152', 'Hover Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:153', 'Air Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:154', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:155', 'Wake Turbulence Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:156', '___ Low-Level Wind Shear Considerations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:157', 'Collision Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:158', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:159', 'Go-Around', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:160', 'Emergency Operations', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:161', 'Straight-In Autorotation With Power Recovery', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:162', 'Power Failure at a Hover', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:163', 'Power Failure at Altitude', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (10, 1, N'1:10:164', 'Simulated Forced Landing Procedures', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (11, 1, N'1:11:165', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (11, 1, N'1:11:166', 'Vertical Takeoffs and Landings', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (11, 1, N'1:11:167', 'Forward, Rearward, and Sideward Hovering', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (11, 1, N'1:11:168', 'Hovering Turns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (11, 1, N'1:11:169', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (11, 1, N'1:11:170', 'Normal Takeoff and Climb', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (11, 1, N'1:11:171', 'Normal Approach', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (11, 1, N'1:11:172', 'Emergency Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (11, 1, N'1:11:173', 'Straight-In Autorotation With Power Recovery', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (11, 1, N'1:11:174', 'Power Failure at a Hover', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (11, 1, N'1:11:175', 'Power Failure at Altitude', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (11, 1, N'1:11:176', 'Simulated Forced Landing Procedures', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (11, 1, N'1:11:177', 'Hovering Maneuvers', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (11, 1, N'1:11:178', 'Hovering Patterns', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (11, 1, N'1:11:179', 'Emergency Operations', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (11, 1, N'1:11:180', '90° Autorotation With Power Recovery', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (13, 1, N'1:13:181', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (13, 1, N'1:13:182', 'Hovering Patterns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (13, 1, N'1:13:183', 'Emergency Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (13, 1, N'1:13:184', '90° Autorotation With Power Recovery', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (13, 1, N'1:13:185', 'Emergency Operations', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (13, 1, N'1:13:186', 'Settling-With-Power', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (13, 1, N'1:13:187', 'Low Rotor RPM Recovery (This task applies to a hover and in flight).', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (13, 1, N'1:13:188', 'Partial Power Failure', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (14, 1, N'1:14:189', 'Emergency Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (14, 1, N'1:14:190', 'Settling-With-Power', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (14, 1, N'1:14:191', 'Low Rotor RPM Recovery', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (14, 1, N'1:14:192', 'Partial Power Failure', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (14, 1, N'1:14:193', 'Systems and Equipment Malfunctions', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (14, 1, N'1:14:194', 'Electrical System Malfunction', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (14, 1, N'1:14:195', 'Electrical Fire or Smoke', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (14, 1, N'1:14:196', 'Hydraulic System Malfunction (If Applicable)', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (14, 1, N'1:14:197', 'Engine and Components Malfunctions', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (14, 1, N'1:14:198', 'Antitorque Failure (This task applies to a hover and in flight).', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (14, 1, N'1:14:199', 'Power Train Failure', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (14, 1, N'1:14:200', 'Abnormal Vibrations', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (14, 1, N'1:14:201', '__ Warning Lights', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (14, 1, N'1:14:202', 'Tachometer Failure', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (14, 1, N'1:14:203', 'Induction System Icing', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:204', 'Airport and Heliport Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:205', 'Traffic Pattern', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:206', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:207', 'Vertical Takeoffs and Landings', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:208', 'Hovering Patterns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:209', 'Takeoffs, Landings and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:210', 'Normal Approach', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:211', 'Go-Around', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:212', 'Emergency Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:213', 'Straight-In Autorotation With Power Recovery', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:214', '90°Autorotation With Power Recovery', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:215', 'Power Failure at a Hover', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:216', 'Power Failure at Altitude', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:217', 'Simulated Forced Landing Procedures', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:218', 'Settling-With-Power', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:219', 'Low Rotor RPM Recovery', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:220', 'Partial Power Failure', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:221', 'Systems and Equipment Malfunctions', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:222', 'Electrical System Malfunction', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:223', 'Electrical Fire or Smoke', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:224', 'Hydraulic System Malfunction (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:225', 'Engine and Components Malfunctions', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:226', 'Antitorque Failure (This task applies to a hover and in flight).', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:227', 'Power Train Failure', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:228', 'Abnormal Vibrations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:229', 'Warning Lights', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:230', 'Tachometer Failure', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:231', 'Induction System Icing', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:232', 'Basic Piloting Skills', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (16, 1, N'1:16:233', 'Rapid Deceleration', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:234', 'Preflight Preparation and Procedures', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:235', 'Operation of Systems', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:236', 'Preflight Inspection', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:237', 'Cockpit Management', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:238', 'Engine Starting and Rotor Engagement', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:239', 'Before Takeoff Check', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:240', 'Airport and Heliport Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:241', 'Radio Communications and ATC Light Signals', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:242', 'Traffic Pattern', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:243', 'Airport and Heliport Markings and Lighting', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:244', 'Runway Incursion Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:245', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:246', 'Vertical Takeoffs and Landings', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:247', 'Forward, Rearward, and Sideward Hovering', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:248', 'Hovering Turns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:249', 'Surface Taxi (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:250', 'Hover Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:251', 'Air Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:252', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:253', 'Use of Checklists', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:254', 'Rapid Deceleration', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:255', 'Wake Turbulence Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:256', 'Low-Level Wind Shear Considerations Collision Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:257', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:258', 'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:259', 'Go-Around', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:260', 'Emergency Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:261', 'Straight-In Autorotation With Power Recovery', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:262', '90°Autorotation With Power Recovery', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:263', 'Power Failure at a Hover', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:264', 'Power Failure at Altitude', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:265', 'Simulated Forced Landing Procedures', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:266', 'Settling-With-Power', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:267', 'Low Rotor RPM Recovery', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:268', 'Partial Power Failure', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:269', 'Postflight Procedures', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (17, 1, N'1:17:270', 'After Landing and Securing', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:271', 'Preflight Preparation and Procedures Airport and Heliport Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:272', 'Radio Communications and ATC Light Signals', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:273', 'Traffic Pattern', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:274', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:275', 'Vertical Takeoffs and Landings', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:276', 'Surface Taxi (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:277', 'Hover Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:278', 'Air Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:279', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:280', 'Wake Turbulence Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:281', 'Collision Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:282', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:283', 'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:284', 'Go-Around', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:285', 'Supervised Solo', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:286', 'Preflight Preparation and Procedures Airport and Heliport Operations', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:287', 'Radio Communications and ATCLight Signals', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:288', 'Traffic Pattern', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:289', 'Hovering Maneuvers', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:290', 'Vertical Takeoffs and Landings', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:291', 'Stationary Hover', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:292', 'Surface Taxi (If Applicable)', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:293', 'Hover Taxi', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:294', 'Air Taxi', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:295', 'Basic Piloting Skills', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:296', 'Wake Turbulence Avoidance', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:297', 'Collision Avoidance', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:298', 'Takeoffs, Landings, and Go-Arounds', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:299', 'Normal and Crosswind Takeoffs, Climbs, and Approaches  Go-Around', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (19, 1, N'1:19:300', 'Go-Around', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:301', 'Preflight Preparation and Procedures', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:302', 'Certificates and Documents', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:303', 'Operation of Systems', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:304', 'Preflight Inspection', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:305', 'Cockpit Management', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:306', 'Engine Starting and Rotor Engagement', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:307', 'Before Takeoff Check', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:308', 'Airport and Heliport Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:309', 'Radio Communications and ATC Light Signals  Traffic Pattern', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:310', 'Airport and Heliport Markings and', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:311', 'Lighting', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:312', 'Runway Incursion Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:313', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:314', 'Vertical Takeoffs and Landings', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:315', 'Forward, Rearward, and Sideward Hovering', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:316', 'Hovering Turns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:317', 'Surface Taxi (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:318', 'Hover Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:319', 'Air Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:320', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:321', 'Use of Checklists', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:322', 'Climbing and Descending Turns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:323', 'Level-Off', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:324', 'Straight-and-Level Flight', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:325', 'Airspeed Transitions', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:326', 'Rapid Deceleration', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:327', 'Ground Safety Precautions', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:328', 'Wake Turbulence Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:329', 'Collision Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:330', 'Low-Level Wind Shear Considerations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:331', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:332', 'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:333', 'Go-Around', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:334', 'Emergency Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:335', 'Straight-In Autorotation With Power Recovery', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:336', '90° Autorotation With Power Recovery', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:337', 'Power Failure at a Hover', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:338', 'Power Failure at Altitude', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:339', 'Simulated Forced Landing Procedures', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:340', 'Settling-With-Power', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:341', 'Low Rotor RPM Recovery', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:342', 'Partial Power Failure', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:343', 'Systems and Equipment Malfunctions', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:344', 'Postflight Procedures', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (21, 1, N'1:21:345', 'After Landing and Securing', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:346', 'Preflight Preparation and Procedures', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:347', 'Airport and Heliport Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:348', 'Radio Communications and ATC Light Signals', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:349', 'Traffic Pattern', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:350', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:351', 'Vertical Takeoffs and Landings', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:352', 'Surface Taxi (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:353', 'Hover Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:354', 'Air Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:355', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:356', 'Wake Turbulence Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:357', 'Collision Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:358', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:359', 'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:360', 'Go-Around', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:361', 'Supervised Solo', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:362', 'Preflight Preparation and Procedures', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:363', 'Airport and Heliport Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:364', 'Radio Communications and ATC Light Signals', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:365', 'Traffic Pattern', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:366', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:367', 'Vertical Takeoffs and Landings', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:368', 'Stationary Hover', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:369', 'Surface Taxi (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:370', 'Hover Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:371', 'Air Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:372', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:373', 'Wake Turbulence Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:374', 'Collision Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:375', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:376', 'Normal and Crosswind Takeoffs,Climbs, and Approaches', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (22, 2, N'2:22:377', 'Go-Around', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:378', 'Preflight Preparation and Procedures', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:379', 'Airport and Heliport Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:380', 'Radio Communications and ATC Light Signals', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:381', 'Traffic Pattern', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:382', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:383', 'Vertical Takeoffs and Landings', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:384', 'Forward, Rearward, and Sideward', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:385', 'Hovering', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:386', 'Hovering Turns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:387', 'Hovering Patterns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:388', 'Surface Taxi (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:389', 'Hover Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:390', 'Air Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:391', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:392', 'Wake Turbulence Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:393', 'Collision Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:394', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:395', 'Normal and Crosswind Takeoffs,', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:396', 'Climbs, and Approaches', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (23, 2, N'2:23:397', 'Go-Around', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (24, 2, N'2:24:398', 'As directed by the Instructor', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (24, 2, N'2:24:399', 'Takeoffs, Landings, and Go-Arounds', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (24, 2, N'2:24:400', 'Maximum Performance Takeoff and Climb', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (24, 2, N'2:24:401', 'Steep Approach', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (24, 2, N'2:24:402', 'Rolling Takeoff (Applies only to helicopters equipped with wheel-type landing gear)', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (24, 2, N'2:24:403', 'Running Takeoff', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (24, 2, N'2:24:404', 'Shallow Approach and Running/Roll-On Landing', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (25, 2, N'2:25:405', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (25, 2, N'2:25:406', 'Rapid Deceleration', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (25, 2, N'2:25:407', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (25, 2, N'2:25:408', 'Maximum Performance Takeoff and Climb', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (25, 2, N'2:25:409', 'Steep Approach', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (25, 2, N'2:25:410', 'Rolling Takeoff (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (25, 2, N'2:25:411', 'Running Takeoff', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (25, 2, N'2:25:412', 'Shallow Approach and Running/Roll-On Landing', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (25, 2, N'2:25:413', 'Hovering Maneuvers', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (25, 2, N'2:25:414', 'Slope Operations', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (25, 2, N'2:25:415', 'Emergency Operations', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (25, 2, N'2:25:416', 'Retreating Blade Stall (Discussion Only)', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (25, 2, N'2:25:417', 'Dynamic Rollover (Discussion Only)', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (27, 2, N'2:27:418', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (27, 2, N'2:27:419', 'Slope Operations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (27, 2, N'2:27:420', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (27, 2, N'2:27:421', 'Rapid Deceleration', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (27, 2, N'2:27:422', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (27, 2, N'2:27:423', 'Maximum Performance Takeoff and Climb', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (27, 2, N'2:27:424', 'Steep Approach', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (27, 2, N'2:27:425', 'Rolling Takeoff (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (27, 2, N'2:27:426', 'Running Takeoff', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (27, 2, N'2:27:427', 'Shallow Approach and Running/Roll-On Landing', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (27, 2, N'2:27:428', 'Emergency Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (27, 2, N'2:27:429', 'Retreating Blade Stall (Discussion Only)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (27, 2, N'2:27:430', 'Dynamic Rollover (Discussion Only)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (27, 2, N'2:27:431', 'Emergency Operations', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (27, 2, N'2:27:432', 'Ground Resonance (Discussion Only)', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (27, 2, N'2:27:433', 'Low G Conditions (Discussion Only)', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (27, 2, N'2:27:434', 'Low Rotor RPM and Blade Stall Discussion Only)', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (29, 2, N'2:29:435', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (29, 2, N'2:29:436', 'Vertical Takeoffs and Landings', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (29, 2, N'2:29:437', 'Forward, Rearward, and Sideward Hovering', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (29, 2, N'2:29:438', 'Hovering Turns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (29, 2, N'2:29:439', 'Hovering Patterns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (29, 2, N'2:29:440', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (29, 2, N'2:29:441', 'Rapid Deceleration', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (29, 2, N'2:29:442', 'Wake Turbulence Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (29, 2, N'2:29:443', 'Collision Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (29, 2, N'2:29:444', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (29, 2, N'2:29:445', 'Maximum Performance Takeoff andClimb', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (29, 2, N'2:29:446', 'Steep Approach', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (29, 2, N'2:29:447', 'Go-Around', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (30, 2, N'2:30:448', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (30, 2, N'2:30:449', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (30, 2, N'2:30:450', 'Rapid Deceleration', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (30, 2, N'2:30:451', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (30, 2, N'2:30:452', 'Maximum Performance Takeoff and Climb', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (30, 2, N'2:30:453', 'Steep Approach', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (30, 2, N'2:30:454', 'Rolling Takeoff (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (30, 2, N'2:30:455', 'Running Takeoff', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (30, 2, N'2:30:456', 'Shallow Approach and Running/Roll-On Landing', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (32, 2, N'2:32:457', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (32, 2, N'2:32:458', 'Vertical Takeoffs and Landings', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (32, 2, N'2:32:459', 'Forward, Rearward, and Sideward Hovering', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (32, 2, N'2:32:460', 'Hovering Turns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (32, 2, N'2:32:461', 'Hovering Patterns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (32, 2, N'2:32:462', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (32, 2, N'2:32:463', 'Rapid Deceleration', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (32, 2, N'2:32:464', 'Wake Turbulence Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (32, 2, N'2:32:465', 'Collision Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (32, 2, N'2:32:466', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (32, 2, N'2:32:467', 'Maximum Performance Takeoff and Climb', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (32, 2, N'2:32:468', 'Steep Approach', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (32, 2, N'2:32:469', 'Go-Around', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (34, 2, N'2:34:470', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (34, 2, N'2:34:471', 'Slope Operations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (34, 2, N'2:34:472', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (34, 2, N'2:34:473', 'Rapid Deceleration', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (34, 2, N'2:34:474', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (34, 2, N'2:34:475', 'Maximum Performance Takeoff and Climb', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (34, 2, N'2:34:476', 'Steep Approach', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (34, 2, N'2:34:477', 'Rolling Takeoff (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (34, 2, N'2:34:478', 'Running Takeoff', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (34, 2, N'2:34:479', 'Shallow Approach and Running/Roll-On Landing', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (34, 2, N'2:34:480', 'Emergency Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (34, 2, N'2:34:481', 'Retreating Blade Stall (Discussion Only)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (34, 2, N'2:34:482', 'Dynamic Rollover (Discussion Only)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (34, 2, N'2:34:483', 'Ground Resonance (Discussion Only)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (34, 2, N'2:34:484', 'Low G Conditions (Discussion Only)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (34, 2, N'2:34:485', 'Low Rotor RPM and Blade Stall', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (36, 3, N'3:36:486', 'Night Operations', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (36, 3, N'3:36:487', 'Flight Planning Considerations', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (36, 3, N'3:36:488', 'Use of Checklists', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (36, 3, N'3:36:489', 'Preflight Inspection', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (36, 3, N'3:36:490', 'Physiological Aspects of Night Flying', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (36, 3, N'3:36:491', 'Lighting and Equipment for Night Flying', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (36, 3, N'3:36:492', 'Cockpit Management', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (36, 3, N'3:36:493', 'Normal and Crosswind Takeoffs,Climbs, and Approaches', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (36, 3, N'3:36:494', 'Vertical Takeoffs and Landings', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (36, 3, N'3:36:495', 'Hovering Maneuvers', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (36, 3, N'3:36:496', 'Straight-In Autorotation With Power Recovery', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (36, 3, N'3:36:497', 'Use of Landing Light', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:498', 'Cross-Country Flight Planning', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:499', 'Sectional Charts', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:500', 'Flight Publications', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:501', 'Route Selection', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:502', 'Weather Information', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:503', 'Navigation Log', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:504', 'FAA Flight Plan', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:505', 'National Airspace System', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:506', 'Performance and Limitations', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:507', 'Weight and Balance', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:508', 'Aeromedical Factors', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:509', 'Cockpit Management', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:510', 'Crew Resource Management', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:511', 'Airport or Heliport Operations', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:512', 'Approach and Departure Control', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:513', 'Controlled Airports/Heliports', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:514', 'Use of ATIS', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:515', 'CTAF (FSS or UNICOM) Airports', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:516', 'Cross-Country Flight', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:517', 'Departure', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:518', 'Opening Flight Plan', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:519', 'Power Settings and Mixture Control', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:520', 'Lost Communications', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:521', 'Collision Avoidance', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:522', 'Closing Flight Plan', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:523', 'Navigation', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:524', 'Pilotage and Dead Reckoning', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:525', 'Radio Navigation and Radar Services', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:526', 'Position Fixes', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:527', 'Adverse Weather', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:528', 'Diversion', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:529', 'Lost Procedures', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:530', 'Emergency Operations', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (38, 3, N'3:38:531', 'Systems and Equipment Malfunctions', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:532', 'Cross-Country Flight Planning', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:533', 'Sectional Charts', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:534', 'Flight Publications', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:535', 'Route Selection', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:536', 'Weather Information', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:537', 'Navigation Log', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:538', 'FAA Flight Plan', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:539', 'National Airspace System', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:540', 'Performance and Limitations', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:541', 'Weight and Balance', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:542', 'Aeromedical Factors', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:543', 'Cockpit Management', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:544', 'Crew Resource Management', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:545', 'Airport or Heliport Operations', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:546', 'Approach and Departure Control', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:547', 'Controlled Airports/Heliports', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:548', 'Use of ATIS', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:549', 'CTAF (FSS or UNICOM) Airports', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:550', 'Cross-Country Flight', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:551', 'Departure', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:552', 'Opening Flight Plan', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:553', 'Power Settings and Mixture Control', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:554', 'Lost Communications', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:555', 'Collision Avoidance', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:556', 'Closing Flight Plan', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:557', 'Navigation', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:558', 'Pilotage and Dead Reckoning', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:559', 'Radio Navigation and Radar Services', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:560', 'Position Fixes', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:561', 'Adverse Weather', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:562', 'Diversion', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:563', 'Lost Procedures', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:564', 'Emergency Operations', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (40, 3, N'3:40:565', 'Systems and Equipment Malfunctions', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:566', 'Cross-Country Flight Planning', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:567', 'Sectional Charts', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:568', 'Flight Publications', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:569', 'Route Selection', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:570', 'Weather Information', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:571', 'Navigation Log', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:572', 'FAA Flight Plan', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:573', 'National Airspace System', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:574', 'Performance and Limitations', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:575', 'Weight and Balance', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:576', 'Aeromedical Factors', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:577', 'Cockpit Management', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:578', 'Crew Resource Management', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:579', 'Airport or Heliport Operations', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:580', 'Approach and Departure Control', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:581', 'Controlled Airports/Heliports', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:582', 'Use of ATIS', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:583', 'CTAF (FSS or UNICOM) Airports', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:584', 'Night Operations', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:585', 'Flight Planning Considerations', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:586', 'Use of Checklists', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:587', 'Preflight Inspection', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:588', 'Physiological Aspects of Night Flying', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:589', 'Lighting and Equipment for Night Flying', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:590', 'Cockpit Management', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:591', 'Normal and Crosswind Takeoffs,Climbs, and Approaches', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:592', 'Vertical Takeoffs and Landings', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:593', 'Hovering Maneuvers', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:594', 'Straight-In Autorotation With Power Recovery', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:595', 'Use of Landing Light', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:596', 'Cross-Country Flight', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:597', 'Departure', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:598', 'Opening Flight Plan', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:599', 'Power Settings and Mixture Control', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:600', 'Lost Communications', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:601', 'Collision Avoidance', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:602', 'Closing Flight Plan', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:603', 'Navigation', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:604', 'Pilotage and Dead Reckoning', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:605', 'Radio Navigation and Radar Services', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:606', 'Position Fixes', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:607', 'Adverse Weather', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:608', 'Diversion', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (42, 3, N'3:42:609', 'Lost Procedures', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:610', 'Preflight Preparation', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:611', 'Aircraft Logbooks', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:612', 'Certificates and Documents', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:613', 'Operation of Systems', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:614', 'Minimum Equipment List', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:615', 'Emergency Equipment and Survival Gear', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:616', 'Cross-Country Flight Planning', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:617', 'Weather Information', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:618', 'Performance and Limitations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:619', 'Weight and Balance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:620', 'National Airspace System', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:621', 'Aeromedical Factors', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:622', 'Preflight Procedures', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:623', 'Preflight Inspection', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:624', 'Cockpit Management', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:625', '__ Engine Starting and Rotor Engagement', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:626', 'Before Takeoff Check', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:627', 'Airport and Heliport Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:628', 'Radio Communications and ATC Light Signals', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:629', 'Traffic Pattern', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:630', 'Airport and Heliport Markings and Lighting', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:631', 'Runway Incursion Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:632', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:633', 'Vertical Takeoffs and Landings', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:634', 'Hovering Patterns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:635', 'Surface Taxi (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:636', 'Hover Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:637', 'Air Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:638', 'Slope Operations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:639', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:640', 'Use of Checklists', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:641', 'Ground Safety Precautions', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:642', 'Rapid Deceleration', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:643', 'Wake Turbulence Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:644', 'Low-Level Wind Shear Considerations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:645', 'Collision Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:646', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:647', 'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:648', 'Maximum Performance Takeoff and Climb', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:649', 'Steep Approach', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:650', 'Rolling Takeoff (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:651', 'Running Takeoff', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:652', 'Shallow Approach and Running/Roll-On Landing', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:653', 'Go-Around', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:654', 'Emergency Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:655', 'Straight-In Autorotation With Power Recovery', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:656', '90° Autorotation With Power Recovery', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:657', 'Power Failure at a Hover', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:658', 'Power Failure at Altitude', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:659', 'Settling-With-Power', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:660', 'Low Rotor RPM Recovery', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:661', 'Partial Power Failure', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:662', 'Retreating Blade Stall (Discussion Only)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:663', 'Dynamic Rollover (Discussion Only)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:664', 'Ground Resonance (Discussion Only)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:665', 'Low G Conditions (Discussion Only)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:666', 'Low Rotor RPM and Blade Stall (Discussion Only)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:667', 'Systems and Equipment Malfunctions', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:668', 'Cross-Country Flight Navigation', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (43, 3, N'3:43:669', 'Postflight Procedures', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:670', 'Preflight Preparation and Procedures', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:671', 'Preflight Inspection', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:672', 'Cockpit Management', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:673', 'Engine Starting and Rotor Engagement', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:674', 'Before Takeoff Check', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:675', 'Airport and Heliport Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:676', 'Radio Communications and ATC Light Signals', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:677', 'Traffic Pattern', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:678', 'Airport and Heliport Markings and Lighting', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:679', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:680', 'Vertical Takeoffs and Landings', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:681', 'Forward, Rearward, and Sideward Hovering', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:682', 'Hovering Turns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:683', 'Surface Taxi (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:684', 'Hover Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:685', 'Air Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:686', 'Slope Operations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:687', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:688', 'Rapid Deceleration', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:689', 'Wake Turbulence Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:690', 'Low-Level Wind Shear Considerations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:691', 'Collision Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:692', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:693', 'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:694', 'Maximum Performance Takeoff and Climb', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:695', 'Steep Approach', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:696', 'Rolling Takeoff (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:697', 'Running Takeoff', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:698', 'Shallow Approach and Running/Roll-On Landing', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (45, 3, N'3:45:699', 'Go-Around', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:700', 'Preflight Preparation and Procedures', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:701', 'Preflight Inspection', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:702', 'Cockpit Management', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:703', 'Engine Starting and Rotor Engagement', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:704', 'Before Takeoff Check', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:705', 'Airport and Heliport Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:706', 'Radio Communications and ATC Light Signals', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:707', 'Traffic Pattern', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:708', 'Airport and Heliport Markings and Lighting', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:709', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:710', 'Vertical Takeoffs and Landings', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:711', 'Forward, Rearward, and Sideward Hovering', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:712', 'Hovering Turns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:713', 'Surface Taxi (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:714', 'Hover Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:715', 'Air Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:716', 'Slope Operations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:717', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:718', 'Rapid Deceleration', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:719', 'Wake Turbulence Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:720', 'Low-Level Wind Shear Considerations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:721', 'Collision Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:722', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:723', 'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:724', 'Maximum Performance Takeoff and Climb', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:725', 'Steep Approach', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:726', 'Rolling Takeoff (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:727', 'Running Takeoff', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:728', 'Shallow Approach and Running/Roll-On Landing', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (46, 3, N'3:46:729', 'Go-Around', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:730', 'Cross-Country Flight Planning', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:731', 'Sectional Charts', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:732', 'Flight Publications', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:733', 'Route Selection', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:734', 'Weather Information', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:735', 'Navigation Log', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:736', 'FAA Flight Plan', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:737', 'National Airspace System', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:738', 'Performance and Limitations', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:739', 'Weight and Balance', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:740', 'Aeromedical Factors', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:741', 'Cockpit Management', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:742', 'Crew Resource Management', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:743', 'Airport or Heliport Operations', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:744', 'Approach and Departure Control', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:745', 'Controlled Airports/Heliports', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:746', 'Use of ATIS', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:747', 'CTAF (FSS or UNICOM) Airports', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:748', 'Cross-Country Flight', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:749', 'Departure', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:750', 'Opening Flight Plan', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:751', 'Power Settings and Mixture Control', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:752', 'Lost Communications', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:753', 'Collision Avoidance', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:754', 'Closing Flight Plan', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:755', 'Navigation', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:756', 'Pilotage and Dead Reckoning', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:757', 'Radio Navigation and Radar Services', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:758', 'Position Fixes', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:759', 'Adverse Weather', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:760', 'Diversion', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:761', 'Lost Procedures', 0, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:762', 'Emergency Operations', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (47, 3, N'3:47:763', 'Systems and Equipment Malfunctions', 1, 0, 1)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:764', 'Preflight Preparation', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:765', 'Aircraft Logbooks', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:766', 'Certificates and Documents', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:767', 'Operation of Systems', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:768', 'Minimum Equipment List', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:769', 'Emergency Equipment and Survival Gear', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:770', 'Location of First Aid Kit', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:771', 'Location of Fire Extinguisher', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:772', 'Location of Survival Gear', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:773', 'Cross-Country Flight Planning', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:774', 'Weather Information', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:775', 'Navigation Log', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:776', 'FAA Flight Plan', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:777', 'Performance and Limitations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:778', 'Weight and Balance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:779', 'National Airspace System', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:780', 'Aeromedical Factors', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:781', 'Crew Resource Management', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:782', 'Preflight Procedures', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:783', 'Preflight Inspection', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:784', 'Cockpit Management', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:785', 'Engine Starting and Rotor Engagement', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:786', 'Before Takeoff Check', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:787', 'Airport and Heliport Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:788', 'Radio Communications and ATC Light Signals', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:789', 'Traffic Pattern', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:790', 'Airport and Heliport Markings and Lighting', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:791', 'Runway Incursion Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:792', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:793', 'Vertical Takeoffs and Landings', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:794', 'Forward, Rearward, and Sideward Hovering', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:795', 'Hovering Turns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:796', 'Surface Taxi (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:797', 'Hover Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:798', 'Air Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:799', 'Slope Operations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:800', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:801', 'Use of Checklists', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:802', 'Rapid Deceleration', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:803', 'Wake Turbulence Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:804', 'Low-Level Wind Shear Considerations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:805', 'Collision Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:806', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:807', 'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:808', 'Maximum Performance Takeoff and Climb', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:809', 'Operation of Systems', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:810', 'Minimum Equipment List', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:811', 'Emergency Equipment and Survival Gear', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:812', 'Location of First Aid Kit', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:813', 'Location of Fire Extinguisher', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:814', 'Location of Survival Gear', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:815', 'Cross-Country Flight Planning', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:816', 'Weather Information', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:817', 'Navigation Log', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:818', 'FAA Flight Plan', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:819', 'Performance and Limitations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:820', 'Weight and Balance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:821', 'National Airspace System', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:822', 'Aeromedical Factors', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:823', 'Crew Resource Management', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:824', 'Preflight Procedures', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:825', 'Preflight Inspection', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:826', 'Cockpit Management', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:827', 'Engine Starting and Rotor Engagement', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:828', 'Before Takeoff Check', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:829', 'Airport and Heliport Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:830', 'Radio Communications and ATC Light Signals', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:831', 'Traffic Pattern', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:832', 'Airport and Heliport Markings and Lighting', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:833', 'Runway Incursion Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:834', 'Hovering Maneuvers', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:835', 'Vertical Takeoffs and Landings', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:836', 'Forward, Rearward, and Sideward Hovering', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:837', 'Hovering Turns', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:838', 'Surface Taxi (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:839', 'Hover Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:840', 'Air Taxi', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:841', 'Slope Operations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:842', 'Basic Piloting Skills', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:843', 'Use of Checklists', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:844', 'Rapid Deceleration', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:845', 'Wake Turbulence Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:846', 'Low-Level Wind Shear Considerations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:847', 'Collision Avoidance', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:848', 'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:849', 'Normal and Crosswind Takeoffs Climbs, and Approaches', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:850', 'Maximum Performance Takeoff and Climb', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:851', 'Steep Approach', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:852', 'Rolling Takeoff (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:853', 'Running Takeoff', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:854', 'Shallow Approach and Running/Roll-On Landing', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:855', 'Go-Around', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:856', 'Emergency Operations', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:857', 'Straight-in Autorotation With Power Recovery', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:858', 'Power Failure at a Hover', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:859', 'Power Failure at Altitude', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:860', 'Settling-With-Power', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:861', 'Low Rotor RPM Recovery', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:862', 'Retreating Blade Stall (Discussion Only)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:863', 'Dynamic Rollover (Discussion Only)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:864', 'Ground Resonance (Discussion Only)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:865', 'Low G Conditions (Discussion Only)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:866', 'Low Rotor RPM and Blade Stall(Discussion Only)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:867', 'Systems and Equipment Malfunctions', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:868', 'Electrical System Malfunction', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:869', 'Electrical Fire or Smoke', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:870', 'Hydraulic System Malfunction (If Applicable)', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:871', 'Engine and Components Malfunctions', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:872', 'Antitorque Failure (This task applies to a hover and in flight).', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:873', 'Power Train Failure', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:874', 'Abnormal Vibrations', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:875', 'Warning Lights', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:876', 'Tachometer Failure', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:877', 'Induction System Icing', 0, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:878', 'Cross-Country Flight', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:879', 'Navigation', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (48, 3, N'3:48:880', 'Postflight Procedures', 1, 1, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:881', 'Section A - Introduction to the Helicopter', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:882', 'The Main Rotor System', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:883', 'Antitorque Systems', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:884', 'Landing Gear', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:885', 'Powerplant', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:886', 'Aircraft Certification', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:887', 'Section B - Aerodynamic Forces', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:888', 'Lift', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:889', 'Weight', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:890', 'Drag', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:891', 'Thrust', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:892', 'Lift Equation', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:893', 'Section C - Forces in Flight', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:894', 'Hovering', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:895', 'Ground Effect', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:896', 'Forward Flight', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:897', 'Autorotation', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:898', 'The Three Axes', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (2, 1, N'1:2:899', 'Turning Flight', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:900', 'Section A - Flight Control Systems', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:901', 'Collective Pitch', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:902', 'Cyclic Pitch', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:903', 'Swash Plate Assembly', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:904', 'Antitorque Control', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:905', 'Trim Systems', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:906', 'Friction Systems', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:907', 'RPM and Manifold Pressure Instruments', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:908', 'Section B - The Reciprocating Engine and Related Systems', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:909', 'Principles of Operation', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:910', 'Ignition System', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:911', 'Oil System', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:912', 'Cooling the Engine', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:913', 'Turboshaft Engines', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:914', 'Section C - Fuel and Electrical Systems', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:915', 'Fuel Systems', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:916', 'Fuel Supply System', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:917', 'Induction System', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:918', 'Refueling', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:919', 'Electrical Systems', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:920', 'Section D - Power Train Systems', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:921', 'Clutch', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:922', 'Transmission', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:923', 'Tail Rotor Drive System', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:924', 'Freewheeling Unit', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:925', 'Section E - Flight Instruments', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:926', 'Magnetic Compass', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:927', 'Outside Air Temperature Gauge', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:928', 'Pitot-Static Instruments', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (4, 1, N'1:4:929', 'Gyroscopic Flight Instruments', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:930', 'Section A - Safety of Flight', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:931', 'Visual Scanning', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:932', 'Blind Spots and Aircraft Design', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:933', 'Right-Of-Way Rules', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:934', 'Minimum Safe Altitudes', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:935', 'VFR Cruising Altitudes', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:936', 'Special Safety Considerations', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:937', 'Section B - Airports and Heliports', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:938', 'Controlled and Uncontrolled Airports', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:939', 'Traffic Patterns', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:940', 'Basic Runway Markings', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:941', 'Heliports', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:942', 'Taxiways', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:943', 'Airport and Heliport Aids', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:944', 'Noise Abatement Procedures', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:945', 'Section C - Airspace', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:946', 'Controlled Airspace', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:947', 'Class A Airspace', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:948', 'Class B Airspace', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:949', 'Class C Airspace', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:950', 'Class D Airspace', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:951', 'Class E Airspace', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:952', 'Cloud Clearance and Visibility Requirements', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:953', 'Class G Airspace (Uncontrolled)', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:954', 'Special Use Airspace', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:955', 'Other Airspace Areas', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:956', 'Emergency Air Traffic Rules', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (6, 1, N'1:6:957', 'ADIZ', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:958', 'Section A - Radio Communications', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:959', 'VHF Communications Equipment', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:960', 'Coordinated Universal Time', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:961', 'Using the Radio', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:962', 'Radio Procedures', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:963', 'Common Traffic Advisory Frequency', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:964', 'Flight Service Stations', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:965', 'Section B - Radar and ATC Services', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:966', 'Radar', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:967', 'Transponder', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:968', 'FAA Radar Systems', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:969', 'VFR Radar Services', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:970', 'ATC Facilities at Controlled Airports', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:971', 'Lost Communications Procedures', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:972', 'Emergency Procedures', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:973', 'Section C - Predicting Performance', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:974', 'Factors Affecting Performance', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:975', 'The Pilot’s Operating Handbook', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:976', 'Performance Charts', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:977', 'Operating Limitations and Markings', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:978', 'Section D - Weight and Balance', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:979', 'Aircraft Weight', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:980', 'Aircraft Balance', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:981', 'Weight and Balance Control', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (8, 1, N'1:8:982', 'Weight and Balance Calculation', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (12, 1, N'1:12:983', '14 CFR Part 1', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (12, 1, N'1:12:984', '14 CFR Part 61', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (12, 1, N'1:12:985', '14 CFR Part 91', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (12, 1, N'1:12:986', 'NTSB Part 830', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:987', 'Section A - Basic Weather Theory', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:988', 'The Atmosphere', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:989', 'Atmospheric Circulation', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:990', 'Wind', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:991', 'Moisture', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:992', 'Change of State', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:993', 'Humidity', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:994', 'Section B - Weather Patterns', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:995', 'Atmospheric Stability', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:996', 'Clouds', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:997', 'Airmasses', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:998', 'Fronts', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:999', 'Section C - Weather Hazards”', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:1000', 'Thunderstorms', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:1001', 'Turbulence', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:1002', 'Wind Shear', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:1003', 'Wake Turbulence', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:1004', 'Low Visibility', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:1005', 'Icing', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (15, 1, N'1:15:1006', 'Cold Weather Operations', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (18, 1, N'1:18:1007', 'PreSolo written exam and briefing', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (20, 1, N'1:20:1008', 'Principles of Flight', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (20, 1, N'1:20:1009', 'Helicopter Systems and Instruments', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (20, 1, N'1:20:1010', 'The Flight Environment', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (20, 1, N'1:20:1011', 'Communications and Performance', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (20, 1, N'1:20:1012', 'Meteorology For Pilots”', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (20, 1, N'1:20:1013', 'FAR/AIM — Private Pilot Regulations', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (26, 2, N'2:26:1014', 'Section A - Printed Reports and Forecasts', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (26, 2, N'2:26:1015', 'Aviation Routine Weather Reports(METAR)', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (26, 2, N'2:26:1016', 'Additional Reports', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (26, 2, N'2:26:1017', 'Terminal Aerodrome Forecasts (TAF)', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (26, 2, N'2:26:1018', 'Area Forecasts', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (26, 2, N'2:26:1019', 'Winds and Temperatures Aloft Forecasts', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (26, 2, N'2:26:1020', 'Severe Weather Reports and Forecasts', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (26, 2, N'2:26:1021', 'Section B - Graphic Weather Products', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (26, 2, N'2:26:1022', 'Surface Analysis Chart', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (26, 2, N'2:26:1023', 'Weather Depiction Chart', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (26, 2, N'2:26:1024', 'Radar Summary Chart', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (26, 2, N'2:26:1025', 'Low-Level Significant Weather Prog', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (26, 2, N'2:26:1026', 'Section C - Sources of Weather Information', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (26, 2, N'2:26:1027', 'Preflight Weather Briefings', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (26, 2, N'2:26:1028', 'Supplemental Weather Sources', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (26, 2, N'2:26:1029', 'In-Flight Weather Services', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1030', 'Section A - Aeronautical Charts', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1031', 'Sectional Charts', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1032', 'VFR Terminal Charts', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1033', 'World Aeronautical Charts', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1034', 'Latitude and Longitude', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1035', 'Legend', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1036', 'Section B - Flight Computers', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1037', 'Navigation Theory', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1038', 'Mechanical Flight Computers', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1039', 'Electronic Flight Computers', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1040', 'Multi-Part Problems', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1041', 'Conversions', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1042', 'Section C - Pilotage and Dead Reckoning', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1043', 'Pilotage', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1044', 'Dead Reckoning', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1045', 'Flight Plan', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1046', 'Flying Over Hazardous Terrain', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1047', 'Section D - Sources of Flight Information', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1048', 'Airport/Facility Directory', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1049', 'Aeronautical Information Manual', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1050', 'Notices to Airmen', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1051', 'Advisory Circulars', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (28, 2, N'2:28:1052', 'Jeppesen Pilot Resource Services', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1053', 'Section A - VHF Omnidirectional Range', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1054', 'Principles of Operation', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1055', 'VOR Airborne Equipment', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1056', 'VOR Navigation', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1057', 'Using VOR Navigation', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1058', 'VOR Cautions', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1059', 'VOR Test Signals', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1060', 'Classes of VOR Facilities', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1061', 'Distance Measuring Equipment (DME)', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1062', 'Section B - Automatic Direction Finder', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1063', 'ADF Equipment', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1064', 'Homing', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1065', 'Tracking', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1066', 'ADF Intercepts', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1067', 'Movable-Card Indicators', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1068', 'ADF Cautions', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1069', 'Section C - Advanced Navigation', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1070', 'VORTAC-Based RNAV', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1071', 'Long Range Navigation (LORAN)', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1072', 'Global Positioning System (GPS)', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (31, 2, N'2:31:1073', 'Advanced Navigation Indicators', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (33, 2, N'2:33:1074', 'Interpreting Weather Data', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (33, 2, N'2:33:1075', 'Basic Navigation', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (33, 2, N'2:33:1076', 'Radio Navigation', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1077', 'Section A - Vision in Flight', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1078', 'The Eye', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1079', 'Night Vision', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1080', 'Night Scanning', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1081', 'Visual Illusions', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1082', 'Landing Illusions', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1083', 'Section B - Spatial Disorientation', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1084', 'Visual Sense', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1085', 'Vestibular Sense', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1086', 'Kinesthetic Sense', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1087', 'Disorientation', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1088', 'Motion Sickness', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1089', 'Section C - Respiration and Altitude', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1090', 'Respiration', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1091', 'Hypoxia', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1092', 'Supplemental Oxygen', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1093', 'Hyperventilation', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1094', 'Pressure Effects', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1095', 'Section D - Alcohol, Drugs, and Performance', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1096', 'Depressants', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1097', 'Alcohol', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1098', 'Stimulants', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1099', 'Pain Killers', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (35, 3, N'3:35:1100', 'Other Problem Drugs', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (37, 3, N'3:37:1101', 'Section A - Planning and Organizing Flights', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (37, 3, N'3:37:1102', 'Initial Planning', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (37, 3, N'3:37:1103', 'Final Planning Stage', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (37, 3, N'3:37:1104', 'Cockpit Management', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (37, 3, N'3:37:1105', 'Section B - Factors Affecting Decision Making', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (37, 3, N'3:37:1106', 'The Decision-Making Process', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (37, 3, N'3:37:1107', 'Hazardous Attitudes', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (37, 3, N'3:37:1108', 'Risk Assessment', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (37, 3, N'3:37:1109', 'Self Assessment', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (37, 3, N'3:37:1110', 'Section C - Cockpit Resource Management', 1, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (37, 3, N'3:37:1111', 'Primary Resources', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (37, 3, N'3:37:1112', 'Expanding Your Resources', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (41, 3, N'3:41:1113', 'Aviation Physiology', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (41, 3, N'3:41:1114', 'Flight Planning and Decision Making', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (44, 3, N'3:44:1115', 'Private Pilot Helicopter End-of-Course Exam', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONITEMS(LESSONID, STAGEID, LESSONGUID, ItemName, IsGroup, IsReview, IsIntro) VALUES (49, 3, N'3:49:1116', 'Practical Test briefing', 0, 0, 0)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (1, 1, 0, N'FLIGHT 1 DUAL — LOCAL', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (3, 1, 0, N'FLIGHT 2 DUAL — LOCAL', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (5, 1, 0, N'FLIGHT 3 DUAL — LOCAL', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (7, 1, 0, N'FLIGHT 4 DUAL — LOCAL', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (9, 1, 0, N'FLIGHT 5 DUAL — LOCAL', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (10, 1, 0, N'FLIGHT 6 DUAL — LOCAL', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (11, 1, 0, N'FLIGHT 7 DUAL — LOCAL', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (13, 1, 0, N'FLIGHT 8 DUAL — LOCAL', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (14, 1, 0, N'FLIGHT 9 DUAL — LOCAL', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (16, 1, 0, N'FLIGHT 10 DUAL — LOCAL', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (17, 1, 0, N'FLIGHT 11 DUAL — LOCAL', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (19, 1, 0, N'FLIGHT 12 DUAL AND SOLO — LOCAL', null, null, 0.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (21, 1, 0, N'FLIGHT 13 DUAL — STAGE CHECK', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (22, 2, 0, N'FLIGHT 14 DUAL AND SOLO — LOCAL', null, null, 0.50, 0.00, 0.00, 0.00, 0.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (23, 2, 0, N'FLIGHT 15 SOLO — LOCAL', null, null, 0.00, 0.00, 0.00, 0.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (24, 2, 0, N'FLIGHT 16 DUAL — LOCAL', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (25, 2, 0, N'FLIGHT 17 DUAL — LOCAL', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (27, 2, 0, N'FLIGHT 18 DUAL — LOCAL', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (29, 2, 0, N'FLIGHT 19 SOLO — LOCAL', null, null, 0.00, 0.00, 0.00, 0.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (30, 2, 0, N'FLIGHT 20 DUAL — LOCAL', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (32, 2, 0, N'FLIGHT 21 SOLO — LOCAL', null, null, 0.00, 0.00, 0.00, 0.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (34, 2, 0, N'FLIGHT 22 DUAL — STAGE CHECK', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (36, 3, 0, N'FLIGHT 23 DUAL — NIGHT', null, null, 0.00, 0.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (38, 3, 0, N'FLIGHT 24 DUAL — CROSS-COUNTRY', null, null, 0.00, 3.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (40, 3, 0, N'FLIGHT 25 SOLO — CROSS-COUNTRY', null, null, 0.00, 2.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (42, 3, 0, N'FLIGHT 26 DUAL — NIGHT CROSS-COUNTRY', null, null, 0.00, 0.00, 0.00, 2.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (43, 3, 0, N'FLIGHT 27 DUAL — LOCAL', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (45, 3, 0, N'FLIGHT 28 SOLO — LOCAL', null, null, 0.00, 0.00, 0.00, 0.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (46, 3, 0, N'FLIGHT 29 SOLO — LOCAL', null, null, 0.00, 0.00, 0.00, 0.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (47, 3, 0, N'FLIGHT 30 DUAL — STAGE CHECK', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (48, 3, 0, N'FLIGHT 31 DUAL — END-OF-COURSE CHECK', null, null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (2, 1, 1, N'GROUND LESSON 1', null, null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (4, 1, 1, N'GROUND LESSON 2', null, null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (6, 1, 1, N'GROUND LESSON 3', null, null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (8, 1, 1, N'GROUND LESSON 4', null, null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (12, 1, 1, N'GROUND LESSON 5', null, null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2.50, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (15, 1, 1, N'GROUND LESSON 6', null, null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2.50, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (18, 1, 1, N'PRESOLO WRITTEN EXAM AND BRIEFING', null, null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (20, 1, 1, N'GROUND LESSON 7 STAGE I EXAM', null, null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.50, 0.50)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (26, 2, 1, N'GROUND LESSON 8', null, null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (28, 2, 1, N'GROUND LESSON 9', null, null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2.50, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (31, 2, 1, N'GROUND LESSON 10', null, null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2.50, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (33, 2, 1, N'GROUND LESSON 11 STAGE II EXAM', null, null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.50, 0.50)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (35, 3, 1, N'GROUND LESSON 12', null, null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2.50, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (37, 3, 1, N'GROUND LESSON 13', null, null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2.50, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (39, 3, 1, N'BRIEFING CROSS COUNTRY', null, null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (41, 3, 1, N'GROUND LESSON 14 STAGE III EXAM', null, null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.50, 0.50)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (44, 3, 1, N'GROUND LESSON 15 END-OF-COURSE EXAM — PRIVATE PILOT HELICOPTER', null, null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1.50, 0.50)
GO

INSERT INTO lessontrack.dbo.LESSONS(LESSONID, STAGEID, IsGround, Title, Objective, Standard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (49, 3, 1, N'BRIEFING FOR PRACTICAL TEST', null, null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LessonTimeLog(STAGEID, LESSONID, Student, Instructor, PerformedOn, AircraftUsed, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (1, 1, N'gsukumar@outlook.com', N'gsukumar@outlook.com', '2016-10-07 16:26:53.073', null, 0.90, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LessonTimeLog(STAGEID, LESSONID, Student, Instructor, PerformedOn, AircraftUsed, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (1, 1, N'jack@black.com', N'gsukumar@outlook.com', '2016-10-08 11:34:05.147', null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LessonTimeLog(STAGEID, LESSONID, Student, Instructor, PerformedOn, AircraftUsed, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (1, 2, N'jack@black.com', N'gsukumar@outlook.com', '2016-10-08 11:43:38.887', null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LessonTimeLog(STAGEID, LESSONID, Student, Instructor, PerformedOn, AircraftUsed, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (1, 3, N'jack@black.com', N'gsukumar@outlook.com', '2016-10-08 11:43:39.003', null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LessonTimeLog(STAGEID, LESSONID, Student, Instructor, PerformedOn, AircraftUsed, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (1, 4, N'jack@black.com', N'gsukumar@outlook.com', '2016-10-08 11:43:39.12', null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LessonTimeLog(STAGEID, LESSONID, Student, Instructor, PerformedOn, AircraftUsed, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (1, 5, N'jack@black.com', N'gsukumar@outlook.com', '2016-10-08 19:24:25.123', null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LessonTimeLog(STAGEID, LESSONID, Student, Instructor, PerformedOn, AircraftUsed, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (1, 6, N'jack@black.com', N'anthony@atomichelicopters.com', '2016-10-16 15:28:17.98', null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LessonTimeLog(STAGEID, LESSONID, Student, Instructor, PerformedOn, AircraftUsed, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (1, 8, N'jack@black.com', N'anthony@atomichelicopters.com', '2016-10-17 00:44:36.79', null, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LessonTimeLog(STAGEID, LESSONID, Student, Instructor, PerformedOn, AircraftUsed, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (1, 9, N'jack@black.com', N'anthony@atomichelicopters.com', '2016-10-10 19:24:04.06', null, 0.90, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LessonTimeLog(STAGEID, LESSONID, Student, Instructor, PerformedOn, AircraftUsed, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (1, 7, N'jack@black.com', N'gsukumar@outlook.com', '2016-10-17 00:45:28.897', null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.LessonTimeLog(STAGEID, LESSONID, Student, Instructor, PerformedOn, AircraftUsed, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (1, 10, N'jack@black.com', N'gsukumar@outlook.com', '2016-10-16 18:03:42.85', null, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00)
GO

INSERT INTO lessontrack.dbo.PilotClassDefinition(PilotClassID, PilotClassName, PilotClassDescription, Logo) VALUES ('08275C94-F00E-499F-9A7B-1C138417672D', N'Pre-Private', 'Has done his solo', N'Student Male')
GO

INSERT INTO lessontrack.dbo.PilotClassDefinition(PilotClassID, PilotClassName, PilotClassDescription, Logo) VALUES ('5DE32520-4A9F-4F9C-8574-A59D9A73BD36', N'Private', 'Earned Private class', N'Helicopter')
GO

INSERT INTO lessontrack.dbo.PilotClassDefinition(PilotClassID, PilotClassName, PilotClassDescription, Logo) VALUES ('2229B73C-0D85-466A-B4DD-3BCB01F0E318', N'Demo', 'has taken the demo flight, not signed up
', N'Passenger')
GO

INSERT INTO lessontrack.dbo.PilotClassDefinition(PilotClassID, PilotClassName, PilotClassDescription, Logo) VALUES ('0EF8C682-FA9C-4221-9140-2C5CFB9B5E4F', N'Pre-Solo', 'Is working toward a solo flight.', N'In Air')
GO

INSERT INTO lessontrack.dbo.PilotClassDefinition(PilotClassID, PilotClassName, PilotClassDescription, Logo) VALUES ('14C61FD4-1AC0-482C-A76E-5071618C69EB', N'Hummingbird', 'Can hover now.', N'In Air')
GO

INSERT INTO lessontrack.dbo.PilotClassPrereq(PilotClassID, AchievementID) VALUES ('2229B73C-0D85-466A-B4DD-3BCB01F0E318', '49B3C557-3C0A-4BD2-A1B5-D7EC8067AD1A')
GO

INSERT INTO lessontrack.dbo.PilotClassPrereq(PilotClassID, AchievementID) VALUES ('14C61FD4-1AC0-482C-A76E-5071618C69EB', 'BD6CAF12-E6A8-4CFD-8AA2-08C16BB35B9D')
GO

INSERT INTO lessontrack.dbo.RewardDefinition(RewardID, RewardName, RewardDesc, RewardType, RewardCount, RewardValidityTill, RewardItem, Logo) VALUES ('FA4861C1-0704-4F23-BCD1-BF4E8260BEEE', N'Tasted flight', 'Badge indicating I Flew a demo flight', N'BADGE', 1, null, N'I Flew', N'Security Checked')
GO

INSERT INTO lessontrack.dbo.RewardDefinition(RewardID, RewardName, RewardDesc, RewardType, RewardCount, RewardValidityTill, RewardItem, Logo) VALUES ('296498B6-85B8-4DA3-BA45-FF6B8E919DFB', N'solo', '', N'SHOUT', null, null, N'', N'Trophy')
GO

INSERT INTO lessontrack.dbo.RewardPrereq(RewardID, RequiredAchievement) VALUES ('FA4861C1-0704-4F23-BCD1-BF4E8260BEEE', '49B3C557-3C0A-4BD2-A1B5-D7EC8067AD1A')
GO

INSERT INTO lessontrack.dbo.RewardPrereq(RewardID, RequiredAchievement) VALUES ('296498B6-85B8-4DA3-BA45-FF6B8E919DFB', 'B9965FB6-76C2-4E49-B7BD-E871FDE8E9C7')
GO

INSERT INTO lessontrack.dbo.STAGES(STAGEID, Name, CertificationID, Objective, Standard, GroundObjective, GroundStandard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (1, N'STAGE I', N'141-PVT', 'During this stage, the student becomes familiar with the training helicopter and learns how the helicopter controls are used to establish and maintain specific flight attitudes. The student also will gain proficiency to conduct the first supervised solo in the training helicopter.', 'At the completion of this stage, the student will demonstrate proficiency in basic flight maneuvers, and will have successfully soloed in the local area.', 'During this stage, the student will be introduced to helicopters and become familiar with the aerodynamic principles of flight which affect their operation. The student will also obtain a basic knowledge of the safety of flight, airports and heliports, airspace, radio communications, and air traffic control services, including the use of radar. In addition, the student will learn how to predict performance and control weight and balance conditions of the helicopter. The student also will become familiar with the Federal Aviation Regulations as they apply to private pilot operations. Finally, the student will be introduced to meteorology for pilots.', 'This stage is complete when the student has taken the Stage I written exam with a minimum passing score of 80%, and the instructor has reviewed each incorrect response to ensure complete understanding before the student progresses to Stage II.', 12.50, 0.00, 0.00, 0.00, 0.50, 0.00, 0.00, 0.00, 0.00, 17.00, 0.50, 0.50)
GO

INSERT INTO lessontrack.dbo.STAGES(STAGEID, Name, CertificationID, Objective, Standard, GroundObjective, GroundStandard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (2, N'STAGE II', N'141-PVT', 'This stage allows the student to expand the skills learned in the previous stage. Introduction of maximum performance takeoffs and climbs, steep approaches, running/rolling takeoffs, shallow approaches, running/roll on landings, and slope operations prepare the student for conducting flights at a variety of airports and heliports. Through discussion sessions, the student will gain insight into emergency situations including retreating blade stall, dynamic rollover, ground resonance, low G conditions, and low r.p.m. and blade stall.', 'At the completion of this stage, the student will have the proficiency to safely demonstrate consistent results in performing maximum performance takeoffs and climbs, steep approaches, running/rolling takeoffs, shallow approaches, running/roll on landings, and slope operations. The student will exhibit knowledge of the elements related to retreating blade stall, dynamic rollover, ground resonance, low G conditions, low r.p.m. and blade stall, and can explain flight techniques which prevent these emergency situations.', 'During this stage, the student will build on previous weather knowledge to learn how to procure weather information and interpret printed reports and graphic weather products. In addition, the student will learn about aeronautical charts, flight computers, pilotage, dead reckoning, and flight information sources. The student also will be introduced to VOR, ADF, and advanced navigation, including GPS.', 'This stage is complete when the student has taken the Stage II written exam with a minimum passing score of 80%, and the instructor has reviewed each incorrect response to ensure complete understanding before the student progresses to Stage III.', 5.50, 0.00, 0.00, 0.00, 3.50, 0.00, 0.00, 0.00, 0.00, 8.00, 0.50, 0.50)
GO

INSERT INTO lessontrack.dbo.STAGES(STAGEID, Name, CertificationID, Objective, Standard, GroundObjective, GroundStandard, duallocalday, dualccday, duallocalnight, dualccnight, sololocalday, soloccday, sololocalnight, soloccnight, briefing, classvideo, exams, debrief) VALUES (3, N'STAGE III', N'141-PVT', 'During this stage, the student will learn to conduct cross-country flights using pilotage, dead reckoning, and radio navigation. In addition, the student will learn how to conduct night operations safely.', 'This stage is complete when the student can accurately plan and conduct cross-country and night flights.', 'During this stage, the student will gain an understanding of the physiological factors which can affect both pilot and passengers during flight. In addition, the student will learn how to conduct comprehensive preflight planning for cross-country flights and gain insight into factors affecting the decision-making process.', 'This stage is complete when the student has taken the Stage III written exam and the Private Pilot Helicopter Final Exam with a minimum passing score of 80%, and the instructor has reviewed each incorrect response to ensure complete understanding.', 3.00, 3.00, 1.00, 2.00, 2.00, 2.00, 0.00, 0.00, 0.00, 5.00, 2.00, 1.00)
GO

INSERT INTO lessontrack.dbo.TaskDefinition(TaskID, TaskName, TaskDescription, TaskType, AircraftType, TailNo, Hours, Maneuver, Airport, Lesson, Rating, Course, Detail, Distance, IsNight, IsDual, IsCrossCountry, IsWithPassenger, ValidityStartDate, ValidityEndDate) VALUES ('91F998F4-48AB-4C51-A4F5-E0C263E7AA58', N'(P) Take a demo flight', 'Demo flight taken with instructor', 2, N'', null, null, N'', N'test      ', N'DEMO', N'', N'', null, null, null, null, null, null, null, null)
GO

INSERT INTO lessontrack.dbo.TaskDefinition(TaskID, TaskName, TaskDescription, TaskType, AircraftType, TailNo, Hours, Maneuver, Airport, Lesson, Rating, Course, Detail, Distance, IsNight, IsDual, IsCrossCountry, IsWithPassenger, ValidityStartDate, ValidityEndDate) VALUES ('D8AF2F20-DD78-4E3B-B06D-9FB544FCF4DA', N'(P) Hover for a minute S300', 'Learn to hover for a minute in a stable manner in the S300

', 1, N'', null, null, N'Hover', N'', N'', N'', N'', null, null, null, null, null, null, null, null)
GO

INSERT INTO lessontrack.dbo.TaskDefinition(TaskID, TaskName, TaskDescription, TaskType, AircraftType, TailNo, Hours, Maneuver, Airport, Lesson, Rating, Course, Detail, Distance, IsNight, IsDual, IsCrossCountry, IsWithPassenger, ValidityStartDate, ValidityEndDate) VALUES ('15B2AC40-FB4E-4E30-9444-6B75DD77B0B7', N'(P) Take second demo flight', 'Take a second demo flight', 2, N'', null, null, N'', N'', N'DEMO', N'', N'', null, null, null, null, null, null, null, null)
GO

INSERT INTO lessontrack.dbo.TaskDefinition(TaskID, TaskName, TaskDescription, TaskType, AircraftType, TailNo, Hours, Maneuver, Airport, Lesson, Rating, Course, Detail, Distance, IsNight, IsDual, IsCrossCountry, IsWithPassenger, ValidityStartDate, ValidityEndDate) VALUES ('1E979BDE-FF72-4CCA-8192-3FB689123F35', N'(P) Take third demo flight', 'Take a third demo flight', 2, N'', null, null, N'', N'', N'DEMO', N'', N'', null, null, null, null, null, null, null, null)
GO

INSERT INTO lessontrack.dbo.TaskDefinition(TaskID, TaskName, TaskDescription, TaskType, AircraftType, TailNo, Hours, Maneuver, Airport, Lesson, Rating, Course, Detail, Distance, IsNight, IsDual, IsCrossCountry, IsWithPassenger, ValidityStartDate, ValidityEndDate) VALUES ('1B2547C2-7AB5-4079-A957-15F1968602F2', N'(P) Presolo test', 'Passed presolo Test', 4, N'', null, null, N'', N'', N'Pre-solo Test', N'', N'', null, null, null, null, null, null, null, null)
GO

INSERT INTO lessontrack.dbo.TaskDefinition(TaskID, TaskName, TaskDescription, TaskType, AircraftType, TailNo, Hours, Maneuver, Airport, Lesson, Rating, Course, Detail, Distance, IsNight, IsDual, IsCrossCountry, IsWithPassenger, ValidityStartDate, ValidityEndDate) VALUES ('766D0FF2-ED53-4CF7-B3E7-6650759B2BC4', N'(P) Solo Stage Check', '', 2, N'', null, null, N'', N'', N'Solo Stage Check', N'', N'', null, null, null, null, null, null, null, null)
GO

INSERT INTO lessontrack.dbo.TaskDefinition(TaskID, TaskName, TaskDescription, TaskType, AircraftType, TailNo, Hours, Maneuver, Airport, Lesson, Rating, Course, Detail, Distance, IsNight, IsDual, IsCrossCountry, IsWithPassenger, ValidityStartDate, ValidityEndDate) VALUES ('4A3EED78-B86E-4C9C-A45D-B5D1D089CE7C', N'(C) 30 180 autos', 'Perfrom 30 180 auto rotations with instructor ', 1, N'', null, null, N'30 180 autos', N'', N'', N'', N'', null, null, null, null, null, null, null, null)
GO

INSERT INTO lessontrack.dbo.TaskDefinition(TaskID, TaskName, TaskDescription, TaskType, AircraftType, TailNo, Hours, Maneuver, Airport, Lesson, Rating, Course, Detail, Distance, IsNight, IsDual, IsCrossCountry, IsWithPassenger, ValidityStartDate, ValidityEndDate) VALUES ('B10E221B-9F0A-4F45-923B-E925D543CAF4', N'(I) Fly a DP', 'Fly KBFI Departure Procedure', 1, N'', null, null, N'KBFI DP', N'', N'', N'', N'', null, null, null, null, null, null, null, null)
GO

INSERT INTO lessontrack.dbo.TaskDefinition(TaskID, TaskName, TaskDescription, TaskType, AircraftType, TailNo, Hours, Maneuver, Airport, Lesson, Rating, Course, Detail, Distance, IsNight, IsDual, IsCrossCountry, IsWithPassenger, ValidityStartDate, ValidityEndDate) VALUES ('D7DFD500-AF46-432B-BAE1-FDAF3D466FD6', N'(F) Endorsement class', 'Receive / teach endorsement class', 4, N'', null, null, N'', N'', N'Endorsement class', N'', N'', null, null, null, null, null, null, null, null)
GO

CREATE INDEX IX_CompletionLogs_Date ON dbo.CompletionLogs (DateCompleted DESC)
GO

CREATE INDEX IX_CompletionLogs_Student ON dbo.CompletionLogs (Student)
GO

CREATE INDEX IX_CompletionLogs_StudentLesson ON dbo.CompletionLogs (Student,LessonGUID)
GO

CREATE INDEX IX_LESSONITEMS_LessonGUID ON dbo.LESSONITEMS (LESSONGUID)
GO

CREATE INDEX IX_LESSONITEMS_LessonID ON dbo.LESSONITEMS (LESSONID)
GO

CREATE INDEX IX_LESSONS_LESSONID ON dbo.LESSONS (LESSONID)
GO

CREATE INDEX IX_LESSONS_STAGE ON dbo.LESSONS (STAGEID)
GO

CREATE INDEX IX_LessonTimeLog_DATE ON dbo.LessonTimeLog (PerformedOn DESC)
GO

CREATE INDEX IX_LessonTimeLog_LESSON ON dbo.LessonTimeLog (Student,LESSONID)
GO

CREATE INDEX IX_LessonTimeLog_STAGE ON dbo.LessonTimeLog (STAGEID,Student)
GO

CREATE INDEX IX_LessonTimeLog_Student ON dbo.LessonTimeLog (Student)
GO

CREATE INDEX IX_STAGES_STAGEID ON dbo.STAGES (STAGEID)
GO

