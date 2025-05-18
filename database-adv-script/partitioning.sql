## Recreate Booking table with RANGE partitioning on start_date
CREATE TABLE Partitioned_Booking (
  booking_id INT NOT NULL,
  property_id INT NOT NULL,
  user_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  total_price DECIMAL,
  status ENUM('pending', 'confirmed', 'cancelled'),
  created_at TIMESTAMP,
  PRIMARY KEY (booking_id, start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
  PARTITION p2021 VALUES LESS THAN (2022),
  PARTITION p2022 VALUES LESS THAN (2023),
  PARTITION p2023 VALUES LESS THAN (2024),
  PARTITION p2024 VALUES LESS THAN (2025),
  PARTITION pmax VALUES LESS THAN MAXVALUE
);

# Testing Performance of queries on Partitioned Table
SELECT * FROM Booking
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
