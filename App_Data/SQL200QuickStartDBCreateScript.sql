SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Competitors]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tbcqsCompetitors](
	[CompetitorId] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Url] [nvarchar](250) NULL,
	[Seed] [nvarchar](5) NULL,
 CONSTRAINT [PK_Competitors] PRIMARY KEY CLUSTERED 
(
	[CompetitorId] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Results]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tbcqsResults](
	[MatchupId] [nvarchar](50) NOT NULL,
	[WinningCompetitorId] [nvarchar](50) NOT NULL,
	[RoundId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Results] PRIMARY KEY CLUSTERED 
(
	[MatchupId] ASC,
	[WinningCompetitorId] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
