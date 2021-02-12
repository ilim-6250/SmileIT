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