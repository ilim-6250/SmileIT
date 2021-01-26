CREATE TABLE [dbo].[CustomersOpinions](
	[id_CustomerOpinion] [int] IDENTITY(1,1) NOT NULL,
	[CustomerReviewDateTime] DATETIME2 NOT NULL,
	[CustomerComment] [varchar](500) NULL,
	[FK_Smiley] [int] NOT NULL,
	[FK_User] [int] NOT NULL,
	[Localisation] [varchar] (200) DEFAULT 'unknown', 
	[CompanyName] [varchar] (200) DEFAULT 'unknown',
 CONSTRAINT [PK_CustomersOpinions] PRIMARY KEY CLUSTERED 
(
	[id_CustomerOpinion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomersOpinions]  WITH CHECK ADD  CONSTRAINT [FK_CustomersOpinions_Smileys] FOREIGN KEY([FK_Smiley])
REFERENCES [dbo].[Smileys] ([id_Smiley])
GO

ALTER TABLE [dbo].[CustomersOpinions] CHECK CONSTRAINT [FK_CustomersOpinions_Smileys]
GO


GO
ALTER TABLE [dbo].[CustomersOpinions]  WITH CHECK ADD  CONSTRAINT [FK_CustomersOpinions_Users] FOREIGN KEY([FK_User])
REFERENCES [dbo].[Users] ([id_User])
GO

ALTER TABLE [dbo].[CustomersOpinions] CHECK CONSTRAINT [FK_CustomersOpinions_Users]
GO

