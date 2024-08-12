with d as ( 
 select distinct                                    -- this subquery (d) gets month and year values from data_table
  to_char(date_field,'mm') m, 
  to_char(date_field,'yyyy') y 
 from data_table 
 where date_field >= '01/01/2023'                   -- calendar start date
),

ds as (
 select                                             -- this subquery (ds) calculates number of days per month based on subquery (d)
  m, y,
  to_date(m||'/'||y, 'mm/yyyy') s_date,
  last_day(to_date(m||'/'||y, 'mm/yyyy')) l_date,
  last_day(to_date(m||'/'||y, 'mm/yyyy')) - to_date(m||'/'||y, 'mm/yyyy') + 1 nbr_days  
 from d),
 
sums as (
 select 
  to_char(date_field,'mm') m, 
  to_char(date_field,'yyyy') y,
  sum(revenue) sum_revenue
 from data_table
 where date_field >= '01/01/2023'
 group by to_char(date_field,'mm'), to_char(date_field,'yyyy')
)
 
 select ds.y, ds.m, ds.nbr_days, sums.sum_revenue, sums.sum_revenue/ds.nbr_days avg   -- calculate average monthly revenue
 from ds, sums where ds.m = sums.m and ds.y = sums.y
