# Calendar based average in SQL

We provide SQL code to calculate the average daily revenue for each month based on formula:
<p align="center">
$average \ daily \ revenue = \frac{total \ monthly \ revenue}{number \ of \ days \ in \ the \ month}$
</p>

i.e. for _January_, the average daily revenue is calculated as in:
<p align="center">
$average \ daily \ revenue_{JANUARY} = \frac{total \ monthly \ revenue_{JANUARY}}{31}$
</p>

We assume the data is stored in table ```data_table```, inlcuding the following columns:
1. ```date_field``` : contains the transaction date
2. ```revenue``` : contains the revenue per transaction

This SQL code has been written for _Oracle_ database.
