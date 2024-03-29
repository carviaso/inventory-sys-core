if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_InBill_ContactUnit]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[InBill] DROP CONSTRAINT FK_InBill_ContactUnit
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_InBill_Employee]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[InBill] DROP CONSTRAINT FK_InBill_Employee
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_GoodsStock_Goods]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[GoodsStock] DROP CONSTRAINT FK_GoodsStock_Goods
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_InBillDetail_Goods]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[InBillDetail] DROP CONSTRAINT FK_InBillDetail_Goods
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Goods_GoodsType]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Goods] DROP CONSTRAINT FK_Goods_GoodsType
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_InBillDetail_InBill]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[InBillDetail] DROP CONSTRAINT FK_InBillDetail_InBill
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ContactUnit]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ContactUnit]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Employee]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Employee]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Goods]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Goods]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GoodsStock]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GoodsStock]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GoodsType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GoodsType]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InBill]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[InBill]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InBillDetail]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[InBillDetail]
GO

CREATE TABLE [dbo].[ContactUnit] (
	[Pkid] [int] IDENTITY (1, 1) NOT NULL ,
	[ContactName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Employee] (
	[Pkid] [int] IDENTITY (1, 1) NOT NULL ,
	[EmployeeName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[AllowLogin] [bit] NOT NULL ,
	[LoginId] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[LoginPwd] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Goods] (
	[Pkid] [int] IDENTITY (1, 1) NOT NULL ,
	[GoodsCode] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[GoodsName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[TypePkid] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[GoodsStock] (
	[Pkid] [int] IDENTITY (1, 1) NOT NULL ,
	[GoodsPkid] [int] NOT NULL ,
	[Amount] [decimal](18, 2) NOT NULL ,
	[Location] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[GoodsType] (
	[Pkid] [int] IDENTITY (1, 1) NOT NULL ,
	[TypeName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[InBill] (
	[RowGuid] [uniqueidentifier] NOT NULL ,
	[AddDateTime] [datetime] NOT NULL ,
	[InBillNumber] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[EmployeePkid] [int] NOT NULL ,
	[ContactUnitPkid] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[InBillDetail] (
	[Pkid] [int] IDENTITY (1, 1) NOT NULL ,
	[BillRowGuid] [uniqueidentifier] NOT NULL ,
	[LineNumber] [int] NOT NULL ,
	[GoodsPkid] [int] NOT NULL ,
	[Amount] [decimal](18, 2) NOT NULL ,
	[Price] [decimal](18, 4) NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ContactUnit] WITH NOCHECK ADD 
	CONSTRAINT [PK_Supplier] PRIMARY KEY  CLUSTERED 
	(
		[Pkid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Employee] WITH NOCHECK ADD 
	CONSTRAINT [PK_Employee] PRIMARY KEY  CLUSTERED 
	(
		[Pkid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Goods] WITH NOCHECK ADD 
	CONSTRAINT [PK_Goods] PRIMARY KEY  CLUSTERED 
	(
		[Pkid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[GoodsStock] WITH NOCHECK ADD 
	CONSTRAINT [PK_GoodsStock] PRIMARY KEY  CLUSTERED 
	(
		[Pkid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[GoodsType] WITH NOCHECK ADD 
	CONSTRAINT [PK_GoodsType] PRIMARY KEY  CLUSTERED 
	(
		[Pkid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[InBill] WITH NOCHECK ADD 
	CONSTRAINT [PK_InBill] PRIMARY KEY  CLUSTERED 
	(
		[RowGuid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[InBillDetail] WITH NOCHECK ADD 
	CONSTRAINT [PK_BillDetail] PRIMARY KEY  CLUSTERED 
	(
		[Pkid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Employee] ADD 
	CONSTRAINT [DF_Employee_AllowLogin] DEFAULT (0) FOR [AllowLogin]
GO

ALTER TABLE [dbo].[GoodsStock] ADD 
	CONSTRAINT [DF_GoodsStock_Amount] DEFAULT (0) FOR [Amount]
GO

ALTER TABLE [dbo].[InBillDetail] ADD 
	CONSTRAINT [DF_BillDetail_LineNumber] DEFAULT (0) FOR [LineNumber]
GO

ALTER TABLE [dbo].[Goods] ADD 
	CONSTRAINT [FK_Goods_GoodsType] FOREIGN KEY 
	(
		[TypePkid]
	) REFERENCES [dbo].[GoodsType] (
		[Pkid]
	)
GO

ALTER TABLE [dbo].[GoodsStock] ADD 
	CONSTRAINT [FK_GoodsStock_Goods] FOREIGN KEY 
	(
		[GoodsPkid]
	) REFERENCES [dbo].[Goods] (
		[Pkid]
	)
GO

ALTER TABLE [dbo].[InBill] ADD 
	CONSTRAINT [FK_InBill_ContactUnit] FOREIGN KEY 
	(
		[ContactUnitPkid]
	) REFERENCES [dbo].[ContactUnit] (
		[Pkid]
	),
	CONSTRAINT [FK_InBill_Employee] FOREIGN KEY 
	(
		[EmployeePkid]
	) REFERENCES [dbo].[Employee] (
		[Pkid]
	)
GO

ALTER TABLE [dbo].[InBillDetail] ADD 
	CONSTRAINT [FK_InBillDetail_Goods] FOREIGN KEY 
	(
		[GoodsPkid]
	) REFERENCES [dbo].[Goods] (
		[Pkid]
	),
	CONSTRAINT [FK_InBillDetail_InBill] FOREIGN KEY 
	(
		[BillRowGuid]
	) REFERENCES [dbo].[InBill] (
		[RowGuid]
	)
GO

