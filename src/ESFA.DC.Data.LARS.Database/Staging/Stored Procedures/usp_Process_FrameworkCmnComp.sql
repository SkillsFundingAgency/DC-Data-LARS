CREATE PROCEDURE [Staging].[usp_Process_FrameworkCmnComp]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_FrameworkCmnComp] AS Target
		USING (
				SELECT   [FworkCode]
					    ,[ProgType]
					    ,[PwayCode]
					    ,[CommonComponent]
					    ,[MinLevel]
					    ,[EffectiveFrom]
					    ,[EffectiveTo]
					    ,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_FrameworkCmnComp]
			  )
			  AS Source 
		   ON Target.[FworkCode] = Source.[FworkCode]
	      AND Target.[ProgType] = Source.[ProgType]	  
		  AND Target.[PwayCode] = Source.[PwayCode]
		  AND Target.[CommonComponent] = Source.[CommonComponent]
		WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							 Target.[EffectiveFrom]
							,Target.[EffectiveTo]
							,Target.[MinLevel]
					EXCEPT 
						SELECT 
							 Source.[EffectiveFrom]
							,Source.[EffectiveTo]
							,Source.[MinLevel]
					)
		  THEN
			UPDATE SET [MinLevel] = Source.[MinLevel]
					  ,[EffectiveFrom] = Source.[EffectiveFrom]
					  ,[EffectiveTo] = Source.[EffectiveTo]					  
					  ,[Modified_By] = Source.[Modified_By]
					  ,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (	   [FworkCode]
					  ,[ProgType]
					  ,[PwayCode]
					  ,[CommonComponent]
					  ,[MinLevel]
					  ,[EffectiveFrom]
					  ,[EffectiveTo]
					  ,[Created_On]
					  ,[Created_By]
					  ,[Modified_On]
					  ,[Modified_By]
					)
			VALUES (	   Source.[FworkCode]
						  ,Source.[ProgType]
						  ,Source.[PwayCode]
						  ,Source.[CommonComponent]
						  ,Source.[MinLevel]
						  ,Source.[EffectiveFrom]
						  ,Source.[EffectiveTo]
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