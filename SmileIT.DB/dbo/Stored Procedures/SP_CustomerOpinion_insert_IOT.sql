CREATE PROCEDURE [dbo].[SP_CustomerOpinion_insert_IOT]
	
	 
	@idSmiley INT,  
	@pCreated_at DATETIME2,
	@pLocalisation Varchar (200),
	@pCompanyName Varchar (200)

	--2 is UserID of public, can add a parameter if users want to make CustomersOpinions
AS 
BEGIN
	BEGIN TRANSACTION 
		Insert into CustomersOpinions (CustomerReviewDateTime,FK_Smiley,FK_User,Localisation,CompanyName)
		OUTPUT Inserted.id_CustomerOpinion
		VALUES (@pCreated_at,@idSmiley,2,@pLocalisation,@pCompanyName);
	COMMIT
END

----Exemple to Execute Procedure:
--exec SP_Insert_CustomerOpinion 1,'Trop salé, trop cuit. Il n''y a pas d''émotion !',2;