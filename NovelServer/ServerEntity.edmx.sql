
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/14/2016 23:41:17
-- Generated from EDMX file: D:\Dev\Project\CS\NovelServer\NovelServer\NovelServer\ServerEntity.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ServerEntity];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AuthorNovel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Novels] DROP CONSTRAINT [FK_AuthorNovel];
GO
IF OBJECT_ID(N'[dbo].[FK_NovelChapters]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Chapters] DROP CONSTRAINT [FK_NovelChapters];
GO
IF OBJECT_ID(N'[dbo].[FK_NovelSources]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sources] DROP CONSTRAINT [FK_NovelSources];
GO
IF OBJECT_ID(N'[dbo].[FK_ReadingListNovels_ReadingList]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReadingListNovels] DROP CONSTRAINT [FK_ReadingListNovels_ReadingList];
GO
IF OBJECT_ID(N'[dbo].[FK_ReadingListNovels_Novel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReadingListNovels] DROP CONSTRAINT [FK_ReadingListNovels_Novel];
GO
IF OBJECT_ID(N'[dbo].[FK_ChapterWebURL]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WebURLs] DROP CONSTRAINT [FK_ChapterWebURL];
GO
IF OBJECT_ID(N'[dbo].[FK_SourceWebURL]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WebURLs] DROP CONSTRAINT [FK_SourceWebURL];
GO
IF OBJECT_ID(N'[dbo].[FK_UserReadingList]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReadingLists] DROP CONSTRAINT [FK_UserReadingList];
GO
IF OBJECT_ID(N'[dbo].[FK_UserHistory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Histories] DROP CONSTRAINT [FK_UserHistory];
GO
IF OBJECT_ID(N'[dbo].[FK_NovelHistory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Histories] DROP CONSTRAINT [FK_NovelHistory];
GO
IF OBJECT_ID(N'[dbo].[FK_ChapterHistory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Histories] DROP CONSTRAINT [FK_ChapterHistory];
GO
IF OBJECT_ID(N'[dbo].[FK_NovelReadingList]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReadingLists] DROP CONSTRAINT [FK_NovelReadingList];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Novels]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Novels];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Chapters]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Chapters];
GO
IF OBJECT_ID(N'[dbo].[Sources]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Sources];
GO
IF OBJECT_ID(N'[dbo].[WebURLs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WebURLs];
GO
IF OBJECT_ID(N'[dbo].[Authors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Authors];
GO
IF OBJECT_ID(N'[dbo].[Histories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Histories];
GO
IF OBJECT_ID(N'[dbo].[ReadingLists]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ReadingLists];
GO
IF OBJECT_ID(N'[dbo].[ReadingListNovels]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ReadingListNovels];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Novels'
CREATE TABLE [dbo].[Novels] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [AuthorId] int  NOT NULL,
    [NovelName] nvarchar(max)  NOT NULL,
    [Status] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserEmail] nvarchar(max)  NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [UserPasswordHash] int  NOT NULL,
    [UserPrivilege] nvarchar(max)  NOT NULL,
    [UserGroup] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Chapters'
CREATE TABLE [dbo].[Chapters] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NovelId] int  NOT NULL,
    [ChapterName] nvarchar(max)  NOT NULL,
    [ChapterIndex] int  NOT NULL
);
GO

-- Creating table 'Sources'
CREATE TABLE [dbo].[Sources] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NovelId] int  NOT NULL,
    [SourceName] nvarchar(max)  NOT NULL,
    [SourcePriority] int  NOT NULL
);
GO

-- Creating table 'WebURLs'
CREATE TABLE [dbo].[WebURLs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SourceId] int  NOT NULL,
    [ChapterId] int  NOT NULL,
    [Url] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Authors'
CREATE TABLE [dbo].[Authors] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [AuthorName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Histories'
CREATE TABLE [dbo].[Histories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [NovelId] int  NOT NULL,
    [ChapterId] int  NOT NULL,
    [ReadTime] datetime  NOT NULL,
    [Hidden] bit  NOT NULL
);
GO

-- Creating table 'ReadingLists'
CREATE TABLE [dbo].[ReadingLists] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [NovelId] int  NOT NULL,
    [Position] int  NOT NULL
);
GO

-- Creating table 'ReadingListNovels'
CREATE TABLE [dbo].[ReadingListNovels] (
    [ReadingListNovels_Novel_Id] int  NOT NULL,
    [ReadingListNovels_ReadingList_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Novels'
ALTER TABLE [dbo].[Novels]
ADD CONSTRAINT [PK_Novels]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Chapters'
ALTER TABLE [dbo].[Chapters]
ADD CONSTRAINT [PK_Chapters]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Sources'
ALTER TABLE [dbo].[Sources]
ADD CONSTRAINT [PK_Sources]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'WebURLs'
ALTER TABLE [dbo].[WebURLs]
ADD CONSTRAINT [PK_WebURLs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Authors'
ALTER TABLE [dbo].[Authors]
ADD CONSTRAINT [PK_Authors]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Histories'
ALTER TABLE [dbo].[Histories]
ADD CONSTRAINT [PK_Histories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ReadingLists'
ALTER TABLE [dbo].[ReadingLists]
ADD CONSTRAINT [PK_ReadingLists]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ReadingListNovels_Novel_Id], [ReadingListNovels_ReadingList_Id] in table 'ReadingListNovels'
ALTER TABLE [dbo].[ReadingListNovels]
ADD CONSTRAINT [PK_ReadingListNovels]
    PRIMARY KEY CLUSTERED ([ReadingListNovels_Novel_Id], [ReadingListNovels_ReadingList_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AuthorId] in table 'Novels'
ALTER TABLE [dbo].[Novels]
ADD CONSTRAINT [FK_AuthorNovel]
    FOREIGN KEY ([AuthorId])
    REFERENCES [dbo].[Authors]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AuthorNovel'
CREATE INDEX [IX_FK_AuthorNovel]
ON [dbo].[Novels]
    ([AuthorId]);
GO

-- Creating foreign key on [NovelId] in table 'Chapters'
ALTER TABLE [dbo].[Chapters]
ADD CONSTRAINT [FK_NovelChapters]
    FOREIGN KEY ([NovelId])
    REFERENCES [dbo].[Novels]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NovelChapters'
CREATE INDEX [IX_FK_NovelChapters]
ON [dbo].[Chapters]
    ([NovelId]);
GO

-- Creating foreign key on [NovelId] in table 'Sources'
ALTER TABLE [dbo].[Sources]
ADD CONSTRAINT [FK_NovelSources]
    FOREIGN KEY ([NovelId])
    REFERENCES [dbo].[Novels]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NovelSources'
CREATE INDEX [IX_FK_NovelSources]
ON [dbo].[Sources]
    ([NovelId]);
GO

-- Creating foreign key on [ReadingListNovels_Novel_Id] in table 'ReadingListNovels'
ALTER TABLE [dbo].[ReadingListNovels]
ADD CONSTRAINT [FK_ReadingListNovels_ReadingList]
    FOREIGN KEY ([ReadingListNovels_Novel_Id])
    REFERENCES [dbo].[ReadingLists]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ReadingListNovels_ReadingList_Id] in table 'ReadingListNovels'
ALTER TABLE [dbo].[ReadingListNovels]
ADD CONSTRAINT [FK_ReadingListNovels_Novel]
    FOREIGN KEY ([ReadingListNovels_ReadingList_Id])
    REFERENCES [dbo].[Novels]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReadingListNovels_Novel'
CREATE INDEX [IX_FK_ReadingListNovels_Novel]
ON [dbo].[ReadingListNovels]
    ([ReadingListNovels_ReadingList_Id]);
GO

-- Creating foreign key on [ChapterId] in table 'WebURLs'
ALTER TABLE [dbo].[WebURLs]
ADD CONSTRAINT [FK_ChapterWebURL]
    FOREIGN KEY ([ChapterId])
    REFERENCES [dbo].[Chapters]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ChapterWebURL'
CREATE INDEX [IX_FK_ChapterWebURL]
ON [dbo].[WebURLs]
    ([ChapterId]);
GO

-- Creating foreign key on [SourceId] in table 'WebURLs'
ALTER TABLE [dbo].[WebURLs]
ADD CONSTRAINT [FK_SourceWebURL]
    FOREIGN KEY ([SourceId])
    REFERENCES [dbo].[Sources]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SourceWebURL'
CREATE INDEX [IX_FK_SourceWebURL]
ON [dbo].[WebURLs]
    ([SourceId]);
GO

-- Creating foreign key on [UserId] in table 'ReadingLists'
ALTER TABLE [dbo].[ReadingLists]
ADD CONSTRAINT [FK_UserReadingList]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserReadingList'
CREATE INDEX [IX_FK_UserReadingList]
ON [dbo].[ReadingLists]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'Histories'
ALTER TABLE [dbo].[Histories]
ADD CONSTRAINT [FK_UserHistory]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserHistory'
CREATE INDEX [IX_FK_UserHistory]
ON [dbo].[Histories]
    ([UserId]);
GO

-- Creating foreign key on [NovelId] in table 'Histories'
ALTER TABLE [dbo].[Histories]
ADD CONSTRAINT [FK_NovelHistory]
    FOREIGN KEY ([NovelId])
    REFERENCES [dbo].[Novels]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NovelHistory'
CREATE INDEX [IX_FK_NovelHistory]
ON [dbo].[Histories]
    ([NovelId]);
GO

-- Creating foreign key on [ChapterId] in table 'Histories'
ALTER TABLE [dbo].[Histories]
ADD CONSTRAINT [FK_ChapterHistory]
    FOREIGN KEY ([ChapterId])
    REFERENCES [dbo].[Chapters]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ChapterHistory'
CREATE INDEX [IX_FK_ChapterHistory]
ON [dbo].[Histories]
    ([ChapterId]);
GO

-- Creating foreign key on [NovelId] in table 'ReadingLists'
ALTER TABLE [dbo].[ReadingLists]
ADD CONSTRAINT [FK_NovelReadingList]
    FOREIGN KEY ([NovelId])
    REFERENCES [dbo].[Novels]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NovelReadingList'
CREATE INDEX [IX_FK_NovelReadingList]
ON [dbo].[ReadingLists]
    ([NovelId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------