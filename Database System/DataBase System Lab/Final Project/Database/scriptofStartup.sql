USE [master]
GO
/****** Object:  Database [Startup]    Script Date: 4/16/2023 10:14:51 AM ******/
CREATE DATABASE [Startup]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Startup', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Startup.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Startup_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Startup_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Startup] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Startup].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Startup] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Startup] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Startup] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Startup] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Startup] SET ARITHABORT OFF 
GO
ALTER DATABASE [Startup] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Startup] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Startup] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Startup] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Startup] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Startup] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Startup] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Startup] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Startup] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Startup] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Startup] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Startup] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Startup] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Startup] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Startup] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Startup] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Startup] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Startup] SET RECOVERY FULL 
GO
ALTER DATABASE [Startup] SET  MULTI_USER 
GO
ALTER DATABASE [Startup] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Startup] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Startup] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Startup] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Startup] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Startup] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Startup', N'ON'
GO
ALTER DATABASE [Startup] SET QUERY_STORE = ON
GO
ALTER DATABASE [Startup] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Startup]
GO
/****** Object:  Table [dbo].[Account Details]    Script Date: 4/16/2023 10:14:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account Details](
	[Person ID] [int] NOT NULL,
	[Current Balance] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Investment]    Script Date: 4/16/2023 10:14:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Investment](
	[ID] [int] NOT NULL,
	[Person ID] [int] NULL,
	[Startup ID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_Investment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Investors]    Script Date: 4/16/2023 10:14:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Investors](
	[Person ID] [int] NOT NULL,
	[Startup ID] [int] NOT NULL,
	[Start Date] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginInfo]    Script Date: 4/16/2023 10:14:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginInfo](
	[ID] [int] NOT NULL,
	[Username] [varchar](30) NOT NULL,
	[Password] [varchar](30) NOT NULL,
 CONSTRAINT [PK_LoginInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mentor]    Script Date: 4/16/2023 10:14:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mentor](
	[Person ID] [int] NOT NULL,
	[Startup ID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 4/16/2023 10:14:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Sender ID] [int] NOT NULL,
	[Reciever ID] [int] NOT NULL,
	[Message Body] [varchar](max) NOT NULL,
	[Date] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 4/16/2023 10:14:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[ID] [int] NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[Gender] [int] NOT NULL,
	[Phone Number] [varchar](30) NOT NULL,
	[Address] [varchar](50) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Required Investment]    Script Date: 4/16/2023 10:14:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Required Investment](
	[ID] [int] NOT NULL,
	[Required Amount] [int] NOT NULL,
	[Minimum Investment] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 4/16/2023 10:14:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[Startup ID] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Year] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Startup]    Script Date: 4/16/2023 10:14:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Startup](
	[ID] [int] NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Description] [varchar](50) NULL,
	[Creation Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Startup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Startup CEO]    Script Date: 4/16/2023 10:14:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Startup CEO](
	[Person ID] [int] NOT NULL,
	[Startup ID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Startup Members]    Script Date: 4/16/2023 10:14:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Startup Members](
	[Startup ID] [int] NOT NULL,
	[Person ID] [int] NOT NULL,
	[Role] [varchar](30) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account Details]  WITH CHECK ADD  CONSTRAINT [FK_Account Details_Person] FOREIGN KEY([Person ID])
REFERENCES [dbo].[Person] ([ID])
GO
ALTER TABLE [dbo].[Account Details] CHECK CONSTRAINT [FK_Account Details_Person]
GO
ALTER TABLE [dbo].[Investment]  WITH CHECK ADD  CONSTRAINT [FK_Investment_Person] FOREIGN KEY([Startup ID])
REFERENCES [dbo].[Startup] ([ID])
GO
ALTER TABLE [dbo].[Investment] CHECK CONSTRAINT [FK_Investment_Person]
GO
ALTER TABLE [dbo].[Investment]  WITH CHECK ADD  CONSTRAINT [FK_Investment_Startup] FOREIGN KEY([Startup ID])
REFERENCES [dbo].[Startup] ([ID])
GO
ALTER TABLE [dbo].[Investment] CHECK CONSTRAINT [FK_Investment_Startup]
GO
ALTER TABLE [dbo].[Investors]  WITH CHECK ADD  CONSTRAINT [FK_Investors_Person] FOREIGN KEY([Person ID])
REFERENCES [dbo].[Person] ([ID])
GO
ALTER TABLE [dbo].[Investors] CHECK CONSTRAINT [FK_Investors_Person]
GO
ALTER TABLE [dbo].[Investors]  WITH CHECK ADD  CONSTRAINT [FK_Investors_Startup] FOREIGN KEY([Startup ID])
REFERENCES [dbo].[Startup] ([ID])
GO
ALTER TABLE [dbo].[Investors] CHECK CONSTRAINT [FK_Investors_Startup]
GO
ALTER TABLE [dbo].[Mentor]  WITH CHECK ADD  CONSTRAINT [FK_Mentor_Person2] FOREIGN KEY([Person ID])
REFERENCES [dbo].[Person] ([ID])
GO
ALTER TABLE [dbo].[Mentor] CHECK CONSTRAINT [FK_Mentor_Person2]
GO
ALTER TABLE [dbo].[Mentor]  WITH CHECK ADD  CONSTRAINT [FK_Mentor_Startup] FOREIGN KEY([Startup ID])
REFERENCES [dbo].[Startup] ([ID])
GO
ALTER TABLE [dbo].[Mentor] CHECK CONSTRAINT [FK_Mentor_Startup]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Person] FOREIGN KEY([Sender ID])
REFERENCES [dbo].[Person] ([ID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Person]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Person1] FOREIGN KEY([Reciever ID])
REFERENCES [dbo].[Person] ([ID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Person1]
GO
ALTER TABLE [dbo].[Required Investment]  WITH CHECK ADD  CONSTRAINT [FK_Required Investment_Startup] FOREIGN KEY([ID])
REFERENCES [dbo].[Startup] ([ID])
GO
ALTER TABLE [dbo].[Required Investment] CHECK CONSTRAINT [FK_Required Investment_Startup]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Startup] FOREIGN KEY([Startup ID])
REFERENCES [dbo].[Startup] ([ID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Startup]
GO
ALTER TABLE [dbo].[Startup CEO]  WITH CHECK ADD  CONSTRAINT [FK_Startup CEO_Person] FOREIGN KEY([Person ID])
REFERENCES [dbo].[Person] ([ID])
GO
ALTER TABLE [dbo].[Startup CEO] CHECK CONSTRAINT [FK_Startup CEO_Person]
GO
ALTER TABLE [dbo].[Startup CEO]  WITH CHECK ADD  CONSTRAINT [FK_Startup CEO_Startup] FOREIGN KEY([Startup ID])
REFERENCES [dbo].[Startup] ([ID])
GO
ALTER TABLE [dbo].[Startup CEO] CHECK CONSTRAINT [FK_Startup CEO_Startup]
GO
ALTER TABLE [dbo].[Startup Members]  WITH CHECK ADD  CONSTRAINT [FK_Startup Members_Person] FOREIGN KEY([Person ID])
REFERENCES [dbo].[Person] ([ID])
GO
ALTER TABLE [dbo].[Startup Members] CHECK CONSTRAINT [FK_Startup Members_Person]
GO
ALTER TABLE [dbo].[Startup Members]  WITH CHECK ADD  CONSTRAINT [FK_Startup Members_Startup] FOREIGN KEY([Startup ID])
REFERENCES [dbo].[Startup] ([ID])
GO
ALTER TABLE [dbo].[Startup Members] CHECK CONSTRAINT [FK_Startup Members_Startup]
GO
USE [master]
GO
ALTER DATABASE [Startup] SET  READ_WRITE 
GO
