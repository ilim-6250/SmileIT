CREATE PROCEDURE [dbo].[SP_User_ReadUsersWithRoles]
AS
SELECT U.id_User, U.Username, U.Email, R.Role_Name  
FROM Users U
JOIN Roles R ON U.FK_Role = R.id_Role