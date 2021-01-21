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