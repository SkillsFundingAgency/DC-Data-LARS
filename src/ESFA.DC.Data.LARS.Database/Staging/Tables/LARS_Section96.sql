CREATE TABLE [Staging].[LARS_Section96] (
    [LearnAimRef]                VARCHAR (8)   NOT NULL,
    [EffectiveFrom]              DATE          NOT NULL,
    [EffectiveTo]                DATE          NULL,
    [Section96ApprovalStatus]    INT           NULL,
    [Section96ApprovalStartDate] DATE          NULL,
    [Section96ReviewDate]        DATE          NULL,
    [Section96ValidPre16]        INT           NULL,
    [Section96Valid16to18]       INT           NULL,
    [Section96Valid18plus]       INT           NULL,
    [Created_On]                 DATETIME      NOT NULL,
    [Created_By]                 VARCHAR (100) NOT NULL,
    [Modified_On]                DATETIME      NOT NULL,
    [Modified_By]                VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Core_LARS_Section96] PRIMARY KEY CLUSTERED ([LearnAimRef] ASC, [EffectiveFrom] ASC) WITH (FILLFACTOR = 90)
);

