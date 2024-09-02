# Calendar based average in SQL

We provide SQL code to calculate the average daily revenue for each month based on formula:
<p align="center">
$average \ daily \ revenue = \frac{total \ monthly \ revenue}{number \ of \ days \ in \ the \ month}$
</p>

i.e. for _January_ of 2024, the average daily revenue is calculated as in:
<p align="center">
$average \ daily \ revenue|_{\ JANUARY, \ 2024} = \frac{total \ monthly \ revenue|_{\ JANUARY, 2024}}{31}$
</p>

We assume the data is stored in table ```data_table```, inlcuding the following columns:
1. ```date_field``` : contains the transaction date
2. ```revenue``` : contains the revenue per transaction

This SQL code has been written for _Oracle_ database.
