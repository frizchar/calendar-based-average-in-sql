# Calendar based average in SQL

We provide SQL code to calculate the daily revenue average for each month based on formula:
<p align="center">
$average \ daily \ revenue = \frac{total \ monthly \ revenue}{number \ of \ days \ in \ the \ month}$
</p>
This SQL code has been written for _Oracle_ database.

We assume table ```data_table``` inlcuding the following columns:
1. ```date_field``` : contains the transaction date
2. ```revenue``` : contains the revenue per transaction
