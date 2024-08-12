with d as (
 select distinct to_char(date,'mm') m, to_char(date,'yyyy') y 
 from table 
 where date >= '01/01/2023'
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
  to_char(date,'mm') m, 
  to_char(date,'yyyy') y,
  count(patcdin) cnt
 from table
 where date >= '01/01/2023'
 group by to_char(date,'mm'), to_char(date,'yyyy')
)
 
 select ds.y, ds.m, ds.nbr_days, sums.cnt, sums.cnt/ds.nbr_days avg 
 from ds, sums where ds.m = sums.m and ds.y = sums.y
