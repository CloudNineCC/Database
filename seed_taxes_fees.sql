-- Seed data for taxes_fees table
-- City-specific taxes and fees for accommodation

INSERT INTO taxes_fees (city_id, lodging_tax_percent, fixed_fee_usd, description, is_active) VALUES
-- New York City
(1, 14.75, 3.50, 'NYC hotel tax (14.75%) + occupancy tax ($3.50/night)', TRUE),

-- London
(2, 20.00, 0.00, 'UK VAT (20%) on accommodation', TRUE),

-- Paris
(3, 10.00, 2.50, 'French hotel tax (10%) + city tax (€2.50/night)', TRUE),

-- Tokyo
(4, 10.00, 0.00, 'Japanese consumption tax (10%)', TRUE),

-- Sydney
(5, 10.00, 0.00, 'Australian GST (10%)', TRUE),

-- Rome
(6, 10.00, 7.00, 'Italian IVA (10%) + city tax (€7/night)', TRUE);

-- Regional taxes
INSERT INTO taxes_fees (region_name, lodging_tax_percent, fixed_fee_usd, description, is_active) VALUES
('EUROPE', 0.00, 5.00, 'European tourism fee (€5/night)', TRUE),
('ASIA_PACIFIC', 0.00, 2.00, 'Asia-Pacific tourism development fee ($2/night)', TRUE);
