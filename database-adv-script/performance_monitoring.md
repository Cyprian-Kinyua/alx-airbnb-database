## 📝 Final Report: Performance Monitoring & Improvement
### 🔎 Query Monitored:
Bookings with user, property, and payment info for 2023 confirmed bookings.
### 📈 Bottlenecks Identified:
| Issue | Description |
| --- | ---- |
| No composite index | Caused full scan on `Booking(status, start_date)` |
| Missing index on `Payment.booking_id` | Slowed `LEFT JOIN` |
| Join order could be optimized | Extra sorting detected |
### 🛠️ Changes Applied:
1. Created composite index on Booking(status, start_date)
2. Created index on Payment(booking_id)
3. Moved payment filter into JOIN clause
### 📊 Improvements Observed:
| Metric | Before | After |
| ---| --- | --- |
| Rows Scanned | \~90,000 | \~12,000 |
| Join Type  | `ALL`    | `ref` / `eq_ref` |
| Query Time | \~1.5s   | \~0.4s |
| Partitions Accessed | 3 | 1 (p2023 only) |
