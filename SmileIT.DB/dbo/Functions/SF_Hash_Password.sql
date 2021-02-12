CREATE FUNCTION [dbo].[SF_Hash_Password]
(
@password NVARCHAR(50)
)

RETURNS VARBINARY(32)
AS
BEGIN
Declare @passwordWithNoise NVARCHAR(MAX)
SET @passwordWithNoise= '@DDm04R'+@password+'N01z*'
RETURN HASHBYTES(N'SHA2_256', @passwordWithNoise)
END