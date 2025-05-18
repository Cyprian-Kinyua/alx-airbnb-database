### Indexes:
Indexes are data structures that improve the speed of data retrieval operations on a database table by providing quick access to rows.
### How to implement Indexes:
1. **Identify High-Usage Columns:** Determine columns frequently used in `WHERE` and other clauses.
   Table | High Usage Columns | Why Index?
   |---|---|---|
   `user`	| `user_id`, `email`, |	user_id for JOINs; email for login/search
   `property` |	`property_id`, `host_id`, `location` |	property_id for JOINs; host_id for filtering; location for search
   `booking` | `booking_id`, `user_id`, `property_id`, `start_date` |	JOINs + filtering by date
   'review'	| 'property_id'	| Aggregates + JOINs
   
3. **Create Indexes:** Use SQL commands like `CREATE INDEX idx_user_email ON user(email);` to add indexes to these columns.
4. **Monitor Performance:** Use tools (SolarWinds Database Performance Analyzer, New Relic) or SQL commands `EXPLAIN`, `SHOW PROFILE` to measure the performance improvement.
   e.g., `EXPLAIN SELECT * FROM Booking WHERE user_id = 3;`
   Performance should show notable improvement.
6. **Balance Indexes:** Avoid over-indexing as it can slow down `INSERT`, `UPDATE`, and `DELETE` operations.
