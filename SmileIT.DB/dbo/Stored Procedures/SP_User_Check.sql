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
