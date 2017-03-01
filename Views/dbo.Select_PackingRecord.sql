SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE View [dbo].[Select_PackingRecord]
AS

Select 		PONumber	AS	'PONumber',
		Model	AS	'Model',
		Serial	AS	'Serial',
		BoxNumber	AS	'BoxNumber',
		PackingDateTime	AS	'PackingDateTime',
		PYear	AS	'PYear',
		ID	AS	'ID'

From	PackingRecord
GO