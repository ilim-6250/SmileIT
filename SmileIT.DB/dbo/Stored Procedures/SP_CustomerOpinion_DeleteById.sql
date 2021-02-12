CREATE PROCEDURE [dbo].[SP_CustomerOpinion_DeleteById]
	@Id int
AS
BEGIN TRANSACTION
	DELETE FROM CustomersOpinions
	WHERE id_CustomerOpinion = @Id
COMMIT