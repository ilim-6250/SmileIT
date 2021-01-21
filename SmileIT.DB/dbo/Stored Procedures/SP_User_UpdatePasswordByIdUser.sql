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