-- travel plans created by users
CREATE TABLE itineraries (
    id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    owner_user_id VARCHAR(100) NOT NULL COMMENT 'User identifier (email, username, etc.)',
    description TEXT,
    status ENUM('DRAFT', 'PLANNING', 'CONFIRMED', 'COMPLETED', 'CANCELLED') NOT NULL DEFAULT 'DRAFT',
    start_date DATE,
    end_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_owner (owner_user_id),
    INDEX idx_status (status),
    INDEX idx_dates (start_date, end_date)
);

-- individual city stays within an itinerary
CREATE TABLE itinerary_segments (
    id VARCHAR(36) PRIMARY KEY,
    itinerary_id VARCHAR(36) NOT NULL,
    city_id VARCHAR(36) NOT NULL COMMENT 'Logical reference to cities.id in destinations_db',
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    lodging_class ENUM('HOSTEL', 'STANDARD', 'PREMIUM') NOT NULL,
    sequence_order INT NOT NULL,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (itinerary_id) REFERENCES itineraries(id) ON DELETE CASCADE,
    INDEX idx_itinerary (itinerary_id),
    INDEX idx_city (city_id),
    INDEX idx_dates (start_date, end_date),
    UNIQUE KEY unique_itinerary_sequence (itinerary_id, sequence_order)
);

-- manage access control for shared itineraries
CREATE TABLE itinerary_roles (
    id VARCHAR(36) PRIMARY KEY,
    itinerary_id VARCHAR(36) NOT NULL,
    user_id VARCHAR(100) NOT NULL COMMENT 'User identifier',
    role ENUM('OWNER', 'EDITOR', 'VIEWER') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (itinerary_id) REFERENCES itineraries(id) ON DELETE CASCADE,
    INDEX idx_itinerary (itinerary_id),
    INDEX idx_user (user_id),
    UNIQUE KEY unique_itinerary_user (itinerary_id, user_id)
);

-- collaborative notes and discussions
CREATE TABLE itinerary_comments (
    id VARCHAR(36) PRIMARY KEY,
    itinerary_id VARCHAR(36) NOT NULL,
    user_id VARCHAR(100) NOT NULL COMMENT 'User identifier',
    text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (itinerary_id) REFERENCES itineraries(id) ON DELETE CASCADE,
    INDEX idx_itinerary (itinerary_id),
    INDEX idx_created_at (created_at)
);

-- audit log of changes
CREATE TABLE itinerary_activity (
    id VARCHAR(36) PRIMARY KEY,
    itinerary_id VARCHAR(36) NOT NULL,
    user_id VARCHAR(100) NOT NULL COMMENT 'User identifier',
    action VARCHAR(100) NOT NULL COMMENT 'Action type (created, updated, segment_added, etc.)',
    details TEXT COMMENT 'JSON or text details about the action',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (itinerary_id) REFERENCES itineraries(id) ON DELETE CASCADE,
    INDEX idx_itinerary (itinerary_id),
    INDEX idx_created_at (created_at)
);
