-- ByteMarket Database Tables Script
-- Database: ByteMarket_db

CREATE TABLE [dbo].[user_tbl] (
    [User_Id]  INT            IDENTITY (1, 1) NOT NULL,
    [Name]     NVARCHAR (MAX) NOT NULL,
    [Gender]   NVARCHAR (MAX) NULL,
    [Email]    NVARCHAR (MAX) NOT NULL,
    [Password] NVARCHAR (MAX) NOT NULL,
    [City]     NVARCHAR (MAX) NULL,
    [Address]  NVARCHAR (MAX) NULL,
    [Mobile]   NVARCHAR (MAX) NULL,
    [Role]     NVARCHAR (MAX) NOT NULL,
    [Image]    NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([User_Id] ASC)
);

CREATE TABLE [dbo].[buyer_tbl] (
    [Buyer_Id] INT            IDENTITY (1, 1) NOT NULL,
    [User_Id]  INT            NOT NULL,
    [FullName] NVARCHAR (MAX) NOT NULL,
    [Gender]   NVARCHAR (MAX) NULL,
    [Email]    NVARCHAR (MAX) NOT NULL,
    [Mobile]   NVARCHAR (MAX) NULL,
    [City]     NVARCHAR (MAX) NULL,
    [Address]  NVARCHAR (MAX) NULL,
    [Image]    NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([Buyer_Id] ASC),
    CONSTRAINT [FK_buyer_user] FOREIGN KEY ([User_Id]) REFERENCES [dbo].[user_tbl] ([User_Id])
);

CREATE TABLE [dbo].[seller_tbl] (
    [Seller_Id] INT            IDENTITY (1, 1) NOT NULL,
    [User_Id]   INT            NOT NULL,
    [FullName]  NVARCHAR (MAX) NOT NULL,
    [Email]     NVARCHAR (MAX) NOT NULL,
    [Mobile]    NVARCHAR (MAX) NULL,
    [StoreName] NVARCHAR (MAX) NULL,
    [City]      NVARCHAR (MAX) NULL,
    [Address]   NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([Seller_Id] ASC),
    CONSTRAINT [FK_seller_user] FOREIGN KEY ([User_Id]) REFERENCES [dbo].[user_tbl] ([User_Id])
);
