CREATE TABLE [Core].[LARS_StandardCommonComponent] (
    [StandardCode]    INT           NOT NULL,
    [CommonComponent] INT           NOT NULL,
    [EffectiveFrom]   DATE          NOT NULL,
    [EffectiveTo]     DATE          NULL,
    [MinLevel]        CHAR (1)      NULL,
    [Created_On]      DATETIME      NOT NULL,
    [Created_By]      VARCHAR (100) NOT NULL,
    [Modified_On]     DATETIME      NOT NULL,
    [Modified_By]     VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Core_LARS_StandardCommonComponent] PRIMARY KEY CLUSTERED ([StandardCode] ASC, [CommonComponent] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_Core_LARS_StandardCommonComponent_CoreStandard] FOREIGN KEY ([StandardCode]) REFERENCES [Core].[LARS_Standard] ([StandardCode]) ON DELETE CASCADE
);

