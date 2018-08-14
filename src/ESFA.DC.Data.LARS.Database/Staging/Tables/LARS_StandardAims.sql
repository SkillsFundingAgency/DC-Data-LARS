CREATE TABLE [Staging].[LARS_StandardAims] (
    [StandardCode]          INT           NOT NULL,
    [LearnAimRef]           VARCHAR (8)   NOT NULL,
    [EffectiveFrom]         DATE          NOT NULL,
    [EffectiveTo]           DATE          NULL,
    [StandardComponentType] INT           NULL,
    [Created_On]            DATETIME      NOT NULL,
    [Created_By]            VARCHAR (100) NOT NULL,
    [Modified_On]           DATETIME      NOT NULL,
    [Modified_By]           VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Staging_LARS_StandardAims] PRIMARY KEY CLUSTERED ([StandardCode] ASC, [LearnAimRef] ASC, [EffectiveFrom] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT ALTER ON OBJECT::Staging.LARS_StandardAims TO [Lars_RW_User];
