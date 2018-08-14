CREATE TABLE [Staging].[LARS_SupersedingAims] (
    [OldLearnAimRef] VARCHAR (8)   NOT NULL,
    [NewLearnAimRef] VARCHAR (8)   NOT NULL,
    [Created_On]     DATETIME      NOT NULL,
    [Created_By]     VARCHAR (100) NOT NULL,
    [Modified_On]    DATETIME      NOT NULL,
    [Modified_By]    VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Staging_LARS_SupersedingAims] PRIMARY KEY CLUSTERED ([OldLearnAimRef] ASC, [NewLearnAimRef] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT ALTER ON OBJECT::Staging.LARS_SupersedingAims TO [Lars_RW_User];
