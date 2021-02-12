CREATE PROCEDURE [dbo].[SP_User_ReadOne]
	@pUserId int
AS
SELECT * FROM Users U
JOIN Roles R ON U.FK_Role = R.id_Role
WHERE U.id_User=@pUserId