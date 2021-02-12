
USE [master]
GO

-- /****** Object:  Database [SmileITv2]    Script Date: 01/12/2020 12:28:42 ******/
-- CREATE DATABASE [SmileITv2]
--  CONTAINMENT = NONE
--  ON  PRIMARY 
-- ( NAME = N'SmileITv2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SmileITv2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
--  LOG ON 
-- ( NAME = N'SmileITv2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SmileITv2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
-- GO

-- ALTER DATABASE [SmileITv2] SET COMPATIBILITY_LEVEL = 140
-- GO

-- IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
-- begin
-- EXEC [SmileITv2].[dbo].[sp_fulltext_database] @action = 'enable'
-- end
-- GO

-- ALTER DATABASE [SmileITv2] SET ANSI_NULL_DEFAULT OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET ANSI_NULLS OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET ANSI_PADDING OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET ANSI_WARNINGS OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET ARITHABORT OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET AUTO_CLOSE OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET AUTO_SHRINK OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET AUTO_UPDATE_STATISTICS ON
-- GO

-- ALTER DATABASE [SmileITv2] SET CURSOR_CLOSE_ON_COMMIT OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET CURSOR_DEFAULT  GLOBAL
-- GO

-- ALTER DATABASE [SmileITv2] SET CONCAT_NULL_YIELDS_NULL OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET NUMERIC_ROUNDABORT OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET QUOTED_IDENTIFIER OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET RECURSIVE_TRIGGERS OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET  DISABLE_BROKER
-- GO

-- ALTER DATABASE [SmileITv2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET DATE_CORRELATION_OPTIMIZATION OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET TRUSTWORTHY OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET ALLOW_SNAPSHOT_ISOLATION OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET PARAMETERIZATION SIMPLE
-- GO

-- ALTER DATABASE [SmileITv2] SET READ_COMMITTED_SNAPSHOT OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET HONOR_BROKER_PRIORITY OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET RECOVERY SIMPLE
-- GO

-- ALTER DATABASE [SmileITv2] SET  MULTI_USER
-- GO

-- ALTER DATABASE [SmileITv2] SET PAGE_VERIFY CHECKSUM
-- GO

-- ALTER DATABASE [SmileITv2] SET DB_CHAINING OFF
-- GO

-- ALTER DATABASE [SmileITv2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
-- GO

-- ALTER DATABASE [SmileITv2] SET TARGET_RECOVERY_TIME = 60 SECONDS
-- GO

-- ALTER DATABASE [SmileITv2] SET DELAYED_DURABILITY = DISABLED
-- GO

-- ALTER DATABASE [SmileITv2] SET QUERY_STORE = OFF
-- GO

-- USE [SmileITv2]
-- GO

-- /****** Object:  UserDefinedFunction [dbo].[SF_Hash_Password]    Script Date: 01/12/2020 12:28:42 ******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- /****** Object:  Table [dbo].[CustomersOpinions]    Script Date: 01/12/2020 12:28:42 ******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- /****** Object:  Table [dbo].[Roles]    Script Date: 01/12/2020 12:28:42 ******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- /****** Object:  Table [dbo].[Smileys]    Script Date: 01/12/2020 12:28:42 ******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- /****** Object:  Table [dbo].[Users]    Script Date: 01/12/2020 12:28:42 ******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- /****** Object:  StoredProcedure [dbo].[SP_AverageCustomerOpinionBetweenTwoDate]    Script Date: 01/12/2020 12:28:42 ******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- /****** Object:  StoredProcedure [dbo].[SP_DeleteCustomerOpinionById]    Script Date: 01/12/2020 12:28:42 ******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- /****** Object:  StoredProcedure [dbo].[SP_Insert_CustomerOpinion]    Script Date: 01/12/2020 12:28:42 ******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- /****** Object:  StoredProcedure [dbo].[SP_CustomerOpinion_Insert_IOT]    Script Date: 01/12/2020 16:19:08 ******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- /****** Object:  StoredProcedure [dbo].[SP_Insert_User]    Script Date: 01/12/2020 12:28:42 ******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- /****** Object:  StoredProcedure [dbo].[SP_ListOfCustomerOpinionBetweenTwoDate]    Script Date: 01/12/2020 12:28:42 ******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- /****** Object:  StoredProcedure [dbo].[SP_Select_UsersWithRoles]    Script Date: 01/12/2020 12:28:42 ******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- /****** Object:  StoredProcedure [dbo].[SP_SelectCustomerOpinionBetweenTwoDate]    Script Date: 01/12/2020 12:28:42 ******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- /****** Object:  StoredProcedure [dbo].[SP_Update_UserEmailByIdUser]    Script Date: 01/12/2020 12:28:42 ******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- /****** Object:  StoredProcedure [dbo].[SP_Update_UserPasswordByIdUser]    Script Date: 01/12/2020 12:28:42 ******/
-- SET ANSI_NULLS ON
-- GO

-- SET QUOTED_IDENTIFIER ON
-- GO

-- USE [master]
-- GO

-- ALTER DATABASE [SmileITv2] SET  READ_WRITE
-- GO

-- USE [master]
-- GO

/****** Object:  Database [SmileIT]    Script Date: 01/12/2020 16:19:08 ******/
CREATE DATABASE [SmileIT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SmileIT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SmileIT_Primary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SmileIT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SmileIT_Primary.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [SmileIT] SET COMPATIBILITY_LEVEL = 140
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmileIT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [SmileIT] SET ANSI_NULL_DEFAULT ON
GO

ALTER DATABASE [SmileIT] SET ANSI_NULLS ON
GO

ALTER DATABASE [SmileIT] SET ANSI_PADDING ON
GO

ALTER DATABASE [SmileIT] SET ANSI_WARNINGS ON
GO

ALTER DATABASE [SmileIT] SET ARITHABORT ON
GO

ALTER DATABASE [SmileIT] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [SmileIT] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [SmileIT] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [SmileIT] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [SmileIT] SET CURSOR_DEFAULT  LOCAL
GO

ALTER DATABASE [SmileIT] SET CONCAT_NULL_YIELDS_NULL ON
GO

ALTER DATABASE [SmileIT] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [SmileIT] SET QUOTED_IDENTIFIER ON
GO

ALTER DATABASE [SmileIT] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [SmileIT] SET  DISABLE_BROKER
GO

ALTER DATABASE [SmileIT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO

ALTER DATABASE [SmileIT] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [SmileIT] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [SmileIT] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [SmileIT] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [SmileIT] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [SmileIT] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [SmileIT] SET RECOVERY FULL
GO

ALTER DATABASE [SmileIT] SET  MULTI_USER
GO

ALTER DATABASE [SmileIT] SET PAGE_VERIFY NONE
GO

ALTER DATABASE [SmileIT] SET DB_CHAINING OFF
GO

ALTER DATABASE [SmileIT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO

ALTER DATABASE [SmileIT] SET TARGET_RECOVERY_TIME = 0 SECONDS
GO

ALTER DATABASE [SmileIT] SET DELAYED_DURABILITY = DISABLED
GO

ALTER DATABASE [SmileIT] SET QUERY_STORE = OFF
GO

USE [SmileIT]
GO

/****** Object:  UserDefinedFunction [dbo].[SF_Hash_Password]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[CustomersOpinions]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Roles]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Smileys]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Users]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SP_CustomerOpinion_DeleteById]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SP_CustomerOpinion_Insert]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO


SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SP_CustomerOpinion_Insert_IOT]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SP_CustomerOpinion_ReadAverageBetweenTwoDate]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SP_CustomerOpinion_ReadListBetweenTwoDate]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SP_User_Delete]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SP_User_Insert]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SP_User_ReadAll]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SP_User_ReadOne]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SP_User_UpdateEmailByIdUser]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SP_User_UpdatePasswordByIdUser]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SP_Users_Check]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SP_Users_Login]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SP_Users_ReadUsersWithRoles]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SP_Users_Update]    Script Date: 01/12/2020 16:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [master]
GO

ALTER DATABASE [SmileIT] SET  READ_WRITE
GO
INSERT INTO Roles (Role_Name,Description) 
	VALUES ('Administrator','Administrator is a Role with all Privileges'),('Public','Public is for everyone, insert an opinion only'),('Employee','Employee is a Role with Read options')

INSERT INTO Smileys ([Label]) 
VALUES ('Très Mauvais'),('Mauvais'),('Moyen'),('Bien'),('Très Bien')

EXEC SP_User_Insert 'sa','sa@mail.com','sa',1
EXEC SP_User_Insert 'public','public@mail.com','public',2


TRUNCATE TABLE CustomersOpinions


EXEC SP_CustomerOpinion_Insert 1,'beurk','1900-01-01 00:00:00'
EXEC SP_CustomerOpinion_Insert 2,'bof','1900-01-02 00:00:00'
EXEC SP_CustomerOpinion_Insert 3,'ok','1900-01-03 00:00:00'
EXEC SP_CustomerOpinion_Insert 4,'sympa','1900-01-04 00:00:00'
EXEC SP_CustomerOpinion_Insert 5,'top','1900-01-05 00:00:00'