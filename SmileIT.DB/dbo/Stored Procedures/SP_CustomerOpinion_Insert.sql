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