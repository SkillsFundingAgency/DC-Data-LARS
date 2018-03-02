CREATE TABLE [Core].[LARS_FrameworkCmnComp] (
    [FworkCode]       INT           NOT NULL,
    [ProgType]        INT           NOT NULL,
    [PwayCode]        INT           NOT NULL,
    [CommonComponent] INT           NOT NULL,
    [EffectiveFrom]   DATE          NOT NULL,
    [EffectiveTo]     DATE          NULL,
    [MinLevel]        CHAR (1)      NULL,
    [Created_On]      DATETIME      NOT NULL,
    [Created_By]      VARCHAR (100) NOT NULL,
    [Modified_On]     DATETIME      NOT NULL,
    [Modified_By]     VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Core_LARS_FrameworkCmnComp] PRIMARY KEY CLUSTERED ([FworkCode] ASC, [ProgType] ASC, [PwayCode] ASC, [CommonComponent] ASC) WITH (FILLFACTOR = 90),
	CONSTRAINT [FK_CoreFrameworkCmnComp_CoreFramework] FOREIGN KEY ([FworkCode],[ProgType],[PwayCode]) REFERENCES [Core].[LARS_Framework] ([FworkCode],[ProgType],[PwayCode])
);

