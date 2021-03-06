﻿CREATE TABLE [Staging].[LARS_StandardPdfLink] (
    [StandardCode]         INT            NOT NULL,
    [StandardPdfURL]       NVARCHAR (MAX) NULL,
    [AssessmentPlanPdfURL] NVARCHAR (MAX) NULL,
    [EffectiveFrom]        DATE           NOT NULL,
    [EffectiveTo]          DATE           NULL,
    [Created_On]           DATETIME       NOT NULL,
    [Created_By]           VARCHAR (100)  NOT NULL,
    [Modified_On]          DATETIME       NOT NULL,
    [Modified_By]          VARCHAR (100)  NOT NULL,
    CONSTRAINT [PK_Staging_LARS_StandardPdfLink] PRIMARY KEY CLUSTERED ([StandardCode] ASC, [EffectiveFrom] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT ALTER ON OBJECT::Staging.LARS_StandardPdfLink TO [Lars_RW_User];
