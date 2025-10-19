-- Seed data for promos table
-- Demo promotion codes and special offers

INSERT INTO promos (code, type, value, min_amount_usd, max_discount_usd, valid_from, valid_until, usage_limit, description, is_active) VALUES
-- Percentage discounts
('WELCOME10', 'percent', 10.00, 100.00, 50.00, '2024-01-01', '2024-12-31', 1000, 'Welcome discount - 10% off first booking (min $100, max $50 discount)', TRUE),
('EARLYBIRD15', 'percent', 15.00, 200.00, 100.00, '2024-01-01', '2024-06-30', 500, 'Early bird discount - 15% off bookings 60+ days in advance (min $200, max $100 discount)', TRUE),
('SUMMER20', 'percent', 20.00, 150.00, 75.00, '2024-06-01', '2024-08-31', 200, 'Summer special - 20% off summer bookings (min $150, max $75 discount)', TRUE),
('STUDENT5', 'percent', 5.00, 50.00, 25.00, '2024-01-01', '2024-12-31', 2000, 'Student discount - 5% off with valid student ID (min $50, max $25 discount)', TRUE),

-- Fixed amount discounts
('SAVE25', 'fixed', 25.00, 200.00, 25.00, '2024-01-01', '2024-12-31', 500, 'Save $25 on bookings over $200', TRUE),
('WEEKEND50', 'fixed', 50.00, 500.00, 50.00, '2024-01-01', '2024-12-31', 100, 'Weekend getaway - $50 off bookings over $500', TRUE),
('LONGSTAY100', 'fixed', 100.00, 1000.00, 100.00, '2024-01-01', '2024-12-31', 50, 'Long stay discount - $100 off bookings over $1000 (7+ nights)', TRUE),

-- Seasonal promotions
('SPRING30', 'percent', 30.00, 300.00, 150.00, '2024-03-01', '2024-05-31', 100, 'Spring travel - 30% off spring bookings (min $300, max $150 discount)', TRUE),
('WINTER25', 'percent', 25.00, 250.00, 125.00, '2024-11-01', '2024-02-28', 150, 'Winter escape - 25% off winter bookings (min $250, max $125 discount)', TRUE),

-- Special event promotions
('NEWYEAR2024', 'fixed', 75.00, 750.00, 75.00, '2024-01-01', '2024-01-31', 75, 'New Year special - $75 off bookings over $750', TRUE),
('BLACKFRIDAY', 'percent', 40.00, 400.00, 200.00, '2024-11-24', '2024-11-30', 50, 'Black Friday - 40% off (min $400, max $200 discount)', TRUE),
('CYBERMONDAY', 'percent', 35.00, 350.00, 175.00, '2024-12-02', '2024-12-02', 100, 'Cyber Monday - 35% off (min $350, max $175 discount)', TRUE),

-- Expired promotions (for testing)
('EXPIRED10', 'percent', 10.00, 100.00, 50.00, '2023-01-01', '2023-12-31', 100, 'Expired promotion - 10% off (for testing)', FALSE),
('USEDUP20', 'percent', 20.00, 200.00, 100.00, '2024-01-01', '2024-12-31', 1, 'Fully used promotion - 20% off (usage limit reached)', TRUE);


UPDATE promos SET usage_count = 1 WHERE code = 'USEDUP20';
