USE [lessontrack]
GO
/****** Object:  User [root]    Script Date: 12/3/2017 4:00:34 PM ******/
CREATE USER [root] FOR LOGIN [root] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [root]
GO
/****** Object:  Table [dbo].[AchievementDefinition]    Script Date: 12/3/2017 4:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AchievementDefinition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AchievementID] [uniqueidentifier] NOT NULL,
	[AchievementName] [nvarchar](50) NOT NULL,
	[AchievementDesc] [text] NOT NULL,
	[ValidityMonths] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AchievementPrereq]    Script Date: 12/3/2017 4:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AchievementPrereq](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AchievementID] [uniqueidentifier] NOT NULL,
	[TaskID] [uniqueidentifier] NULL,
	[RequiredAchievementID] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aircrafts]    Script Date: 12/3/2017 4:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aircrafts](
	[TailNumber] [nchar](10) NOT NULL,
	[Make] [nvarchar](50) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[Year] [nchar](10) NULL,
	[LastHobbs] [decimal](7, 1) NULL,
	[LastMXHobbs] [decimal](7, 1) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Aircrafts] PRIMARY KEY CLUSTERED 
(
	[TailNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUsers]    Script Date: 12/3/2017 4:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUsers](
	[UserEmail] [nvarchar](50) NOT NULL,
	[PasswordHash] [varbinary](100) NULL,
	[IsAdmin] [bit] NOT NULL,
	[IsStudent] [bit] NOT NULL,
	[IsInstructor] [bit] NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MI] [nvarchar](50) NULL,
	[Gender] [nchar](10) NULL,
	[DOB] [date] NULL,
	[CellPhone] [nchar](20) NULL,
	[HomePhone] [nchar](20) NULL,
	[WorkPhone] [nchar](20) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[Address3] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[ZIP] [nvarchar](20) NULL,
	[Country] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Employer] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompletionLogs]    Script Date: 12/3/2017 4:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompletionLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCompleted] [datetime] NOT NULL,
	[Student] [nvarchar](100) NOT NULL,
	[Instructor] [nvarchar](100) NOT NULL,
	[AircraftUsed] [nchar](10) NULL,
	[LessonGUID] [nvarchar](50) NOT NULL,
	[STAGEID] [int] NOT NULL,
	[LESSONID] [int] NOT NULL,
	[HoursSpent] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Endorsements]    Script Date: 12/3/2017 4:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endorsements](
	[UserEmail] [nvarchar](50) NOT NULL,
	[EndorsementType] [nvarchar](50) NOT NULL,
	[EndorsementSubtype] [nvarchar](50) NOT NULL,
	[ValidityIfAny] [date] NULL,
	[IssuedOn] [date] NOT NULL,
	[IssuingAuthority] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAACerts]    Script Date: 12/3/2017 4:00:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAACerts](
	[CertificationID] [nvarchar](50) NOT NULL,
	[CertificationName] [nvarchar](50) NOT NULL,
	[InfoLink] [nvarchar](500) NULL,
	[FAAPart] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[CertificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LESSONITEMS]    Script Date: 12/3/2017 4:00:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LESSONITEMS](
	[LineID] [int] IDENTITY(1,1) NOT NULL,
	[LESSONID] [int] NOT NULL,
	[STAGEID] [int] NOT NULL,
	[LESSONGUID] [nvarchar](50) NOT NULL,
	[ItemName] [nvarchar](max) NOT NULL,
	[IsGroup] [bit] NOT NULL,
	[IsReview] [bit] NOT NULL,
	[IsIntro] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LESSONS]    Script Date: 12/3/2017 4:00:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LESSONS](
	[ROWID] [int] IDENTITY(1,1) NOT NULL,
	[LESSONID] [int] NOT NULL,
	[STAGEID] [int] NOT NULL,
	[IsGround] [bit] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Objective] [nvarchar](max) NULL,
	[Standard] [nvarchar](max) NULL,
	[duallocalday] [decimal](5, 2) NOT NULL,
	[dualccday] [decimal](5, 2) NOT NULL,
	[duallocalnight] [decimal](5, 2) NOT NULL,
	[dualccnight] [decimal](5, 2) NOT NULL,
	[sololocalday] [decimal](5, 2) NOT NULL,
	[soloccday] [decimal](5, 2) NOT NULL,
	[sololocalnight] [decimal](5, 2) NOT NULL,
	[soloccnight] [decimal](5, 2) NOT NULL,
	[briefing] [decimal](5, 2) NOT NULL,
	[classvideo] [decimal](5, 2) NOT NULL,
	[exams] [decimal](5, 2) NOT NULL,
	[debrief] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ROWID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonTimeLog]    Script Date: 12/3/2017 4:00:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonTimeLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[STAGEID] [int] NOT NULL,
	[LESSONID] [int] NOT NULL,
	[Student] [nvarchar](100) NOT NULL,
	[Instructor] [nvarchar](100) NOT NULL,
	[PerformedOn] [datetime] NOT NULL,
	[AircraftUsed] [nchar](10) NULL,
	[duallocalday] [decimal](5, 2) NOT NULL,
	[dualccday] [decimal](5, 2) NOT NULL,
	[duallocalnight] [decimal](5, 2) NOT NULL,
	[dualccnight] [decimal](5, 2) NOT NULL,
	[sololocalday] [decimal](5, 2) NOT NULL,
	[soloccday] [decimal](5, 2) NOT NULL,
	[sololocalnight] [decimal](5, 2) NOT NULL,
	[soloccnight] [decimal](5, 2) NOT NULL,
	[briefing] [decimal](5, 2) NOT NULL,
	[classvideo] [decimal](5, 2) NOT NULL,
	[exams] [decimal](5, 2) NOT NULL,
	[debrief] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PilotAchievement]    Script Date: 12/3/2017 4:00:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PilotAchievement](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PilotEmail] [nvarchar](50) NOT NULL,
	[AchievementID] [uniqueidentifier] NOT NULL,
	[DateCompleted] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PilotClass]    Script Date: 12/3/2017 4:00:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PilotClass](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PilotEmail] [nvarchar](50) NOT NULL,
	[PilotClassID] [uniqueidentifier] NOT NULL,
	[DateCompleted] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PilotClassDefinition]    Script Date: 12/3/2017 4:00:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PilotClassDefinition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PilotClassID] [uniqueidentifier] NOT NULL,
	[PilotClassName] [nvarchar](50) NOT NULL,
	[PilotClassDescription] [text] NOT NULL,
	[Logo] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PilotClassPrereq]    Script Date: 12/3/2017 4:00:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PilotClassPrereq](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PilotClassID] [uniqueidentifier] NOT NULL,
	[AchievementID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PilotReward]    Script Date: 12/3/2017 4:00:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PilotReward](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PilotEmail] [nvarchar](50) NOT NULL,
	[RewardID] [uniqueidentifier] NOT NULL,
	[DateCompleted] [datetime] NOT NULL,
	[IsIssued] [bit] NOT NULL,
	[IssuedOn] [datetime] NULL,
	[IssuedBy] [nvarchar](50) NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PilotTask]    Script Date: 12/3/2017 4:00:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PilotTask](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PilotEmail] [nvarchar](50) NOT NULL,
	[TaskID] [uniqueidentifier] NOT NULL,
	[DateAdded] [datetime] NULL,
	[IsCompleted] [bit] NOT NULL,
	[DateCompleted] [datetime] NULL,
	[IsVerified] [bit] NOT NULL,
	[InstructorEmail] [nvarchar](50) NULL,
	[DateVerified] [datetime] NULL,
	[VerificationNotes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RewardDefinition]    Script Date: 12/3/2017 4:00:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RewardDefinition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RewardID] [uniqueidentifier] NOT NULL,
	[RewardName] [nvarchar](50) NOT NULL,
	[RewardDesc] [text] NOT NULL,
	[RewardType] [nvarchar](10) NOT NULL,
	[RewardCount] [decimal](18, 0) NULL,
	[RewardValidityTill] [date] NULL,
	[RewardItem] [nvarchar](50) NULL,
	[Logo] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RewardPrereq]    Script Date: 12/3/2017 4:00:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RewardPrereq](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RewardID] [uniqueidentifier] NOT NULL,
	[RequiredAchievement] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STAGES]    Script Date: 12/3/2017 4:00:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STAGES](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[STAGEID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CertificationID] [nvarchar](50) NOT NULL,
	[Objective] [varchar](max) NULL,
	[Standard] [varchar](max) NULL,
	[GroundObjective] [varchar](max) NULL,
	[GroundStandard] [varchar](max) NULL,
	[duallocalday] [decimal](5, 2) NOT NULL,
	[dualccday] [decimal](5, 2) NOT NULL,
	[duallocalnight] [decimal](5, 2) NOT NULL,
	[dualccnight] [decimal](5, 2) NOT NULL,
	[sololocalday] [decimal](5, 2) NOT NULL,
	[soloccday] [decimal](5, 2) NOT NULL,
	[sololocalnight] [decimal](5, 2) NOT NULL,
	[soloccnight] [decimal](5, 2) NOT NULL,
	[briefing] [decimal](5, 2) NOT NULL,
	[classvideo] [decimal](5, 2) NOT NULL,
	[exams] [decimal](5, 2) NOT NULL,
	[debrief] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskDefinition]    Script Date: 12/3/2017 4:00:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskDefinition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskID] [uniqueidentifier] NOT NULL,
	[TaskName] [nvarchar](100) NOT NULL,
	[TaskDescription] [text] NULL,
	[TaskType] [int] NOT NULL,
	[AircraftType] [nvarchar](50) NULL,
	[TailNo] [nvarchar](10) NULL,
	[Hours] [decimal](18, 0) NULL,
	[Maneuver] [nvarchar](50) NULL,
	[Airport] [nvarchar](10) NULL,
	[Lesson] [nvarchar](50) NULL,
	[Rating] [nvarchar](50) NULL,
	[Course] [nvarchar](50) NULL,
	[Detail] [nvarchar](100) NULL,
	[Distance] [decimal](18, 0) NULL,
	[IsNight] [bit] NULL,
	[IsDual] [bit] NULL,
	[IsCrossCountry] [bit] NULL,
	[IsWithPassenger] [bit] NULL,
	[ValidityStartDate] [datetime] NULL,
	[ValidityEndDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AchievementDefinition] ON 

INSERT [dbo].[AchievementDefinition] ([Id], [AchievementID], [AchievementName], [AchievementDesc], [ValidityMonths]) VALUES (7, N'49b3c557-3c0a-4bd2-a1b5-d7ec8067ad1a', N'Took 3 Demo Flights', N'Student has taken a demo flight and is interested in pursuing', 0)
INSERT [dbo].[AchievementDefinition] ([Id], [AchievementID], [AchievementName], [AchievementDesc], [ValidityMonths]) VALUES (8, N'bd6caf12-e6a8-4cfd-8aa2-08c16bb35b9d', N'Hover the S300', N'Figured out how to hover in the S300', 0)
INSERT [dbo].[AchievementDefinition] ([Id], [AchievementID], [AchievementName], [AchievementDesc], [ValidityMonths]) VALUES (9, N'b9965fb6-76c2-4e49-b7bd-e871fde8e9c7', N'S300 Solo', N'Soloed the S300', 0)
SET IDENTITY_INSERT [dbo].[AchievementDefinition] OFF
SET IDENTITY_INSERT [dbo].[AchievementPrereq] ON 

INSERT [dbo].[AchievementPrereq] ([Id], [AchievementID], [TaskID], [RequiredAchievementID]) VALUES (11, N'bd6caf12-e6a8-4cfd-8aa2-08c16bb35b9d', N'd8af2f20-dd78-4e3b-b06d-9fb544fcf4da', NULL)
INSERT [dbo].[AchievementPrereq] ([Id], [AchievementID], [TaskID], [RequiredAchievementID]) VALUES (12, N'49b3c557-3c0a-4bd2-a1b5-d7ec8067ad1a', N'91f998f4-48ab-4c51-a4f5-e0c263e7aa58', NULL)
INSERT [dbo].[AchievementPrereq] ([Id], [AchievementID], [TaskID], [RequiredAchievementID]) VALUES (13, N'49b3c557-3c0a-4bd2-a1b5-d7ec8067ad1a', N'15b2ac40-fb4e-4e30-9444-6b75dd77b0b7', NULL)
INSERT [dbo].[AchievementPrereq] ([Id], [AchievementID], [TaskID], [RequiredAchievementID]) VALUES (14, N'49b3c557-3c0a-4bd2-a1b5-d7ec8067ad1a', N'1e979bde-ff72-4cca-8192-3fb689123f35', NULL)
INSERT [dbo].[AchievementPrereq] ([Id], [AchievementID], [TaskID], [RequiredAchievementID]) VALUES (21, N'b9965fb6-76c2-4e49-b7bd-e871fde8e9c7', N'1b2547c2-7ab5-4079-a957-15f1968602f2', NULL)
INSERT [dbo].[AchievementPrereq] ([Id], [AchievementID], [TaskID], [RequiredAchievementID]) VALUES (22, N'b9965fb6-76c2-4e49-b7bd-e871fde8e9c7', N'766d0ff2-ed53-4cf7-b3e7-6650759b2bc4', NULL)
SET IDENTITY_INSERT [dbo].[AchievementPrereq] OFF
INSERT [dbo].[Aircrafts] ([TailNumber], [Make], [Model], [Year], [LastHobbs], [LastMXHobbs], [Status]) VALUES (N'N144AH    ', N'Robinson', N'Raven 1', N'          ', NULL, NULL, 1)
INSERT [dbo].[Aircrafts] ([TailNumber], [Make], [Model], [Year], [LastHobbs], [LastMXHobbs], [Status]) VALUES (N'N974CW    ', N'Schweizer', N'CB300', N'1996      ', CAST(3245.3 AS Decimal(7, 1)), CAST(762.3 AS Decimal(7, 1)), 1)
INSERT [dbo].[AppUsers] ([UserEmail], [PasswordHash], [IsAdmin], [IsStudent], [IsInstructor], [LastName], [FirstName], [MI], [Gender], [DOB], [CellPhone], [HomePhone], [WorkPhone], [Address1], [Address2], [Address3], [City], [State], [ZIP], [Country], [CreatedOn], [Employer]) VALUES (N'anthony@atomichelicopters.com', 0x77617465723938, 1, 0, 1, N'Riley', N'Tony', N'', N'M         ', NULL, N'  360-994-0300      ', N'                    ', N'                    ', N'', N'', N'', N'', N'Poulsbo', N'', N'', CAST(N'2016-10-05T18:37:23.917' AS DateTime), N'')
INSERT [dbo].[AppUsers] ([UserEmail], [PasswordHash], [IsAdmin], [IsStudent], [IsInstructor], [LastName], [FirstName], [MI], [Gender], [DOB], [CellPhone], [HomePhone], [WorkPhone], [Address1], [Address2], [Address3], [City], [State], [ZIP], [Country], [CreatedOn], [Employer]) VALUES (N'bryan@atomichelicopters.com', 0x746F6E79726F636B73, 1, 0, 1, N'Kaasa', N'Bryan', N'', NULL, CAST(N'1990-01-01' AS Date), N'425-555-6352        ', N'                    ', N'                    ', N'', N'', N'', N'', N'', N'', N'', CAST(N'2016-01-01T00:00:00.000' AS DateTime), N'Atomic Helicopters')
INSERT [dbo].[AppUsers] ([UserEmail], [PasswordHash], [IsAdmin], [IsStudent], [IsInstructor], [LastName], [FirstName], [MI], [Gender], [DOB], [CellPhone], [HomePhone], [WorkPhone], [Address1], [Address2], [Address3], [City], [State], [ZIP], [Country], [CreatedOn], [Employer]) VALUES (N'gsukumar@outlook.com', NULL, 1, 1, 0, N'Sukumar', N'Goutham', N'', NULL, CAST(N'2003-01-01' AS Date), N'4255556252          ', N'                    ', N'                    ', N'', N'', N'', N'', N'', N'', N'', CAST(N'2016-01-01T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[AppUsers] ([UserEmail], [PasswordHash], [IsAdmin], [IsStudent], [IsInstructor], [LastName], [FirstName], [MI], [Gender], [DOB], [CellPhone], [HomePhone], [WorkPhone], [Address1], [Address2], [Address3], [City], [State], [ZIP], [Country], [CreatedOn], [Employer]) VALUES (N'jack@black.com', NULL, 0, 1, 0, N'Black', N'Jack', N'', NULL, CAST(N'1970-09-09' AS Date), N'425-555-8372        ', N'425-999-0391        ', N'425-777-7463        ', N'20440 Pearson Ave', N'Apt 32', N'Room 4', N'Redmond', N'WA', N'98052', N'USA', CAST(N'2016-09-27T08:26:46.183' AS DateTime), N'Microsoft')
INSERT [dbo].[AppUsers] ([UserEmail], [PasswordHash], [IsAdmin], [IsStudent], [IsInstructor], [LastName], [FirstName], [MI], [Gender], [DOB], [CellPhone], [HomePhone], [WorkPhone], [Address1], [Address2], [Address3], [City], [State], [ZIP], [Country], [CreatedOn], [Employer]) VALUES (N'matt@atomichelicopters.com', 0x746F6E79726F636B73, 1, 0, 1, N'Taylor', N'Matt', N'', NULL, CAST(N'1990-01-01' AS Date), N'425-555-9864        ', N'                    ', N'                    ', N'', N'', N'', N'', N'', N'', N'', CAST(N'2016-01-01T00:00:00.000' AS DateTime), N'Atomic Helicopters')
INSERT [dbo].[AppUsers] ([UserEmail], [PasswordHash], [IsAdmin], [IsStudent], [IsInstructor], [LastName], [FirstName], [MI], [Gender], [DOB], [CellPhone], [HomePhone], [WorkPhone], [Address1], [Address2], [Address3], [City], [State], [ZIP], [Country], [CreatedOn], [Employer]) VALUES (N'tours@atomichelicopters.com', 0x61746F6D696332303136, 0, 1, 0, N'galvin', N'pat ', N'', NULL, NULL, N'                    ', N'                    ', N'                    ', N'', N'', N'', N'', N'', N'', N'', CAST(N'2017-05-06T02:22:14.560' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[CompletionLogs] ON 

INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (2, CAST(N'2016-10-08T11:34:05.527' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:3', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (3, CAST(N'2016-10-08T11:43:45.090' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:4', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (4, CAST(N'2016-10-08T11:43:45.217' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:5', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (5, CAST(N'2016-10-08T11:43:45.330' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:7', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (6, CAST(N'2016-10-08T11:43:45.453' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:8', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (7, CAST(N'2016-10-08T11:43:45.577' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:9', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (8, CAST(N'2016-10-08T11:43:45.700' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:11', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (9, CAST(N'2016-10-08T11:43:45.833' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:12', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (10, CAST(N'2016-10-08T11:43:45.950' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:13', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (11, CAST(N'2016-10-08T11:43:46.063' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:14', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (12, CAST(N'2016-10-08T11:43:46.167' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:16', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (13, CAST(N'2016-10-08T11:43:46.287' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:18', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (14, CAST(N'2016-10-08T11:43:46.387' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:19', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (15, CAST(N'2016-10-08T11:43:46.500' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:20', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (16, CAST(N'2016-10-08T11:43:46.610' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:21', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (17, CAST(N'2016-10-08T11:43:46.723' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:22', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (18, CAST(N'2016-10-08T11:43:46.840' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:23', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (19, CAST(N'2016-10-08T11:43:46.967' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:24', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (20, CAST(N'2016-10-08T11:43:47.083' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:25', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (21, CAST(N'2016-10-08T11:43:47.210' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:26', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (22, CAST(N'2016-10-08T11:43:47.330' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:28', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (23, CAST(N'2016-10-08T11:43:47.440' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:29', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (24, CAST(N'2016-10-08T11:43:47.563' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:31', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (25, CAST(N'2016-10-08T11:43:47.687' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:2:883', 1, 2, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (26, CAST(N'2016-10-08T11:43:47.800' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:2:884', 1, 2, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (27, CAST(N'2016-10-08T11:43:47.933' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:2:885', 1, 2, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (28, CAST(N'2016-10-08T11:43:48.047' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:2:886', 1, 2, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (29, CAST(N'2016-10-08T11:43:48.160' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:2:888', 1, 2, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (30, CAST(N'2016-10-08T11:43:48.283' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:2:889', 1, 2, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (31, CAST(N'2016-10-08T11:43:48.407' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:2:890', 1, 2, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (32, CAST(N'2016-10-08T11:43:48.533' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:2:891', 1, 2, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (33, CAST(N'2016-10-08T11:43:48.660' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:2:892', 1, 2, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (34, CAST(N'2016-10-08T11:43:48.780' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:2:894', 1, 2, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (35, CAST(N'2016-10-08T11:43:48.893' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:2:895', 1, 2, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (36, CAST(N'2016-10-08T11:43:49.033' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:2:896', 1, 2, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (37, CAST(N'2016-10-08T11:43:49.150' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:2:897', 1, 2, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (38, CAST(N'2016-10-08T11:43:49.270' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:2:898', 1, 2, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (39, CAST(N'2016-10-08T11:43:49.383' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:2:899', 1, 2, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (40, CAST(N'2016-10-08T11:43:49.537' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:33', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (41, CAST(N'2016-10-08T11:43:49.650' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:34', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (42, CAST(N'2016-10-08T11:43:49.767' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:35', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (43, CAST(N'2016-10-08T11:43:49.900' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:36', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (44, CAST(N'2016-10-08T11:43:50.007' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:38', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (45, CAST(N'2016-10-08T11:43:50.120' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:39', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (46, CAST(N'2016-10-08T11:43:50.243' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:41', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (47, CAST(N'2016-10-08T11:43:50.367' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:42', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (48, CAST(N'2016-10-08T11:43:50.497' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:43', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (49, CAST(N'2016-10-08T11:43:50.613' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:45', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (50, CAST(N'2016-10-08T11:43:50.723' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:46', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (51, CAST(N'2016-10-08T11:43:50.830' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:47', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (52, CAST(N'2016-10-08T11:43:50.960' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:49', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (53, CAST(N'2016-10-08T11:43:51.080' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:50', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (54, CAST(N'2016-10-08T11:43:51.200' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:51', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (55, CAST(N'2016-10-08T11:43:51.310' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:52', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (56, CAST(N'2016-10-08T11:43:51.433' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:54', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (57, CAST(N'2016-10-08T11:43:51.550' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:56', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (58, CAST(N'2016-10-08T11:43:51.660' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:57', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (59, CAST(N'2016-10-08T11:43:51.770' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:58', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (60, CAST(N'2016-10-08T11:43:51.890' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:59', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (61, CAST(N'2016-10-08T11:43:52.013' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:60', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (62, CAST(N'2016-10-08T11:43:52.117' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:61', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (63, CAST(N'2016-10-08T11:43:52.230' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:62', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (64, CAST(N'2016-10-08T11:43:52.360' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:63', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (65, CAST(N'2016-10-08T11:43:52.483' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:65', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (66, CAST(N'2016-10-08T11:43:52.607' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:66', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (67, CAST(N'2016-10-08T11:43:52.720' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:3:68', 1, 3, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (68, CAST(N'2016-10-08T11:43:52.833' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:901', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (69, CAST(N'2016-10-08T11:43:52.950' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:903', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (70, CAST(N'2016-10-08T11:43:53.083' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:904', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (71, CAST(N'2016-10-08T11:43:53.200' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:905', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (72, CAST(N'2016-10-08T11:43:53.320' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:906', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (73, CAST(N'2016-10-08T11:43:53.427' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:907', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (74, CAST(N'2016-10-08T11:43:53.530' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:909', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (75, CAST(N'2016-10-08T11:43:53.653' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:910', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (76, CAST(N'2016-10-08T11:43:53.767' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:911', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (77, CAST(N'2016-10-08T11:43:53.893' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:912', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (78, CAST(N'2016-10-08T11:43:54.020' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:913', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (79, CAST(N'2016-10-08T11:43:54.140' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:915', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (80, CAST(N'2016-10-08T11:43:54.253' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:916', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (81, CAST(N'2016-10-08T11:44:44.187' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:917', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (82, CAST(N'2016-10-08T11:44:44.343' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:918', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (83, CAST(N'2016-10-08T11:44:44.463' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:919', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (84, CAST(N'2016-10-08T11:44:44.583' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:921', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (85, CAST(N'2016-10-08T11:44:44.740' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:922', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (86, CAST(N'2016-10-08T11:44:44.857' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:923', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (87, CAST(N'2016-10-08T11:44:44.977' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:924', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (88, CAST(N'2016-10-08T11:44:45.097' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:926', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (89, CAST(N'2016-10-08T11:44:45.223' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:927', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (90, CAST(N'2016-10-08T11:44:45.340' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:928', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (91, CAST(N'2016-10-08T11:44:45.450' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:929', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (92, CAST(N'2016-10-08T19:23:59.407' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:2:882', 1, 2, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (93, CAST(N'2016-10-08T19:24:26.077' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:4:902', 1, 4, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (94, CAST(N'2016-10-08T19:24:26.390' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:5:70', 1, 5, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (95, CAST(N'2016-10-08T19:24:26.407' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:5:73', 1, 5, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (96, CAST(N'2016-10-08T19:24:26.420' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:5:75', 1, 5, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (97, CAST(N'2016-10-08T19:24:53.280' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:5:78', 1, 5, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (98, CAST(N'2016-10-08T19:24:53.297' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:5:80', 1, 5, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (99, CAST(N'2016-10-08T19:24:53.310' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:5:83', 1, 5, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (100, CAST(N'2016-10-08T19:24:53.327' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:5:86', 1, 5, CAST(0.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (101, CAST(N'2016-10-08T19:24:53.343' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:5:88', 1, 5, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (102, CAST(N'2016-10-08T19:26:02.980' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:5:71', 1, 5, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (103, CAST(N'2016-10-08T19:26:03.013' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:5:74', 1, 5, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (104, CAST(N'2016-10-08T19:26:03.043' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:5:76', 1, 5, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (105, CAST(N'2016-10-08T19:26:03.060' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:5:79', 1, 5, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (106, CAST(N'2016-10-08T19:26:03.090' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:5:81', 1, 5, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (107, CAST(N'2016-10-08T19:26:03.120' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:5:84', 1, 5, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (108, CAST(N'2016-10-08T19:26:03.137' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:5:87', 1, 5, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (109, CAST(N'2016-10-08T19:26:03.167' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:5:89', 1, 5, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (110, CAST(N'2016-10-10T19:18:37.510' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:6:931', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (111, CAST(N'2016-10-10T19:18:37.523' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:6:932', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (112, CAST(N'2016-10-10T19:18:37.540' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:6:933', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (113, CAST(N'2016-10-10T19:19:26.570' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:6:935', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (114, CAST(N'2016-10-10T19:19:26.587' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:6:936', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (115, CAST(N'2016-10-10T19:19:26.600' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:6:938', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (116, CAST(N'2016-10-10T19:20:50.537' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:6:947', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (117, CAST(N'2016-10-10T19:20:50.550' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:6:948', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (118, CAST(N'2016-10-10T19:21:37.097' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:8:959', 1, 8, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (119, CAST(N'2016-10-10T19:21:37.127' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:8:960', 1, 8, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (120, CAST(N'2016-10-10T19:24:05.670' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:109', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (121, CAST(N'2016-10-10T19:24:05.687' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:110', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (122, CAST(N'2016-10-10T19:24:05.700' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:111', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (123, CAST(N'2016-10-10T19:24:05.717' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:112', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (124, CAST(N'2016-10-10T19:24:05.733' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:113', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (125, CAST(N'2016-10-10T19:24:05.750' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:114', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (126, CAST(N'2016-10-10T19:24:05.750' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:115', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (127, CAST(N'2016-10-10T19:24:05.763' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:117', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (128, CAST(N'2016-10-10T19:24:05.780' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:118', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (129, CAST(N'2016-10-10T19:24:05.797' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:119', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (130, CAST(N'2016-10-10T19:24:05.810' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:120', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (131, CAST(N'2016-10-10T19:24:05.827' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:121', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (132, CAST(N'2016-10-10T19:24:05.843' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:122', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (133, CAST(N'2016-10-10T19:24:05.857' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:123', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (134, CAST(N'2016-10-10T19:24:05.857' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:124', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (135, CAST(N'2016-10-10T19:24:05.873' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:125', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (136, CAST(N'2016-10-10T19:24:05.890' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:127', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (137, CAST(N'2016-10-10T19:24:05.903' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:128', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (138, CAST(N'2016-10-10T19:24:05.920' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:130', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (139, CAST(N'2016-10-10T19:24:05.937' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:131', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (140, CAST(N'2016-10-10T19:24:05.950' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:132', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (141, CAST(N'2016-10-10T19:24:05.967' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:133', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (142, CAST(N'2016-10-10T19:24:05.967' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:134', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (143, CAST(N'2016-10-10T19:24:05.983' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:136', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (144, CAST(N'2016-10-10T19:24:06.000' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:137', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (145, CAST(N'2016-10-10T19:24:06.013' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:138', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (146, CAST(N'2016-10-10T19:24:06.030' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:140', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (147, CAST(N'2016-10-10T19:24:06.047' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:141', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (148, CAST(N'2016-10-10T19:24:06.060' AS DateTime), N'jack@black.com', N'anthony@atomichelicopters.com', NULL, N'1:9:143', 1, 9, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (149, CAST(N'2016-10-16T15:28:36.810' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:6:934', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (150, CAST(N'2016-10-16T15:28:37.467' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:6:939', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (151, CAST(N'2016-10-16T15:28:37.653' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:6:940', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (152, CAST(N'2016-10-16T15:28:37.827' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:6:941', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (153, CAST(N'2016-10-16T15:28:37.997' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:6:942', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (154, CAST(N'2016-10-16T15:28:38.170' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:6:943', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (155, CAST(N'2016-10-16T15:28:38.310' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:6:944', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (156, CAST(N'2016-10-16T15:28:38.497' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:6:946', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (157, CAST(N'2016-10-16T15:28:38.997' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:6:949', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (158, CAST(N'2016-10-16T15:28:39.153' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:6:950', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (159, CAST(N'2016-10-16T15:28:39.310' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:6:951', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (160, CAST(N'2016-10-16T15:28:39.497' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:6:952', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (161, CAST(N'2016-10-16T15:28:39.653' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:6:953', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (162, CAST(N'2016-10-16T15:28:39.810' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:6:954', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (163, CAST(N'2016-10-16T15:28:39.967' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:6:955', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (164, CAST(N'2016-10-16T15:28:40.137' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:6:956', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (165, CAST(N'2016-10-16T15:28:40.310' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:6:957', 1, 6, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (166, CAST(N'2016-10-16T18:05:39.163' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:10:145', 1, 10, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (167, CAST(N'2016-10-16T18:05:39.320' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:10:146', 1, 10, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (168, CAST(N'2016-10-17T01:10:26.197' AS DateTime), N'jack@black.com', N'gsukumar@outlook.com', NULL, N'1:1:2', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (169, CAST(N'2017-05-06T02:39:04.630' AS DateTime), N'tours@atomichelicopters.com', N'anthony@atomichelicopters.com', NULL, N'1:1:2', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (170, CAST(N'2017-05-06T02:39:04.643' AS DateTime), N'tours@atomichelicopters.com', N'anthony@atomichelicopters.com', NULL, N'1:1:3', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (171, CAST(N'2017-05-06T02:39:04.643' AS DateTime), N'tours@atomichelicopters.com', N'anthony@atomichelicopters.com', NULL, N'1:1:4', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (172, CAST(N'2017-05-06T02:39:04.643' AS DateTime), N'tours@atomichelicopters.com', N'anthony@atomichelicopters.com', NULL, N'1:1:5', 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[CompletionLogs] ([Id], [DateCompleted], [Student], [Instructor], [AircraftUsed], [LessonGUID], [STAGEID], [LESSONID], [HoursSpent]) VALUES (173, CAST(N'2017-05-06T02:39:04.643' AS DateTime), N'tours@atomichelicopters.com', N'anthony@atomichelicopters.com', NULL, N'1:1:31', 1, 1, CAST(0.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[CompletionLogs] OFF
INSERT [dbo].[FAACerts] ([CertificationID], [CertificationName], [InfoLink], [FAAPart]) VALUES (N'141-PVT', N'Private Pilot Helicopter', NULL, N'141       ')
SET IDENTITY_INSERT [dbo].[LESSONITEMS] ON 

INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1, 1, 1, N'1:1:1', N'Preflight Preparation', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (2, 1, 1, N'1:1:2', N'Aircraft Logbooks', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (3, 1, 1, N'1:1:3', N'Certificates and Documents', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (4, 1, 1, N'1:1:4', N'Operation of Systems', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (5, 1, 1, N'1:1:5', N'Minimum Equipment List', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (6, 1, 1, N'1:1:6', N'Emergency Equipment and Survival Gear', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (7, 1, 1, N'1:1:7', N'Location of First Aid Kit', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (8, 1, 1, N'1:1:8', N'Location of Fire Extinguisher', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (9, 1, 1, N'1:1:9', N'Location of Survival Gear', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (10, 1, 1, N'1:1:10', N'Preflight Procedures', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (11, 1, 1, N'1:1:11', N'Preflight Inspection', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (12, 1, 1, N'1:1:12', N'Cockpit Management', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (13, 1, 1, N'1:1:13', N'Engine Starting and Rotor Engagement', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (14, 1, 1, N'1:1:14', N'Before Takeoff Check', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (15, 1, 1, N'1:1:15', N'Airport and Heliport Operations', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (16, 1, 1, N'1:1:16', N'Radio Communications', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (17, 1, 1, N'1:1:17', N'Basic Piloting Skills', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (18, 1, 1, N'1:1:18', N'Positive Exchange of Flight Controls', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (19, 1, 1, N'1:1:19', N'Use of Checklists', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (20, 1, 1, N'1:1:20', N'Climbs', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (21, 1, 1, N'1:1:21', N'Descents', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (22, 1, 1, N'1:1:22', N'Level-Off', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (23, 1, 1, N'1:1:23', N'Straight-and-Level Flight', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (24, 1, 1, N'1:1:24', N'Shallow Banked Turns In Both', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (25, 1, 1, N'1:1:25', N'Directions', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (26, 1, 1, N'1:1:26', N'Ground Safety Precautions', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (27, 1, 1, N'1:1:27', N'Takeoffs, Landings, and Go-Arounds', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (28, 1, 1, N'1:1:28', N'Normal Takeoff and Climb', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (29, 1, 1, N'1:1:29', N'Normal Approach', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (30, 1, 1, N'1:1:30', N'Postflight Procedures', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (31, 1, 1, N'1:1:31', N'After Landing and Securing', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (32, 3, 1, N'1:3:32', N'Preflight Preparation', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (33, 3, 1, N'1:3:33', N'Aircraft Logbooks', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (34, 3, 1, N'1:3:34', N'Certificates and Documents', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (35, 3, 1, N'1:3:35', N'Operation of Systems', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (36, 3, 1, N'1:3:36', N'Minimum Equipment List', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (37, 3, 1, N'1:3:37', N'Preflight Preparations and Procedures', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (38, 3, 1, N'1:3:38', N'Helicopter Servicing', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (39, 3, 1, N'1:3:39', N'Fuel Grades', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (40, 3, 1, N'1:3:40', N'Basic Piloting Skills', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (41, 3, 1, N'1:3:41', N'Climbing and Descending Turns', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (42, 3, 1, N'1:3:42', N'Airspeed Transitions', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (43, 3, 1, N'1:3:43', N'Collision Avoidance', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (44, 3, 1, N'1:3:44', N'Emergency Equipment and Survival Gear', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (45, 3, 1, N'1:3:45', N'Location of First Aid Kit', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (46, 3, 1, N'1:3:46', N'Location of Fire Extinguisher', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (47, 3, 1, N'1:3:47', N'Location of Survival Gear', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (48, 3, 1, N'1:3:48', N'Preflight Procedures', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (49, 3, 1, N'1:3:49', N'Preflight Inspection', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (50, 3, 1, N'1:3:50', N'Cockpit Management', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (51, 3, 1, N'1:3:51', N'Engine Starting and Rotor Engagement', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (52, 3, 1, N'1:3:52', N'Before Takeoff Check', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (53, 3, 1, N'1:3:53', N'Airport and Heliport Operations', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (54, 3, 1, N'1:3:54', N'Radio Communications', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (55, 3, 1, N'1:3:55', N'Basic Piloting Skills', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (56, 3, 1, N'1:3:56', N'Positive Exchange of Flight Controls', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (57, 3, 1, N'1:3:57', N'Use of Checklists', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (58, 3, 1, N'1:3:58', N'Climbs', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (59, 3, 1, N'1:3:59', N'Descents', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (60, 3, 1, N'1:3:60', N'Level-Off', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (61, 3, 1, N'1:3:61', N'Straight-and-Level Flight', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (62, 3, 1, N'1:3:62', N'Shallow and Medium Banked Turns In Both Directions', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (63, 3, 1, N'1:3:63', N'Ground Safety Precautions', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (64, 3, 1, N'1:3:64', N'Takeoffs, Landings, and Go-Arounds', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (65, 3, 1, N'1:3:65', N'Normal Takeoff and Climb', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (66, 3, 1, N'1:3:66', N'Normal Approach', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (67, 3, 1, N'1:3:67', N'Postflight Procedures', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (68, 3, 1, N'1:3:68', N'After Landing and Securing', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (69, 5, 1, N'1:5:69', N'Preflight Preparation', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (70, 5, 1, N'1:5:70', N'Helicopter Servicing', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (71, 5, 1, N'1:5:71', N'Fuel Grades', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (72, 5, 1, N'1:5:72', N'Preflight Procedures', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (73, 5, 1, N'1:5:73', N'Preflight Inspection', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (74, 5, 1, N'1:5:74', N'Cockpit Management', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (75, 5, 1, N'1:5:75', N'Engine Starting and Rotor Engagement', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (76, 5, 1, N'1:5:76', N'Before Takeoff Check', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (77, 5, 1, N'1:5:77', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (78, 5, 1, N'1:5:78', N'Positive Exchange of Flight Controls', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (79, 5, 1, N'1:5:79', N'Climbing and Descending Turns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (80, 5, 1, N'1:5:80', N'Airspeed Transitions', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (81, 5, 1, N'1:5:81', N'Collision Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (82, 5, 1, N'1:5:82', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (83, 5, 1, N'1:5:83', N'Normal Takeoff and Climb', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (84, 5, 1, N'1:5:84', N'Normal Approach', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (85, 5, 1, N'1:5:85', N'Postflight Procedures', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (86, 5, 1, N'1:5:86', N'After Landing and Securing', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (87, 5, 1, N'1:5:87', N'Vertical Takeoff to a Hover', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (88, 5, 1, N'1:5:88', N'Stationary Hovering', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (89, 5, 1, N'1:5:89', N'Vertical Landing From a Hover', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (90, 7, 1, N'1:7:90', N'Preflight Procedures', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (91, 7, 1, N'1:7:91', N'Preflight Inspection', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (92, 7, 1, N'1:7:92', N'Cockpit Management', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (93, 7, 1, N'1:7:93', N'Engine Starting and Rotor Engagement', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (94, 7, 1, N'1:7:94', N'Before Takeoff Ch', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (95, 7, 1, N'1:7:95', N'eck', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (96, 7, 1, N'1:7:96', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (97, 7, 1, N'1:7:97', N'Vertical Takeoff to a Hover', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (98, 7, 1, N'1:7:98', N'Stationary Hovering', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (99, 7, 1, N'1:7:99', N'Vertical Landing From a Hover', 0, 1, 0)
GO
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (100, 7, 1, N'1:7:100', N'Postflight Procedures', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (101, 7, 1, N'1:7:101', N'After Landing and Securing', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (102, 7, 1, N'1:7:102', N'Forward, Rearward, and Sideward', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (103, 7, 1, N'1:7:103', N'Hovering', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (104, 7, 1, N'1:7:104', N'Hovering Turns', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (105, 7, 1, N'1:7:105', N'Takeoffs, Landings, and Go-Arounds', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (106, 7, 1, N'1:7:106', N'Crosswind Takeoff and Climb', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (107, 7, 1, N'1:7:107', N'Crosswind Approach', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (108, 9, 1, N'1:9:108', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (109, 9, 1, N'1:9:109', N'Vertical Takeoffs and Landings', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (110, 9, 1, N'1:9:110', N'Forward, Rearward, and Sideward', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (111, 9, 1, N'1:9:111', N'Hovering', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (112, 9, 1, N'1:9:112', N'Hovering Turns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (113, 9, 1, N'1:9:113', N'Cockpit Management', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (114, 9, 1, N'1:9:114', N'Engine Starting and Rotor Engagement', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (115, 9, 1, N'1:9:115', N'Before Takeoff Check', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (116, 9, 1, N'1:9:116', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (117, 9, 1, N'1:9:117', N'Climbs', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (118, 9, 1, N'1:9:118', N'Descents', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (119, 9, 1, N'1:9:119', N'Level-Off', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (120, 9, 1, N'1:9:120', N'Straight-and-Level Flight', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (121, 9, 1, N'1:9:121', N'Shallow, Medium, and Steep Banked Turns In Both Directions', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (122, 9, 1, N'1:9:122', N'Climbing and Descending Turns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (123, 9, 1, N'1:9:123', N'Ground Safety Precautions', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (124, 9, 1, N'1:9:124', N'Airspeed Transitions', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (125, 9, 1, N'1:9:125', N'Collision Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (126, 9, 1, N'1:9:126', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (127, 9, 1, N'1:9:127', N'Crosswind Takeoff and Climb', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (128, 9, 1, N'1:9:128', N'Crosswind Approach', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (129, 9, 1, N'1:9:129', N'Airport and Heliport Operations', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (130, 9, 1, N'1:9:130', N'Radio Communications and ATC Light', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (131, 9, 1, N'1:9:131', N'Signals  Traffic Pattern', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (132, 9, 1, N'1:9:132', N'Airport and Heliport Markings and', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (133, 9, 1, N'1:9:133', N'Lighting', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (134, 9, 1, N'1:9:134', N'Runway Incursion Avoidance', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (135, 9, 1, N'1:9:135', N'Hovering Maneuvers', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (136, 9, 1, N'1:9:136', N'Surface Taxi (Applies only to helicopters equipped with wheel-type landing gear)', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (137, 9, 1, N'1:9:137', N'Hover Taxi', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (138, 9, 1, N'1:9:138', N'Air Taxi', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (139, 9, 1, N'1:9:139', N'Basic Piloting Skills', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (140, 9, 1, N'1:9:140', N'Wake Turbulence Avoidance', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (141, 9, 1, N'1:9:141', N'Low-Level Wind Shear Considerations', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (142, 9, 1, N'1:9:142', N'Takeoffs, Landings, and Go-Arounds', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (143, 9, 1, N'1:9:143', N'Go-Around', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (144, 10, 1, N'1:10:144', N'Airport and Heliport Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (145, 10, 1, N'1:10:145', N'Radio Communications and ATC Light Signals', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (146, 10, 1, N'1:10:146', N'Traffic Pattern', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (147, 10, 1, N'1:10:147', N'Airport and Heliport Markings and Lighting', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (148, 10, 1, N'1:10:148', N'Runway Incursion Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (149, 10, 1, N'1:10:149', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (150, 10, 1, N'1:10:150', N'Vertical Takeoffs and Landings', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (151, 10, 1, N'1:10:151', N'Surface Taxi (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (152, 10, 1, N'1:10:152', N'Hover Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (153, 10, 1, N'1:10:153', N'Air Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (154, 10, 1, N'1:10:154', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (155, 10, 1, N'1:10:155', N'Wake Turbulence Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (156, 10, 1, N'1:10:156', N'___ Low-Level Wind Shear Considerations', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (157, 10, 1, N'1:10:157', N'Collision Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (158, 10, 1, N'1:10:158', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (159, 10, 1, N'1:10:159', N'Go-Around', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (160, 10, 1, N'1:10:160', N'Emergency Operations', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (161, 10, 1, N'1:10:161', N'Straight-In Autorotation With Power Recovery', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (162, 10, 1, N'1:10:162', N'Power Failure at a Hover', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (163, 10, 1, N'1:10:163', N'Power Failure at Altitude', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (164, 10, 1, N'1:10:164', N'Simulated Forced Landing Procedures', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (165, 11, 1, N'1:11:165', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (166, 11, 1, N'1:11:166', N'Vertical Takeoffs and Landings', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (167, 11, 1, N'1:11:167', N'Forward, Rearward, and Sideward Hovering', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (168, 11, 1, N'1:11:168', N'Hovering Turns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (169, 11, 1, N'1:11:169', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (170, 11, 1, N'1:11:170', N'Normal Takeoff and Climb', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (171, 11, 1, N'1:11:171', N'Normal Approach', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (172, 11, 1, N'1:11:172', N'Emergency Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (173, 11, 1, N'1:11:173', N'Straight-In Autorotation With Power Recovery', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (174, 11, 1, N'1:11:174', N'Power Failure at a Hover', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (175, 11, 1, N'1:11:175', N'Power Failure at Altitude', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (176, 11, 1, N'1:11:176', N'Simulated Forced Landing Procedures', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (177, 11, 1, N'1:11:177', N'Hovering Maneuvers', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (178, 11, 1, N'1:11:178', N'Hovering Patterns', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (179, 11, 1, N'1:11:179', N'Emergency Operations', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (180, 11, 1, N'1:11:180', N'90° Autorotation With Power Recovery', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (181, 13, 1, N'1:13:181', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (182, 13, 1, N'1:13:182', N'Hovering Patterns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (183, 13, 1, N'1:13:183', N'Emergency Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (184, 13, 1, N'1:13:184', N'90° Autorotation With Power Recovery', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (185, 13, 1, N'1:13:185', N'Emergency Operations', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (186, 13, 1, N'1:13:186', N'Settling-With-Power', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (187, 13, 1, N'1:13:187', N'Low Rotor RPM Recovery (This task applies to a hover and in flight).', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (188, 13, 1, N'1:13:188', N'Partial Power Failure', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (189, 14, 1, N'1:14:189', N'Emergency Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (190, 14, 1, N'1:14:190', N'Settling-With-Power', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (191, 14, 1, N'1:14:191', N'Low Rotor RPM Recovery', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (192, 14, 1, N'1:14:192', N'Partial Power Failure', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (193, 14, 1, N'1:14:193', N'Systems and Equipment Malfunctions', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (194, 14, 1, N'1:14:194', N'Electrical System Malfunction', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (195, 14, 1, N'1:14:195', N'Electrical Fire or Smoke', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (196, 14, 1, N'1:14:196', N'Hydraulic System Malfunction (If Applicable)', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (197, 14, 1, N'1:14:197', N'Engine and Components Malfunctions', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (198, 14, 1, N'1:14:198', N'Antitorque Failure (This task applies to a hover and in flight).', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (199, 14, 1, N'1:14:199', N'Power Train Failure', 0, 0, 1)
GO
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (200, 14, 1, N'1:14:200', N'Abnormal Vibrations', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (201, 14, 1, N'1:14:201', N'__ Warning Lights', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (202, 14, 1, N'1:14:202', N'Tachometer Failure', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (203, 14, 1, N'1:14:203', N'Induction System Icing', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (204, 16, 1, N'1:16:204', N'Airport and Heliport Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (205, 16, 1, N'1:16:205', N'Traffic Pattern', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (206, 16, 1, N'1:16:206', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (207, 16, 1, N'1:16:207', N'Vertical Takeoffs and Landings', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (208, 16, 1, N'1:16:208', N'Hovering Patterns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (209, 16, 1, N'1:16:209', N'Takeoffs, Landings and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (210, 16, 1, N'1:16:210', N'Normal Approach', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (211, 16, 1, N'1:16:211', N'Go-Around', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (212, 16, 1, N'1:16:212', N'Emergency Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (213, 16, 1, N'1:16:213', N'Straight-In Autorotation With Power Recovery', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (214, 16, 1, N'1:16:214', N'90°Autorotation With Power Recovery', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (215, 16, 1, N'1:16:215', N'Power Failure at a Hover', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (216, 16, 1, N'1:16:216', N'Power Failure at Altitude', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (217, 16, 1, N'1:16:217', N'Simulated Forced Landing Procedures', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (218, 16, 1, N'1:16:218', N'Settling-With-Power', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (219, 16, 1, N'1:16:219', N'Low Rotor RPM Recovery', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (220, 16, 1, N'1:16:220', N'Partial Power Failure', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (221, 16, 1, N'1:16:221', N'Systems and Equipment Malfunctions', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (222, 16, 1, N'1:16:222', N'Electrical System Malfunction', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (223, 16, 1, N'1:16:223', N'Electrical Fire or Smoke', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (224, 16, 1, N'1:16:224', N'Hydraulic System Malfunction (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (225, 16, 1, N'1:16:225', N'Engine and Components Malfunctions', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (226, 16, 1, N'1:16:226', N'Antitorque Failure (This task applies to a hover and in flight).', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (227, 16, 1, N'1:16:227', N'Power Train Failure', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (228, 16, 1, N'1:16:228', N'Abnormal Vibrations', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (229, 16, 1, N'1:16:229', N'Warning Lights', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (230, 16, 1, N'1:16:230', N'Tachometer Failure', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (231, 16, 1, N'1:16:231', N'Induction System Icing', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (232, 16, 1, N'1:16:232', N'Basic Piloting Skills', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (233, 16, 1, N'1:16:233', N'Rapid Deceleration', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (234, 17, 1, N'1:17:234', N'Preflight Preparation and Procedures', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (235, 17, 1, N'1:17:235', N'Operation of Systems', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (236, 17, 1, N'1:17:236', N'Preflight Inspection', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (237, 17, 1, N'1:17:237', N'Cockpit Management', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (238, 17, 1, N'1:17:238', N'Engine Starting and Rotor Engagement', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (239, 17, 1, N'1:17:239', N'Before Takeoff Check', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (240, 17, 1, N'1:17:240', N'Airport and Heliport Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (241, 17, 1, N'1:17:241', N'Radio Communications and ATC Light Signals', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (242, 17, 1, N'1:17:242', N'Traffic Pattern', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (243, 17, 1, N'1:17:243', N'Airport and Heliport Markings and Lighting', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (244, 17, 1, N'1:17:244', N'Runway Incursion Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (245, 17, 1, N'1:17:245', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (246, 17, 1, N'1:17:246', N'Vertical Takeoffs and Landings', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (247, 17, 1, N'1:17:247', N'Forward, Rearward, and Sideward Hovering', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (248, 17, 1, N'1:17:248', N'Hovering Turns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (249, 17, 1, N'1:17:249', N'Surface Taxi (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (250, 17, 1, N'1:17:250', N'Hover Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (251, 17, 1, N'1:17:251', N'Air Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (252, 17, 1, N'1:17:252', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (253, 17, 1, N'1:17:253', N'Use of Checklists', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (254, 17, 1, N'1:17:254', N'Rapid Deceleration', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (255, 17, 1, N'1:17:255', N'Wake Turbulence Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (256, 17, 1, N'1:17:256', N'Low-Level Wind Shear Considerations Collision Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (257, 17, 1, N'1:17:257', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (258, 17, 1, N'1:17:258', N'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (259, 17, 1, N'1:17:259', N'Go-Around', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (260, 17, 1, N'1:17:260', N'Emergency Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (261, 17, 1, N'1:17:261', N'Straight-In Autorotation With Power Recovery', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (262, 17, 1, N'1:17:262', N'90°Autorotation With Power Recovery', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (263, 17, 1, N'1:17:263', N'Power Failure at a Hover', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (264, 17, 1, N'1:17:264', N'Power Failure at Altitude', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (265, 17, 1, N'1:17:265', N'Simulated Forced Landing Procedures', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (266, 17, 1, N'1:17:266', N'Settling-With-Power', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (267, 17, 1, N'1:17:267', N'Low Rotor RPM Recovery', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (268, 17, 1, N'1:17:268', N'Partial Power Failure', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (269, 17, 1, N'1:17:269', N'Postflight Procedures', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (270, 17, 1, N'1:17:270', N'After Landing and Securing', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (271, 19, 1, N'1:19:271', N'Preflight Preparation and Procedures Airport and Heliport Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (272, 19, 1, N'1:19:272', N'Radio Communications and ATC Light Signals', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (273, 19, 1, N'1:19:273', N'Traffic Pattern', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (274, 19, 1, N'1:19:274', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (275, 19, 1, N'1:19:275', N'Vertical Takeoffs and Landings', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (276, 19, 1, N'1:19:276', N'Surface Taxi (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (277, 19, 1, N'1:19:277', N'Hover Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (278, 19, 1, N'1:19:278', N'Air Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (279, 19, 1, N'1:19:279', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (280, 19, 1, N'1:19:280', N'Wake Turbulence Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (281, 19, 1, N'1:19:281', N'Collision Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (282, 19, 1, N'1:19:282', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (283, 19, 1, N'1:19:283', N'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (284, 19, 1, N'1:19:284', N'Go-Around', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (285, 19, 1, N'1:19:285', N'Supervised Solo', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (286, 19, 1, N'1:19:286', N'Preflight Preparation and Procedures Airport and Heliport Operations', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (287, 19, 1, N'1:19:287', N'Radio Communications and ATCLight Signals', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (288, 19, 1, N'1:19:288', N'Traffic Pattern', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (289, 19, 1, N'1:19:289', N'Hovering Maneuvers', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (290, 19, 1, N'1:19:290', N'Vertical Takeoffs and Landings', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (291, 19, 1, N'1:19:291', N'Stationary Hover', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (292, 19, 1, N'1:19:292', N'Surface Taxi (If Applicable)', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (293, 19, 1, N'1:19:293', N'Hover Taxi', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (294, 19, 1, N'1:19:294', N'Air Taxi', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (295, 19, 1, N'1:19:295', N'Basic Piloting Skills', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (296, 19, 1, N'1:19:296', N'Wake Turbulence Avoidance', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (297, 19, 1, N'1:19:297', N'Collision Avoidance', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (298, 19, 1, N'1:19:298', N'Takeoffs, Landings, and Go-Arounds', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (299, 19, 1, N'1:19:299', N'Normal and Crosswind Takeoffs, Climbs, and Approaches  Go-Around', 0, 0, 1)
GO
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (300, 19, 1, N'1:19:300', N'Go-Around', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (301, 21, 1, N'1:21:301', N'Preflight Preparation and Procedures', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (302, 21, 1, N'1:21:302', N'Certificates and Documents', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (303, 21, 1, N'1:21:303', N'Operation of Systems', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (304, 21, 1, N'1:21:304', N'Preflight Inspection', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (305, 21, 1, N'1:21:305', N'Cockpit Management', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (306, 21, 1, N'1:21:306', N'Engine Starting and Rotor Engagement', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (307, 21, 1, N'1:21:307', N'Before Takeoff Check', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (308, 21, 1, N'1:21:308', N'Airport and Heliport Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (309, 21, 1, N'1:21:309', N'Radio Communications and ATC Light Signals  Traffic Pattern', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (310, 21, 1, N'1:21:310', N'Airport and Heliport Markings and', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (311, 21, 1, N'1:21:311', N'Lighting', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (312, 21, 1, N'1:21:312', N'Runway Incursion Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (313, 21, 1, N'1:21:313', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (314, 21, 1, N'1:21:314', N'Vertical Takeoffs and Landings', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (315, 21, 1, N'1:21:315', N'Forward, Rearward, and Sideward Hovering', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (316, 21, 1, N'1:21:316', N'Hovering Turns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (317, 21, 1, N'1:21:317', N'Surface Taxi (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (318, 21, 1, N'1:21:318', N'Hover Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (319, 21, 1, N'1:21:319', N'Air Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (320, 21, 1, N'1:21:320', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (321, 21, 1, N'1:21:321', N'Use of Checklists', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (322, 21, 1, N'1:21:322', N'Climbing and Descending Turns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (323, 21, 1, N'1:21:323', N'Level-Off', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (324, 21, 1, N'1:21:324', N'Straight-and-Level Flight', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (325, 21, 1, N'1:21:325', N'Airspeed Transitions', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (326, 21, 1, N'1:21:326', N'Rapid Deceleration', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (327, 21, 1, N'1:21:327', N'Ground Safety Precautions', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (328, 21, 1, N'1:21:328', N'Wake Turbulence Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (329, 21, 1, N'1:21:329', N'Collision Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (330, 21, 1, N'1:21:330', N'Low-Level Wind Shear Considerations', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (331, 21, 1, N'1:21:331', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (332, 21, 1, N'1:21:332', N'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (333, 21, 1, N'1:21:333', N'Go-Around', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (334, 21, 1, N'1:21:334', N'Emergency Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (335, 21, 1, N'1:21:335', N'Straight-In Autorotation With Power Recovery', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (336, 21, 1, N'1:21:336', N'90° Autorotation With Power Recovery', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (337, 21, 1, N'1:21:337', N'Power Failure at a Hover', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (338, 21, 1, N'1:21:338', N'Power Failure at Altitude', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (339, 21, 1, N'1:21:339', N'Simulated Forced Landing Procedures', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (340, 21, 1, N'1:21:340', N'Settling-With-Power', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (341, 21, 1, N'1:21:341', N'Low Rotor RPM Recovery', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (342, 21, 1, N'1:21:342', N'Partial Power Failure', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (343, 21, 1, N'1:21:343', N'Systems and Equipment Malfunctions', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (344, 21, 1, N'1:21:344', N'Postflight Procedures', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (345, 21, 1, N'1:21:345', N'After Landing and Securing', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (346, 22, 2, N'2:22:346', N'Preflight Preparation and Procedures', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (347, 22, 2, N'2:22:347', N'Airport and Heliport Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (348, 22, 2, N'2:22:348', N'Radio Communications and ATC Light Signals', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (349, 22, 2, N'2:22:349', N'Traffic Pattern', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (350, 22, 2, N'2:22:350', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (351, 22, 2, N'2:22:351', N'Vertical Takeoffs and Landings', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (352, 22, 2, N'2:22:352', N'Surface Taxi (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (353, 22, 2, N'2:22:353', N'Hover Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (354, 22, 2, N'2:22:354', N'Air Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (355, 22, 2, N'2:22:355', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (356, 22, 2, N'2:22:356', N'Wake Turbulence Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (357, 22, 2, N'2:22:357', N'Collision Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (358, 22, 2, N'2:22:358', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (359, 22, 2, N'2:22:359', N'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (360, 22, 2, N'2:22:360', N'Go-Around', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (361, 22, 2, N'2:22:361', N'Supervised Solo', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (362, 22, 2, N'2:22:362', N'Preflight Preparation and Procedures', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (363, 22, 2, N'2:22:363', N'Airport and Heliport Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (364, 22, 2, N'2:22:364', N'Radio Communications and ATC Light Signals', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (365, 22, 2, N'2:22:365', N'Traffic Pattern', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (366, 22, 2, N'2:22:366', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (367, 22, 2, N'2:22:367', N'Vertical Takeoffs and Landings', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (368, 22, 2, N'2:22:368', N'Stationary Hover', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (369, 22, 2, N'2:22:369', N'Surface Taxi (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (370, 22, 2, N'2:22:370', N'Hover Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (371, 22, 2, N'2:22:371', N'Air Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (372, 22, 2, N'2:22:372', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (373, 22, 2, N'2:22:373', N'Wake Turbulence Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (374, 22, 2, N'2:22:374', N'Collision Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (375, 22, 2, N'2:22:375', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (376, 22, 2, N'2:22:376', N'Normal and Crosswind Takeoffs,Climbs, and Approaches', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (377, 22, 2, N'2:22:377', N'Go-Around', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (378, 23, 2, N'2:23:378', N'Preflight Preparation and Procedures', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (379, 23, 2, N'2:23:379', N'Airport and Heliport Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (380, 23, 2, N'2:23:380', N'Radio Communications and ATC Light Signals', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (381, 23, 2, N'2:23:381', N'Traffic Pattern', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (382, 23, 2, N'2:23:382', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (383, 23, 2, N'2:23:383', N'Vertical Takeoffs and Landings', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (384, 23, 2, N'2:23:384', N'Forward, Rearward, and Sideward', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (385, 23, 2, N'2:23:385', N'Hovering', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (386, 23, 2, N'2:23:386', N'Hovering Turns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (387, 23, 2, N'2:23:387', N'Hovering Patterns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (388, 23, 2, N'2:23:388', N'Surface Taxi (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (389, 23, 2, N'2:23:389', N'Hover Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (390, 23, 2, N'2:23:390', N'Air Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (391, 23, 2, N'2:23:391', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (392, 23, 2, N'2:23:392', N'Wake Turbulence Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (393, 23, 2, N'2:23:393', N'Collision Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (394, 23, 2, N'2:23:394', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (395, 23, 2, N'2:23:395', N'Normal and Crosswind Takeoffs,', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (396, 23, 2, N'2:23:396', N'Climbs, and Approaches', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (397, 23, 2, N'2:23:397', N'Go-Around', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (398, 24, 2, N'2:24:398', N'As directed by the Instructor', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (399, 24, 2, N'2:24:399', N'Takeoffs, Landings, and Go-Arounds', 1, 0, 1)
GO
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (400, 24, 2, N'2:24:400', N'Maximum Performance Takeoff and Climb', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (401, 24, 2, N'2:24:401', N'Steep Approach', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (402, 24, 2, N'2:24:402', N'Rolling Takeoff (Applies only to helicopters equipped with wheel-type landing gear)', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (403, 24, 2, N'2:24:403', N'Running Takeoff', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (404, 24, 2, N'2:24:404', N'Shallow Approach and Running/Roll-On Landing', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (405, 25, 2, N'2:25:405', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (406, 25, 2, N'2:25:406', N'Rapid Deceleration', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (407, 25, 2, N'2:25:407', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (408, 25, 2, N'2:25:408', N'Maximum Performance Takeoff and Climb', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (409, 25, 2, N'2:25:409', N'Steep Approach', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (410, 25, 2, N'2:25:410', N'Rolling Takeoff (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (411, 25, 2, N'2:25:411', N'Running Takeoff', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (412, 25, 2, N'2:25:412', N'Shallow Approach and Running/Roll-On Landing', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (413, 25, 2, N'2:25:413', N'Hovering Maneuvers', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (414, 25, 2, N'2:25:414', N'Slope Operations', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (415, 25, 2, N'2:25:415', N'Emergency Operations', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (416, 25, 2, N'2:25:416', N'Retreating Blade Stall (Discussion Only)', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (417, 25, 2, N'2:25:417', N'Dynamic Rollover (Discussion Only)', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (418, 27, 2, N'2:27:418', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (419, 27, 2, N'2:27:419', N'Slope Operations', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (420, 27, 2, N'2:27:420', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (421, 27, 2, N'2:27:421', N'Rapid Deceleration', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (422, 27, 2, N'2:27:422', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (423, 27, 2, N'2:27:423', N'Maximum Performance Takeoff and Climb', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (424, 27, 2, N'2:27:424', N'Steep Approach', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (425, 27, 2, N'2:27:425', N'Rolling Takeoff (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (426, 27, 2, N'2:27:426', N'Running Takeoff', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (427, 27, 2, N'2:27:427', N'Shallow Approach and Running/Roll-On Landing', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (428, 27, 2, N'2:27:428', N'Emergency Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (429, 27, 2, N'2:27:429', N'Retreating Blade Stall (Discussion Only)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (430, 27, 2, N'2:27:430', N'Dynamic Rollover (Discussion Only)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (431, 27, 2, N'2:27:431', N'Emergency Operations', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (432, 27, 2, N'2:27:432', N'Ground Resonance (Discussion Only)', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (433, 27, 2, N'2:27:433', N'Low G Conditions (Discussion Only)', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (434, 27, 2, N'2:27:434', N'Low Rotor RPM and Blade Stall Discussion Only)', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (435, 29, 2, N'2:29:435', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (436, 29, 2, N'2:29:436', N'Vertical Takeoffs and Landings', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (437, 29, 2, N'2:29:437', N'Forward, Rearward, and Sideward Hovering', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (438, 29, 2, N'2:29:438', N'Hovering Turns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (439, 29, 2, N'2:29:439', N'Hovering Patterns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (440, 29, 2, N'2:29:440', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (441, 29, 2, N'2:29:441', N'Rapid Deceleration', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (442, 29, 2, N'2:29:442', N'Wake Turbulence Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (443, 29, 2, N'2:29:443', N'Collision Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (444, 29, 2, N'2:29:444', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (445, 29, 2, N'2:29:445', N'Maximum Performance Takeoff andClimb', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (446, 29, 2, N'2:29:446', N'Steep Approach', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (447, 29, 2, N'2:29:447', N'Go-Around', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (448, 30, 2, N'2:30:448', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (449, 30, 2, N'2:30:449', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (450, 30, 2, N'2:30:450', N'Rapid Deceleration', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (451, 30, 2, N'2:30:451', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (452, 30, 2, N'2:30:452', N'Maximum Performance Takeoff and Climb', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (453, 30, 2, N'2:30:453', N'Steep Approach', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (454, 30, 2, N'2:30:454', N'Rolling Takeoff (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (455, 30, 2, N'2:30:455', N'Running Takeoff', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (456, 30, 2, N'2:30:456', N'Shallow Approach and Running/Roll-On Landing', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (457, 32, 2, N'2:32:457', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (458, 32, 2, N'2:32:458', N'Vertical Takeoffs and Landings', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (459, 32, 2, N'2:32:459', N'Forward, Rearward, and Sideward Hovering', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (460, 32, 2, N'2:32:460', N'Hovering Turns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (461, 32, 2, N'2:32:461', N'Hovering Patterns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (462, 32, 2, N'2:32:462', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (463, 32, 2, N'2:32:463', N'Rapid Deceleration', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (464, 32, 2, N'2:32:464', N'Wake Turbulence Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (465, 32, 2, N'2:32:465', N'Collision Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (466, 32, 2, N'2:32:466', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (467, 32, 2, N'2:32:467', N'Maximum Performance Takeoff and Climb', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (468, 32, 2, N'2:32:468', N'Steep Approach', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (469, 32, 2, N'2:32:469', N'Go-Around', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (470, 34, 2, N'2:34:470', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (471, 34, 2, N'2:34:471', N'Slope Operations', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (472, 34, 2, N'2:34:472', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (473, 34, 2, N'2:34:473', N'Rapid Deceleration', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (474, 34, 2, N'2:34:474', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (475, 34, 2, N'2:34:475', N'Maximum Performance Takeoff and Climb', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (476, 34, 2, N'2:34:476', N'Steep Approach', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (477, 34, 2, N'2:34:477', N'Rolling Takeoff (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (478, 34, 2, N'2:34:478', N'Running Takeoff', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (479, 34, 2, N'2:34:479', N'Shallow Approach and Running/Roll-On Landing', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (480, 34, 2, N'2:34:480', N'Emergency Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (481, 34, 2, N'2:34:481', N'Retreating Blade Stall (Discussion Only)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (482, 34, 2, N'2:34:482', N'Dynamic Rollover (Discussion Only)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (483, 34, 2, N'2:34:483', N'Ground Resonance (Discussion Only)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (484, 34, 2, N'2:34:484', N'Low G Conditions (Discussion Only)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (485, 34, 2, N'2:34:485', N'Low Rotor RPM and Blade Stall', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (486, 36, 3, N'3:36:486', N'Night Operations', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (487, 36, 3, N'3:36:487', N'Flight Planning Considerations', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (488, 36, 3, N'3:36:488', N'Use of Checklists', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (489, 36, 3, N'3:36:489', N'Preflight Inspection', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (490, 36, 3, N'3:36:490', N'Physiological Aspects of Night Flying', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (491, 36, 3, N'3:36:491', N'Lighting and Equipment for Night Flying', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (492, 36, 3, N'3:36:492', N'Cockpit Management', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (493, 36, 3, N'3:36:493', N'Normal and Crosswind Takeoffs,Climbs, and Approaches', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (494, 36, 3, N'3:36:494', N'Vertical Takeoffs and Landings', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (495, 36, 3, N'3:36:495', N'Hovering Maneuvers', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (496, 36, 3, N'3:36:496', N'Straight-In Autorotation With Power Recovery', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (497, 36, 3, N'3:36:497', N'Use of Landing Light', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (498, 38, 3, N'3:38:498', N'Cross-Country Flight Planning', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (499, 38, 3, N'3:38:499', N'Sectional Charts', 0, 0, 1)
GO
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (500, 38, 3, N'3:38:500', N'Flight Publications', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (501, 38, 3, N'3:38:501', N'Route Selection', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (502, 38, 3, N'3:38:502', N'Weather Information', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (503, 38, 3, N'3:38:503', N'Navigation Log', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (504, 38, 3, N'3:38:504', N'FAA Flight Plan', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (505, 38, 3, N'3:38:505', N'National Airspace System', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (506, 38, 3, N'3:38:506', N'Performance and Limitations', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (507, 38, 3, N'3:38:507', N'Weight and Balance', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (508, 38, 3, N'3:38:508', N'Aeromedical Factors', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (509, 38, 3, N'3:38:509', N'Cockpit Management', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (510, 38, 3, N'3:38:510', N'Crew Resource Management', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (511, 38, 3, N'3:38:511', N'Airport or Heliport Operations', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (512, 38, 3, N'3:38:512', N'Approach and Departure Control', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (513, 38, 3, N'3:38:513', N'Controlled Airports/Heliports', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (514, 38, 3, N'3:38:514', N'Use of ATIS', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (515, 38, 3, N'3:38:515', N'CTAF (FSS or UNICOM) Airports', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (516, 38, 3, N'3:38:516', N'Cross-Country Flight', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (517, 38, 3, N'3:38:517', N'Departure', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (518, 38, 3, N'3:38:518', N'Opening Flight Plan', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (519, 38, 3, N'3:38:519', N'Power Settings and Mixture Control', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (520, 38, 3, N'3:38:520', N'Lost Communications', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (521, 38, 3, N'3:38:521', N'Collision Avoidance', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (522, 38, 3, N'3:38:522', N'Closing Flight Plan', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (523, 38, 3, N'3:38:523', N'Navigation', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (524, 38, 3, N'3:38:524', N'Pilotage and Dead Reckoning', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (525, 38, 3, N'3:38:525', N'Radio Navigation and Radar Services', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (526, 38, 3, N'3:38:526', N'Position Fixes', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (527, 38, 3, N'3:38:527', N'Adverse Weather', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (528, 38, 3, N'3:38:528', N'Diversion', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (529, 38, 3, N'3:38:529', N'Lost Procedures', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (530, 38, 3, N'3:38:530', N'Emergency Operations', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (531, 38, 3, N'3:38:531', N'Systems and Equipment Malfunctions', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (532, 40, 3, N'3:40:532', N'Cross-Country Flight Planning', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (533, 40, 3, N'3:40:533', N'Sectional Charts', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (534, 40, 3, N'3:40:534', N'Flight Publications', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (535, 40, 3, N'3:40:535', N'Route Selection', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (536, 40, 3, N'3:40:536', N'Weather Information', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (537, 40, 3, N'3:40:537', N'Navigation Log', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (538, 40, 3, N'3:40:538', N'FAA Flight Plan', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (539, 40, 3, N'3:40:539', N'National Airspace System', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (540, 40, 3, N'3:40:540', N'Performance and Limitations', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (541, 40, 3, N'3:40:541', N'Weight and Balance', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (542, 40, 3, N'3:40:542', N'Aeromedical Factors', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (543, 40, 3, N'3:40:543', N'Cockpit Management', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (544, 40, 3, N'3:40:544', N'Crew Resource Management', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (545, 40, 3, N'3:40:545', N'Airport or Heliport Operations', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (546, 40, 3, N'3:40:546', N'Approach and Departure Control', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (547, 40, 3, N'3:40:547', N'Controlled Airports/Heliports', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (548, 40, 3, N'3:40:548', N'Use of ATIS', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (549, 40, 3, N'3:40:549', N'CTAF (FSS or UNICOM) Airports', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (550, 40, 3, N'3:40:550', N'Cross-Country Flight', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (551, 40, 3, N'3:40:551', N'Departure', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (552, 40, 3, N'3:40:552', N'Opening Flight Plan', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (553, 40, 3, N'3:40:553', N'Power Settings and Mixture Control', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (554, 40, 3, N'3:40:554', N'Lost Communications', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (555, 40, 3, N'3:40:555', N'Collision Avoidance', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (556, 40, 3, N'3:40:556', N'Closing Flight Plan', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (557, 40, 3, N'3:40:557', N'Navigation', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (558, 40, 3, N'3:40:558', N'Pilotage and Dead Reckoning', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (559, 40, 3, N'3:40:559', N'Radio Navigation and Radar Services', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (560, 40, 3, N'3:40:560', N'Position Fixes', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (561, 40, 3, N'3:40:561', N'Adverse Weather', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (562, 40, 3, N'3:40:562', N'Diversion', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (563, 40, 3, N'3:40:563', N'Lost Procedures', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (564, 40, 3, N'3:40:564', N'Emergency Operations', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (565, 40, 3, N'3:40:565', N'Systems and Equipment Malfunctions', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (566, 42, 3, N'3:42:566', N'Cross-Country Flight Planning', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (567, 42, 3, N'3:42:567', N'Sectional Charts', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (568, 42, 3, N'3:42:568', N'Flight Publications', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (569, 42, 3, N'3:42:569', N'Route Selection', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (570, 42, 3, N'3:42:570', N'Weather Information', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (571, 42, 3, N'3:42:571', N'Navigation Log', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (572, 42, 3, N'3:42:572', N'FAA Flight Plan', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (573, 42, 3, N'3:42:573', N'National Airspace System', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (574, 42, 3, N'3:42:574', N'Performance and Limitations', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (575, 42, 3, N'3:42:575', N'Weight and Balance', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (576, 42, 3, N'3:42:576', N'Aeromedical Factors', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (577, 42, 3, N'3:42:577', N'Cockpit Management', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (578, 42, 3, N'3:42:578', N'Crew Resource Management', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (579, 42, 3, N'3:42:579', N'Airport or Heliport Operations', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (580, 42, 3, N'3:42:580', N'Approach and Departure Control', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (581, 42, 3, N'3:42:581', N'Controlled Airports/Heliports', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (582, 42, 3, N'3:42:582', N'Use of ATIS', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (583, 42, 3, N'3:42:583', N'CTAF (FSS or UNICOM) Airports', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (584, 42, 3, N'3:42:584', N'Night Operations', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (585, 42, 3, N'3:42:585', N'Flight Planning Considerations', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (586, 42, 3, N'3:42:586', N'Use of Checklists', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (587, 42, 3, N'3:42:587', N'Preflight Inspection', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (588, 42, 3, N'3:42:588', N'Physiological Aspects of Night Flying', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (589, 42, 3, N'3:42:589', N'Lighting and Equipment for Night Flying', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (590, 42, 3, N'3:42:590', N'Cockpit Management', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (591, 42, 3, N'3:42:591', N'Normal and Crosswind Takeoffs,Climbs, and Approaches', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (592, 42, 3, N'3:42:592', N'Vertical Takeoffs and Landings', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (593, 42, 3, N'3:42:593', N'Hovering Maneuvers', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (594, 42, 3, N'3:42:594', N'Straight-In Autorotation With Power Recovery', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (595, 42, 3, N'3:42:595', N'Use of Landing Light', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (596, 42, 3, N'3:42:596', N'Cross-Country Flight', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (597, 42, 3, N'3:42:597', N'Departure', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (598, 42, 3, N'3:42:598', N'Opening Flight Plan', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (599, 42, 3, N'3:42:599', N'Power Settings and Mixture Control', 0, 0, 1)
GO
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (600, 42, 3, N'3:42:600', N'Lost Communications', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (601, 42, 3, N'3:42:601', N'Collision Avoidance', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (602, 42, 3, N'3:42:602', N'Closing Flight Plan', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (603, 42, 3, N'3:42:603', N'Navigation', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (604, 42, 3, N'3:42:604', N'Pilotage and Dead Reckoning', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (605, 42, 3, N'3:42:605', N'Radio Navigation and Radar Services', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (606, 42, 3, N'3:42:606', N'Position Fixes', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (607, 42, 3, N'3:42:607', N'Adverse Weather', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (608, 42, 3, N'3:42:608', N'Diversion', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (609, 42, 3, N'3:42:609', N'Lost Procedures', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (610, 43, 3, N'3:43:610', N'Preflight Preparation', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (611, 43, 3, N'3:43:611', N'Aircraft Logbooks', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (612, 43, 3, N'3:43:612', N'Certificates and Documents', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (613, 43, 3, N'3:43:613', N'Operation of Systems', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (614, 43, 3, N'3:43:614', N'Minimum Equipment List', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (615, 43, 3, N'3:43:615', N'Emergency Equipment and Survival Gear', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (616, 43, 3, N'3:43:616', N'Cross-Country Flight Planning', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (617, 43, 3, N'3:43:617', N'Weather Information', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (618, 43, 3, N'3:43:618', N'Performance and Limitations', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (619, 43, 3, N'3:43:619', N'Weight and Balance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (620, 43, 3, N'3:43:620', N'National Airspace System', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (621, 43, 3, N'3:43:621', N'Aeromedical Factors', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (622, 43, 3, N'3:43:622', N'Preflight Procedures', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (623, 43, 3, N'3:43:623', N'Preflight Inspection', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (624, 43, 3, N'3:43:624', N'Cockpit Management', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (625, 43, 3, N'3:43:625', N'__ Engine Starting and Rotor Engagement', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (626, 43, 3, N'3:43:626', N'Before Takeoff Check', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (627, 43, 3, N'3:43:627', N'Airport and Heliport Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (628, 43, 3, N'3:43:628', N'Radio Communications and ATC Light Signals', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (629, 43, 3, N'3:43:629', N'Traffic Pattern', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (630, 43, 3, N'3:43:630', N'Airport and Heliport Markings and Lighting', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (631, 43, 3, N'3:43:631', N'Runway Incursion Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (632, 43, 3, N'3:43:632', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (633, 43, 3, N'3:43:633', N'Vertical Takeoffs and Landings', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (634, 43, 3, N'3:43:634', N'Hovering Patterns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (635, 43, 3, N'3:43:635', N'Surface Taxi (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (636, 43, 3, N'3:43:636', N'Hover Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (637, 43, 3, N'3:43:637', N'Air Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (638, 43, 3, N'3:43:638', N'Slope Operations', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (639, 43, 3, N'3:43:639', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (640, 43, 3, N'3:43:640', N'Use of Checklists', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (641, 43, 3, N'3:43:641', N'Ground Safety Precautions', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (642, 43, 3, N'3:43:642', N'Rapid Deceleration', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (643, 43, 3, N'3:43:643', N'Wake Turbulence Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (644, 43, 3, N'3:43:644', N'Low-Level Wind Shear Considerations', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (645, 43, 3, N'3:43:645', N'Collision Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (646, 43, 3, N'3:43:646', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (647, 43, 3, N'3:43:647', N'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (648, 43, 3, N'3:43:648', N'Maximum Performance Takeoff and Climb', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (649, 43, 3, N'3:43:649', N'Steep Approach', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (650, 43, 3, N'3:43:650', N'Rolling Takeoff (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (651, 43, 3, N'3:43:651', N'Running Takeoff', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (652, 43, 3, N'3:43:652', N'Shallow Approach and Running/Roll-On Landing', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (653, 43, 3, N'3:43:653', N'Go-Around', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (654, 43, 3, N'3:43:654', N'Emergency Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (655, 43, 3, N'3:43:655', N'Straight-In Autorotation With Power Recovery', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (656, 43, 3, N'3:43:656', N'90° Autorotation With Power Recovery', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (657, 43, 3, N'3:43:657', N'Power Failure at a Hover', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (658, 43, 3, N'3:43:658', N'Power Failure at Altitude', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (659, 43, 3, N'3:43:659', N'Settling-With-Power', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (660, 43, 3, N'3:43:660', N'Low Rotor RPM Recovery', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (661, 43, 3, N'3:43:661', N'Partial Power Failure', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (662, 43, 3, N'3:43:662', N'Retreating Blade Stall (Discussion Only)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (663, 43, 3, N'3:43:663', N'Dynamic Rollover (Discussion Only)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (664, 43, 3, N'3:43:664', N'Ground Resonance (Discussion Only)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (665, 43, 3, N'3:43:665', N'Low G Conditions (Discussion Only)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (666, 43, 3, N'3:43:666', N'Low Rotor RPM and Blade Stall (Discussion Only)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (667, 43, 3, N'3:43:667', N'Systems and Equipment Malfunctions', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (668, 43, 3, N'3:43:668', N'Cross-Country Flight Navigation', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (669, 43, 3, N'3:43:669', N'Postflight Procedures', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (670, 45, 3, N'3:45:670', N'Preflight Preparation and Procedures', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (671, 45, 3, N'3:45:671', N'Preflight Inspection', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (672, 45, 3, N'3:45:672', N'Cockpit Management', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (673, 45, 3, N'3:45:673', N'Engine Starting and Rotor Engagement', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (674, 45, 3, N'3:45:674', N'Before Takeoff Check', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (675, 45, 3, N'3:45:675', N'Airport and Heliport Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (676, 45, 3, N'3:45:676', N'Radio Communications and ATC Light Signals', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (677, 45, 3, N'3:45:677', N'Traffic Pattern', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (678, 45, 3, N'3:45:678', N'Airport and Heliport Markings and Lighting', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (679, 45, 3, N'3:45:679', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (680, 45, 3, N'3:45:680', N'Vertical Takeoffs and Landings', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (681, 45, 3, N'3:45:681', N'Forward, Rearward, and Sideward Hovering', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (682, 45, 3, N'3:45:682', N'Hovering Turns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (683, 45, 3, N'3:45:683', N'Surface Taxi (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (684, 45, 3, N'3:45:684', N'Hover Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (685, 45, 3, N'3:45:685', N'Air Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (686, 45, 3, N'3:45:686', N'Slope Operations', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (687, 45, 3, N'3:45:687', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (688, 45, 3, N'3:45:688', N'Rapid Deceleration', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (689, 45, 3, N'3:45:689', N'Wake Turbulence Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (690, 45, 3, N'3:45:690', N'Low-Level Wind Shear Considerations', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (691, 45, 3, N'3:45:691', N'Collision Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (692, 45, 3, N'3:45:692', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (693, 45, 3, N'3:45:693', N'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (694, 45, 3, N'3:45:694', N'Maximum Performance Takeoff and Climb', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (695, 45, 3, N'3:45:695', N'Steep Approach', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (696, 45, 3, N'3:45:696', N'Rolling Takeoff (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (697, 45, 3, N'3:45:697', N'Running Takeoff', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (698, 45, 3, N'3:45:698', N'Shallow Approach and Running/Roll-On Landing', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (699, 45, 3, N'3:45:699', N'Go-Around', 0, 1, 0)
GO
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (700, 46, 3, N'3:46:700', N'Preflight Preparation and Procedures', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (701, 46, 3, N'3:46:701', N'Preflight Inspection', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (702, 46, 3, N'3:46:702', N'Cockpit Management', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (703, 46, 3, N'3:46:703', N'Engine Starting and Rotor Engagement', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (704, 46, 3, N'3:46:704', N'Before Takeoff Check', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (705, 46, 3, N'3:46:705', N'Airport and Heliport Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (706, 46, 3, N'3:46:706', N'Radio Communications and ATC Light Signals', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (707, 46, 3, N'3:46:707', N'Traffic Pattern', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (708, 46, 3, N'3:46:708', N'Airport and Heliport Markings and Lighting', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (709, 46, 3, N'3:46:709', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (710, 46, 3, N'3:46:710', N'Vertical Takeoffs and Landings', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (711, 46, 3, N'3:46:711', N'Forward, Rearward, and Sideward Hovering', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (712, 46, 3, N'3:46:712', N'Hovering Turns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (713, 46, 3, N'3:46:713', N'Surface Taxi (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (714, 46, 3, N'3:46:714', N'Hover Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (715, 46, 3, N'3:46:715', N'Air Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (716, 46, 3, N'3:46:716', N'Slope Operations', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (717, 46, 3, N'3:46:717', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (718, 46, 3, N'3:46:718', N'Rapid Deceleration', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (719, 46, 3, N'3:46:719', N'Wake Turbulence Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (720, 46, 3, N'3:46:720', N'Low-Level Wind Shear Considerations', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (721, 46, 3, N'3:46:721', N'Collision Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (722, 46, 3, N'3:46:722', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (723, 46, 3, N'3:46:723', N'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (724, 46, 3, N'3:46:724', N'Maximum Performance Takeoff and Climb', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (725, 46, 3, N'3:46:725', N'Steep Approach', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (726, 46, 3, N'3:46:726', N'Rolling Takeoff (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (727, 46, 3, N'3:46:727', N'Running Takeoff', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (728, 46, 3, N'3:46:728', N'Shallow Approach and Running/Roll-On Landing', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (729, 46, 3, N'3:46:729', N'Go-Around', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (730, 47, 3, N'3:47:730', N'Cross-Country Flight Planning', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (731, 47, 3, N'3:47:731', N'Sectional Charts', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (732, 47, 3, N'3:47:732', N'Flight Publications', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (733, 47, 3, N'3:47:733', N'Route Selection', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (734, 47, 3, N'3:47:734', N'Weather Information', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (735, 47, 3, N'3:47:735', N'Navigation Log', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (736, 47, 3, N'3:47:736', N'FAA Flight Plan', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (737, 47, 3, N'3:47:737', N'National Airspace System', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (738, 47, 3, N'3:47:738', N'Performance and Limitations', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (739, 47, 3, N'3:47:739', N'Weight and Balance', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (740, 47, 3, N'3:47:740', N'Aeromedical Factors', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (741, 47, 3, N'3:47:741', N'Cockpit Management', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (742, 47, 3, N'3:47:742', N'Crew Resource Management', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (743, 47, 3, N'3:47:743', N'Airport or Heliport Operations', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (744, 47, 3, N'3:47:744', N'Approach and Departure Control', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (745, 47, 3, N'3:47:745', N'Controlled Airports/Heliports', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (746, 47, 3, N'3:47:746', N'Use of ATIS', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (747, 47, 3, N'3:47:747', N'CTAF (FSS or UNICOM) Airports', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (748, 47, 3, N'3:47:748', N'Cross-Country Flight', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (749, 47, 3, N'3:47:749', N'Departure', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (750, 47, 3, N'3:47:750', N'Opening Flight Plan', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (751, 47, 3, N'3:47:751', N'Power Settings and Mixture Control', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (752, 47, 3, N'3:47:752', N'Lost Communications', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (753, 47, 3, N'3:47:753', N'Collision Avoidance', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (754, 47, 3, N'3:47:754', N'Closing Flight Plan', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (755, 47, 3, N'3:47:755', N'Navigation', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (756, 47, 3, N'3:47:756', N'Pilotage and Dead Reckoning', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (757, 47, 3, N'3:47:757', N'Radio Navigation and Radar Services', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (758, 47, 3, N'3:47:758', N'Position Fixes', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (759, 47, 3, N'3:47:759', N'Adverse Weather', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (760, 47, 3, N'3:47:760', N'Diversion', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (761, 47, 3, N'3:47:761', N'Lost Procedures', 0, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (762, 47, 3, N'3:47:762', N'Emergency Operations', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (763, 47, 3, N'3:47:763', N'Systems and Equipment Malfunctions', 1, 0, 1)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (764, 48, 3, N'3:48:764', N'Preflight Preparation', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (765, 48, 3, N'3:48:765', N'Aircraft Logbooks', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (766, 48, 3, N'3:48:766', N'Certificates and Documents', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (767, 48, 3, N'3:48:767', N'Operation of Systems', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (768, 48, 3, N'3:48:768', N'Minimum Equipment List', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (769, 48, 3, N'3:48:769', N'Emergency Equipment and Survival Gear', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (770, 48, 3, N'3:48:770', N'Location of First Aid Kit', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (771, 48, 3, N'3:48:771', N'Location of Fire Extinguisher', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (772, 48, 3, N'3:48:772', N'Location of Survival Gear', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (773, 48, 3, N'3:48:773', N'Cross-Country Flight Planning', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (774, 48, 3, N'3:48:774', N'Weather Information', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (775, 48, 3, N'3:48:775', N'Navigation Log', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (776, 48, 3, N'3:48:776', N'FAA Flight Plan', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (777, 48, 3, N'3:48:777', N'Performance and Limitations', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (778, 48, 3, N'3:48:778', N'Weight and Balance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (779, 48, 3, N'3:48:779', N'National Airspace System', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (780, 48, 3, N'3:48:780', N'Aeromedical Factors', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (781, 48, 3, N'3:48:781', N'Crew Resource Management', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (782, 48, 3, N'3:48:782', N'Preflight Procedures', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (783, 48, 3, N'3:48:783', N'Preflight Inspection', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (784, 48, 3, N'3:48:784', N'Cockpit Management', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (785, 48, 3, N'3:48:785', N'Engine Starting and Rotor Engagement', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (786, 48, 3, N'3:48:786', N'Before Takeoff Check', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (787, 48, 3, N'3:48:787', N'Airport and Heliport Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (788, 48, 3, N'3:48:788', N'Radio Communications and ATC Light Signals', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (789, 48, 3, N'3:48:789', N'Traffic Pattern', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (790, 48, 3, N'3:48:790', N'Airport and Heliport Markings and Lighting', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (791, 48, 3, N'3:48:791', N'Runway Incursion Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (792, 48, 3, N'3:48:792', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (793, 48, 3, N'3:48:793', N'Vertical Takeoffs and Landings', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (794, 48, 3, N'3:48:794', N'Forward, Rearward, and Sideward Hovering', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (795, 48, 3, N'3:48:795', N'Hovering Turns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (796, 48, 3, N'3:48:796', N'Surface Taxi (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (797, 48, 3, N'3:48:797', N'Hover Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (798, 48, 3, N'3:48:798', N'Air Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (799, 48, 3, N'3:48:799', N'Slope Operations', 0, 1, 0)
GO
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (800, 48, 3, N'3:48:800', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (801, 48, 3, N'3:48:801', N'Use of Checklists', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (802, 48, 3, N'3:48:802', N'Rapid Deceleration', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (803, 48, 3, N'3:48:803', N'Wake Turbulence Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (804, 48, 3, N'3:48:804', N'Low-Level Wind Shear Considerations', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (805, 48, 3, N'3:48:805', N'Collision Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (806, 48, 3, N'3:48:806', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (807, 48, 3, N'3:48:807', N'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (808, 48, 3, N'3:48:808', N'Maximum Performance Takeoff and Climb', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (809, 48, 3, N'3:48:809', N'Operation of Systems', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (810, 48, 3, N'3:48:810', N'Minimum Equipment List', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (811, 48, 3, N'3:48:811', N'Emergency Equipment and Survival Gear', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (812, 48, 3, N'3:48:812', N'Location of First Aid Kit', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (813, 48, 3, N'3:48:813', N'Location of Fire Extinguisher', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (814, 48, 3, N'3:48:814', N'Location of Survival Gear', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (815, 48, 3, N'3:48:815', N'Cross-Country Flight Planning', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (816, 48, 3, N'3:48:816', N'Weather Information', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (817, 48, 3, N'3:48:817', N'Navigation Log', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (818, 48, 3, N'3:48:818', N'FAA Flight Plan', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (819, 48, 3, N'3:48:819', N'Performance and Limitations', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (820, 48, 3, N'3:48:820', N'Weight and Balance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (821, 48, 3, N'3:48:821', N'National Airspace System', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (822, 48, 3, N'3:48:822', N'Aeromedical Factors', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (823, 48, 3, N'3:48:823', N'Crew Resource Management', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (824, 48, 3, N'3:48:824', N'Preflight Procedures', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (825, 48, 3, N'3:48:825', N'Preflight Inspection', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (826, 48, 3, N'3:48:826', N'Cockpit Management', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (827, 48, 3, N'3:48:827', N'Engine Starting and Rotor Engagement', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (828, 48, 3, N'3:48:828', N'Before Takeoff Check', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (829, 48, 3, N'3:48:829', N'Airport and Heliport Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (830, 48, 3, N'3:48:830', N'Radio Communications and ATC Light Signals', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (831, 48, 3, N'3:48:831', N'Traffic Pattern', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (832, 48, 3, N'3:48:832', N'Airport and Heliport Markings and Lighting', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (833, 48, 3, N'3:48:833', N'Runway Incursion Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (834, 48, 3, N'3:48:834', N'Hovering Maneuvers', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (835, 48, 3, N'3:48:835', N'Vertical Takeoffs and Landings', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (836, 48, 3, N'3:48:836', N'Forward, Rearward, and Sideward Hovering', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (837, 48, 3, N'3:48:837', N'Hovering Turns', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (838, 48, 3, N'3:48:838', N'Surface Taxi (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (839, 48, 3, N'3:48:839', N'Hover Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (840, 48, 3, N'3:48:840', N'Air Taxi', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (841, 48, 3, N'3:48:841', N'Slope Operations', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (842, 48, 3, N'3:48:842', N'Basic Piloting Skills', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (843, 48, 3, N'3:48:843', N'Use of Checklists', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (844, 48, 3, N'3:48:844', N'Rapid Deceleration', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (845, 48, 3, N'3:48:845', N'Wake Turbulence Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (846, 48, 3, N'3:48:846', N'Low-Level Wind Shear Considerations', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (847, 48, 3, N'3:48:847', N'Collision Avoidance', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (848, 48, 3, N'3:48:848', N'Takeoffs, Landings, and Go-Arounds', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (849, 48, 3, N'3:48:849', N'Normal and Crosswind Takeoffs Climbs, and Approaches', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (850, 48, 3, N'3:48:850', N'Maximum Performance Takeoff and Climb', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (851, 48, 3, N'3:48:851', N'Steep Approach', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (852, 48, 3, N'3:48:852', N'Rolling Takeoff (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (853, 48, 3, N'3:48:853', N'Running Takeoff', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (854, 48, 3, N'3:48:854', N'Shallow Approach and Running/Roll-On Landing', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (855, 48, 3, N'3:48:855', N'Go-Around', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (856, 48, 3, N'3:48:856', N'Emergency Operations', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (857, 48, 3, N'3:48:857', N'Straight-in Autorotation With Power Recovery', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (858, 48, 3, N'3:48:858', N'Power Failure at a Hover', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (859, 48, 3, N'3:48:859', N'Power Failure at Altitude', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (860, 48, 3, N'3:48:860', N'Settling-With-Power', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (861, 48, 3, N'3:48:861', N'Low Rotor RPM Recovery', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (862, 48, 3, N'3:48:862', N'Retreating Blade Stall (Discussion Only)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (863, 48, 3, N'3:48:863', N'Dynamic Rollover (Discussion Only)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (864, 48, 3, N'3:48:864', N'Ground Resonance (Discussion Only)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (865, 48, 3, N'3:48:865', N'Low G Conditions (Discussion Only)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (866, 48, 3, N'3:48:866', N'Low Rotor RPM and Blade Stall(Discussion Only)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (867, 48, 3, N'3:48:867', N'Systems and Equipment Malfunctions', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (868, 48, 3, N'3:48:868', N'Electrical System Malfunction', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (869, 48, 3, N'3:48:869', N'Electrical Fire or Smoke', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (870, 48, 3, N'3:48:870', N'Hydraulic System Malfunction (If Applicable)', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (871, 48, 3, N'3:48:871', N'Engine and Components Malfunctions', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (872, 48, 3, N'3:48:872', N'Antitorque Failure (This task applies to a hover and in flight).', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (873, 48, 3, N'3:48:873', N'Power Train Failure', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (874, 48, 3, N'3:48:874', N'Abnormal Vibrations', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (875, 48, 3, N'3:48:875', N'Warning Lights', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (876, 48, 3, N'3:48:876', N'Tachometer Failure', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (877, 48, 3, N'3:48:877', N'Induction System Icing', 0, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (878, 48, 3, N'3:48:878', N'Cross-Country Flight', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (879, 48, 3, N'3:48:879', N'Navigation', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (880, 48, 3, N'3:48:880', N'Postflight Procedures', 1, 1, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (881, 2, 1, N'1:2:881', N'Section A - Introduction to the Helicopter', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (882, 2, 1, N'1:2:882', N'The Main Rotor System', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (883, 2, 1, N'1:2:883', N'Antitorque Systems', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (884, 2, 1, N'1:2:884', N'Landing Gear', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (885, 2, 1, N'1:2:885', N'Powerplant', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (886, 2, 1, N'1:2:886', N'Aircraft Certification', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (887, 2, 1, N'1:2:887', N'Section B - Aerodynamic Forces', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (888, 2, 1, N'1:2:888', N'Lift', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (889, 2, 1, N'1:2:889', N'Weight', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (890, 2, 1, N'1:2:890', N'Drag', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (891, 2, 1, N'1:2:891', N'Thrust', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (892, 2, 1, N'1:2:892', N'Lift Equation', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (893, 2, 1, N'1:2:893', N'Section C - Forces in Flight', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (894, 2, 1, N'1:2:894', N'Hovering', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (895, 2, 1, N'1:2:895', N'Ground Effect', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (896, 2, 1, N'1:2:896', N'Forward Flight', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (897, 2, 1, N'1:2:897', N'Autorotation', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (898, 2, 1, N'1:2:898', N'The Three Axes', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (899, 2, 1, N'1:2:899', N'Turning Flight', 0, 0, 0)
GO
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (900, 4, 1, N'1:4:900', N'Section A - Flight Control Systems', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (901, 4, 1, N'1:4:901', N'Collective Pitch', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (902, 4, 1, N'1:4:902', N'Cyclic Pitch', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (903, 4, 1, N'1:4:903', N'Swash Plate Assembly', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (904, 4, 1, N'1:4:904', N'Antitorque Control', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (905, 4, 1, N'1:4:905', N'Trim Systems', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (906, 4, 1, N'1:4:906', N'Friction Systems', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (907, 4, 1, N'1:4:907', N'RPM and Manifold Pressure Instruments', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (908, 4, 1, N'1:4:908', N'Section B - The Reciprocating Engine and Related Systems', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (909, 4, 1, N'1:4:909', N'Principles of Operation', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (910, 4, 1, N'1:4:910', N'Ignition System', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (911, 4, 1, N'1:4:911', N'Oil System', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (912, 4, 1, N'1:4:912', N'Cooling the Engine', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (913, 4, 1, N'1:4:913', N'Turboshaft Engines', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (914, 4, 1, N'1:4:914', N'Section C - Fuel and Electrical Systems', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (915, 4, 1, N'1:4:915', N'Fuel Systems', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (916, 4, 1, N'1:4:916', N'Fuel Supply System', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (917, 4, 1, N'1:4:917', N'Induction System', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (918, 4, 1, N'1:4:918', N'Refueling', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (919, 4, 1, N'1:4:919', N'Electrical Systems', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (920, 4, 1, N'1:4:920', N'Section D - Power Train Systems', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (921, 4, 1, N'1:4:921', N'Clutch', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (922, 4, 1, N'1:4:922', N'Transmission', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (923, 4, 1, N'1:4:923', N'Tail Rotor Drive System', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (924, 4, 1, N'1:4:924', N'Freewheeling Unit', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (925, 4, 1, N'1:4:925', N'Section E - Flight Instruments', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (926, 4, 1, N'1:4:926', N'Magnetic Compass', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (927, 4, 1, N'1:4:927', N'Outside Air Temperature Gauge', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (928, 4, 1, N'1:4:928', N'Pitot-Static Instruments', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (929, 4, 1, N'1:4:929', N'Gyroscopic Flight Instruments', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (930, 6, 1, N'1:6:930', N'Section A - Safety of Flight', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (931, 6, 1, N'1:6:931', N'Visual Scanning', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (932, 6, 1, N'1:6:932', N'Blind Spots and Aircraft Design', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (933, 6, 1, N'1:6:933', N'Right-Of-Way Rules', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (934, 6, 1, N'1:6:934', N'Minimum Safe Altitudes', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (935, 6, 1, N'1:6:935', N'VFR Cruising Altitudes', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (936, 6, 1, N'1:6:936', N'Special Safety Considerations', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (937, 6, 1, N'1:6:937', N'Section B - Airports and Heliports', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (938, 6, 1, N'1:6:938', N'Controlled and Uncontrolled Airports', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (939, 6, 1, N'1:6:939', N'Traffic Patterns', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (940, 6, 1, N'1:6:940', N'Basic Runway Markings', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (941, 6, 1, N'1:6:941', N'Heliports', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (942, 6, 1, N'1:6:942', N'Taxiways', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (943, 6, 1, N'1:6:943', N'Airport and Heliport Aids', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (944, 6, 1, N'1:6:944', N'Noise Abatement Procedures', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (945, 6, 1, N'1:6:945', N'Section C - Airspace', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (946, 6, 1, N'1:6:946', N'Controlled Airspace', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (947, 6, 1, N'1:6:947', N'Class A Airspace', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (948, 6, 1, N'1:6:948', N'Class B Airspace', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (949, 6, 1, N'1:6:949', N'Class C Airspace', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (950, 6, 1, N'1:6:950', N'Class D Airspace', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (951, 6, 1, N'1:6:951', N'Class E Airspace', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (952, 6, 1, N'1:6:952', N'Cloud Clearance and Visibility Requirements', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (953, 6, 1, N'1:6:953', N'Class G Airspace (Uncontrolled)', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (954, 6, 1, N'1:6:954', N'Special Use Airspace', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (955, 6, 1, N'1:6:955', N'Other Airspace Areas', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (956, 6, 1, N'1:6:956', N'Emergency Air Traffic Rules', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (957, 6, 1, N'1:6:957', N'ADIZ', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (958, 8, 1, N'1:8:958', N'Section A - Radio Communications', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (959, 8, 1, N'1:8:959', N'VHF Communications Equipment', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (960, 8, 1, N'1:8:960', N'Coordinated Universal Time', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (961, 8, 1, N'1:8:961', N'Using the Radio', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (962, 8, 1, N'1:8:962', N'Radio Procedures', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (963, 8, 1, N'1:8:963', N'Common Traffic Advisory Frequency', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (964, 8, 1, N'1:8:964', N'Flight Service Stations', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (965, 8, 1, N'1:8:965', N'Section B - Radar and ATC Services', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (966, 8, 1, N'1:8:966', N'Radar', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (967, 8, 1, N'1:8:967', N'Transponder', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (968, 8, 1, N'1:8:968', N'FAA Radar Systems', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (969, 8, 1, N'1:8:969', N'VFR Radar Services', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (970, 8, 1, N'1:8:970', N'ATC Facilities at Controlled Airports', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (971, 8, 1, N'1:8:971', N'Lost Communications Procedures', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (972, 8, 1, N'1:8:972', N'Emergency Procedures', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (973, 8, 1, N'1:8:973', N'Section C - Predicting Performance', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (974, 8, 1, N'1:8:974', N'Factors Affecting Performance', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (975, 8, 1, N'1:8:975', N'The Pilot’s Operating Handbook', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (976, 8, 1, N'1:8:976', N'Performance Charts', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (977, 8, 1, N'1:8:977', N'Operating Limitations and Markings', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (978, 8, 1, N'1:8:978', N'Section D - Weight and Balance', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (979, 8, 1, N'1:8:979', N'Aircraft Weight', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (980, 8, 1, N'1:8:980', N'Aircraft Balance', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (981, 8, 1, N'1:8:981', N'Weight and Balance Control', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (982, 8, 1, N'1:8:982', N'Weight and Balance Calculation', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (983, 12, 1, N'1:12:983', N'14 CFR Part 1', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (984, 12, 1, N'1:12:984', N'14 CFR Part 61', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (985, 12, 1, N'1:12:985', N'14 CFR Part 91', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (986, 12, 1, N'1:12:986', N'NTSB Part 830', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (987, 15, 1, N'1:15:987', N'Section A - Basic Weather Theory', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (988, 15, 1, N'1:15:988', N'The Atmosphere', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (989, 15, 1, N'1:15:989', N'Atmospheric Circulation', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (990, 15, 1, N'1:15:990', N'Wind', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (991, 15, 1, N'1:15:991', N'Moisture', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (992, 15, 1, N'1:15:992', N'Change of State', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (993, 15, 1, N'1:15:993', N'Humidity', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (994, 15, 1, N'1:15:994', N'Section B - Weather Patterns', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (995, 15, 1, N'1:15:995', N'Atmospheric Stability', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (996, 15, 1, N'1:15:996', N'Clouds', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (997, 15, 1, N'1:15:997', N'Airmasses', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (998, 15, 1, N'1:15:998', N'Fronts', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (999, 15, 1, N'1:15:999', N'Section C - Weather Hazards”', 1, 0, 0)
GO
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1000, 15, 1, N'1:15:1000', N'Thunderstorms', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1001, 15, 1, N'1:15:1001', N'Turbulence', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1002, 15, 1, N'1:15:1002', N'Wind Shear', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1003, 15, 1, N'1:15:1003', N'Wake Turbulence', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1004, 15, 1, N'1:15:1004', N'Low Visibility', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1005, 15, 1, N'1:15:1005', N'Icing', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1006, 15, 1, N'1:15:1006', N'Cold Weather Operations', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1007, 18, 1, N'1:18:1007', N'PreSolo written exam and briefing', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1008, 20, 1, N'1:20:1008', N'Principles of Flight', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1009, 20, 1, N'1:20:1009', N'Helicopter Systems and Instruments', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1010, 20, 1, N'1:20:1010', N'The Flight Environment', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1011, 20, 1, N'1:20:1011', N'Communications and Performance', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1012, 20, 1, N'1:20:1012', N'Meteorology For Pilots”', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1013, 20, 1, N'1:20:1013', N'FAR/AIM — Private Pilot Regulations', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1014, 26, 2, N'2:26:1014', N'Section A - Printed Reports and Forecasts', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1015, 26, 2, N'2:26:1015', N'Aviation Routine Weather Reports(METAR)', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1016, 26, 2, N'2:26:1016', N'Additional Reports', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1017, 26, 2, N'2:26:1017', N'Terminal Aerodrome Forecasts (TAF)', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1018, 26, 2, N'2:26:1018', N'Area Forecasts', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1019, 26, 2, N'2:26:1019', N'Winds and Temperatures Aloft Forecasts', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1020, 26, 2, N'2:26:1020', N'Severe Weather Reports and Forecasts', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1021, 26, 2, N'2:26:1021', N'Section B - Graphic Weather Products', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1022, 26, 2, N'2:26:1022', N'Surface Analysis Chart', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1023, 26, 2, N'2:26:1023', N'Weather Depiction Chart', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1024, 26, 2, N'2:26:1024', N'Radar Summary Chart', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1025, 26, 2, N'2:26:1025', N'Low-Level Significant Weather Prog', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1026, 26, 2, N'2:26:1026', N'Section C - Sources of Weather Information', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1027, 26, 2, N'2:26:1027', N'Preflight Weather Briefings', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1028, 26, 2, N'2:26:1028', N'Supplemental Weather Sources', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1029, 26, 2, N'2:26:1029', N'In-Flight Weather Services', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1030, 28, 2, N'2:28:1030', N'Section A - Aeronautical Charts', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1031, 28, 2, N'2:28:1031', N'Sectional Charts', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1032, 28, 2, N'2:28:1032', N'VFR Terminal Charts', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1033, 28, 2, N'2:28:1033', N'World Aeronautical Charts', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1034, 28, 2, N'2:28:1034', N'Latitude and Longitude', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1035, 28, 2, N'2:28:1035', N'Legend', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1036, 28, 2, N'2:28:1036', N'Section B - Flight Computers', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1037, 28, 2, N'2:28:1037', N'Navigation Theory', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1038, 28, 2, N'2:28:1038', N'Mechanical Flight Computers', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1039, 28, 2, N'2:28:1039', N'Electronic Flight Computers', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1040, 28, 2, N'2:28:1040', N'Multi-Part Problems', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1041, 28, 2, N'2:28:1041', N'Conversions', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1042, 28, 2, N'2:28:1042', N'Section C - Pilotage and Dead Reckoning', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1043, 28, 2, N'2:28:1043', N'Pilotage', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1044, 28, 2, N'2:28:1044', N'Dead Reckoning', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1045, 28, 2, N'2:28:1045', N'Flight Plan', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1046, 28, 2, N'2:28:1046', N'Flying Over Hazardous Terrain', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1047, 28, 2, N'2:28:1047', N'Section D - Sources of Flight Information', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1048, 28, 2, N'2:28:1048', N'Airport/Facility Directory', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1049, 28, 2, N'2:28:1049', N'Aeronautical Information Manual', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1050, 28, 2, N'2:28:1050', N'Notices to Airmen', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1051, 28, 2, N'2:28:1051', N'Advisory Circulars', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1052, 28, 2, N'2:28:1052', N'Jeppesen Pilot Resource Services', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1053, 31, 2, N'2:31:1053', N'Section A - VHF Omnidirectional Range', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1054, 31, 2, N'2:31:1054', N'Principles of Operation', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1055, 31, 2, N'2:31:1055', N'VOR Airborne Equipment', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1056, 31, 2, N'2:31:1056', N'VOR Navigation', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1057, 31, 2, N'2:31:1057', N'Using VOR Navigation', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1058, 31, 2, N'2:31:1058', N'VOR Cautions', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1059, 31, 2, N'2:31:1059', N'VOR Test Signals', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1060, 31, 2, N'2:31:1060', N'Classes of VOR Facilities', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1061, 31, 2, N'2:31:1061', N'Distance Measuring Equipment (DME)', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1062, 31, 2, N'2:31:1062', N'Section B - Automatic Direction Finder', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1063, 31, 2, N'2:31:1063', N'ADF Equipment', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1064, 31, 2, N'2:31:1064', N'Homing', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1065, 31, 2, N'2:31:1065', N'Tracking', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1066, 31, 2, N'2:31:1066', N'ADF Intercepts', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1067, 31, 2, N'2:31:1067', N'Movable-Card Indicators', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1068, 31, 2, N'2:31:1068', N'ADF Cautions', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1069, 31, 2, N'2:31:1069', N'Section C - Advanced Navigation', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1070, 31, 2, N'2:31:1070', N'VORTAC-Based RNAV', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1071, 31, 2, N'2:31:1071', N'Long Range Navigation (LORAN)', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1072, 31, 2, N'2:31:1072', N'Global Positioning System (GPS)', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1073, 31, 2, N'2:31:1073', N'Advanced Navigation Indicators', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1074, 33, 2, N'2:33:1074', N'Interpreting Weather Data', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1075, 33, 2, N'2:33:1075', N'Basic Navigation', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1076, 33, 2, N'2:33:1076', N'Radio Navigation', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1077, 35, 3, N'3:35:1077', N'Section A - Vision in Flight', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1078, 35, 3, N'3:35:1078', N'The Eye', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1079, 35, 3, N'3:35:1079', N'Night Vision', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1080, 35, 3, N'3:35:1080', N'Night Scanning', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1081, 35, 3, N'3:35:1081', N'Visual Illusions', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1082, 35, 3, N'3:35:1082', N'Landing Illusions', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1083, 35, 3, N'3:35:1083', N'Section B - Spatial Disorientation', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1084, 35, 3, N'3:35:1084', N'Visual Sense', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1085, 35, 3, N'3:35:1085', N'Vestibular Sense', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1086, 35, 3, N'3:35:1086', N'Kinesthetic Sense', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1087, 35, 3, N'3:35:1087', N'Disorientation', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1088, 35, 3, N'3:35:1088', N'Motion Sickness', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1089, 35, 3, N'3:35:1089', N'Section C - Respiration and Altitude', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1090, 35, 3, N'3:35:1090', N'Respiration', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1091, 35, 3, N'3:35:1091', N'Hypoxia', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1092, 35, 3, N'3:35:1092', N'Supplemental Oxygen', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1093, 35, 3, N'3:35:1093', N'Hyperventilation', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1094, 35, 3, N'3:35:1094', N'Pressure Effects', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1095, 35, 3, N'3:35:1095', N'Section D - Alcohol, Drugs, and Performance', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1096, 35, 3, N'3:35:1096', N'Depressants', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1097, 35, 3, N'3:35:1097', N'Alcohol', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1098, 35, 3, N'3:35:1098', N'Stimulants', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1099, 35, 3, N'3:35:1099', N'Pain Killers', 0, 0, 0)
GO
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1100, 35, 3, N'3:35:1100', N'Other Problem Drugs', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1101, 37, 3, N'3:37:1101', N'Section A - Planning and Organizing Flights', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1102, 37, 3, N'3:37:1102', N'Initial Planning', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1103, 37, 3, N'3:37:1103', N'Final Planning Stage', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1104, 37, 3, N'3:37:1104', N'Cockpit Management', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1105, 37, 3, N'3:37:1105', N'Section B - Factors Affecting Decision Making', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1106, 37, 3, N'3:37:1106', N'The Decision-Making Process', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1107, 37, 3, N'3:37:1107', N'Hazardous Attitudes', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1108, 37, 3, N'3:37:1108', N'Risk Assessment', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1109, 37, 3, N'3:37:1109', N'Self Assessment', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1110, 37, 3, N'3:37:1110', N'Section C - Cockpit Resource Management', 1, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1111, 37, 3, N'3:37:1111', N'Primary Resources', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1112, 37, 3, N'3:37:1112', N'Expanding Your Resources', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1113, 41, 3, N'3:41:1113', N'Aviation Physiology', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1114, 41, 3, N'3:41:1114', N'Flight Planning and Decision Making', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1115, 44, 3, N'3:44:1115', N'Private Pilot Helicopter End-of-Course Exam', 0, 0, 0)
INSERT [dbo].[LESSONITEMS] ([LineID], [LESSONID], [STAGEID], [LESSONGUID], [ItemName], [IsGroup], [IsReview], [IsIntro]) VALUES (1116, 49, 3, N'3:49:1116', N'Practical Test briefing', 0, 0, 0)
SET IDENTITY_INSERT [dbo].[LESSONITEMS] OFF
SET IDENTITY_INSERT [dbo].[LESSONS] ON 

INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (1, 1, 1, 0, N'FLIGHT 1 DUAL — LOCAL', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (2, 3, 1, 0, N'FLIGHT 2 DUAL — LOCAL', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (3, 5, 1, 0, N'FLIGHT 3 DUAL — LOCAL', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (4, 7, 1, 0, N'FLIGHT 4 DUAL — LOCAL', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (5, 9, 1, 0, N'FLIGHT 5 DUAL — LOCAL', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (6, 10, 1, 0, N'FLIGHT 6 DUAL — LOCAL', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (7, 11, 1, 0, N'FLIGHT 7 DUAL — LOCAL', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (8, 13, 1, 0, N'FLIGHT 8 DUAL — LOCAL', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (9, 14, 1, 0, N'FLIGHT 9 DUAL — LOCAL', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (10, 16, 1, 0, N'FLIGHT 10 DUAL — LOCAL', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (11, 17, 1, 0, N'FLIGHT 11 DUAL — LOCAL', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (12, 19, 1, 0, N'FLIGHT 12 DUAL AND SOLO — LOCAL', NULL, NULL, CAST(0.50 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (13, 21, 1, 0, N'FLIGHT 13 DUAL — STAGE CHECK', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (14, 22, 2, 0, N'FLIGHT 14 DUAL AND SOLO — LOCAL', NULL, NULL, CAST(0.50 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.50 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (15, 23, 2, 0, N'FLIGHT 15 SOLO — LOCAL', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (16, 24, 2, 0, N'FLIGHT 16 DUAL — LOCAL', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (17, 25, 2, 0, N'FLIGHT 17 DUAL — LOCAL', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (18, 27, 2, 0, N'FLIGHT 18 DUAL — LOCAL', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (19, 29, 2, 0, N'FLIGHT 19 SOLO — LOCAL', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (20, 30, 2, 0, N'FLIGHT 20 DUAL — LOCAL', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (21, 32, 2, 0, N'FLIGHT 21 SOLO — LOCAL', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (22, 34, 2, 0, N'FLIGHT 22 DUAL — STAGE CHECK', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (23, 36, 3, 0, N'FLIGHT 23 DUAL — NIGHT', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (24, 38, 3, 0, N'FLIGHT 24 DUAL — CROSS-COUNTRY', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (25, 40, 3, 0, N'FLIGHT 25 SOLO — CROSS-COUNTRY', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (26, 42, 3, 0, N'FLIGHT 26 DUAL — NIGHT CROSS-COUNTRY', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (27, 43, 3, 0, N'FLIGHT 27 DUAL — LOCAL', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (28, 45, 3, 0, N'FLIGHT 28 SOLO — LOCAL', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (29, 46, 3, 0, N'FLIGHT 29 SOLO — LOCAL', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (30, 47, 3, 0, N'FLIGHT 30 DUAL — STAGE CHECK', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (31, 48, 3, 0, N'FLIGHT 31 DUAL — END-OF-COURSE CHECK', NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (32, 2, 1, 1, N'GROUND LESSON 1', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (33, 4, 1, 1, N'GROUND LESSON 2', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (34, 6, 1, 1, N'GROUND LESSON 3', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (35, 8, 1, 1, N'GROUND LESSON 4', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (36, 12, 1, 1, N'GROUND LESSON 5', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(2.50 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (37, 15, 1, 1, N'GROUND LESSON 6', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(2.50 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (38, 18, 1, 1, N'PRESOLO WRITTEN EXAM AND BRIEFING', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (39, 20, 1, 1, N'GROUND LESSON 7 STAGE I EXAM', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.50 AS Decimal(5, 2)), CAST(0.50 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (40, 26, 2, 1, N'GROUND LESSON 8', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (41, 28, 2, 1, N'GROUND LESSON 9', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(2.50 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (42, 31, 2, 1, N'GROUND LESSON 10', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(2.50 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (43, 33, 2, 1, N'GROUND LESSON 11 STAGE II EXAM', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.50 AS Decimal(5, 2)), CAST(0.50 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (44, 35, 3, 1, N'GROUND LESSON 12', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(2.50 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (45, 37, 3, 1, N'GROUND LESSON 13', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(2.50 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (46, 39, 3, 1, N'BRIEFING CROSS COUNTRY', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (47, 41, 3, 1, N'GROUND LESSON 14 STAGE III EXAM', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.50 AS Decimal(5, 2)), CAST(0.50 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (48, 44, 3, 1, N'GROUND LESSON 15 END-OF-COURSE EXAM — PRIVATE PILOT HELICOPTER', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1.50 AS Decimal(5, 2)), CAST(0.50 AS Decimal(5, 2)))
INSERT [dbo].[LESSONS] ([ROWID], [LESSONID], [STAGEID], [IsGround], [Title], [Objective], [Standard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (49, 49, 3, 1, N'BRIEFING FOR PRACTICAL TEST', NULL, NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[LESSONS] OFF
SET IDENTITY_INSERT [dbo].[LessonTimeLog] ON 

INSERT [dbo].[LessonTimeLog] ([Id], [STAGEID], [LESSONID], [Student], [Instructor], [PerformedOn], [AircraftUsed], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (1, 1, 1, N'gsukumar@outlook.com', N'gsukumar@outlook.com', CAST(N'2016-10-07T16:26:53.073' AS DateTime), NULL, CAST(0.90 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LessonTimeLog] ([Id], [STAGEID], [LESSONID], [Student], [Instructor], [PerformedOn], [AircraftUsed], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (2, 1, 1, N'jack@black.com', N'gsukumar@outlook.com', CAST(N'2016-10-08T11:34:05.147' AS DateTime), NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LessonTimeLog] ([Id], [STAGEID], [LESSONID], [Student], [Instructor], [PerformedOn], [AircraftUsed], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (3, 1, 2, N'jack@black.com', N'gsukumar@outlook.com', CAST(N'2016-10-08T11:43:38.887' AS DateTime), NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LessonTimeLog] ([Id], [STAGEID], [LESSONID], [Student], [Instructor], [PerformedOn], [AircraftUsed], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (4, 1, 3, N'jack@black.com', N'gsukumar@outlook.com', CAST(N'2016-10-08T11:43:39.003' AS DateTime), NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LessonTimeLog] ([Id], [STAGEID], [LESSONID], [Student], [Instructor], [PerformedOn], [AircraftUsed], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (5, 1, 4, N'jack@black.com', N'gsukumar@outlook.com', CAST(N'2016-10-08T11:43:39.120' AS DateTime), NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LessonTimeLog] ([Id], [STAGEID], [LESSONID], [Student], [Instructor], [PerformedOn], [AircraftUsed], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (6, 1, 5, N'jack@black.com', N'gsukumar@outlook.com', CAST(N'2016-10-08T19:24:25.123' AS DateTime), NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LessonTimeLog] ([Id], [STAGEID], [LESSONID], [Student], [Instructor], [PerformedOn], [AircraftUsed], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (7, 1, 6, N'jack@black.com', N'anthony@atomichelicopters.com', CAST(N'2016-10-16T15:28:17.980' AS DateTime), NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LessonTimeLog] ([Id], [STAGEID], [LESSONID], [Student], [Instructor], [PerformedOn], [AircraftUsed], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (8, 1, 8, N'jack@black.com', N'anthony@atomichelicopters.com', CAST(N'2016-10-17T00:44:36.790' AS DateTime), NULL, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LessonTimeLog] ([Id], [STAGEID], [LESSONID], [Student], [Instructor], [PerformedOn], [AircraftUsed], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (9, 1, 9, N'jack@black.com', N'anthony@atomichelicopters.com', CAST(N'2016-10-10T19:24:04.060' AS DateTime), NULL, CAST(0.90 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LessonTimeLog] ([Id], [STAGEID], [LESSONID], [Student], [Instructor], [PerformedOn], [AircraftUsed], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (10, 1, 7, N'jack@black.com', N'gsukumar@outlook.com', CAST(N'2016-10-17T00:45:28.897' AS DateTime), NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[LessonTimeLog] ([Id], [STAGEID], [LESSONID], [Student], [Instructor], [PerformedOn], [AircraftUsed], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (11, 1, 10, N'jack@black.com', N'gsukumar@outlook.com', CAST(N'2016-10-16T18:03:42.850' AS DateTime), NULL, CAST(1.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[LessonTimeLog] OFF
SET IDENTITY_INSERT [dbo].[PilotClassDefinition] ON 

INSERT [dbo].[PilotClassDefinition] ([Id], [PilotClassID], [PilotClassName], [PilotClassDescription], [Logo]) VALUES (2, N'08275c94-f00e-499f-9a7b-1c138417672d', N'Pre-Private', N'Has done his solo', N'Student Male')
INSERT [dbo].[PilotClassDefinition] ([Id], [PilotClassID], [PilotClassName], [PilotClassDescription], [Logo]) VALUES (3, N'5de32520-4a9f-4f9c-8574-a59d9a73bd36', N'Private', N'Earned Private class', N'Helicopter')
INSERT [dbo].[PilotClassDefinition] ([Id], [PilotClassID], [PilotClassName], [PilotClassDescription], [Logo]) VALUES (4, N'2229b73c-0d85-466a-b4dd-3bcb01f0e318', N'Demo', N'has taken the demo flight, not signed up
', N'Passenger')
INSERT [dbo].[PilotClassDefinition] ([Id], [PilotClassID], [PilotClassName], [PilotClassDescription], [Logo]) VALUES (5, N'0ef8c682-fa9c-4221-9140-2c5cfb9b5e4f', N'Pre-Solo', N'Is working toward a solo flight.', N'In Air')
INSERT [dbo].[PilotClassDefinition] ([Id], [PilotClassID], [PilotClassName], [PilotClassDescription], [Logo]) VALUES (6, N'14c61fd4-1ac0-482c-a76e-5071618c69eb', N'Hummingbird', N'Can hover now.', N'In Air')
SET IDENTITY_INSERT [dbo].[PilotClassDefinition] OFF
SET IDENTITY_INSERT [dbo].[PilotClassPrereq] ON 

INSERT [dbo].[PilotClassPrereq] ([Id], [PilotClassID], [AchievementID]) VALUES (2, N'2229b73c-0d85-466a-b4dd-3bcb01f0e318', N'49b3c557-3c0a-4bd2-a1b5-d7ec8067ad1a')
INSERT [dbo].[PilotClassPrereq] ([Id], [PilotClassID], [AchievementID]) VALUES (3, N'14c61fd4-1ac0-482c-a76e-5071618c69eb', N'bd6caf12-e6a8-4cfd-8aa2-08c16bb35b9d')
SET IDENTITY_INSERT [dbo].[PilotClassPrereq] OFF
SET IDENTITY_INSERT [dbo].[RewardDefinition] ON 

INSERT [dbo].[RewardDefinition] ([Id], [RewardID], [RewardName], [RewardDesc], [RewardType], [RewardCount], [RewardValidityTill], [RewardItem], [Logo]) VALUES (5, N'fa4861c1-0704-4f23-bcd1-bf4e8260beee', N'Tasted flight', N'Badge indicating I Flew a demo flight', N'BADGE', CAST(1 AS Decimal(18, 0)), NULL, N'I Flew', N'Security Checked')
INSERT [dbo].[RewardDefinition] ([Id], [RewardID], [RewardName], [RewardDesc], [RewardType], [RewardCount], [RewardValidityTill], [RewardItem], [Logo]) VALUES (14, N'296498b6-85b8-4da3-ba45-ff6b8e919dfb', N'solo', N'', N'SHOUT', NULL, NULL, N'', N'Trophy')
SET IDENTITY_INSERT [dbo].[RewardDefinition] OFF
SET IDENTITY_INSERT [dbo].[RewardPrereq] ON 

INSERT [dbo].[RewardPrereq] ([Id], [RewardID], [RequiredAchievement]) VALUES (6, N'fa4861c1-0704-4f23-bcd1-bf4e8260beee', N'49b3c557-3c0a-4bd2-a1b5-d7ec8067ad1a')
INSERT [dbo].[RewardPrereq] ([Id], [RewardID], [RequiredAchievement]) VALUES (7, N'296498b6-85b8-4da3-ba45-ff6b8e919dfb', N'b9965fb6-76c2-4e49-b7bd-e871fde8e9c7')
SET IDENTITY_INSERT [dbo].[RewardPrereq] OFF
SET IDENTITY_INSERT [dbo].[STAGES] ON 

INSERT [dbo].[STAGES] ([RowID], [STAGEID], [Name], [CertificationID], [Objective], [Standard], [GroundObjective], [GroundStandard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (1, 1, N'STAGE I', N'141-PVT', N'During this stage, the student becomes familiar with the training helicopter and learns how the helicopter controls are used to establish and maintain specific flight attitudes. The student also will gain proficiency to conduct the first supervised solo in the training helicopter.', N'At the completion of this stage, the student will demonstrate proficiency in basic flight maneuvers, and will have successfully soloed in the local area.', N'During this stage, the student will be introduced to helicopters and become familiar with the aerodynamic principles of flight which affect their operation. The student will also obtain a basic knowledge of the safety of flight, airports and heliports, airspace, radio communications, and air traffic control services, including the use of radar. In addition, the student will learn how to predict performance and control weight and balance conditions of the helicopter. The student also will become familiar with the Federal Aviation Regulations as they apply to private pilot operations. Finally, the student will be introduced to meteorology for pilots.', N'This stage is complete when the student has taken the Stage I written exam with a minimum passing score of 80%, and the instructor has reviewed each incorrect response to ensure complete understanding before the student progresses to Stage II.', CAST(12.50 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.50 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(17.00 AS Decimal(5, 2)), CAST(0.50 AS Decimal(5, 2)), CAST(0.50 AS Decimal(5, 2)))
INSERT [dbo].[STAGES] ([RowID], [STAGEID], [Name], [CertificationID], [Objective], [Standard], [GroundObjective], [GroundStandard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (2, 2, N'STAGE II', N'141-PVT', N'This stage allows the student to expand the skills learned in the previous stage. Introduction of maximum performance takeoffs and climbs, steep approaches, running/rolling takeoffs, shallow approaches, running/roll on landings, and slope operations prepare the student for conducting flights at a variety of airports and heliports. Through discussion sessions, the student will gain insight into emergency situations including retreating blade stall, dynamic rollover, ground resonance, low G conditions, and low r.p.m. and blade stall.', N'At the completion of this stage, the student will have the proficiency to safely demonstrate consistent results in performing maximum performance takeoffs and climbs, steep approaches, running/rolling takeoffs, shallow approaches, running/roll on landings, and slope operations. The student will exhibit knowledge of the elements related to retreating blade stall, dynamic rollover, ground resonance, low G conditions, low r.p.m. and blade stall, and can explain flight techniques which prevent these emergency situations.', N'During this stage, the student will build on previous weather knowledge to learn how to procure weather information and interpret printed reports and graphic weather products. In addition, the student will learn about aeronautical charts, flight computers, pilotage, dead reckoning, and flight information sources. The student also will be introduced to VOR, ADF, and advanced navigation, including GPS.', N'This stage is complete when the student has taken the Stage II written exam with a minimum passing score of 80%, and the instructor has reviewed each incorrect response to ensure complete understanding before the student progresses to Stage III.', CAST(5.50 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(3.50 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(8.00 AS Decimal(5, 2)), CAST(0.50 AS Decimal(5, 2)), CAST(0.50 AS Decimal(5, 2)))
INSERT [dbo].[STAGES] ([RowID], [STAGEID], [Name], [CertificationID], [Objective], [Standard], [GroundObjective], [GroundStandard], [duallocalday], [dualccday], [duallocalnight], [dualccnight], [sololocalday], [soloccday], [sololocalnight], [soloccnight], [briefing], [classvideo], [exams], [debrief]) VALUES (3, 3, N'STAGE III', N'141-PVT', N'During this stage, the student will learn to conduct cross-country flights using pilotage, dead reckoning, and radio navigation. In addition, the student will learn how to conduct night operations safely.', N'This stage is complete when the student can accurately plan and conduct cross-country and night flights.', N'During this stage, the student will gain an understanding of the physiological factors which can affect both pilot and passengers during flight. In addition, the student will learn how to conduct comprehensive preflight planning for cross-country flights and gain insight into factors affecting the decision-making process.', N'This stage is complete when the student has taken the Stage III written exam and the Private Pilot Helicopter Final Exam with a minimum passing score of 80%, and the instructor has reviewed each incorrect response to ensure complete understanding.', CAST(3.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[STAGES] OFF
SET IDENTITY_INSERT [dbo].[TaskDefinition] ON 

INSERT [dbo].[TaskDefinition] ([Id], [TaskID], [TaskName], [TaskDescription], [TaskType], [AircraftType], [TailNo], [Hours], [Maneuver], [Airport], [Lesson], [Rating], [Course], [Detail], [Distance], [IsNight], [IsDual], [IsCrossCountry], [IsWithPassenger], [ValidityStartDate], [ValidityEndDate]) VALUES (7, N'91f998f4-48ab-4c51-a4f5-e0c263e7aa58', N'(P) Take a demo flight', N'Demo flight taken with instructor', 2, N'', NULL, NULL, N'', N'test      ', N'DEMO', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TaskDefinition] ([Id], [TaskID], [TaskName], [TaskDescription], [TaskType], [AircraftType], [TailNo], [Hours], [Maneuver], [Airport], [Lesson], [Rating], [Course], [Detail], [Distance], [IsNight], [IsDual], [IsCrossCountry], [IsWithPassenger], [ValidityStartDate], [ValidityEndDate]) VALUES (15, N'd8af2f20-dd78-4e3b-b06d-9fb544fcf4da', N'(P) Hover for a minute S300', N'Learn to hover for a minute in a stable manner in the S300

', 1, N'', NULL, NULL, N'Hover', N'', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TaskDefinition] ([Id], [TaskID], [TaskName], [TaskDescription], [TaskType], [AircraftType], [TailNo], [Hours], [Maneuver], [Airport], [Lesson], [Rating], [Course], [Detail], [Distance], [IsNight], [IsDual], [IsCrossCountry], [IsWithPassenger], [ValidityStartDate], [ValidityEndDate]) VALUES (16, N'15b2ac40-fb4e-4e30-9444-6b75dd77b0b7', N'(P) Take second demo flight', N'Take a second demo flight', 2, N'', NULL, NULL, N'', N'', N'DEMO', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TaskDefinition] ([Id], [TaskID], [TaskName], [TaskDescription], [TaskType], [AircraftType], [TailNo], [Hours], [Maneuver], [Airport], [Lesson], [Rating], [Course], [Detail], [Distance], [IsNight], [IsDual], [IsCrossCountry], [IsWithPassenger], [ValidityStartDate], [ValidityEndDate]) VALUES (17, N'1e979bde-ff72-4cca-8192-3fb689123f35', N'(P) Take third demo flight', N'Take a third demo flight', 2, N'', NULL, NULL, N'', N'', N'DEMO', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TaskDefinition] ([Id], [TaskID], [TaskName], [TaskDescription], [TaskType], [AircraftType], [TailNo], [Hours], [Maneuver], [Airport], [Lesson], [Rating], [Course], [Detail], [Distance], [IsNight], [IsDual], [IsCrossCountry], [IsWithPassenger], [ValidityStartDate], [ValidityEndDate]) VALUES (18, N'1b2547c2-7ab5-4079-a957-15f1968602f2', N'(P) Presolo test', N'Passed presolo Test', 4, N'', NULL, NULL, N'', N'', N'Pre-solo Test', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TaskDefinition] ([Id], [TaskID], [TaskName], [TaskDescription], [TaskType], [AircraftType], [TailNo], [Hours], [Maneuver], [Airport], [Lesson], [Rating], [Course], [Detail], [Distance], [IsNight], [IsDual], [IsCrossCountry], [IsWithPassenger], [ValidityStartDate], [ValidityEndDate]) VALUES (19, N'766d0ff2-ed53-4cf7-b3e7-6650759b2bc4', N'(P) Solo Stage Check', N'', 2, N'', NULL, NULL, N'', N'', N'Solo Stage Check', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TaskDefinition] ([Id], [TaskID], [TaskName], [TaskDescription], [TaskType], [AircraftType], [TailNo], [Hours], [Maneuver], [Airport], [Lesson], [Rating], [Course], [Detail], [Distance], [IsNight], [IsDual], [IsCrossCountry], [IsWithPassenger], [ValidityStartDate], [ValidityEndDate]) VALUES (20, N'4a3eed78-b86e-4c9c-a45d-b5d1d089ce7c', N'(C) 30 180 autos', N'Perfrom 30 180 auto rotations with instructor ', 1, N'', NULL, NULL, N'30 180 autos', N'', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TaskDefinition] ([Id], [TaskID], [TaskName], [TaskDescription], [TaskType], [AircraftType], [TailNo], [Hours], [Maneuver], [Airport], [Lesson], [Rating], [Course], [Detail], [Distance], [IsNight], [IsDual], [IsCrossCountry], [IsWithPassenger], [ValidityStartDate], [ValidityEndDate]) VALUES (21, N'b10e221b-9f0a-4f45-923b-e925d543caf4', N'(I) Fly a DP', N'Fly KBFI Departure Procedure', 1, N'', NULL, NULL, N'KBFI DP', N'', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TaskDefinition] ([Id], [TaskID], [TaskName], [TaskDescription], [TaskType], [AircraftType], [TailNo], [Hours], [Maneuver], [Airport], [Lesson], [Rating], [Course], [Detail], [Distance], [IsNight], [IsDual], [IsCrossCountry], [IsWithPassenger], [ValidityStartDate], [ValidityEndDate]) VALUES (22, N'd7dfd500-af46-432b-bae1-fdaf3d466fd6', N'(F) Endorsement class', N'Receive / teach endorsement class', 4, N'', NULL, NULL, N'', N'', N'Endorsement class', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TaskDefinition] OFF
/****** Object:  Index [IX_CompletionLogs_Date]    Script Date: 12/3/2017 4:00:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_CompletionLogs_Date] ON [dbo].[CompletionLogs]
(
	[DateCompleted] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CompletionLogs_Student]    Script Date: 12/3/2017 4:00:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_CompletionLogs_Student] ON [dbo].[CompletionLogs]
(
	[Student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CompletionLogs_StudentLesson]    Script Date: 12/3/2017 4:00:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_CompletionLogs_StudentLesson] ON [dbo].[CompletionLogs]
(
	[Student] ASC,
	[LessonGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_LESSONITEMS_LessonGUID]    Script Date: 12/3/2017 4:00:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_LESSONITEMS_LessonGUID] ON [dbo].[LESSONITEMS]
(
	[LESSONGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LESSONITEMS_LessonID]    Script Date: 12/3/2017 4:00:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_LESSONITEMS_LessonID] ON [dbo].[LESSONITEMS]
(
	[LESSONID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LESSONS_LESSONID]    Script Date: 12/3/2017 4:00:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_LESSONS_LESSONID] ON [dbo].[LESSONS]
(
	[LESSONID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LESSONS_STAGE]    Script Date: 12/3/2017 4:00:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_LESSONS_STAGE] ON [dbo].[LESSONS]
(
	[STAGEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LessonTimeLog_DATE]    Script Date: 12/3/2017 4:00:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_LessonTimeLog_DATE] ON [dbo].[LessonTimeLog]
(
	[PerformedOn] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_LessonTimeLog_LESSON]    Script Date: 12/3/2017 4:00:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_LessonTimeLog_LESSON] ON [dbo].[LessonTimeLog]
(
	[Student] ASC,
	[LESSONID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_LessonTimeLog_STAGE]    Script Date: 12/3/2017 4:00:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_LessonTimeLog_STAGE] ON [dbo].[LessonTimeLog]
(
	[STAGEID] ASC,
	[Student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_LessonTimeLog_Student]    Script Date: 12/3/2017 4:00:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_LessonTimeLog_Student] ON [dbo].[LessonTimeLog]
(
	[Student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_STAGES_STAGEID]    Script Date: 12/3/2017 4:00:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_STAGES_STAGEID] ON [dbo].[STAGES]
(
	[STAGEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AchievementDefinition] ADD  DEFAULT ((0)) FOR [ValidityMonths]
GO
ALTER TABLE [dbo].[Aircrafts] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[CompletionLogs] ADD  DEFAULT ((0.0)) FOR [HoursSpent]
GO
ALTER TABLE [dbo].[LESSONITEMS] ADD  DEFAULT ('1') FOR [LESSONGUID]
GO
ALTER TABLE [dbo].[LESSONS] ADD  DEFAULT ((0)) FOR [duallocalday]
GO
ALTER TABLE [dbo].[LESSONS] ADD  DEFAULT ((0)) FOR [dualccday]
GO
ALTER TABLE [dbo].[LESSONS] ADD  DEFAULT ((0)) FOR [duallocalnight]
GO
ALTER TABLE [dbo].[LESSONS] ADD  DEFAULT ((0)) FOR [dualccnight]
GO
ALTER TABLE [dbo].[LESSONS] ADD  DEFAULT ((0)) FOR [sololocalday]
GO
ALTER TABLE [dbo].[LESSONS] ADD  DEFAULT ((0)) FOR [soloccday]
GO
ALTER TABLE [dbo].[LESSONS] ADD  DEFAULT ((0)) FOR [sololocalnight]
GO
ALTER TABLE [dbo].[LESSONS] ADD  DEFAULT ((0)) FOR [soloccnight]
GO
ALTER TABLE [dbo].[LESSONS] ADD  DEFAULT ((0)) FOR [briefing]
GO
ALTER TABLE [dbo].[LESSONS] ADD  DEFAULT ((0)) FOR [classvideo]
GO
ALTER TABLE [dbo].[LESSONS] ADD  DEFAULT ((0)) FOR [exams]
GO
ALTER TABLE [dbo].[LESSONS] ADD  DEFAULT ((0)) FOR [debrief]
GO
ALTER TABLE [dbo].[LessonTimeLog] ADD  DEFAULT ((0)) FOR [duallocalday]
GO
ALTER TABLE [dbo].[LessonTimeLog] ADD  DEFAULT ((0)) FOR [dualccday]
GO
ALTER TABLE [dbo].[LessonTimeLog] ADD  DEFAULT ((0)) FOR [duallocalnight]
GO
ALTER TABLE [dbo].[LessonTimeLog] ADD  DEFAULT ((0)) FOR [dualccnight]
GO
ALTER TABLE [dbo].[LessonTimeLog] ADD  DEFAULT ((0)) FOR [sololocalday]
GO
ALTER TABLE [dbo].[LessonTimeLog] ADD  DEFAULT ((0)) FOR [soloccday]
GO
ALTER TABLE [dbo].[LessonTimeLog] ADD  DEFAULT ((0)) FOR [sololocalnight]
GO
ALTER TABLE [dbo].[LessonTimeLog] ADD  DEFAULT ((0)) FOR [soloccnight]
GO
ALTER TABLE [dbo].[LessonTimeLog] ADD  DEFAULT ((0)) FOR [briefing]
GO
ALTER TABLE [dbo].[LessonTimeLog] ADD  DEFAULT ((0)) FOR [classvideo]
GO
ALTER TABLE [dbo].[LessonTimeLog] ADD  DEFAULT ((0)) FOR [exams]
GO
ALTER TABLE [dbo].[LessonTimeLog] ADD  DEFAULT ((0)) FOR [debrief]
GO
ALTER TABLE [dbo].[PilotClassDefinition] ADD  DEFAULT ('Passenger') FOR [Logo]
GO
ALTER TABLE [dbo].[PilotReward] ADD  DEFAULT ((0)) FOR [IsIssued]
GO
ALTER TABLE [dbo].[PilotTask] ADD  DEFAULT ((0)) FOR [IsVerified]
GO
ALTER TABLE [dbo].[RewardDefinition] ADD  DEFAULT ('DISCOUNT') FOR [RewardType]
GO
ALTER TABLE [dbo].[RewardDefinition] ADD  DEFAULT ((0)) FOR [RewardCount]
GO
ALTER TABLE [dbo].[RewardDefinition] ADD  DEFAULT ('Security Checked') FOR [Logo]
GO
ALTER TABLE [dbo].[STAGES] ADD  DEFAULT ((0)) FOR [duallocalday]
GO
ALTER TABLE [dbo].[STAGES] ADD  DEFAULT ((0)) FOR [dualccday]
GO
ALTER TABLE [dbo].[STAGES] ADD  DEFAULT ((0)) FOR [duallocalnight]
GO
ALTER TABLE [dbo].[STAGES] ADD  DEFAULT ((0)) FOR [dualccnight]
GO
ALTER TABLE [dbo].[STAGES] ADD  DEFAULT ((0)) FOR [sololocalday]
GO
ALTER TABLE [dbo].[STAGES] ADD  DEFAULT ((0)) FOR [soloccday]
GO
ALTER TABLE [dbo].[STAGES] ADD  DEFAULT ((0)) FOR [sololocalnight]
GO
ALTER TABLE [dbo].[STAGES] ADD  DEFAULT ((0)) FOR [soloccnight]
GO
ALTER TABLE [dbo].[STAGES] ADD  DEFAULT ((0)) FOR [briefing]
GO
ALTER TABLE [dbo].[STAGES] ADD  DEFAULT ((0)) FOR [classvideo]
GO
ALTER TABLE [dbo].[STAGES] ADD  DEFAULT ((0)) FOR [exams]
GO
ALTER TABLE [dbo].[STAGES] ADD  DEFAULT ((0)) FOR [debrief]
GO
ALTER TABLE [dbo].[TaskDefinition] ADD  DEFAULT ((0)) FOR [TaskType]
GO
ALTER TABLE [dbo].[TaskDefinition] ADD  DEFAULT ((0)) FOR [Hours]
GO
ALTER TABLE [dbo].[TaskDefinition] ADD  DEFAULT ((0)) FOR [Distance]
GO
ALTER TABLE [dbo].[TaskDefinition] ADD  DEFAULT ((0)) FOR [IsNight]
GO
ALTER TABLE [dbo].[TaskDefinition] ADD  DEFAULT ((0)) FOR [IsDual]
GO
ALTER TABLE [dbo].[TaskDefinition] ADD  DEFAULT ((0)) FOR [IsCrossCountry]
GO
ALTER TABLE [dbo].[TaskDefinition] ADD  DEFAULT ((0)) FOR [IsWithPassenger]
GO
