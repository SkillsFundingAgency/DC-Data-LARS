CREATE TABLE [Core].[LARS_SupersedingFrameworks] (
    [OldFworkCode] INT           NOT NULL,
    [OldProgType]  INT           NOT NULL,
    [OldPwayCode]  INT           NOT NULL,
    [NewFworkCode] INT           NOT NULL,
    [NewProgType]  INT           NOT NULL,
    [NewPwayCode]  INT           NOT NULL,
    [Created_On]   DATETIME      NOT NULL,
    [Created_By]   VARCHAR (100) NOT NULL,
    [Modified_On]  DATETIME      NOT NULL,
    [Modified_By]  VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Core_LARS_SupersedingFrameworks] PRIMARY KEY CLUSTERED ([OldFworkCode] ASC, [OldProgType] ASC, [OldPwayCode] ASC, [NewFworkCode] ASC, [NewProgType] ASC, [NewPwayCode] ASC) WITH (FILLFACTOR = 90)
);

