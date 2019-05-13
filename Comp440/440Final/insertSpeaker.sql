USE [s17guest33]
GO
/****** Object:  StoredProcedure [dbo].[insertSpeaker]    Script Date: 5/18/2017 5:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[insertSpeaker]
	@speaker varchar(255),
	@class varchar(255)
AS
begin 
	insert into presenter(name) values (@speaker)
end;


