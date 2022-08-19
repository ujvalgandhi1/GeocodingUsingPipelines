SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE   PROC [temp].[usp_insertAddress]

	@id				INT = NULL,
	@location_id	INT = NULL,
	@address_1		NVARCHAR(100) = NULL,
	@address_2		NVARCHAR(100) = NULL,
	@city			NVARCHAR(100) = NULL,
	@state_province	              NVARCHAR(50) = NULL,
	@postal_code		NVARCHAR(50) = NULL,
	@country		NVARCHAR(50) = NULL,
	@address		NVARCHAR(255) = NULL,
	@latitude			DECIMAL(18, 15) = NULL,
	@longitude		DECIMAL(18, 15) = NULL,
	@confidence		FLOAT

AS

SET NOCOUNT ON

	INSERT INTO temp.geocodingoutput(id, location_id, address_1, address_2, city, state_province, postal_code, country, [address], latitude, longitude, confidence )
	VALUES (@id, @location_id, @address_1, @address_2, @city, @state_province, @postal_code, @country, @address, @latitude, @longitude, @confidence )

	RETURN
GO


