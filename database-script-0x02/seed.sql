INSERT INTO user (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
(1, 'Alice', 'Smith', 'alice@example.com', 'hash1', '1234567890', 'host'),
(2, 'Bob', 'Johnson', 'bob@example.com', 'hash2', '2345678901', 'guest'),
(3, 'Charlie', 'Brown', 'charlie@example.com', 'hash3', '3456789012', 'guest'),
(4, 'Diana', 'Prince', 'diana@example.com', 'hash4', '4567890123', 'host');

INSERT INTO property (property_id, host_id, name, description, location, pricepernight) VALUES
(1, 1, 'Ocean View Apartment', 'A beautiful apartment with ocean view.', 'Mombasa', 100.00),
(2, 4, 'City Center Loft', 'Modern loft in the heart of the city.', 'Nairobi', 80.00);

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
(1, 1, 2, '2025-06-01', '2025-06-05', 400.00, 'confirmed'),
(2, 2, 3, '2025-06-10', '2025-06-12', 160.00, 'pending');

INSERT INTO Payment (payment_id, booking_id, amount, payment_method) VALUES
(1, 1, 400.00, 'credit_card'),
(2, 2, 160.00, 'paypal');

INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
(1, 1, 2, 5, 'Amazing stay, very clean and peaceful.'),
(2, 2, 3, 4, 'Great location, but a bit noisy.');

INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES
(1, 2, 1, 'Hi, is the Ocean View Apartment available in July?'),
(2, 1, 2, 'Yes, it is available from July 10th onward.'),
(3, 3, 4, 'Is the City Center Loft near any public transport?');
