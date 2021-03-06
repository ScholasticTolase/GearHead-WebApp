USE [master]
GO
/****** Object:  Database [AccountsDB]    Script Date: 9/10/2020 9:15:02 PM ******/
CREATE DATABASE [AccountsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AccountsDB', FILENAME = N'C:\Users\HP PC\AccountsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AccountsDB_log', FILENAME = N'C:\Users\HP PC\AccountsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AccountsDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AccountsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AccountsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AccountsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AccountsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AccountsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AccountsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AccountsDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AccountsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AccountsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AccountsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AccountsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AccountsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AccountsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AccountsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AccountsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AccountsDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AccountsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AccountsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AccountsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AccountsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AccountsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AccountsDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [AccountsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AccountsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AccountsDB] SET  MULTI_USER 
GO
ALTER DATABASE [AccountsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AccountsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AccountsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AccountsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AccountsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AccountsDB] SET QUERY_STORE = OFF
GO
USE [AccountsDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [AccountsDB]
GO
/****** Object:  Table [dbo].[AdminAccounts]    Script Date: 9/10/2020 9:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminAccounts](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[ConfirmPassword] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AdminAccounts] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 9/10/2020 9:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[CategoryType] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Articles.] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/10/2020 9:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryType] [nvarchar](15) NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccounts]    Script Date: 9/10/2020 9:15:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccounts](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[ConfirmPassword] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.UserAccounts] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdminAccounts] ON 

INSERT [dbo].[AdminAccounts] ([AdminId], [FirstName], [LastName], [Email], [PhoneNumber], [Username], [Password], [ConfirmPassword]) VALUES (1, N'adm', N'adm', N'adm@mail.com', N'08101820189', N'adm', N'adm', N'adm')
INSERT [dbo].[AdminAccounts] ([AdminId], [FirstName], [LastName], [Email], [PhoneNumber], [Username], [Password], [ConfirmPassword]) VALUES (2, N'Admin', N'First', N'adm@hotmail.com', N'08101111111', N'admino', N'11111', N'11111')
INSERT [dbo].[AdminAccounts] ([AdminId], [FirstName], [LastName], [Email], [PhoneNumber], [Username], [Password], [ConfirmPassword]) VALUES (3, N'Tolase', N'Sunday', N'ntol@hi2.in', N'08101111111', N'Admin01', N'22222', N'22222')
SET IDENTITY_INSERT [dbo].[AdminAccounts] OFF
GO
INSERT [dbo].[Categories] ([CategoryType], [CategoryName]) VALUES (N'Article', N'Maintenance')
INSERT [dbo].[Categories] ([CategoryType], [CategoryName]) VALUES (N'Guide', N'Know-How')
GO
SET IDENTITY_INSERT [dbo].[UserAccounts] ON 

INSERT [dbo].[UserAccounts] ([UserId], [FirstName], [LastName], [Email], [PhoneNumber], [Username], [Password], [ConfirmPassword]) VALUES (1, N'Odion', N'Asukwo', N'divinepowermega@gmail.com', N'08101820189', N'Tolase1', N'123451', N'123451')
INSERT [dbo].[UserAccounts] ([UserId], [FirstName], [LastName], [Email], [PhoneNumber], [Username], [Password], [ConfirmPassword]) VALUES (2, N'Odion', N'Asukwo', N'divinepowermega@gmail.com', N'08101820189', N'Tolase1', N'123451', N'123451')
INSERT [dbo].[UserAccounts] ([UserId], [FirstName], [LastName], [Email], [PhoneNumber], [Username], [Password], [ConfirmPassword]) VALUES (3, N'George', N'John', N'g.john@mail.com', N'08102222222', N'g.john', N'123452', N'123452')
INSERT [dbo].[UserAccounts] ([UserId], [FirstName], [LastName], [Email], [PhoneNumber], [Username], [Password], [ConfirmPassword]) VALUES (4, N'George', N'John', N'g.john@mail.com', N'08102222222', N'g.john', N'123452', N'123452')
INSERT [dbo].[UserAccounts] ([UserId], [FirstName], [LastName], [Email], [PhoneNumber], [Username], [Password], [ConfirmPassword]) VALUES (5, N'Tosin', N'Adeife', N't.adeife@gmail.com', N'08103333333', N't.adeife', N'123453', N'123453')
INSERT [dbo].[UserAccounts] ([UserId], [FirstName], [LastName], [Email], [PhoneNumber], [Username], [Password], [ConfirmPassword]) VALUES (6, N'John', N'Emma', N'j.emma@mail.coom', N'08104444444', N'j.emma', N'123454', N'123454')
INSERT [dbo].[UserAccounts] ([UserId], [FirstName], [LastName], [Email], [PhoneNumber], [Username], [Password], [ConfirmPassword]) VALUES (7, N'null', N'null', N'null@mail.com', N'08101820189', N'null', N'null', N'null')
INSERT [dbo].[UserAccounts] ([UserId], [FirstName], [LastName], [Email], [PhoneNumber], [Username], [Password], [ConfirmPassword]) VALUES (8, N'adm', N'adm', N'adm@mail.com', N'08101820189', N'adm', N'adm', N'adm')
INSERT [dbo].[UserAccounts] ([UserId], [FirstName], [LastName], [Email], [PhoneNumber], [Username], [Password], [ConfirmPassword]) VALUES (9, N'adm', N'adm', N'adm@mail.com', N'08101820189', N'adm01', N'123456', N'123456')
INSERT [dbo].[UserAccounts] ([UserId], [FirstName], [LastName], [Email], [PhoneNumber], [Username], [Password], [ConfirmPassword]) VALUES (10, N'Ini', N'John', N'ini@mail.com', N'08101810189', N'ini.j', N'123456', N'123456')
INSERT [dbo].[UserAccounts] ([UserId], [FirstName], [LastName], [Email], [PhoneNumber], [Username], [Password], [ConfirmPassword]) VALUES (1010, N'Samuel', N'Olaniyi', N'sam.ola@gmail.com', N'08101810180', N'sam.ola', N'123450', N'123450')
INSERT [dbo].[UserAccounts] ([UserId], [FirstName], [LastName], [Email], [PhoneNumber], [Username], [Password], [ConfirmPassword]) VALUES (1011, N'Dan', N'Ola', N'danola@mail.com', N'08101810181', N'danola', N'123455', N'123455')
INSERT [dbo].[UserAccounts] ([UserId], [FirstName], [LastName], [Email], [PhoneNumber], [Username], [Password], [ConfirmPassword]) VALUES (1012, N'ade', N'nike', N'nike@mail.com', N'08101010101', N'ade.nike', N'123459', N'123459')
SET IDENTITY_INSERT [dbo].[UserAccounts] OFF
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Categories] FOREIGN KEY([CategoryType])
REFERENCES [dbo].[Categories] ([CategoryType])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Categories]
GO
USE [master]
GO
ALTER DATABASE [AccountsDB] SET  READ_WRITE 
GO
