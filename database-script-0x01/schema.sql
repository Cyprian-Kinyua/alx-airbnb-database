DROP TABLE IF EXISTS Message, Review, Payment, Booking, property, user;

CREATE TABLE user ( 
  user_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  password_hash VARCHAR(50),
  phone_number VARCHAR(50),
  role ENUM('guest', 'host', 'admin'),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  KEY idx_user (first_name, last_name, email, password_hash, phone_number, role, created_at)
);

CREATE TABLE property (
  property_id INT PRIMARY KEY,
  host_id INT,
  name VARCHAR(50),
  description TEXT,
  location VARCHAR(50),
  pricepernight DECIMAL(10, 2),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (host_id) REFERENCES user(user_id),
  KEY idx_property (name, description(100), location, pricepernight, created_at, updated_at)
);

CREATE TABLE Booking (
  booking_id INT PRIMARY KEY,
  property_id INT,
  user_id INT,
  start_date DATE,
  end_date DATE,
  total_price DECIMAL(10, 2),
  status ENUM('pending', 'confirmed', 'cancelled'),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (property_id) REFERENCES property(property_id),
  KEY idx_booking (start_date, end_date, total_price, status, created_at)
);

CREATE TABLE Payment (
  payment_id INT PRIMARY KEY,
  booking_id INT,
  amount DECIMAL(10, 2),
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  payment_method ENUM('credit_card', 'paypal', 'bank_transfer'),
  FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
  KEY idx_payment_amount (amount),
  KEY idx_payment_method (payment_date, payment_method)
);

CREATE TABLE Review (
  review_id INT PRIMARY KEY,
  property_id INT,
  user_id INT,
  rating INT,
  comment TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (property_id) REFERENCES property(property_id),
  KEY idx_review (rating, comment(100), created_at)
);

CREATE TABLE Message (
  message_id INT PRIMARY KEY,
  sender_id INT,
  recipient_id INT,
  message_body TEXT,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (sender_id) REFERENCES user(user_id),
  KEY idx_message (message_body(100), sent_at)
);
