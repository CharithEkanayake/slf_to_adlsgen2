CREATE TABLE [dbo].[ctrl_table](
	[sourcename] [varchar](100) NULL,
	[sourceobj] [varchar](100) NULL,
	[sourceschema] [varchar](100) NULL,
	[targetlocation] [varchar](100) NULL,
	[targetobj] [varchar](100) NULL,
	[watermark_column] [varchar](100) NULL,
	[watermark_value] [varchar](255) NULL,
	[whereclause] [varchar](500) NULL,
	[query1] [varchar](8000) NULL,
	[query2] [varchar](8000) NULL,
	[last_updt_dt_time] [datetime2](7) NULL,
	[frequency] [varchar](10) NULL,
	[load_type] [varchar](30) NULL,
	[load_sequence] [varchar](1) NULL,
	[key_column] [varchar](100) NULL,
	[run_flg] [varchar](2) NULL
)

INSERT INTO [dbo].[ctrl_table]
           ([sourcename]
           ,[sourceobj]
           ,[sourceschema]
           ,[targetlocation]
           ,[targetobj]
           ,[watermark_column]
           ,[watermark_value]
           ,[whereclause]
           ,[query1]
           ,[query2]
           ,[last_updt_dt_time]
           ,[frequency]
           ,[load_type]
           ,[load_sequence]
           ,[key_column]
           ,[run_flg])
     VALUES
           ('salesforce'
           ,'opportunity'
           ,null
		   ,'/1.bronze/opportunity/'
           ,'opportunity_'
           ,'CreatedDate'
           ,null
           ,'where LastModifiedDate'
           ,'select Id,IsDeleted,AccountId,IsPrivate,Name,Description,StageName,Amount,Probability,ExpectedRevenue,TotalOpportunityQuantity,CloseDate,Type,NextStep,LeadSource, IsClosed,IsWon,ForecastCategory,LastModifiedDate'
           ,null
           ,'2000-09-07 14:48:50.3800000'
           ,null
           ,'current'
           ,1
           ,null
           ,1)
		   
DECLARE @json_construct varchar(MAX) = '{"type": "TabularTranslator", "mappings": {X}}';  
DECLARE @json VARCHAR(MAX);  
      
SET @json = (  

SELECT  
        a.[source.name] AS 'source.name',   
        a.[sink.name] AS 'sink.name'   
    FROM dbo.ColumnMapper as a  
  WHERE a.tablename ='@{item().sourceobj}'

    FOR JSON PATH );  
   
    SELECT REPLACE(@json_construct,'{X}', @json) AS json_output;  
		   
		   
CREATE TABLE [dbo].[ColumnMapper](
	[tablename] [nvarchar](100) NULL,
	[source.name] [nvarchar](100) NULL,
	[sink.name] [nvarchar](100) NULL
)

insert into [dbo].[ColumnMapper] values ('opportunity','Id','Id');
insert into [dbo].[ColumnMapper] values ('opportunity','IsDeleted','IsDeleted');
insert into [dbo].[ColumnMapper] values ('opportunity','AccountId','AccountId');
insert into [dbo].[ColumnMapper] values ('opportunity','IsPrivate','IsPrivate');
insert into [dbo].[ColumnMapper] values ('opportunity','Name','Name');
insert into [dbo].[ColumnMapper] values ('opportunity','Description','Description');
insert into [dbo].[ColumnMapper] values ('opportunity','StageName','StageName');
insert into [dbo].[ColumnMapper] values ('opportunity','Amount','Amount');
insert into [dbo].[ColumnMapper] values ('opportunity','Probability','Probability');
insert into [dbo].[ColumnMapper] values ('opportunity','ExpectedRevenue','ExpectedRevenue');
insert into [dbo].[ColumnMapper] values ('opportunity','TotalOpportunityQuantity','TotalOpportunityQuantity');
insert into [dbo].[ColumnMapper] values ('opportunity','CloseDate','CloseDate');
insert into [dbo].[ColumnMapper] values ('opportunity','Type','Type');
insert into [dbo].[ColumnMapper] values ('opportunity','NextStep','NextStep');
insert into [dbo].[ColumnMapper] values ('opportunity','LeadSource','LeadSource');
insert into [dbo].[ColumnMapper] values ('opportunity','IsClosed','IsClosed');
insert into [dbo].[ColumnMapper] values ('opportunity','IsWon','IsWon');
insert into [dbo].[ColumnMapper] values ('opportunity','ForecastCategory','ForecastCategory');
insert into [dbo].[ColumnMapper] values ('opportunity','LastModifiedDate','LastModifiedDate');


