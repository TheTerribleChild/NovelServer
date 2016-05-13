
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/12/2016 23:23:30
-- Generated from EDMX file: D:\Dev\Project\CS\NovelServer\NovelServer\NovelServer\ServerDatabase.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [NovelSever];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Novels'
CREATE TABLE [dbo].[Novels] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NovelName] nvarchar(max)  NOT NULL,
    [AuthorId] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserEmail] nvarchar(max)  NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [UserPasswordHash] int  NOT NULL,
    [UserPrivilege] nvarchar(max)  NOT NULL,
    [History_Id] int  NOT NULL
);
GO

-- Creating table 'Chapters'
CREATE TABLE [dbo].[Chapters] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ChapterName] nvarchar(max)  NOT NULL,
    [ChapterIndex] int  NOT NULL,
    [NovelId] int  NOT NULL
);
GO

-- Creating table 'Sources'
CREATE TABLE [dbo].[Sources] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SourceName] nvarchar(max)  NOT NULL,
    [SourcePriority] int  NOT NULL,
    [NovelId] int  NOT NULL
);
GO

-- Creating table 'WebURLs'
CREATE TABLE [dbo].[WebURLs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Url] nvarchar(max)  NOT NULL,
    [ChapterId] int  NOT NULL,
    [SourceId] int  NOT NULL
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
    [ReadTime] datetime  NOT NULL,
    [Hidden] bit  NOT NULL
);
GO

-- Creating table 'ReadingLists'
CREATE TABLE [dbo].[ReadingLists] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Position] int  NOT NULL,
    [Status] nvarchar(max)  NOT NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'NovelHistory'
CREATE TABLE [dbo].[NovelHistory] (
    [Histories_Id] int  NOT NULL,
    [Novels_Id] int  NOT NULL
);
GO

-- Creating table 'ReadingListNovels'
CREATE TABLE [dbo].[ReadingListNovels] (
    [ReadingLists_Id] int  NOT NULL,
    [Novels_Id] int  NOT NULL
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

-- Creating primary key on [Histories_Id], [Novels_Id] in table 'NovelHistory'
ALTER TABLE [dbo].[NovelHistory]
ADD CONSTRAINT [PK_NovelHistory]
    PRIMARY KEY CLUSTERED ([Histories_Id], [Novels_Id] ASC);
GO

-- Creating primary key on [ReadingLists_Id], [Novels_Id] in table 'ReadingListNovels'
ALTER TABLE [dbo].[ReadingListNovels]
ADD CONSTRAINT [PK_ReadingListNovels]
    PRIMARY KEY CLUSTERED ([ReadingLists_Id], [Novels_Id] ASC);
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

-- Creating foreign key on [Histories_Id] in table 'NovelHistory'
ALTER TABLE [dbo].[NovelHistory]
ADD CONSTRAINT [FK_NovelHistory_History]
    FOREIGN KEY ([Histories_Id])
    REFERENCES [dbo].[Histories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Novels_Id] in table 'NovelHistory'
ALTER TABLE [dbo].[NovelHistory]
ADD CONSTRAINT [FK_NovelHistory_Novel]
    FOREIGN KEY ([Novels_Id])
    REFERENCES [dbo].[Novels]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NovelHistory_Novel'
CREATE INDEX [IX_FK_NovelHistory_Novel]
ON [dbo].[NovelHistory]
    ([Novels_Id]);
GO

-- Creating foreign key on [ReadingLists_Id] in table 'ReadingListNovels'
ALTER TABLE [dbo].[ReadingListNovels]
ADD CONSTRAINT [FK_ReadingListNovels_ReadingList]
    FOREIGN KEY ([ReadingLists_Id])
    REFERENCES [dbo].[ReadingLists]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Novels_Id] in table 'ReadingListNovels'
ALTER TABLE [dbo].[ReadingListNovels]
ADD CONSTRAINT [FK_ReadingListNovels_Novel]
    FOREIGN KEY ([Novels_Id])
    REFERENCES [dbo].[Novels]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReadingListNovels_Novel'
CREATE INDEX [IX_FK_ReadingListNovels_Novel]
ON [dbo].[ReadingListNovels]
    ([Novels_Id]);
GO

-- Creating foreign key on [History_Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_UserHistory]
    FOREIGN KEY ([History_Id])
    REFERENCES [dbo].[Histories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserHistory'
CREATE INDEX [IX_FK_UserHistory]
ON [dbo].[Users]
    ([History_Id]);
GO

-- Creating foreign key on [User_Id] in table 'ReadingLists'
ALTER TABLE [dbo].[ReadingLists]
ADD CONSTRAINT [FK_UserReadingList]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserReadingList'
CREATE INDEX [IX_FK_UserReadingList]
ON [dbo].[ReadingLists]
    ([User_Id]);
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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------