### 🚀 Optimized Query Tips:
1. Use explicit column selection rather than SELECT * to reduce I/O.
2. Add filters (WHERE) if you don’t need all rows.
3. Ensure indexes on JOIN columns.

### 🧪 Re-Test Performance
After implementing the optimization tips, you should see:
1. Join type improves to ref or eq_ref
2. Key shows the index being used
3. Rows scanned reduce
