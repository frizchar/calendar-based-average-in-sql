# Calendar based average in SQL

### Overview
We provide SQL code to calculate the average daily revenue of transactional data for each month based on formula:
<p align="center">
$average \ daily \ revenue = \frac{total \ monthly \ revenue}{number \ of \ days \ in \ the \ month}$
</p>

i.e. for _January 2024_, the average daily revenue is calculated as in:
<p align="center">
$average \ daily \ revenue|_{\ JANUARY, \ 2024} = \frac{total \ monthly \ revenue|_{\ JANUARY, 2024}}{31}$
</p>

### Assumptions
1. We assume the data is stored in table ```data_table```, inlcuding the following columns:
  * ```date_field``` : contains the transaction date
  * ```revenue_field``` : contains the revenue per transaction
2. We exclude from all calculations the running month
3. This SQL code has been written for _Oracle_ database
