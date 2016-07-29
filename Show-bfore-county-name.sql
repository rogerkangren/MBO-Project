/****** Show the counties result of searching by loann_officer_id ******/
SELECT TOP 1000 a.[loan_officer_state_county_id]
      ,a.[loan_officer_id]
      ,a.[state_county_id], c.county_id, c.county_name
  FROM [CompassWeb_Mortgage_Redirect].[dbo].[loan_officer_state_county] as a
  join [CompassWeb_Mortgage_Redirect].[dbo].state_county as b  
  on  a.state_county_id = b.state_county_id 
  join [CompassWeb_Mortgage_Redirect].[dbo].county as c
  on b.county_id = c.county_id
  where  a.[loan_officer_id] =2978  -- this line need changed offen