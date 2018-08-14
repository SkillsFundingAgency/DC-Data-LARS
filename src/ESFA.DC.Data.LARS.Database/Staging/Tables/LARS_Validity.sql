CREATE TABLE [Staging].[LARS_Validity] (
    [LearnAimRef]      VARCHAR (8)   NOT NULL,
    [ValidityCategory] VARCHAR (50)  NOT NULL,
    [StartDate]        DATE          NOT NULL,
    [EndDate]          DATE          NULL,
    [LastNewStartDate] DATE          NULL,
    [Created_On]       DATETIME      NOT NULL,
    [Created_By]       VARCHAR (100) NOT NULL,
    [Modified_On]      DATETIME      NOT NULL,
    [Modified_By]      VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Staging_LARS_Validity] PRIMARY KEY CLUSTERED ([LearnAimRef] ASC, [ValidityCategory] ASC, [StartDate] ASC) WITH (FILLFACTOR = 90)
);

GO
GRANT ALTER ON OBJECT::Staging.LARS_Validity TO [Lars_RW_User];

