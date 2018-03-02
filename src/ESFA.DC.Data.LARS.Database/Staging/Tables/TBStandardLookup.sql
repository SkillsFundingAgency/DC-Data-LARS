CREATE TABLE [Staging].[TBStandardLookup] (
    [StandardNumber]      INT             NOT NULL,
    [StandardDesc]        VARCHAR (255)   NULL,
    [Sector]              VARCHAR (100)   NULL,
    [Status]              VARCHAR (100)   NULL,
    [CoreGovContCap]      DECIMAL (18, 5) NULL,
    [YoungAppIncentive]   DECIMAL (18, 5) NULL,
    [SmallBusIncentive]   DECIMAL (18, 5) NULL,
    [AchIncentive]        DECIMAL (18, 5) NULL,
    [ValuesEffectiveFrom] DATETIME        NOT NULL,
    [ValuesEffectiveTo]   DATETIME        NULL,
    [Created_On]          DATETIME        NULL,
    [Created_By]          VARCHAR (150)   NULL,
    [Modified_On]         DATETIME        NULL,
    [Modified_By]         VARCHAR (150)   NULL,
    CONSTRAINT [PK_TBStandardLookup] PRIMARY KEY CLUSTERED ([StandardNumber] ASC, [ValuesEffectiveFrom] ASC) WITH (FILLFACTOR = 90)
);

