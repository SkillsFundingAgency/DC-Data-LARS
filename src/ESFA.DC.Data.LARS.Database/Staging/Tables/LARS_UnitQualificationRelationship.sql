CREATE TABLE [Staging].[LARS_UnitQualificationRelationship] (
    [UnitLearnAimRef]          VARCHAR (8)   NOT NULL,
    [QualificationLearnAimRef] VARCHAR (8)   NOT NULL,
    [EffectiveFrom]            DATE          NOT NULL,
    [EffectiveTo]              DATE          NULL,
    [Created_On]               DATETIME      NOT NULL,
    [Created_By]               VARCHAR (100) NOT NULL,
    [Modified_On]              DATETIME      NOT NULL,
    [Modified_By]              VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Staging_LARS_UnitQualificationRelationship] PRIMARY KEY CLUSTERED ([UnitLearnAimRef] ASC, [QualificationLearnAimRef] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT ALTER ON OBJECT::Staging.LARS_UnitQualificationRelationship TO [Lars_RW_User];
