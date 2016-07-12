----Officer No. 1
USE [CompassWeb_Mortgage_Redirect]
GO

declare @newOfficer_lo_code int
declare @newOfficer_profile_id int
declare @newOfficer_name nvarchar(50)
declare @newOfficer_title nvarchar(max)
declare @newOfficer_nmls_originator_id int
declare @newOfficer_street_address nvarchar(max)
declare @newOfficer_email_address nvarchar(50)
declare @newOfficer_business_hours nvarchar(50)
declare @newOfficer_office_phone_number nvarchar(50)
declare @newOfficer_cell_phone_number nvarchar(50)
declare @newOfficer_fax_number nvarchar(50)
declare @newOfficer_toll_free_number nvarchar(50)
declare @newOfficer_main_url nvarchar(max)
declare @newOfficer_site_status nvarchar(50)
declare @newOfficer_site_effective_date datetime
declare @newOfficer_site_expiration_date datetime
declare @newOfficer_alias_url nvarchar(max)
declare @newOfficer_profile_pic_path nvarchar(100)
declare @newOfficer_State nvarchar(50)
declare @newOfficer_County nvarchar(50)
declare @newOfficer_County2 nvarchar(50)
declare @newOfficer_County3 nvarchar(50)
declare @newOfficer_County4 nvarchar(50)
declare @newOfficer_County5 nvarchar(50)
declare @newOfficer_County6 nvarchar(50)
declare @newOfficer_County7 nvarchar(50)
declare @newOfficer_County8 nvarchar(50)
declare @newOfficer_County9 nvarchar(50)
declare @newOfficer_County10 nvarchar(50)
declare @newOfficer_StateID int
declare @newOfficer_CountyID int
declare @newOfficer_ID int
declare @newOfficer_StateCountyID int
declare @NMLS_status nvarchar(10)

set @newOfficer_lo_code = '81711' --int
set @newOfficer_name = 'Linda Vera' --nvarchar(50)
set @newOfficer_State = 'Texas'--nvarchar(50)  --Alabama Arizona California Colorado Florida New Mexico Texas
set @newOfficer_County = 'Cameron' --nvarchar(50)
set @newOfficer_County2 = 'Willacy'--nvarchar(50)
set @newOfficer_County3 = 'Hidalgo'--nvarchar(50)
set @newOfficer_County4 = 'Starr'--nvarchar(50)
set @newOfficer_County5 = 'Kennedy'--nvarchar(50)
set @newOfficer_County6 = 'Brooks'--nvarchar(50)
set @newOfficer_County7 = 'Jim Hogg'--nvarchar(50)
set @newOfficer_County8 = 'Zapata'--nvarchar(50)
set @newOfficer_County9 = 'Jim Wells'--nvarchar(50)
set @newOfficer_County10 = 'Duval' --nvarchar(50)
set @newOfficer_street_address = '3900 N 10th Street, McAllen, TX 78501 ' --nvarchar(max)
set @newOfficer_office_phone_number = '956-429-8260' --nvarchar(50)
set @newOfficer_cell_phone_number = '956-429-8260' --nvarchar(50)
set @newOfficer_fax_number = '205-524-0495' --nvarchar(50)
set @newOfficer_site_effective_date = '07/12/2016' --datetime
set @newOfficer_nmls_originator_id = '761667' --int
set @newOfficer_email_address = 'linda.vera@bbva.com' --nvarchar(50)
set @newOfficer_main_url = 'mortgage.bbvacompass.com/default.asp?siteId=60809D01-EBBB-429B-8309-4FC519561A6C' --nvarchar(max)
set @newOfficer_alias_url = 'http://www.bbvacompass.com/mortgages/lvera' --nvarchar(max)
set @newOfficer_profile_pic_path = 'https://mortgage.bbvacompass.com/Skins/images/carousel2.jpg' --nvarchar(50)
set @newOfficer_business_hours = '' --nvarchar(50)
set @newOfficer_site_status = 'Live' --nvarchar(50)
set @newOfficer_site_expiration_date = null --datetime
set @NMLS_status = 'A'
set @newOfficer_profile_id = '0' --int -- default value
set @newOfficer_title = 'Mortgage Banking Officer' --nvarchar(max) -- default value
set @newOfficer_toll_free_number = '' --nvarchar(50)

--If loan Officer not in the table then add them
if(Select count(*) from [dbo].[loan_officer] where lo_code= @newOfficer_lo_code)=0 
Begin

	INSERT INTO [dbo].[loan_officer]
			   ([lo_code]
			   ,[profile_id]
			   ,[name]
			   ,[title]
			   ,[nmls_originator_id]
			   ,[street_address]
			   ,[email_address]
			   ,[business_hours]
			   ,[office_phone_number]
			   ,[cell_phone_number]
			   ,[fax_number]
			   ,[toll_free_number]
			   ,[main_url]
			   ,[site_status]
			   ,[site_effective_date]
			   ,[site_expiration_date]
			   ,[alias_url]
			   ,[profile_pic_path]
			   ,[NMLS_status])
		 VALUES
			   (@newOfficer_lo_code,  --int
			   @newOfficer_profile_id,  --int
			   @newOfficer_name,  --char(50)
			   @newOfficer_title,  --nvarchar(max)
			   @newOfficer_nmls_originator_id,  --int
			   @newOfficer_street_address,  --nvarchar(max)
			   @newOfficer_email_address,  --nvarchar(50)
			   @newOfficer_business_hours,  --nvarchar(50)
			   @newOfficer_office_phone_number,  --nvarchar(50)
			   @newOfficer_cell_phone_number,  --nvarchar(50)
			   @newOfficer_fax_number,  --nvarchar(50)
			   @newOfficer_toll_free_number,  --nvarchar(50)
			   @newOfficer_main_url,  --nvarchar(max)
			   @newOfficer_site_status,  --nvarchar(50)
			   @newOfficer_site_effective_date,  --datetime
			   @newOfficer_site_expiration_date,  --datetime
			   @newOfficer_alias_url,  --nvarchar(max)
			   @newOfficer_profile_pic_path,  --nvarchar(50)
			   @NMLS_status)
end

--Get Loan_Officer_ID
Select @newOfficer_ID = [loan_officer_id] from [dbo].[loan_officer] where  lo_code= @newOfficer_lo_code

--Add state if not in table
if (Select count(*) from dbo.state where [state_name] = @newOfficer_State) = 0 
begin
	insert into dbo.state ([state_name] ) values ( @newOfficer_State)
end
select @newOfficer_StateID = s.state_id from dbo.[state] s where s.[state_name] = @newOfficer_State

--@newOfficer_County
--Add county if not in table
if @newOfficer_County != ''  
begin
	If (Select count(*) from dbo.county where [county_name] = @newOfficer_county) = 0
	begin
		insert into dbo.county ([county_name] ) values ( @newOfficer_county)
	end
	--Get new county ID
	select @newOfficer_CountyID = county_ID from dbo.county where [county_name] = @newOfficer_county
	--Add State County if not here
	if (Select count(*) from dbo.state_county where [county_id] = @newOfficer_countyID and state_id = @newOfficer_StateID) = 0
	begin
		--insert new county into state_county table
		insert into [dbo].[state_county] ([state_id],[county_id] ) values ( @newOfficer_StateID,@newOfficer_countyID)
	End
	--Get state county ID
	select @newOfficer_StateCountyID = [state_county_id] from [dbo].[state_county] where state_id = @newOfficer_StateID and county_id = @newOfficer_countyID
	--Add [dbo].[loan_officer_state_county] if not there
	if (Select count(*) from dbo.loan_officer_state_county where [state_county_id] =@newOfficer_StateCountyID and loan_officer_id = @newOfficer_ID) = 0
	begin
		insert dbo.loan_officer_state_county (loan_officer_id,state_county_id) values (@newOfficer_ID,@newOfficer_StateCountyID)
	end
end
--@newOfficer_County2
--Add county if not in table
if @newOfficer_County2 != ''  
begin
	If (Select count(*) from dbo.county where [county_name] = @newOfficer_county2) = 0
	begin
		insert into dbo.county ([county_name] ) values ( @newOfficer_county2)
	end
	--Get new county ID
	select @newOfficer_CountyID = county_ID from dbo.county where [county_name] = @newOfficer_county2
	--Add State County if not here
	if (Select count(*) from dbo.state_county where [county_id] = @newOfficer_countyID and state_id = @newOfficer_StateID) = 0
	begin
		--insert new county into state_county table
		insert into [dbo].[state_county] ([state_id],[county_id] ) values ( @newOfficer_StateID,@newOfficer_countyID)
	End
	--Get state county ID
	select @newOfficer_StateCountyID = [state_county_id] from [dbo].[state_county] where state_id = @newOfficer_StateID and county_id = @newOfficer_countyID
	--Add [dbo].[loan_officer_state_county] if not there
	if (Select count(*) from dbo.loan_officer_state_county where [state_county_id] =@newOfficer_StateCountyID and loan_officer_id = @newOfficer_ID) = 0
	begin
		insert dbo.loan_officer_state_county (loan_officer_id,state_county_id) values (@newOfficer_ID,@newOfficer_StateCountyID)
	end
end
--@newOfficer_County3
--Add county if not in table
if @newOfficer_County3 != ''  
begin
	If (Select count(*) from dbo.county where [county_name] = @newOfficer_county3) = 0
	begin
		insert into dbo.county ([county_name] ) values ( @newOfficer_county3)
	end
	--Get new county ID
	select @newOfficer_CountyID = county_ID from dbo.county where [county_name] = @newOfficer_county3
	--Add State County if not here
	if (Select count(*) from dbo.state_county where [county_id] = @newOfficer_countyID and state_id = @newOfficer_StateID) = 0
	begin
		--insert new county into state_county table
		insert into [dbo].[state_county] ([state_id],[county_id] ) values ( @newOfficer_StateID,@newOfficer_countyID)
	End
	--Get state county ID
	select @newOfficer_StateCountyID = [state_county_id] from [dbo].[state_county] where state_id = @newOfficer_StateID and county_id = @newOfficer_countyID
	--Add [dbo].[loan_officer_state_county] if not there
	if (Select count(*) from dbo.loan_officer_state_county where [state_county_id] =@newOfficer_StateCountyID and loan_officer_id = @newOfficer_ID) = 0
	begin
		insert dbo.loan_officer_state_county (loan_officer_id,state_county_id) values (@newOfficer_ID,@newOfficer_StateCountyID)
	end
end
--@newOfficer_County4
--Add county if not in table
if @newOfficer_County4 != ''  
begin
	If (Select count(*) from dbo.county where [county_name] = @newOfficer_county4) = 0
	begin
		insert into dbo.county ([county_name] ) values ( @newOfficer_county4)
	end
	--Get new county ID
	select @newOfficer_CountyID = county_ID from dbo.county where [county_name] = @newOfficer_county4
	--Add State County if not here
	if (Select count(*) from dbo.state_county where [county_id] = @newOfficer_countyID and state_id = @newOfficer_StateID) = 0
	begin
		--insert new county into state_county table
		insert into [dbo].[state_county] ([state_id],[county_id] ) values ( @newOfficer_StateID,@newOfficer_countyID)
	End
	--Get state county ID
	select @newOfficer_StateCountyID = [state_county_id] from [dbo].[state_county] where state_id = @newOfficer_StateID and county_id = @newOfficer_countyID
	--Add [dbo].[loan_officer_state_county] if not there
	if (Select count(*) from dbo.loan_officer_state_county where [state_county_id] =@newOfficer_StateCountyID and loan_officer_id = @newOfficer_ID) = 0
	begin
		insert dbo.loan_officer_state_county (loan_officer_id,state_county_id) values (@newOfficer_ID,@newOfficer_StateCountyID)
	end
end
--@newOfficer_County5
--Add county if not in table
if @newOfficer_County5 != ''  
begin
	If (Select count(*) from dbo.county where [county_name] = @newOfficer_county5) = 0
	begin
		insert into dbo.county ([county_name] ) values ( @newOfficer_county5)
	end
	--Get new county ID
	select @newOfficer_CountyID = county_ID from dbo.county where [county_name] = @newOfficer_county5
	--Add State County if not here
	if (Select count(*) from dbo.state_county where [county_id] = @newOfficer_countyID and state_id = @newOfficer_StateID) = 0
	begin
		--insert new county into state_county table
		insert into [dbo].[state_county] ([state_id],[county_id] ) values ( @newOfficer_StateID,@newOfficer_countyID)
	End
	--Get state county ID
	select @newOfficer_StateCountyID = [state_county_id] from [dbo].[state_county] where state_id = @newOfficer_StateID and county_id = @newOfficer_countyID
	--Add [dbo].[loan_officer_state_county] if not there
	if (Select count(*) from dbo.loan_officer_state_county where [state_county_id] =@newOfficer_StateCountyID and loan_officer_id = @newOfficer_ID) = 0
	begin
		insert dbo.loan_officer_state_county (loan_officer_id,state_county_id) values (@newOfficer_ID,@newOfficer_StateCountyID)
	end
end
--@newOfficer_County6
--Add county if not in table
if @newOfficer_County6 != ''  
begin
	If (Select count(*) from dbo.county where [county_name] = @newOfficer_county6) = 0
	begin
		insert into dbo.county ([county_name] ) values ( @newOfficer_county6)
	end
	--Get new county ID
	select @newOfficer_CountyID = county_ID from dbo.county where [county_name] = @newOfficer_county6
	--Add State County if not here
	if (Select count(*) from dbo.state_county where [county_id] = @newOfficer_countyID and state_id = @newOfficer_StateID) = 0
	begin
		--insert new county into state_county table
		insert into [dbo].[state_county] ([state_id],[county_id] ) values ( @newOfficer_StateID,@newOfficer_countyID)
	End
	--Get state county ID
	select @newOfficer_StateCountyID = [state_county_id] from [dbo].[state_county] where state_id = @newOfficer_StateID and county_id = @newOfficer_countyID
	--Add [dbo].[loan_officer_state_county] if not there
	if (Select count(*) from dbo.loan_officer_state_county where [state_county_id] =@newOfficer_StateCountyID and loan_officer_id = @newOfficer_ID) = 0
	begin
		insert dbo.loan_officer_state_county (loan_officer_id,state_county_id) values (@newOfficer_ID,@newOfficer_StateCountyID)
	end
end
--@newOfficer_County7
--Add county if not in table
 if @newOfficer_County7 != ''  
begin
	If (Select count(*) from dbo.county where [county_name] = @newOfficer_county7) = 0
	begin
		insert into dbo.county ([county_name] ) values ( @newOfficer_county7)
	end
	--Get new county ID
	select @newOfficer_CountyID = county_ID from dbo.county where [county_name] = @newOfficer_county7
	--Add State County if not here
	if (Select count(*) from dbo.state_county where [county_id] = @newOfficer_countyID and state_id = @newOfficer_StateID) = 0
	begin
		--insert new county into state_county table
		insert into [dbo].[state_county] ([state_id],[county_id] ) values ( @newOfficer_StateID,@newOfficer_countyID)
	End
	--Get state county ID
	select @newOfficer_StateCountyID = [state_county_id] from [dbo].[state_county] where state_id = @newOfficer_StateID and county_id = @newOfficer_countyID
	--Add [dbo].[loan_officer_state_county] if not there
	if (Select count(*) from dbo.loan_officer_state_county where [state_county_id] =@newOfficer_StateCountyID and loan_officer_id = @newOfficer_ID) = 0
	begin
		insert dbo.loan_officer_state_county (loan_officer_id,state_county_id) values (@newOfficer_ID,@newOfficer_StateCountyID)
	end
end
--@newOfficer_County8
--Add county if not in table
if @newOfficer_County8 != ''  
begin
	If (Select count(*) from dbo.county where [county_name] = @newOfficer_county8) = 0
	begin
		insert into dbo.county ([county_name] ) values ( @newOfficer_county8)
	end
	--Get new county ID
	select @newOfficer_CountyID = county_ID from dbo.county where [county_name] = @newOfficer_county8
	--Add State County if not here
	if (Select count(*) from dbo.state_county where [county_id] = @newOfficer_countyID and state_id = @newOfficer_StateID) = 0
	begin
		--insert new county into state_county table
		insert into [dbo].[state_county] ([state_id],[county_id] ) values ( @newOfficer_StateID,@newOfficer_countyID)
	End
	--Get state county ID
	select @newOfficer_StateCountyID = [state_county_id] from [dbo].[state_county] where state_id = @newOfficer_StateID and county_id = @newOfficer_countyID
	--Add [dbo].[loan_officer_state_county] if not there
	if (Select count(*) from dbo.loan_officer_state_county where [state_county_id] =@newOfficer_StateCountyID and loan_officer_id = @newOfficer_ID) = 0
	begin
		insert dbo.loan_officer_state_county (loan_officer_id,state_county_id) values (@newOfficer_ID,@newOfficer_StateCountyID)
	end
end
--@newOfficer_County9
--Add county if not in table
if @newOfficer_County9 != ''  
begin
	If (Select count(*) from dbo.county where [county_name] = @newOfficer_county9) = 0
	begin
		insert into dbo.county ([county_name] ) values ( @newOfficer_county9)
	end
	--Get new county ID
	select @newOfficer_CountyID = county_ID from dbo.county where [county_name] = @newOfficer_county9
	--Add State County if not here
	if (Select count(*) from dbo.state_county where [county_id] = @newOfficer_countyID and state_id = @newOfficer_StateID) = 0
	begin
		--insert new county into state_county table
		insert into [dbo].[state_county] ([state_id],[county_id] ) values ( @newOfficer_StateID,@newOfficer_countyID)
	End
	--Get state county ID
	select @newOfficer_StateCountyID = [state_county_id] from [dbo].[state_county] where state_id = @newOfficer_StateID and county_id = @newOfficer_countyID
	--Add [dbo].[loan_officer_state_county] if not there
	if (Select count(*) from dbo.loan_officer_state_county where [state_county_id] =@newOfficer_StateCountyID and loan_officer_id = @newOfficer_ID) = 0
	begin
		insert dbo.loan_officer_state_county (loan_officer_id,state_county_id) values (@newOfficer_ID,@newOfficer_StateCountyID)
	end
end
--@newOfficer_County10
--Add county if not in table
if @newOfficer_County10 != ''  
begin
	If (Select count(*) from dbo.county where [county_name] = @newOfficer_county10) = 0
	begin
		insert into dbo.county ([county_name] ) values ( @newOfficer_county10)
	end
	--Get new county ID
	select @newOfficer_CountyID = county_ID from dbo.county where [county_name] = @newOfficer_county10
	--Add State County if not here
	if (Select count(*) from dbo.state_county where [county_id] = @newOfficer_countyID and state_id = @newOfficer_StateID) = 0
	begin
		--insert new county into state_county table
		insert into [dbo].[state_county] ([state_id],[county_id] ) values ( @newOfficer_StateID,@newOfficer_countyID)
	End
	--Get state county ID
	select @newOfficer_StateCountyID = [state_county_id] from [dbo].[state_county] where state_id = @newOfficer_StateID and county_id = @newOfficer_countyID
	--Add [dbo].[loan_officer_state_county] if not there
	if (Select count(*) from dbo.loan_officer_state_county where [state_county_id] =@newOfficer_StateCountyID and loan_officer_id = @newOfficer_ID) = 0
	begin
		insert dbo.loan_officer_state_county (loan_officer_id,state_county_id) values (@newOfficer_ID,@newOfficer_StateCountyID)
	end
end

