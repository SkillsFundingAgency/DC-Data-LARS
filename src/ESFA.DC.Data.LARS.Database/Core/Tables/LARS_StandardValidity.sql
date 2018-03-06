CREATE TABLE [Core].[LARS_StandardValidity] (
    [StandardCode]     INT           NOT NULL,
    [ValidityCategory] VARCHAR (50)  NOT NULL,
    [StartDate]        DATE          NOT NULL,
    [LastNewStartDate] DATE          NULL,
    [EndDate]          DATE          NULL,
    [Created_On]       DATETIME      NOT NULL,
    [Created_By]       VARCHAR (100) NOT NULL,
    [Modified_On]      DATETIME      NOT NULL,
    [Modified_By]      VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Core_LARS_StandardValidity] PRIMARY KEY CLUSTERED ([StandardCode] ASC, [ValidityCategory] ASC, [StartDate] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_CoreStandardValidity_CoreStandard] FOREIGN KEY ([StandardCode]) REFERENCES [Core].[LARS_Standard] ([StandardCode])
);

