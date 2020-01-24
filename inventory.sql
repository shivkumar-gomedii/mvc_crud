USE [master]
GO
/****** Object:  Database [Inventory]    Script Date: 24-01-2020 12:54:23 PM ******/
CREATE DATABASE [Inventory]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Inventory', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Inventory.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Inventory_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Inventory_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Inventory] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Inventory].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Inventory] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Inventory] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Inventory] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Inventory] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Inventory] SET ARITHABORT OFF 
GO
ALTER DATABASE [Inventory] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Inventory] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Inventory] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Inventory] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Inventory] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Inventory] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Inventory] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Inventory] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Inventory] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Inventory] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Inventory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Inventory] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Inventory] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Inventory] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Inventory] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Inventory] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Inventory] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Inventory] SET RECOVERY FULL 
GO
ALTER DATABASE [Inventory] SET  MULTI_USER 
GO
ALTER DATABASE [Inventory] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Inventory] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Inventory] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Inventory] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Inventory] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Inventory', N'ON'
GO
ALTER DATABASE [Inventory] SET QUERY_STORE = OFF
GO
USE [Inventory]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 24-01-2020 12:54:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 24-01-2020 12:54:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Category] [varchar](100) NULL,
	[Color] [varchar](20) NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[AvailableQuantity] [bigint] NOT NULL,
	[ProductImagePath] [varchar](max) NULL,
	[CratedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [CratedDate]
GO
/****** Object:  StoredProcedure [dbo].[spGetList]    Script Date: 24-01-2020 12:54:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetList]
                    as
                    begin
                     select*From Products;
                    end
GO
/****** Object:  StoredProcedure [dbo].[spSaveProduct]    Script Date: 24-01-2020 12:54:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spSaveProduct]
             @Name Varchar(100),
             @Category Varchar(100),
             @Color Varchar(20),
             @UnitPrice Decimal,
             @AvailableQuantity BigInt,
             @ProductImagePath varchar(max)
            as
            begin
            INSERT INTO [dbo].[Products]
           ([Name]
           ,[Category]
           ,[Color]
           ,[UnitPrice]
           ,[AvailableQuantity]
           ,[ProductImagePath]
           ,[CratedDate])
            VALUES
           (@Name
           ,@Category
           ,@Color
           ,@UnitPrice
           ,@AvailableQuantity
           ,@ProductImagePath
           ,GETDATE())
          end
GO
USE [master]
GO
ALTER DATABASE [Inventory] SET  READ_WRITE 
GO
