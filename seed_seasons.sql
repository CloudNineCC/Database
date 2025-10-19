-- Seed data for seasons table
-- Defines peak, shoulder, and off seasons for each city

INSERT INTO seasons (city_id, season_name, start_month, end_month) VALUES
-- New York (USA)
(1, 'peak', 6, 8),    
(1, 'shoulder', 4, 5), 
(1, 'shoulder', 9, 10),
(1, 'off', 11, 3),    

-- London (UK)
(2, 'peak', 6, 8),   
(2, 'shoulder', 4, 5), 
(2, 'shoulder', 9, 10), 
(2, 'off', 11, 3),    

-- Paris (France)
(3, 'peak', 6, 8),   
(3, 'shoulder', 4, 5), 
(3, 'shoulder', 9, 10), 
(3, 'off', 11, 3),    

-- Tokyo (Japan)
(4, 'peak', 3, 5),    
(4, 'peak', 9, 11),   
(4, 'shoulder', 6, 8), 
(4, 'off', 12, 2),    

-- Sydney (Australia)
(5, 'peak', 12, 2),   
(5, 'shoulder', 3, 5), 
(5, 'shoulder', 9, 11), 
(5, 'off', 6, 8),     

-- Rome (Italy)
(6, 'peak', 6, 8),    
(6, 'shoulder', 4, 5), 
(6, 'shoulder', 9, 10), 
(6, 'off', 11, 3);   