CREATE PROCEDURE [dbo].[SP_CustomerOpinion_ReadListBetweenTwoDate]
--Should not work with string, replace with DATETIME2
	@DateStartString Varchar(30),
	@DateEndString Varchar(30)
AS
DECLARE @DateStart Datetime2 = Convert(datetime2,@DateStartString,103), 
		@DateEnd Datetime2 = Convert(datetime2,@DateEndString,103)
SELECT
	CO.CustomerReviewDateTime,
	S.id_Smiley,
	CO.CustomerComment,
	U.Username
FROM CustomersOpinions CO
JOIN Smileys S on CO.FK_Smiley = S.id_Smiley
JOIN Users U ON CO.FK_User = U.id_User
WHERE CO.CustomerReviewDateTime BETWEEN @DateStart AND @DateEnd 