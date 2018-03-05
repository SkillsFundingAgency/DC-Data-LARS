CREATE PROCEDURE [Staging].[usp_Process_Version]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_Version] AS Target
		USING (
				SELECT   [MajorNumber]
					    ,[MinorNumber]
					    ,[MaintenanceNumber]
					    ,[MainDataSchemaName]
					    ,[RefDataSchemaName]
					    ,[ActivationDate]
					    ,[ExpiryDate]
					    ,[Description]
					    ,[Comment]
						,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_Version]
			  )
			  AS Source 
		     ON Target.[MajorNumber] = Source.[MajorNumber]
		    AND Target.[MinorNumber] = Source.[MinorNumber]
		    AND Target.[MaintenanceNumber] = Source.[MaintenanceNumber]
			 
		WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							 Target.[MainDataSchemaName]
							,Target.[RefDataSchemaName]
							,Target.[ActivationDate]
							,Target.[ExpiryDate]
							,Target.[Description]
							,Target.[Comment]
					EXCEPT 
						SELECT 
							 Source.[MainDataSchemaName]
							,Source.[RefDataSchemaName]
							,Source.[ActivationDate]
							,Source.[ExpiryDate]
							,Source.[Description]
							,Source.[Comment]
					)
		  THEN
			UPDATE SET [MainDataSchemaName] = Source.[MainDataSchemaName]
					  ,[RefDataSchemaName] = Source.[RefDataSchemaName]
					  ,[ActivationDate] = Source.[ActivationDate]					  
					  ,[ExpiryDate] = Source.[ExpiryDate]
					  ,[Description] = Source.[Description]
					  ,[Comment] = Source.[Comment]
					  ,[Modified_By] = Source.[Modified_By]
					  ,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
			INSERT (     [MajorNumber]
						,[MinorNumber]
						,[MaintenanceNumber]
					 	,[MainDataSchemaName]
						,[RefDataSchemaName]
						,[ActivationDate]
						,[ExpiryDate]
						,[Description]	
						,[Comment]			  					  
						,[Created_On]				  					  
						,[Created_By]
						,[Modified_On]
						,[Modified_By]
					)
							
			VALUES (	 Source.[MajorNumber]
						,Source.[MinorNumber]
						,Source.[MaintenanceNumber]
						,Source.[MainDataSchemaName]
						,Source.[RefDataSchemaName]
						,Source.[ActivationDate]
						,Source.[ExpiryDate]
						,Source.[Description]
						,Source.[Comment]					
						,Source.[Created_On]
						,Source.[Created_By]
					 	,Source.[Modified_On]
						,Source.[Modified_By]
				  )
		WHEN NOT MATCHED BY SOURCE THEN DELETE
		;

		RETURN 0;

	END TRY
-- 
-------------------------------------------------------------------------------------- 
-- Handle any problems
-------------------------------------------------------------------------------------- 
-- 
	BEGIN CATCH

		DECLARE   @ErrorMessage		NVARCHAR(4000)
				, @ErrorSeverity	INT 
				, @ErrorState		INT
				, @ErrorNumber		INT
						
		SELECT	  @ErrorNumber		= ERROR_NUMBER()
				, @ErrorMessage		= 'Error in :' + ISNULL(OBJECT_NAME(@@PROCID),'') + ' - Error was :' + ERROR_MESSAGE()
				, @ErrorSeverity	= ERROR_SEVERITY()
				, @ErrorState		= ERROR_STATE();
	
		RAISERROR (
					  @ErrorMessage		-- Message text.
					, @ErrorSeverity	-- Severity.
					, @ErrorState		-- State.
				  );
			  
		RETURN @ErrorNumber;

	END CATCH
-- 
-------------------------------------------------------------------------------------- 
-- All done
-------------------------------------------------------------------------------------- 
-- 
END