CREATE PROCEDURE [dbo].[SP_User_Login]
	@pUsername VARCHAR(50),
	@pPassword VARCHAR(50)
AS
	SELECT [id_User],[Email],[Username],[Password],[FK_Role]
	FROM [dbo].[Users]
	WHERE Username = @pUsername 
		AND [Password] = dbo.SF_Hash_Password(@pPassword)

