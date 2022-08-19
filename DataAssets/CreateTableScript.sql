SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [temp].[geocodingoutput](
	[id] [int] NOT NULL,
	[location_id] [int] NOT NULL,
	[address_1] [nvarchar](100) NULL,
	[address_2] [nvarchar](100) NULL,
	[city] [nvarchar](100) NULL,
	[state_province] [nvarchar](50) NULL,
	[postal_code] [nvarchar](50) NULL,
	[country] [nvarchar](50) NULL,
	[address] [nvarchar](255) NULL,
	[latitude] [decimal](18, 15) NULL,
	[longitude] [decimal](18, 15) NULL,
	[confidence] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


