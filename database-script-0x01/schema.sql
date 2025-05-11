CREATE TABLE `user` (
  `user_id` int, Indexed, UUID
  `first_name` varchar(50), NOT NULL
  `last_name` varchar(50),NOT NULL
  `email` varchar(50), NOT NULL, UNIQUE
  `password_hash` varchar(50), NOT NULL
  `phone_number` varchar(50), NULL
  `role` enum(guest, host, admin), NOT NULL
  `created_at` timestamp, DEFAULT CURRENT_TIMESTAMP
  PRIMARY KEY (`user_id`),
  KEY `Key` (`first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`)
);

CREATE TABLE `property` (
  `property_id` int, UUID, Indexed
  `host_id` int, 
  `name` varchar(50), NOT NULL
  `description` text, NOT NULL
  `location` varchar(50), NOT NULL
  `pricepernight` decimal, NOT NULL
  `created_at` timestamp, DEFAULT CURRENT_TIMESTAMP
  `updated_at` timestamp, ON UPDATE CURRENT_TIMESTAMP
  PRIMARY KEY (`property_id`),
  FOREIGN KEY (`host_id`) REFERENCES `user`(`user_id`),
  KEY `Key` (`name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`)
);

CREATE TABLE `Booking` (
  `booking_id` int, UUID, Indexed
  `property_id` int,
  `user_id` int,
  `start_date` date, NOT NULL
  `end_date` date, NOT NULL
  `total_price` decimal, NOT NULL
  `status` enum(pending, confirmed, canceled), NOT NULL
  `created_at` timestamp, DEFAULT CURRENT_TIMESTAMP
  PRIMARY KEY (`booking_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`),
  FOREIGN KEY (`property_id`) REFERENCES `property`(`property_id`),
  KEY `Key` (`start_date`, `end_date`, `total_price`, `status`, `created_at`)
);

CREATE TABLE `Payment` (
  `payment_id` int, UUID, Indexed
  `booking_id` int,
  `amount` decimal, NOT NULL
  `payment_date` timestamp, DEFAULT CURRENT_TIMESTAMP
  `payment_method` enum(credit_card, paypal, stripe),
  PRIMARY KEY (`payment_id`),
  FOREIGN KEY (`booking_id`) REFERENCES `Booking`(`booking_id`),
  KEY `key` (`amount`),
  KEY `Key` (`payment_date`, `payment_method`)
);

CREATE TABLE `Review` (
  `review_id` int, UUID, Indexed
  `property_id` int, 
  `user_id` int,
  `rating` int, CHECK: rating >= 1 AND rating<= 5, NOT NULL
  `comment` text, NOT NULL
  `created_at` timestamp, DEFAULT CURRENT_TIMESTAMP
  PRIMARY KEY (`review_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`),
  FOREIGN KEY (`property_id`) REFERENCES `property`(`property_id`),
  KEY `Key` (`rating`, `comment`, `created_at`)
);

CREATE TABLE `Message` (
  `message_id` int, UUID, Indexed
  `sender_id` int,
  `recipient_id` int,
  `message_body` text, NOT NULL
  `sent_at` timestamp, DEFAULT CURRENT_TIMESTAMP
  PRIMARY KEY (`message_id`),
  FOREIGN KEY (`sender_id`) REFERENCES `user`(`user_id`),
  KEY `Key` (`message_body`, `sent_at`)
);


