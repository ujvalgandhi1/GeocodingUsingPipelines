SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[usp_getAddress]
AS
SET NOCOUNT ON

	SELECT id, location_id, address_1, address_2, city, state_province, postal_code, country, [address], latitude, longitude, confidence
	FROM temp.geocodingoutput

	RETURN
GO


