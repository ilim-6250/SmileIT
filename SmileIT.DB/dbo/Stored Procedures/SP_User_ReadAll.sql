CREATE PROCEDURE [dbo].[SP_User_ReadAll]
AS
SELECT *
FROM Users U
JOIN Roles R ON U.FK_Role = R.id_Role