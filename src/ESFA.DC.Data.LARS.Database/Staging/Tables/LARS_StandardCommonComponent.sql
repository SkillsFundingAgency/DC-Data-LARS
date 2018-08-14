CREATE TABLE [Staging].[LARS_StandardCommonComponent] (
    [StandardCode]    INT           NOT NULL,
    [CommonComponent] INT           NOT NULL,
    [EffectiveFrom]   DATE          NOT NULL,
    [EffectiveTo]     DATE          NULL,
    [MinLevel]        CHAR (1)      NULL,
    [Created_On]      DATETIME      NOT NULL,
    [Created_By]      VARCHAR (100) NOT NULL,
    [Modified_On]     DATETIME      NOT NULL,
    [Modified_By]     VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Staging_LARS_StandardCommonComponent] PRIMARY KEY CLUSTERED ([StandardCode] ASC, [CommonComponent] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT ALTER ON OBJECT::Staging.LARS_StandardCommonComponent TO [Lars_RW_User];
