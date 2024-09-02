with d as ( 
 select distinct                                    -- CTE (d) gets month and year values from data_table
  to_char(date_field,'mm') m, 
  to_char(date_field,'yyyy') y 
 from data_table 
 where 
  date_field >= '01/01/2023'                        -- calendar start date
  and date < trunc(sysdate,'mm')                    -- exclude running month from calculations
),

ds as (
 select                                             -- CTE (ds) calculates the number of days per month based on subquery (d)
  m, y,
  to_date(m||'/'||y, 'mm/yyyy') s_date,
  last_day(to_date(m||'/'||y, 'mm/yyyy')) l_date,
  last_day(to_date(m||'/'||y, 'mm/yyyy')) - to_date(m||'/'||y, 'mm/yyyy') + 1 nbr_days  
 from d),
 
sums as (
 select                                             -- CTE (sums) calculates the monthly revenue total
  to_char(date_field,'mm') m, 
  to_char(date_field,'yyyy') y,
  sum(revenue) sum_revenue
 from data_table
 where 
  date_field >= '01/01/2023'
  and date < trunc(sysdate,'mm')                    -- exclude running month from calculations
 group by to_char(date_field,'mm'), to_char(date_field,'yyyy')
)
 
 select                                             -- final query calculates the average daily revenue
  ds.y, ds.m, ds.nbr_days, sums.sum_revenue, 
  sums.sum_revenue/ds.nbr_days avg   
 from ds, sums where ds.m = sums.m and ds.y = sums.y
