USE [dprosev]
GO
ALTER TABLE [cap].[MedInfo] DROP CONSTRAINT [FK__MedInfo__personI__4B8221F7]
GO
/****** Object:  Table [cap].[MedInfo]    Script Date: 5/1/2020 11:17:25 AM ******/
DROP TABLE [cap].[MedInfo]
GO
/****** Object:  Table [cap].[Consumables]    Script Date: 5/1/2020 11:17:25 AM ******/
DROP TABLE [cap].[Consumables]
GO
/****** Object:  Table [cap].[Activities]    Script Date: 5/1/2020 11:17:25 AM ******/
DROP TABLE [cap].[Activities]
GO
/****** Object:  View [dbo].[IO]    Script Date: 5/1/2020 11:17:25 AM ******/
DROP VIEW [dbo].[IO]
GO
/****** Object:  Table [cap].[Person]    Script Date: 5/1/2020 11:17:25 AM ******/
DROP TABLE [cap].[Person]
GO
/****** Object:  Schema [cap]    Script Date: 5/1/2020 11:17:25 AM ******/
DROP SCHEMA [cap]
GO
/****** Object:  Schema [cap]    Script Date: 5/1/2020 11:17:25 AM ******/
CREATE SCHEMA [cap]
GO
/****** Object:  Table [cap].[Person]    Script Date: 5/1/2020 11:17:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cap].[Person](
	[personID] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](5) NULL,
	[email] [varchar](80) NULL,
	[password] [varchar](30) NULL,
	[prefix] [varchar](20) NULL,
	[firstName] [varchar](40) NULL,
	[middleName] [varchar](40) NULL,
	[lastName] [varchar](40) NULL,
	[sufix] [varchar](20) NULL,
	[gender] [varchar](6) NULL,
	[DOB] [date] NULL,
	[parentPassword] [varchar](30) NULL,
	[altEmail] [varchar](80) NULL,
	[altPassword] [varchar](30) NULL,
	[phone] [varchar](15) NULL,
	[address] [varchar](80) NULL,
	[registerDate] [datetime] NULL,
	[lastLogin] [datetime] NULL,
	[approved] [varchar](3) NULL,
	[currLoggedIN] [varchar](3) NULL,
	[rndCode] [char](50) NULL,
	[heightFt] [int] NULL,
	[heightIn] [float] NULL,
	[weight] [float] NULL,
	[bloodType] [varchar](15) NULL,
	[allergies] [varchar](255) NULL,
	[inputAct] [varchar](255) NULL,
	[outputAct] [varchar](255) NULL,
	[inputCons] [varchar](255) NULL,
	[outputCons] [varchar](255) NULL,
	[imgData] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[personID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[IO]    Script Date: 5/1/2020 11:17:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[IO] AS
select email, inputAct, outputAct, inputCons, outputCons from cap.Person
GO
/****** Object:  Table [cap].[Activities]    Script Date: 5/1/2020 11:17:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cap].[Activities](
	[actID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](60) NULL,
	[status] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[actID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [cap].[Consumables]    Script Date: 5/1/2020 11:17:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cap].[Consumables](
	[consID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](60) NULL,
	[sugar] [float] NULL,
	[calories] [float] NULL,
	[GI] [int] NULL,
	[status] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[consID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [cap].[MedInfo]    Script Date: 5/1/2020 11:17:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cap].[MedInfo](
	[personID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[personID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [cap].[Activities] ON 

INSERT [cap].[Activities] ([actID], [name], [status]) VALUES (1, N'Sports', N'active')
INSERT [cap].[Activities] ([actID], [name], [status]) VALUES (2, N'Walking', N'active')
INSERT [cap].[Activities] ([actID], [name], [status]) VALUES (3, N'Running', N'active')
INSERT [cap].[Activities] ([actID], [name], [status]) VALUES (4, N'Strenght Training', N'active')
SET IDENTITY_INSERT [cap].[Activities] OFF
SET IDENTITY_INSERT [cap].[Consumables] ON 

INSERT [cap].[Consumables] ([consID], [name], [sugar], [calories], [GI], [status]) VALUES (1, N'Apple', 2, 30, 5, N'active')
INSERT [cap].[Consumables] ([consID], [name], [sugar], [calories], [GI], [status]) VALUES (2, N'Pear', 3, 45, 6, N'active')
INSERT [cap].[Consumables] ([consID], [name], [sugar], [calories], [GI], [status]) VALUES (3, N'Banana', 4, 55, 7, N'active')
INSERT [cap].[Consumables] ([consID], [name], [sugar], [calories], [GI], [status]) VALUES (4, N'Orange', 5, 44, 6, N'active')
SET IDENTITY_INSERT [cap].[Consumables] OFF
SET IDENTITY_INSERT [cap].[Person] ON 

INSERT [cap].[Person] ([personID], [type], [email], [password], [prefix], [firstName], [middleName], [lastName], [sufix], [gender], [DOB], [parentPassword], [altEmail], [altPassword], [phone], [address], [registerDate], [lastLogin], [approved], [currLoggedIN], [rndCode], [heightFt], [heightIn], [weight], [bloodType], [allergies], [inputAct], [outputAct], [inputCons], [outputCons], [imgData]) VALUES (1, N'user', N'test@gmail.com', N'test123!!!', N'', N'firstuser', N'', N'lastuser', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'', N'', N'', CAST(N'2020-03-15T22:21:19.000' AS DateTime), NULL, N'no', N'no', N'AAGUBTMKJPUQTFPWHAXOJWPSCHEHEIHRPKOPGKILMWAHXEWRBQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [cap].[Person] ([personID], [type], [email], [password], [prefix], [firstName], [middleName], [lastName], [sufix], [gender], [DOB], [parentPassword], [altEmail], [altPassword], [phone], [address], [registerDate], [lastLogin], [approved], [currLoggedIN], [rndCode], [heightFt], [heightIn], [weight], [bloodType], [allergies], [inputAct], [outputAct], [inputCons], [outputCons], [imgData]) VALUES (2, N'admin', N'admin@gmail.com', N'test123!!!', N'', N'firstadmin', N'', N'lastadmin', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'', N'', N'', CAST(N'2020-03-15T22:21:19.000' AS DateTime), NULL, N'no', N'no', N'AAGUBTMKJPUQTFPWHAXOJWPSCHEHEIHRPKOPGKILMWAHXEWRBQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [cap].[Person] ([personID], [type], [email], [password], [prefix], [firstName], [middleName], [lastName], [sufix], [gender], [DOB], [parentPassword], [altEmail], [altPassword], [phone], [address], [registerDate], [lastLogin], [approved], [currLoggedIN], [rndCode], [heightFt], [heightIn], [weight], [bloodType], [allergies], [inputAct], [outputAct], [inputCons], [outputCons], [imgData]) VALUES (3, N'super', N'super@gmail.com', N'test123!!!', N'', N'firstsuper', N'', N'lastsuper', N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', N'', N'', N'', CAST(N'2020-03-15T22:21:19.000' AS DateTime), NULL, N'no', N'no', N'AAGUBTMKJPUQTFPWHAXOJWPSCHEHEIHRPKOPGKILMWAHXEWRBQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [cap].[Person] OFF
ALTER TABLE [cap].[MedInfo]  WITH CHECK ADD FOREIGN KEY([personID])
REFERENCES [cap].[Person] ([personID])
GO
