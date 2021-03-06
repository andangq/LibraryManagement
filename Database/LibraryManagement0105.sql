USE [master]
GO
/****** Object:  Database [LibraryManagement]    Script Date: 2018-05-01 11:55:20 PM ******/
CREATE DATABASE [LibraryManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.CSDLPT1\MSSQL\DATA\LibraryManagement.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LibraryManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.CSDLPT1\MSSQL\DATA\LibraryManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LibraryManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [LibraryManagement] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LibraryManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LibraryManagement', N'ON'
GO
USE [LibraryManagement]
GO
/****** Object:  Table [dbo].[LibBook]    Script Date: 2018-05-01 11:55:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibBook](
	[IdBook] [int] NOT NULL,
	[TitleOfBook] [nvarchar](50) NOT NULL,
	[Author] [nvarchar](128) NOT NULL,
	[PublishYear] [date] NOT NULL,
	[ShortDescription] [nvarchar](100) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[IdBook] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LibBorrowBook]    Script Date: 2018-05-01 11:55:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibBorrowBook](
	[IdBorrow] [int] NOT NULL,
	[IdUser] [int] NOT NULL,
	[ISBN] [nchar](15) NOT NULL,
	[DateBorrow] [date] NOT NULL,
	[DateReturn] [date] NOT NULL,
 CONSTRAINT [PK_BorrowBook] PRIMARY KEY CLUSTERED 
(
	[IdBorrow] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LibISBN]    Script Date: 2018-05-01 11:55:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibISBN](
	[ISBN] [nchar](15) NOT NULL,
	[IdBook] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[TotalBook] [int] NOT NULL,
	[NumberBooksBorrowed] [int] NOT NULL,
 CONSTRAINT [PK_ISBN] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LibRole]    Script Date: 2018-05-01 11:55:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibRole](
	[IdRole] [int] IDENTITY(1,1) NOT NULL,
	[NameRole] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LibUser]    Script Date: 2018-05-01 11:55:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibUser](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nchar](128) NOT NULL,
	[Password] [nchar](61) NOT NULL,
	[FullName] [nvarchar](128) NOT NULL,
	[IdRole] [int] NOT NULL,
	[LimitNumber] [int] NOT NULL CONSTRAINT [DF_User_LimitNumber]  DEFAULT ((3)),
	[BorrowedNumber] [int] NOT NULL CONSTRAINT [DF_User_BorrowedNumber]  DEFAULT ((0)),
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persistent_Logins]    Script Date: 2018-05-01 11:55:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Persistent_Logins](
	[UserName] [varchar](64) NOT NULL,
	[Series] [varchar](64) NOT NULL,
	[Token] [varchar](64) NOT NULL,
	[LastUsed] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Series] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[LibRole] ON 

INSERT [dbo].[LibRole] ([IdRole], [NameRole]) VALUES (1, N'ROLE_ADMIN')
INSERT [dbo].[LibRole] ([IdRole], [NameRole]) VALUES (2, N'ROLE_USER')
SET IDENTITY_INSERT [dbo].[LibRole] OFF
SET IDENTITY_INSERT [dbo].[LibUser] ON 

INSERT [dbo].[LibUser] ([IdUser], [UserName], [Password], [FullName], [IdRole], [LimitNumber], [BorrowedNumber]) VALUES (1, N'hqt95na@gmail.com                                                                                                               ', N'$2y$10$12dFop/grbWgokVdo8PcX.y.rKUeTbJ.El3U2lHuKcNwWivOG0Sd2 ', N'Hoàng Quốc Tuân', 1, 3, 0)
SET IDENTITY_INSERT [dbo].[LibUser] OFF
ALTER TABLE [dbo].[LibBorrowBook] ADD  CONSTRAINT [DF_BorrowBook_DateReturn]  DEFAULT (NULL) FOR [DateReturn]
GO
ALTER TABLE [dbo].[LibISBN] ADD  CONSTRAINT [DF_ISBN_NumberBooksBorrowed]  DEFAULT ((0)) FOR [NumberBooksBorrowed]
GO
ALTER TABLE [dbo].[LibBorrowBook]  WITH CHECK ADD  CONSTRAINT [FK_BorrowBook_ISBN] FOREIGN KEY([ISBN])
REFERENCES [dbo].[LibISBN] ([ISBN])
GO
ALTER TABLE [dbo].[LibBorrowBook] CHECK CONSTRAINT [FK_BorrowBook_ISBN]
GO
ALTER TABLE [dbo].[LibBorrowBook]  WITH CHECK ADD  CONSTRAINT [FK_BorrowBook_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[LibUser] ([IdUser])
GO
ALTER TABLE [dbo].[LibBorrowBook] CHECK CONSTRAINT [FK_BorrowBook_User]
GO
ALTER TABLE [dbo].[LibISBN]  WITH CHECK ADD  CONSTRAINT [FK_ISBN_Book] FOREIGN KEY([IdBook])
REFERENCES [dbo].[LibBook] ([IdBook])
GO
ALTER TABLE [dbo].[LibISBN] CHECK CONSTRAINT [FK_ISBN_Book]
GO
ALTER TABLE [dbo].[LibUser]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[LibRole] ([IdRole])
GO
ALTER TABLE [dbo].[LibUser] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [LibraryManagement] SET  READ_WRITE 
GO
