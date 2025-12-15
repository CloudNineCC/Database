-- defines accommodation types
CREATE TABLE lodging_classes (
    id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Validation happens in composite service
CREATE TABLE rate_table (
    id VARCHAR(36) PRIMARY KEY,
    city_id VARCHAR(36) NOT NULL COMMENT 'Logical reference to cities.id in destinations_db',
    season_id VARCHAR(36) NOT NULL COMMENT 'Logical reference to seasons.id in destinations_db',
    lodging_class_id VARCHAR(36) NOT NULL,
    base_nightly_usd DECIMAL(10,2) NOT NULL CHECK (base_nightly_usd > 0),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (lodging_class_id) REFERENCES lodging_classes(id) ON DELETE CASCADE,
    UNIQUE KEY unique_rate (city_id, season_id, lodging_class_id),
    INDEX idx_city (city_id),
    INDEX idx_season (season_id),
    INDEX idx_lodging (lodging_class_id)
);

-- historical exchange rates
CREATE TABLE fx_snapshots (
    id VARCHAR(36) PRIMARY KEY,
    as_of_date DATE NOT NULL,
    base_currency VARCHAR(3) NOT NULL,
    quote_currency VARCHAR(3) NOT NULL,
    rate DECIMAL(12,6) NOT NULL CHECK (rate > 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_date_currencies (as_of_date, base_currency, quote_currency),
    INDEX idx_base_currency (base_currency),
    INDEX idx_quote_currency (quote_currency)
);

-- additional costs by city/region
CREATE TABLE taxes_fees (
    id VARCHAR(36) PRIMARY KEY,
    city_id VARCHAR(36) COMMENT 'Logical reference to cities.id in destinations_db',
    region_name VARCHAR(100),
    lodging_tax_percent DECIMAL(5,2) DEFAULT 0.00 CHECK (lodging_tax_percent >= 0),
    fixed_fee_usd DECIMAL(10,2) DEFAULT 0.00 CHECK (fixed_fee_usd >= 0),
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_city (city_id),
    INDEX idx_active (is_active)
);

-- discount codes and special offers
CREATE TABLE promos (
    id VARCHAR(36) PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    type ENUM('percent', 'fixed') NOT NULL,
    value DECIMAL(10,2) NOT NULL CHECK (value > 0),
    min_amount_usd DECIMAL(10,2) DEFAULT 0.00,
    max_discount_usd DECIMAL(10,2),
    valid_from DATE NOT NULL,
    valid_until DATE NOT NULL,
    usage_limit INT,
    usage_count INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_code (code),
    INDEX idx_valid_dates (valid_from, valid_until),
    INDEX idx_active (is_active)
);

-- generated pricing quotes for trip segments
CREATE TABLE quotes (
    id VARCHAR(36) PRIMARY KEY,
    total_usd DECIMAL(12,2) NOT NULL,
    currency VARCHAR(3) NOT NULL DEFAULT 'USD',
    fx_rate DECIMAL(12,6),
    promo_code VARCHAR(50),
    promo_discount_usd DECIMAL(10,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP,
    FOREIGN KEY (promo_code) REFERENCES promos(code),
    INDEX idx_created_at (created_at)
);

-- individual trip segments within a quote
CREATE TABLE quote_segments (
    id VARCHAR(36) PRIMARY KEY,
    quote_id VARCHAR(36) NOT NULL,
    city_id VARCHAR(36) NOT NULL COMMENT 'Logical reference to cities.id in destinations_db',
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    lodging_class_id VARCHAR(36) NOT NULL,
    nights INT NOT NULL,
    base_nightly_usd DECIMAL(10,2) NOT NULL,
    season_multiplier DECIMAL(4,2) DEFAULT 1.00,
    taxes_fees_usd DECIMAL(10,2) DEFAULT 0.00,
    subtotal_usd DECIMAL(12,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (quote_id) REFERENCES quotes(id) ON DELETE CASCADE,
    FOREIGN KEY (lodging_class_id) REFERENCES lodging_classes(id),
    INDEX idx_quote (quote_id),
    INDEX idx_city (city_id)
);

-- tracks which exchange rates were used
CREATE TABLE quote_fx_used (
    id VARCHAR(36) PRIMARY KEY,
    quote_id VARCHAR(36) NOT NULL,
    base_currency VARCHAR(3) NOT NULL,
    quote_currency VARCHAR(3) NOT NULL,
    rate DECIMAL(12,6) NOT NULL,
    fx_snapshot_id VARCHAR(36),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (quote_id) REFERENCES quotes(id) ON DELETE CASCADE,
    FOREIGN KEY (fx_snapshot_id) REFERENCES fx_snapshots(id),
    INDEX idx_quote (quote_id)
);

-- tracks which taxes and fees were applied
CREATE TABLE quote_taxes_applied (
    id VARCHAR(36) PRIMARY KEY,
    quote_id VARCHAR(36) NOT NULL,
    taxes_fees_id VARCHAR(36) NOT NULL,
    amount_usd DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (quote_id) REFERENCES quotes(id) ON DELETE CASCADE,
    FOREIGN KEY (taxes_fees_id) REFERENCES taxes_fees(id),
    INDEX idx_quote (quote_id)
);
