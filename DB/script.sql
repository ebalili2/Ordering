USE [master]
GO
/****** Object:  Database [Cleverbit]    Script Date: 08/05/2021 17:47:45 ******/
CREATE DATABASE [Cleverbit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cleverbit', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER01\MSSQL\DATA\Cleverbit.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cleverbit_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER01\MSSQL\DATA\Cleverbit_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Cleverbit] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cleverbit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cleverbit] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cleverbit] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cleverbit] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cleverbit] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cleverbit] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cleverbit] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cleverbit] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cleverbit] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cleverbit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cleverbit] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cleverbit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cleverbit] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cleverbit] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cleverbit] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cleverbit] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cleverbit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cleverbit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cleverbit] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cleverbit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cleverbit] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cleverbit] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cleverbit] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cleverbit] SET RECOVERY FULL 
GO
ALTER DATABASE [Cleverbit] SET  MULTI_USER 
GO
ALTER DATABASE [Cleverbit] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cleverbit] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cleverbit] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cleverbit] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cleverbit] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Cleverbit', N'ON'
GO
ALTER DATABASE [Cleverbit] SET QUERY_STORE = OFF
GO
USE [Cleverbit]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 08/05/2021 17:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1000,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[IsPopular] [tinyint] NOT NULL,
	[Price] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 08/05/2021 17:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[TransactionId] [int] IDENTITY(1000,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[TransactionTypeId] [int] NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 08/05/2021 17:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionType](
	[TransactionTypeId] [int] IDENTITY(1000,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 08/05/2021 17:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1000,1) NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[FirstName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[password] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Name], [IsPopular], [Price]) VALUES (1000, N'Product1', 0, CAST(100 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ProductId], [Name], [IsPopular], [Price]) VALUES (1001, N'Product2', 0, CAST(200 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ProductId], [Name], [IsPopular], [Price]) VALUES (1002, N'Product3', 0, CAST(300 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionType] ON 

INSERT [dbo].[TransactionType] ([TransactionTypeId], [Name]) VALUES (1003, N'Cancel')
INSERT [dbo].[TransactionType] ([TransactionTypeId], [Name]) VALUES (1000, N'Create')
INSERT [dbo].[TransactionType] ([TransactionTypeId], [Name]) VALUES (1001, N'Order')
INSERT [dbo].[TransactionType] ([TransactionTypeId], [Name]) VALUES (1002, N'Payment')
SET IDENTITY_INSERT [dbo].[TransactionType] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Username], [FirstName], [LastName], [password]) VALUES (1000, N'ebalili', N'Ervin', N'Balili', N'password')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Product__737584F661789D57]    Script Date: 08/05/2021 17:47:45 ******/
ALTER TABLE [dbo].[Product] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Transact__737584F6DCDD1168]    Script Date: 08/05/2021 17:47:45 ******/
ALTER TABLE [dbo].[TransactionType] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4B99D052B]    Script Date: 08/05/2021 17:47:45 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [IsPopular]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD FOREIGN KEY([TransactionTypeId])
REFERENCES [dbo].[TransactionType] ([TransactionTypeId])
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserId])
GO
USE [master]
GO
ALTER DATABASE [Cleverbit] SET  READ_WRITE 
GO
