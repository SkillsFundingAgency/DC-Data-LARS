CREATE TABLE [Core].[LARS_Validity] (
    [LearnAimRef]      VARCHAR (8)   NOT NULL,
    [ValidityCategory] VARCHAR (50)  NOT NULL,
    [StartDate]        DATE          NOT NULL,
    [EndDate]          DATE          NULL,
    [LastNewStartDate] DATE          NULL,
    [Created_On]       DATETIME      NOT NULL,
    [Created_By]       VARCHAR (100) NOT NULL,
    [Modified_On]      DATETIME      NOT NULL,
    [Modified_By]      VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Core_LARS_Validity] PRIMARY KEY CLUSTERED ([LearnAimRef] ASC, [ValidityCategory] ASC, [StartDate] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_Core_LARS_Validity_CoreLearningDelivery] FOREIGN KEY ([LearnAimRef]) REFERENCES [Core].[LARS_LearningDelivery] ([LearnAimRef]) ON DELETE CASCADE
);

