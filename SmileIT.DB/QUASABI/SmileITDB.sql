USE [master]
GO
/****** Object:  Database [SmileIT]    Script Date: 11-02-21 15:10:54 ******/
CREATE DATABASE [SmileIT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SmileIT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER03\MSSQL\DATA\SmileIT_Primary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SmileIT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER03\MSSQL\DATA\SmileIT_Primary.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SmileIT] SET COMPATIBILITY_LEVEL = 150
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
ALTER DATABASE [SmileIT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SmileIT', N'ON'
GO
ALTER DATABASE [SmileIT] SET QUERY_STORE = OFF
GO
USE [SmileIT]
GO
/****** Object:  UserDefinedFunction [dbo].[SF_Hash_Password]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SF_Hash_Password]
(
@password NVARCHAR(50)
)

RETURNS VARBINARY(32)
AS
BEGIN
Declare @passwordWithNoise NVARCHAR(MAX)
SET @passwordWithNoise= '@DDm04R'+@password+'N01z*'
RETURN HASHBYTES(N'SHA2_256', @passwordWithNoise)
END
GO
/****** Object:  Table [dbo].[CustomersOpinions]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomersOpinions](
	[id_CustomerOpinion] [int] IDENTITY(1,1) NOT NULL,
	[CustomerReviewDateTime] [datetime2](7) NOT NULL,
	[CustomerComment] [varchar](500) NULL,
	[FK_Smiley] [int] NOT NULL,
	[FK_User] [int] NOT NULL,
	[CompanyName] [varchar](200) NULL,
	[DevEUI] [varchar](200) NULL,
	[ThingName] [varchar](200) NULL,
	[Container] [varchar](200) NULL,
	[LocationFriendlyName1] [varchar](200) NULL,
 CONSTRAINT [PK_CustomersOpinions] PRIMARY KEY CLUSTERED 
(
	[id_CustomerOpinion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id_Role] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [varchar](50) NOT NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[id_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Smileys]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Smileys](
	[id_Smiley] [int] IDENTITY(1,1) NOT NULL,
	[Label] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Smileys] PRIMARY KEY CLUSTERED 
(
	[id_Smiley] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id_User] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Email] [varchar](150) NULL,
	[FK_Role] [int] NOT NULL,
	[Password] [varbinary](32) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomersOpinions] ADD  DEFAULT ('unknown') FOR [CompanyName]
GO
ALTER TABLE [dbo].[CustomersOpinions] ADD  DEFAULT ('unknown') FOR [DevEUI]
GO
ALTER TABLE [dbo].[CustomersOpinions] ADD  DEFAULT ('unknown') FOR [ThingName]
GO
ALTER TABLE [dbo].[CustomersOpinions] ADD  DEFAULT ('unknown') FOR [Container]
GO
ALTER TABLE [dbo].[CustomersOpinions] ADD  DEFAULT ('unknown') FOR [LocationFriendlyName1]
GO
ALTER TABLE [dbo].[CustomersOpinions]  WITH CHECK ADD  CONSTRAINT [FK_CustomersOpinions_Smileys] FOREIGN KEY([FK_Smiley])
REFERENCES [dbo].[Smileys] ([id_Smiley])
GO
ALTER TABLE [dbo].[CustomersOpinions] CHECK CONSTRAINT [FK_CustomersOpinions_Smileys]
GO
ALTER TABLE [dbo].[CustomersOpinions]  WITH CHECK ADD  CONSTRAINT [FK_CustomersOpinions_Users] FOREIGN KEY([FK_User])
REFERENCES [dbo].[Users] ([id_User])
GO
ALTER TABLE [dbo].[CustomersOpinions] CHECK CONSTRAINT [FK_CustomersOpinions_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([FK_Role])
REFERENCES [dbo].[Roles] ([id_Role])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[SP_CustomerOpinion_DeleteById]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CustomerOpinion_DeleteById]
	@Id int
AS
BEGIN TRANSACTION
	DELETE FROM CustomersOpinions
	WHERE id_CustomerOpinion = @Id
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SP_CustomerOpinion_Insert]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CustomerOpinion_Insert] 
	@idSmiley INT, 
	@Comment Varchar(500), 
	@pCreated_at DATETIME2
	--2 is UserID of public, can add a parameter if users want to make CustomersOpinions
AS 
BEGIN
	BEGIN TRANSACTION 
		Insert into CustomersOpinions (CustomerReviewDateTime,FK_Smiley,CustomerComment,FK_User)
		OUTPUT Inserted.id_CustomerOpinion
		VALUES (@pCreated_at,@idSmiley,@Comment,2);
	COMMIT
END

----Exemple to Execute Procedure:
--exec SP_Insert_CustomerOpinion 1,'Trop salé, trop cuit. Il n''y a pas d''émotion !',2;
GO
/****** Object:  StoredProcedure [dbo].[SP_CustomerOpinion_insert_IOT]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CustomerOpinion_insert_IOT]
	
	 
	@idSmiley INT,  
	@pTimestamp  DATETIME2,
	@pCompanyName Varchar (200),
	@pDevEUI Varchar (200),
	@pThingName Varchar (200),
	@pContainer Varchar (200),
	@pLocationFriendlyName1 Varchar (200)
	
	--2 is UserID of public, can add a parameter if users want to make CustomersOpinions
AS 
BEGIN
	BEGIN TRANSACTION 
		Insert into CustomersOpinions (CustomerReviewDateTime,FK_Smiley,FK_User,CompanyName,DevEUI,ThingName,Container,LocationFriendlyName1)
		OUTPUT Inserted.id_CustomerOpinion
		VALUES (@pTimestamp ,@idSmiley,2,@pCompanyName,@pDevEUI,@pThingName,@pContainer,@pLocationFriendlyName1);
	COMMIT
END

----Exemple to Execute Procedure:
--exec SP_Insert_CustomerOpinion 1,'Trop salé, trop cuit. Il n''y a pas d''émotion !',2;
GO
/****** Object:  StoredProcedure [dbo].[SP_CustomerOpinion_ReadAverageBetweenTwoDate]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CustomerOpinion_ReadAverageBetweenTwoDate]
--Should not work with string, replace with DATETIME2
	@DateStartString Varchar(30), 
	@DateEndString Varchar(30)
AS


DECLARE @DateStart Datetime2 = Convert(datetime2,@DateStartString,103),
	@DateEnd Datetime2 = Convert(datetime2,@DateEndString,103),
	@CountOfSmileyType INT,
	@SumOfVote INT

SET @CountOfSmileyType = (SELECT COUNT(DISTINCT S.Label)
	FROM CustomersOpinions CO
	JOIN Smileys S on CO.FK_Smiley = S.id_Smiley
	WHERE CO.CustomerReviewDateTime Between @DateStart and @DateEnd)
	SET @SumOfVote = (SELECT COUNT(*) FROM CustomersOpinions CO
	WHERE CO.CustomerReviewDateTime Between @DateStart and @DateEnd);

SELECT
	S.id_Smiley 'Smiley Type',
	COUNT(*) 'Number de Votes',
	ROUND(CONVERT(float,COUNT(*))/@SumOfVote*100,2) 'Percentage'
	FROM CustomersOpinions CO
	JOIN Smileys S on CO.FK_Smiley = S.id_Smiley
	WHERE CO.CustomerReviewDateTime Between @DateStart and @DateEnd
	GROUP BY S.Label, S.id_Smiley
	ORDER BY S.id_Smiley desc
GO
/****** Object:  StoredProcedure [dbo].[SP_CustomerOpinion_ReadListBetweenTwoDate]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CustomerOpinion_ReadListBetweenTwoDate]
--Should not work with string, replace with DATETIME2
	@DateStartString Varchar(30),
	@DateEndString Varchar(30)
AS
DECLARE @DateStart Datetime2 = Convert(datetime2,@DateStartString,103), 
		@DateEnd Datetime2 = Convert(datetime2,@DateEndString,103)
SELECT
	CO.CustomerReviewDateTime,
	S.id_Smiley,
	CO.CustomerComment,
	U.Username
FROM CustomersOpinions CO
JOIN Smileys S on CO.FK_Smiley = S.id_Smiley
JOIN Users U ON CO.FK_User = U.id_User
WHERE CO.CustomerReviewDateTime BETWEEN @DateStart AND @DateEnd
GO
/****** Object:  StoredProcedure [dbo].[SP_CustomerOpinion_Update]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CustomerOpinion_Update]
	@pCustomerComment Varchar(500), 
	@pId int,
	@pFK_Smiley int,
	--@pFK_User int
	@pCreated_at DATETIME2

AS
BEGIN TRANSACTION
	BEGIN
		UPDATE CustomersOpinions 
		SET 
		CustomerComment = @pCustomerComment,
		FK_Smiley = @pFK_Smiley,
		CustomerReviewDateTime = @pCreated_at
		--FK_User = @pFK_User     --no need at the moment

		WHERE id_CustomerOpinion = @pId
	END
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SP_User_Check]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_User_Check]
	@pUsername VARCHAR(50),
	@pPassword VARCHAR(50),
	@pIsOK BIT OUTPUT
AS
BEGIN TRANSACTION
	BEGIN
	SET @pIsOK=0;
	IF EXISTS(
	SELECT id_User
	FROM [dbo].[Users]
	WHERE Username = @pUsername
	AND [Password]=[dbo].SF_Hash_Password(@pPassword))
	SET @pIsOK=1;
	END
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SP_User_Delete]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_User_Delete]
	@pUserId int
AS
BEGIN TRANSACTION
	DELETE FROM Users
	WHERE id_User = @pUserId
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SP_User_Insert]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_User_Insert] 
		@pUsername varchar(50),
		@pEmail varchar(150),
		@pPassword varchar(50),
		@pFK_Role int
AS
BEGIN TRANSACTION
	INSERT INTO Users ([Username],Email,[Password],FK_Role) 
		OUTPUT Inserted.id_User
	VALUES (@pUsername,@pEmail,dbo.SF_Hash_Password(@pPassword),@pFK_Role)
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SP_User_Login]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_User_Login]
	@pUsername VARCHAR(50),
	@pPassword VARCHAR(50)
AS
	SELECT [id_User],[Email],[Username],[Password],[FK_Role]
	FROM [dbo].[Users]
	WHERE Username = @pUsername 
		AND [Password] = dbo.SF_Hash_Password(@pPassword)
GO
/****** Object:  StoredProcedure [dbo].[SP_User_ReadAll]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_User_ReadAll]
AS
SELECT *
FROM Users U
JOIN Roles R ON U.FK_Role = R.id_Role
GO
/****** Object:  StoredProcedure [dbo].[SP_User_ReadOne]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_User_ReadOne]
	@pUserId int
AS
SELECT * FROM Users U
JOIN Roles R ON U.FK_Role = R.id_Role
WHERE U.id_User=@pUserId
GO
/****** Object:  StoredProcedure [dbo].[SP_User_ReadUsersWithRoles]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_User_ReadUsersWithRoles]
AS
SELECT U.id_User, U.Username, U.Email, R.Role_Name  
FROM Users U
JOIN Roles R ON U.FK_Role = R.id_Role
GO
/****** Object:  StoredProcedure [dbo].[SP_User_Update]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_User_Update]
	@pEmail Varchar(150), 
	@pUserId int,
	@pUsername VARCHAR(50),
	@pPassword VARCHAR(50),
	@pRole int

AS
BEGIN TRANSACTION
	BEGIN
		UPDATE Users 
		SET 
		Email = @pEmail,
		Username = @pUsername,
		[Password] = dbo.SF_Hash_Password(@pPassword),
		[FK_Role] = @pRole

		WHERE id_User = @pUserId
	END
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SP_User_UpdateEmailByIdUser]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_User_UpdateEmailByIdUser] 
	@pEmail Varchar(150), 
	@pUserId int
AS
BEGIN TRANSACTION
IF (@pEmail is Null OR @pEmail = '')
	BEGIN
		Print 'the new email is empty'
	END
ELSE
	BEGIN
		UPDATE Users 
		SET Email = @pEmail
		WHERE id_User = @pUserId
	END
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[SP_User_UpdatePasswordByIdUser]    Script Date: 11-02-21 15:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_User_UpdatePasswordByIdUser] 
	@pPassword Varchar(50), 
	@pUserId int
AS
BEGIN TRANSACTION
IF (@pPassword is Null OR @pPassword = '')
	BEGIN
		Print 'the new password is empty'
	END
ELSE
	BEGIN
		UPDATE Users 
		SET [Password] = dbo.SF_Hash_Password(@pPassword)
		WHERE id_User = @pUserId
	END
COMMIT
GO
USE [master]
GO
ALTER DATABASE [SmileIT] SET  READ_WRITE 
GO
