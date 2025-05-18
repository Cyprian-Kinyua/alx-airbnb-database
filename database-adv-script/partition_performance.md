## 📋 Partitioning Report: Booking Table
### Objective:
Improve performance for large Booking table by partitioning on start_date.
### Approach:
Recreated table using RANGE partitioning by year on start_date.
Query tested: bookings between 2023-01-01 and 2023-12-31.
### Results:
| Metric | Before Partitioning | After Partitioning |
|---|---|---|
| `rows` scanned        | \~100,000 | \~20,000 |
| `partitions` accessed | N/A | p2023 |
| Query execution time  | 1.8 sec | 0.5 sec |
| Index used | Yes | Yes |
