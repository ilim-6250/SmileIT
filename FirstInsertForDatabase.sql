
-- Avant de commencer;

--use SmileIT.DB

INSERT INTO Roles (Role_Name,Description) 
	VALUES ('Administrator','Administrator is a Role with all Privileges'),('Public','Public is for everyone, insert an opinion only'),('Employee','Employee is a Role with Read options')

INSERT INTO Smileys ([Label]) 
VALUES ('Très Mauvais'),('Mauvais'),('Moyen'),('Bien'),('Très Bien')

EXEC SP_User_Insert 'sa','sa@mail.com','sa',1
EXEC SP_User_Insert 'public','public@mail.com','public',2


TRUNCATE TABLE CustomersOpinions


EXEC SP_CustomerOpinion_Insert 1,'beurk','1900-01-01 00:00:00'
EXEC SP_CustomerOpinion_Insert 2,'bof','1900-01-02 00:00:00'
EXEC SP_CustomerOpinion_Insert 3,'ok','1900-01-03 00:00:00'
EXEC SP_CustomerOpinion_Insert 4,'sympa','1900-01-04 00:00:00'
EXEC SP_CustomerOpinion_Insert 5,'top','1900-01-05 00:00:00'