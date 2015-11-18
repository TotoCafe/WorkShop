CREATE SCHEMA [totocafe]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Costumer](
	[CostumerID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[UserTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Costumer] PRIMARY KEY CLUSTERED 
(
	[CostumerID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK__City__F2D21A96A6543A8E] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Availability](
	[AvailabilityID] [int] IDENTITY(1,1) NOT NULL,
	[Availability] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Availability] PRIMARY KEY CLUSTERED 
(
	[AvailabilityID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[Permission] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Email] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Password] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Address] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Phone#] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Location] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT (''),
	[WirelessName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT (''),
	[WirelessPassword] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT (''),
	[CityID] [int] NOT NULL,
	[AvailabilityID] [int] NOT NULL DEFAULT ((1)),
	[PermissionID] [int] NOT NULL CONSTRAINT [DF_Company_PermissionAnonymousID]  DEFAULT ((1)),
 CONSTRAINT [PK__Company__2D971C4CDDA5A950] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyCostumer](
	[CompanyCostumerID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[CostumerID] [int] NOT NULL,
 CONSTRAINT [PK_CompanyCostumer] PRIMARY KEY CLUSTERED 
(
	[CompanyCostumerID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountSummary](
	[SummaryID] [int] IDENTITY(1,1) NOT NULL,
	[Credit] [float] NOT NULL,
	[TotalBill] [float] NOT NULL,
	[SummaryDateTime] [datetime] NOT NULL,
	[CompanyCostumerID] [int] NOT NULL,
 CONSTRAINT [PK_AccountSummary] PRIMARY KEY CLUSTERED 
(
	[SummaryID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anonymous](
	[AnonymousID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceID] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Anonymous] PRIMARY KEY CLUSTERED 
(
	[AnonymousID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AvailabilityID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Score](
	[ScoreID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceQuality] [int] NOT NULL,
	[ProductQuality] [int] NOT NULL,
 CONSTRAINT [PK_Score] PRIMARY KEY CLUSTERED 
(
	[ScoreID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consideration](
	[ConsiderartionID] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ScoreID] [int] NOT NULL,
	[ConsiderationDate] [date] NOT NULL,
	[CompanyCostumerID] [int] NOT NULL,
 CONSTRAINT [PK_Consideration] PRIMARY KEY CLUSTERED 
(
	[ConsiderartionID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Detail] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Price] [float] NOT NULL,
	[Credit] [float] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[AvailabilityID] [int] NOT NULL CONSTRAINT [DF__Product__IsHidde__3C69FB99]  DEFAULT ((1)),
 CONSTRAINT [PK__Product__B40CC6ED137F170B] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[TableID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[QrCode] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CompanyID] [int] NOT NULL,
	[AvailabilityID] [int] NOT NULL,
 CONSTRAINT [PK__Table__7D5F018EE58A2BB3] PRIMARY KEY CLUSTERED 
(
	[TableID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableController](
	[ControllerID] [int] IDENTITY(1,1) NOT NULL,
	[CostumerID] [int] NOT NULL,
	[TableID] [int] NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[FinishDateTime] [datetime] NULL,
 CONSTRAINT [PK__TableCon__5A8912B0B80EC574] PRIMARY KEY CLUSTERED 
(
	[ControllerID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Amount#] [int] NOT NULL,
	[OrderTime] [datetime] NOT NULL,
	[ControllerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[OrderDetails] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__tmp_ms_x__C3905BAFB3851EDE] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF__tmp_ms_xx__Amoun__38996AB5]  DEFAULT ((1)) FOR [Amount#]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Platform](
	[PlatformID] [int] IDENTITY(1,1) NOT NULL,
	[Platform] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Platform] PRIMARY KEY CLUSTERED 
(
	[PlatformID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Surname] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Email] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Password] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[BirthDate] [date] NOT NULL,
	[GenderID] [int] NOT NULL,
	[PlatformID] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
ALTER TABLE [dbo].[Costumer]  WITH CHECK ADD  CONSTRAINT [FK_Costumer_UserType] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserType] ([UserTypeID])
GO
ALTER TABLE [dbo].[Costumer] CHECK CONSTRAINT [FK_Costumer_UserType]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Availability] FOREIGN KEY([AvailabilityID])
REFERENCES [dbo].[Availability] ([AvailabilityID])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Availability]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_City]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Permission] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permission] ([PermissionID])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Permission]
GO
ALTER TABLE [dbo].[CompanyCostumer]  WITH CHECK ADD  CONSTRAINT [FK_CompanyCostumer_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[CompanyCostumer] CHECK CONSTRAINT [FK_CompanyCostumer_Company]
GO
ALTER TABLE [dbo].[CompanyCostumer]  WITH CHECK ADD  CONSTRAINT [FK_CompanyCostumer_Costumer] FOREIGN KEY([CostumerID])
REFERENCES [dbo].[Costumer] ([CostumerID])
GO
ALTER TABLE [dbo].[CompanyCostumer] CHECK CONSTRAINT [FK_CompanyCostumer_Costumer]
GO
ALTER TABLE [dbo].[AccountSummary]  WITH CHECK ADD  CONSTRAINT [FK_AccountSummary_CompanyCostumer] FOREIGN KEY([CompanyCostumerID])
REFERENCES [dbo].[CompanyCostumer] ([CompanyCostumerID])
GO
ALTER TABLE [dbo].[AccountSummary] CHECK CONSTRAINT [FK_AccountSummary_CompanyCostumer]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Availability] FOREIGN KEY([AvailabilityID])
REFERENCES [dbo].[Availability] ([AvailabilityID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Availability]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Company]
GO
ALTER TABLE [dbo].[Consideration]  WITH CHECK ADD  CONSTRAINT [FK_Consideration_CompanyCostumer] FOREIGN KEY([CompanyCostumerID])
REFERENCES [dbo].[CompanyCostumer] ([CompanyCostumerID])
GO
ALTER TABLE [dbo].[Consideration] CHECK CONSTRAINT [FK_Consideration_CompanyCostumer]
GO
ALTER TABLE [dbo].[Consideration]  WITH CHECK ADD  CONSTRAINT [FK_Consideration_Score] FOREIGN KEY([ScoreID])
REFERENCES [dbo].[Score] ([ScoreID])
GO
ALTER TABLE [dbo].[Consideration] CHECK CONSTRAINT [FK_Consideration_Score]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Availability] FOREIGN KEY([AvailabilityID])
REFERENCES [dbo].[Availability] ([AvailabilityID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Availability]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Table]  WITH CHECK ADD  CONSTRAINT [FK_Table_Availability] FOREIGN KEY([AvailabilityID])
REFERENCES [dbo].[Availability] ([AvailabilityID])
GO
ALTER TABLE [dbo].[Table] CHECK CONSTRAINT [FK_Table_Availability]
GO
ALTER TABLE [dbo].[Table]  WITH CHECK ADD  CONSTRAINT [FK_Table_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Table] CHECK CONSTRAINT [FK_Table_Company]
GO
ALTER TABLE [dbo].[TableController]  WITH CHECK ADD  CONSTRAINT [FK_TableController_Costumer] FOREIGN KEY([CostumerID])
REFERENCES [dbo].[Costumer] ([CostumerID])
GO
ALTER TABLE [dbo].[TableController] CHECK CONSTRAINT [FK_TableController_Costumer]
GO
ALTER TABLE [dbo].[TableController]  WITH CHECK ADD  CONSTRAINT [FK_TableController_Table] FOREIGN KEY([TableID])
REFERENCES [dbo].[Table] ([TableID])
GO
ALTER TABLE [dbo].[TableController] CHECK CONSTRAINT [FK_TableController_Table]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_TableController] FOREIGN KEY([ControllerID])
REFERENCES [dbo].[TableController] ([ControllerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_TableController]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Gender] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Gender] ([GenderID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Gender]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Platform] FOREIGN KEY([PlatformID])
REFERENCES [dbo].[Platform] ([PlatformID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Platform]
GO

