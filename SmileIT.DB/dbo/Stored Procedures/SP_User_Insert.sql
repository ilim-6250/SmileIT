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