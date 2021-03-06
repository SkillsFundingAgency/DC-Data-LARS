﻿CREATE TABLE [Core].[LARS_DataGeneration] (
    [DataGeneratedOn] DATETIME      NOT NULL,
    [Description]     VARCHAR (500) NULL,
    [Comment]         VARCHAR (500) NULL,
    [Created_On]      DATETIME      NOT NULL,
    [Created_By]      VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Core_LARS_DataGeneration] PRIMARY KEY CLUSTERED ([DataGeneratedOn] ASC) WITH (FILLFACTOR = 90)
);

