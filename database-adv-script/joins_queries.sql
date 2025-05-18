# INNER JOIN on bookings and users
SELECT 
    b.booking_id,
    b.property_id,
    u.user_id,
    u.first_name,
    u.last_name,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM Booking b
INNER JOIN user u ON b.user_id = u.user_id;

# LEFT JOIN on properties and reviews
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at
FROM property p
LEFT JOIN Review r ON p.property_id = r.property_id
ORDER BY r.review_id IS NULL, r.created_at DESC;

# FULL OUTER JOIN Implemented using UNION since MySQL does not support FULL OUTER JOIN natively
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM user u
LEFT JOIN Booking b ON u.user_id = b.user_id
UNION
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM user u
RIGHT JOIN Booking b ON u.user_id = b.user_id;


