-- stores destination cities
CREATE TABLE cities (
    id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country_code VARCHAR(3) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    version INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_country (country_code),
    INDEX idx_currency (currency),
    INDEX idx_name (name)
);

-- defines travel seasons for each city
CREATE TABLE seasons (
    id VARCHAR(36) PRIMARY KEY,
    city_id VARCHAR(36) NOT NULL,
    season_name ENUM('peak', 'shoulder', 'off-peak') NOT NULL,
    start_month TINYINT NOT NULL CHECK (start_month >= 1 AND start_month <= 12),
    end_month TINYINT NOT NULL CHECK (end_month >= 1 AND end_month <= 12),
    version INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (city_id) REFERENCES cities(id) ON DELETE CASCADE,
    INDEX idx_city_season (city_id, season_name),
    INDEX idx_city (city_id),
    UNIQUE KEY unique_city_season (city_id, season_name)
);

-- for async bulk operations (e.g., bulk season import)
CREATE TABLE async_jobs (
    id VARCHAR(36) PRIMARY KEY,
    job_type VARCHAR(50) NOT NULL,
    status ENUM('PENDING', 'PROCESSING', 'COMPLETED', 'FAILED') NOT NULL DEFAULT 'PENDING',
    progress INT DEFAULT 0,
    total_items INT DEFAULT 0,
    result_summary TEXT,
    error_message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    started_at TIMESTAMP NULL,
    completed_at TIMESTAMP NULL,
    INDEX idx_status (status),
    INDEX idx_created_at (created_at)
);
