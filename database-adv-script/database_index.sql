# Indexes on user table
CREATE INDEX idx_user_email ON user(email);
CREATE INDEX idx_user_userid ON user(user_id);

# Indexes on property table
CREATE INDEX idx_property_host ON property(host_id);
CREATE INDEX idx_property_location ON property(location);

# Indexes on booking table
CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_startdate ON Booking(start_date);

# Index on review table
CREATE INDEX idx_review_property ON Review(property_id);

# Measuring Performance
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 3;
