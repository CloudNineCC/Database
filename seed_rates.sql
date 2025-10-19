-- Seed data for rate_table
-- Base nightly rates in USD by city, season, and lodging class

INSERT INTO rate_table (city_id, season_id, lodging_class_id, base_nightly_usd, notes) VALUES
-- New York City rates
(1, 1, 1, 45.00, 'NYC hostel peak season - summer rates'),
(1, 1, 2, 180.00, 'NYC standard peak season - summer rates'),
(1, 1, 3, 450.00, 'NYC premium peak season - summer rates'),
(1, 2, 1, 35.00, 'NYC hostel shoulder season - spring/fall'),
(1, 2, 2, 140.00, 'NYC standard shoulder season - spring/fall'),
(1, 2, 3, 350.00, 'NYC premium shoulder season - spring/fall'),
(1, 3, 1, 25.00, 'NYC hostel off season - winter'),
(1, 3, 2, 100.00, 'NYC standard off season - winter'),
(1, 3, 3, 250.00, 'NYC premium off season - winter'),

-- London rates
(2, 1, 1, 40.00, 'London hostel peak season - summer rates'),
(2, 1, 2, 160.00, 'London standard peak season - summer rates'),
(2, 1, 3, 400.00, 'London premium peak season - summer rates'),
(2, 2, 1, 30.00, 'London hostel shoulder season - spring/fall'),
(2, 2, 2, 120.00, 'London standard shoulder season - spring/fall'),
(2, 2, 3, 300.00, 'London premium shoulder season - spring/fall'),
(2, 3, 1, 20.00, 'London hostel off season - winter'),
(2, 3, 2, 80.00, 'London standard off season - winter'),
(2, 3, 3, 200.00, 'London premium off season - winter'),

-- Paris rates
(3, 1, 1, 35.00, 'Paris hostel peak season - summer rates'),
(3, 1, 2, 150.00, 'Paris standard peak season - summer rates'),
(3, 1, 3, 380.00, 'Paris premium peak season - summer rates'),
(3, 2, 1, 28.00, 'Paris hostel shoulder season - spring/fall'),
(3, 2, 2, 110.00, 'Paris standard shoulder season - spring/fall'),
(3, 2, 3, 280.00, 'Paris premium shoulder season - spring/fall'),
(3, 3, 1, 22.00, 'Paris hostel off season - winter'),
(3, 3, 2, 85.00, 'Paris standard off season - winter'),
(3, 3, 3, 220.00, 'Paris premium off season - winter'),

-- Tokyo rates
(4, 1, 1, 30.00, 'Tokyo hostel peak season - cherry blossom/fall'),
(4, 1, 2, 120.00, 'Tokyo standard peak season - cherry blossom/fall'),
(4, 1, 3, 320.00, 'Tokyo premium peak season - cherry blossom/fall'),
(4, 2, 1, 25.00, 'Tokyo hostel shoulder season - summer'),
(4, 2, 2, 100.00, 'Tokyo standard shoulder season - summer'),
(4, 2, 3, 260.00, 'Tokyo premium shoulder season - summer'),
(4, 3, 1, 20.00, 'Tokyo hostel off season - winter'),
(4, 3, 2, 75.00, 'Tokyo standard off season - winter'),
(4, 3, 3, 200.00, 'Tokyo premium off season - winter'),

-- Sydney rates
(5, 1, 1, 50.00, 'Sydney hostel peak season - summer rates'),
(5, 1, 2, 200.00, 'Sydney standard peak season - summer rates'),
(5, 1, 3, 500.00, 'Sydney premium peak season - summer rates'),
(5, 2, 1, 40.00, 'Sydney hostel shoulder season - fall/spring'),
(5, 2, 2, 160.00, 'Sydney standard shoulder season - fall/spring'),
(5, 2, 3, 400.00, 'Sydney premium shoulder season - fall/spring'),
(5, 3, 1, 30.00, 'Sydney hostel off season - winter'),
(5, 3, 2, 120.00, 'Sydney standard off season - winter'),
(5, 3, 3, 300.00, 'Sydney premium off season - winter'),

-- Rome rates
(6, 1, 1, 32.00, 'Rome hostel peak season - summer rates'),
(6, 1, 2, 130.00, 'Rome standard peak season - summer rates'),
(6, 1, 3, 330.00, 'Rome premium peak season - summer rates'),
(6, 2, 1, 26.00, 'Rome hostel shoulder season - spring/fall'),
(6, 2, 2, 100.00, 'Rome standard shoulder season - spring/fall'),
(6, 2, 3, 250.00, 'Rome premium shoulder season - spring/fall'),
(6, 3, 1, 20.00, 'Rome hostel off season - winter'),
(6, 3, 2, 75.00, 'Rome standard off season - winter'),
(6, 3, 3, 180.00, 'Rome premium off season - winter');
