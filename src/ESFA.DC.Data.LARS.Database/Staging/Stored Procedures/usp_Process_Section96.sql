CREATE PROCEDURE [Staging].[usp_Process_Section96]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_Section96] AS Target
		USING (
				SELECT   [LearnAimRef]
					    ,[EffectiveFrom]
					    ,[EffectiveTo]
					    ,[Section96ApprovalStatus]
					    ,[Section96ApprovalStartDate]
					    ,[Section96ReviewDate]
					    ,[Section96ValidPre16]
					    ,[Section96Valid16to18]
					    ,[Section96Valid18plus]
						,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_Section96]
			  )
			  AS Source 
		   ON Target.[LearnAimRef] = Source.[LearnAimRef]
	      AND Target.[EffectiveFrom] = Source.[EffectiveFrom]	
			WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							 Target.[EffectiveTo]
							,Target.[Section96ApprovalStatus]
							,Target.[Section96ApprovalStartDate]
							,Target.[Section96ReviewDate]
							,Target.[Section96ValidPre16]
							,Target.[Section96Valid16to18]
							,Target.[Section96Valid18plus]					
					EXCEPT 
						SELECT 
							 Source.[EffectiveTo]
							,Source.[Section96ApprovalStatus]
							,Source.[Section96ApprovalStartDate]
							,Source.[Section96ReviewDate]
							,Source.[Section96ValidPre16]
							,Source.[Section96Valid16to18]
							,Source.[Section96Valid18plus]
					)
		  THEN
			UPDATE SET   [EffectiveTo] = Source.[EffectiveTo]
						,[Section96ApprovalStatus] = Source.[Section96ApprovalStatus]
						,[Section96ApprovalStartDate] = Source.[Section96ApprovalStartDate]
						,[Section96ReviewDate] = Source.[Section96ReviewDate]
						,[Section96ValidPre16] = Source.[Section96ValidPre16]
						,[Section96Valid16to18] = Source.[Section96Valid16to18]
						,[Section96Valid18plus] = Source.[Section96Valid18plus]
						,[Modified_By] = Source.[Modified_By]
						,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (     [LearnAimRef]
					,[EffectiveFrom]
					,[EffectiveTo]
					,[Section96ApprovalStatus]
					,[Section96ApprovalStartDate]
					,[Section96ReviewDate]
					,[Section96ValidPre16]
					,[Section96Valid16to18]
					,[Section96Valid18plus]		
					,[Created_On]
					,[Created_By]
					,[Modified_On]
					,[Modified_By]
					)
			VALUES ( Source.[LearnAimRef]
					,Source.[EffectiveFrom]
					,Source.[EffectiveTo]
					,Source.[Section96ApprovalStatus]
					,Source.[Section96ApprovalStartDate]
					,Source.[Section96ReviewDate]
					,Source.[Section96ValidPre16]
					,Source.[Section96Valid16to18]
					,Source.[Section96Valid18plus]	
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