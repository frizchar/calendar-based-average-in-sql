with d as (
 select distinct to_char(date_field,'mm') m, to_char(date_field,'yyyy') y 
 from data_table 
 where date_field >= '01/01/2023'
),

ds as (
 select 
  m, y,
  to_date(m||'/'||y, 'mm/yyyy') s_date,
  last_day(to_date(m||'/'||y, 'mm/yyyy')) l_date,
  last_day(to_date(m||'/'||y, 'mm/yyyy')) - to_date(m||'/'||y, 'mm/yyyy') + 1 nbr_days
 from d),
 
sums as (
 select 
  to_char(date_field,'mm') m, 
  to_char(date_field,'yyyy') y,
  count(patcdin) cnt
 from data_table
 where date_field >= '01/01/2023'
 group by to_char(date_field,'mm'), to_char(date_field,'yyyy')
)
 
 select ds.y, ds.m, ds.nbr_days, sums.cnt, sums.cnt/ds.nbr_days avg 
 from ds, sums where ds.m = sums.m and ds.y = sums.y
