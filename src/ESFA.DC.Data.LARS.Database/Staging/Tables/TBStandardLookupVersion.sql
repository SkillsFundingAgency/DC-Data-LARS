CREATE TABLE [Staging].[TBStandardLookupVersion] (
    [StandardLookupVersion] VARCHAR (50)  NOT NULL,
    [Created_On]            DATETIME      NULL,
    [Created_By]            VARCHAR (150) NULL,
    [Modified_On]           DATETIME      NULL,
    [Modified_By]           VARCHAR (150) NULL,
    CONSTRAINT [PK_Staging_TBStandardLookupVersion] PRIMARY KEY CLUSTERED ([StandardLookupVersion] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT ALTER ON OBJECT::Staging.TBStandardLookupVersion TO [Lars_RW_User];
