CREATE PROCEDURE [dbo].[SP_CustomerOpinion_insert_IOT]
	
	 
	@idSmiley INT,  
	@pTimestamp  DATETIME2,
	@pCompanyName Varchar (200),
	@pDevEUI Varchar (200),
	@pThingName Varchar (200),
	@pContainer Varchar (200),
	@pLocationFriendlyName1 Varchar (200)
	
	--2 is UserID of public, can add a parameter if users want to make CustomersOpinions
AS 
BEGIN
	BEGIN TRANSACTION 
		Insert into CustomersOpinions (CustomerReviewDateTime,FK_Smiley,FK_User,CompanyName,DevEUI,ThingName,Container,LocationFriendlyName1)
		OUTPUT Inserted.id_CustomerOpinion
		VALUES (@pTimestamp ,@idSmiley,2,@pCompanyName,@pDevEUI,@pThingName,@pContainer,@pLocationFriendlyName1);
	COMMIT
END

----Exemple to Execute Procedure:
--exec SP_Insert_CustomerOpinion 1,'Trop salé, trop cuit. Il n''y a pas d''émotion !',2;