CREATE PROCEDURE [Staging].[usp_Process_StandardMetaData]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_StandardMetaData] AS Target
		USING (
				SELECT   [StandardCode]
					    ,[JobRoles]
					    ,[RoleOverview]
					    ,[Keywords]
					    ,[EntryRequirements]
					    ,[Learning]
					    ,[Qualifications]
					    ,[ProfessionalRegistration]
					    ,[EffectiveFrom]
					    ,[EffectiveTo]
						,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_StandardMetaData]
			  )
			  AS Source 
		   ON Target.[StandardCode] = Source.[StandardCode]
		WHEN MATCHED 
				AND EXISTS 
					(
						SELECT 
							 Target.[JobRoles]
							,Target.[RoleOverview]
							,Target.[Keywords]
							,Target.[EntryRequirements]
							,Target.[Learning]
							,Target.[Qualifications]
							,Target.[ProfessionalRegistration]
							,Target.[EffectiveFrom]
							,Target.[EffectiveTo]							
					EXCEPT 
						SELECT 
							 Source.[JobRoles]
							,Source.[RoleOverview]
							,Source.[Keywords]
							,Source.[EntryRequirements]
							,Source.[Learning]
							,Source.[Qualifications]
							,Source.[ProfessionalRegistration]
							,Source.[EffectiveFrom]
							,Source.[EffectiveTo]	
					)
		  THEN
			UPDATE SET 
					 [RoleOverview] = Source.[RoleOverview]
					,[JobRoles] = Source.[JobRoles]
					,[Keywords] = Source.[Keywords]
					,[EntryRequirements] = Source.[EntryRequirements]
					,[Learning] = Source.[Learning]
					,[Qualifications] = Source.[Qualifications]
					,[ProfessionalRegistration] = Source.[ProfessionalRegistration]
					,[EffectiveFrom] = Source.[EffectiveFrom]
					,[EffectiveTo] = Source.[EffectiveTo]
					
					,[Modified_By] = Source.[Modified_By]
					,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (	     [StandardCode]
						,[JobRoles]
						,[RoleOverview]
						,[Keywords]
						,[EntryRequirements]
						,[Learning]
						,[Qualifications]
						,[ProfessionalRegistration]
						,[EffectiveFrom]
						,[EffectiveTo]
						,[Created_On]
						,[Created_By]
						,[Modified_On]
						,[Modified_By]
					)
			VALUES (     Source.[StandardCode]
						,Source.[JobRoles]
						,Source.[RoleOverview]
						,Source.[Keywords]
						,Source.[EntryRequirements]
						,Source.[Learning]
						,Source.[Qualifications]
						,Source.[ProfessionalRegistration]
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