CREATE TABLE [Core].[LARS_FrameworkMetaData] (
    [FworkCode]     INT            NOT NULL,
    [ProgType]      INT            NOT NULL,
    [PwayCode]      INT            NOT NULL,
    [Roles]         NVARCHAR (MAX) NULL,
    [Keywords]      NVARCHAR (MAX) NULL,
    [EffectiveFrom] DATE           NULL,
    [EffectiveTo]   DATE           NULL,
    [Created_On]    DATETIME       DEFAULT (getdate()) NOT NULL,
    [Created_By]    VARCHAR (256)  NOT NULL,
    [Modified_On]   DATETIME       DEFAULT (getdate()) NOT NULL,
    [Modified_By]   VARCHAR (256)  NOT NULL,
    CONSTRAINT [PK_Core_LARS_FrameworkMetaData] PRIMARY KEY CLUSTERED ([FworkCode] ASC, [ProgType] ASC, [PwayCode] ASC),
	CONSTRAINT [FK_Core_LARS_FrameworkMetaData_CoreFramework] FOREIGN KEY ([FworkCode],[ProgType],[PwayCode]) REFERENCES [Core].[LARS_Framework] ([FworkCode],[ProgType],[PwayCode]) ON DELETE CASCADE
);

