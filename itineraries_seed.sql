INSERT INTO itineraries (id, name, owner_user_id, description, status, start_date, end_date) VALUES
('i1111111-1111-1111-1111-111111111111', 'European Summer Tour 2024', 'alice@example.com', 'Multi-city tour across Europe visiting Paris, Rome, and Barcelona', 'CONFIRMED', '2024-07-01', '2024-07-14'),
('i2222222-2222-2222-2222-222222222222', 'USA East Coast Adventure', 'bob@example.com', 'Exploring the historic cities of the American East Coast', 'PLANNING', '2024-09-15', '2024-09-25'),
('i3333333-3333-3333-3333-333333333333', 'Asia Pacific Discovery', 'charlie@example.com', 'Journey through Tokyo, Bangkok, and Sydney', 'DRAFT', NULL, NULL),
('i4444444-4444-4444-4444-444444444444', 'London Business Trip', 'diana@example.com', 'Quick business trip to London with weekend extension', 'COMPLETED', '2024-05-10', '2024-05-15'),
('i5555555-5555-5555-5555-555555555555', 'Winter Getaway', 'eve@example.com', 'Winter vacation planning - TBD destinations', 'DRAFT', NULL, NULL);

INSERT INTO itinerary_segments (id, itinerary_id, city_id, start_date, end_date, lodging_class, sequence_order, notes) VALUES
('sg111111-1111-1111-1111-111111111111', 'i1111111-1111-1111-1111-111111111111', 'c3333333-3333-3333-3333-333333333333', '2024-07-01', '2024-07-05', 'STANDARD', 1, 'Paris - Eiffel Tower, Louvre, Notre Dame'),
('sg111111-1111-1111-1111-111111111112', 'i1111111-1111-1111-1111-111111111111', 'c6666666-6666-6666-6666-666666666666', '2024-07-06', '2024-07-10', 'STANDARD', 2, 'Rome - Colosseum, Vatican, Trevi Fountain'),
('sg111111-1111-1111-1111-111111111113', 'i1111111-1111-1111-1111-111111111111', 'c7777777-7777-7777-7777-777777777777', '2024-07-11', '2024-07-14', 'PREMIUM', 3, 'Barcelona - Sagrada Familia, Park Guell, beach time');

INSERT INTO itinerary_segments (id, itinerary_id, city_id, start_date, end_date, lodging_class, sequence_order, notes) VALUES
('sg222222-2222-2222-2222-222222222221', 'i2222222-2222-2222-2222-222222222222', 'c1111111-1111-1111-1111-111111111111', '2024-09-15', '2024-09-20', 'HOSTEL', 1, 'New York City - Times Square, Central Park, museums'),
('sg222222-2222-2222-2222-222222222222', 'i2222222-2222-2222-2222-222222222222', 'c1111111-1111-1111-1111-111111111111', '2024-09-20', '2024-09-25', 'STANDARD', 2, 'Extended NYC stay - exploring Brooklyn and Queens');

INSERT INTO itinerary_segments (id, itinerary_id, city_id, start_date, end_date, lodging_class, sequence_order, notes) VALUES
('sg333333-3333-3333-3333-333333333331', 'i3333333-3333-3333-3333-333333333333', 'c4444444-4444-4444-4444-444444444444', '2024-10-01', '2024-10-07', 'STANDARD', 1, 'Tokyo - temples, anime, sushi'),
('sg333333-3333-3333-3333-333333333332', 'i3333333-3333-3333-3333-333333333333', 'c9999999-9999-9999-9999-999999999999', '2024-10-08', '2024-10-12', 'HOSTEL', 2, 'Bangkok - markets, temples, street food'),
('sg333333-3333-3333-3333-333333333333', 'i3333333-3333-3333-3333-333333333333', 'c5555555-5555-5555-5555-555555555555', '2024-10-13', '2024-10-18', 'PREMIUM', 3, 'Sydney - Opera House, Bondi Beach, Harbor');

INSERT INTO itinerary_segments (id, itinerary_id, city_id, start_date, end_date, lodging_class, sequence_order, notes) VALUES
('sg444444-4444-4444-4444-444444444441', 'i4444444-4444-4444-4444-444444444444', 'c2222222-2222-2222-2222-222222222222', '2024-05-10', '2024-05-15', 'PREMIUM', 1, 'London - business meetings in City district, weekend sightseeing');

INSERT INTO itinerary_roles (id, itinerary_id, user_id, role) VALUES
('ir111111-1111-1111-1111-111111111111', 'i1111111-1111-1111-1111-111111111111', 'alice@example.com', 'OWNER'),
('ir111111-1111-1111-1111-111111111112', 'i1111111-1111-1111-1111-111111111111', 'bob@example.com', 'VIEWER'),
('ir111111-1111-1111-1111-111111111113', 'i1111111-1111-1111-1111-111111111111', 'charlie@example.com', 'EDITOR'),
('ir222222-2222-2222-2222-222222222221', 'i2222222-2222-2222-2222-222222222222', 'bob@example.com', 'OWNER'),
('ir333333-3333-3333-3333-333333333331', 'i3333333-3333-3333-3333-333333333333', 'charlie@example.com', 'OWNER'),
('ir333333-3333-3333-3333-333333333332', 'i3333333-3333-3333-3333-333333333333', 'alice@example.com', 'EDITOR'),
('ir444444-4444-4444-4444-444444444441', 'i4444444-4444-4444-4444-444444444444', 'diana@example.com', 'OWNER'),
('ir555555-5555-5555-5555-555555555551', 'i5555555-5555-5555-5555-555555555555', 'eve@example.com', 'OWNER');

INSERT INTO itinerary_comments (id, itinerary_id, user_id, text) VALUES
('ic111111-1111-1111-1111-111111111111', 'i1111111-1111-1111-1111-111111111111', 'alice@example.com', 'Created the initial itinerary! So excited for this trip!'),
('ic111111-1111-1111-1111-111111111112', 'i1111111-1111-1111-1111-111111111111', 'bob@example.com', 'Looks amazing! I recommend visiting the Sacré-Cœur in Paris.'),
('ic111111-1111-1111-1111-111111111113', 'i1111111-1111-1111-1111-111111111111', 'charlie@example.com', 'Added some notes about must-see spots in Barcelona!'),
('ic111111-1111-1111-1111-111111111114', 'i1111111-1111-1111-1111-111111111111', 'alice@example.com', 'Thanks for the suggestions! Updated the Barcelona segment notes.'),
('ic222222-2222-2222-2222-222222222221', 'i2222222-2222-2222-2222-222222222222', 'bob@example.com', 'Planning my first trip to NYC! Any budget tips?'),
('ic333333-3333-3333-3333-333333333331', 'i3333333-3333-3333-3333-333333333333', 'charlie@example.com', 'Still finalizing dates but route looks good!'),
('ic333333-3333-3333-3333-333333333332', 'i3333333-3333-3333-3333-333333333333', 'alice@example.com', 'I can help with Tokyo recommendations - lived there for 2 years!');

INSERT INTO itinerary_activity (id, itinerary_id, user_id, action, details) VALUES
('ia111111-1111-1111-1111-111111111111', 'i1111111-1111-1111-1111-111111111111', 'alice@example.com', 'created', 'Created itinerary "European Summer Tour 2024"'),
('ia111111-1111-1111-1111-111111111112', 'i1111111-1111-1111-1111-111111111111', 'alice@example.com', 'segment_added', 'Added segment: Paris (2024-07-01 to 2024-07-05)'),
('ia111111-1111-1111-1111-111111111113', 'i1111111-1111-1111-1111-111111111111', 'alice@example.com', 'segment_added', 'Added segment: Rome (2024-07-06 to 2024-07-10)'),
('ia111111-1111-1111-1111-111111111114', 'i1111111-1111-1111-1111-111111111111', 'alice@example.com', 'segment_added', 'Added segment: Barcelona (2024-07-11 to 2024-07-14)'),
('ia111111-1111-1111-1111-111111111115', 'i1111111-1111-1111-1111-111111111111', 'alice@example.com', 'role_added', 'Granted VIEWER role to bob@example.com'),
('ia111111-1111-1111-1111-111111111116', 'i1111111-1111-1111-1111-111111111111', 'alice@example.com', 'role_added', 'Granted EDITOR role to charlie@example.com'),
('ia111111-1111-1111-1111-111111111117', 'i1111111-1111-1111-1111-111111111111', 'charlie@example.com', 'segment_updated', 'Updated Barcelona segment notes'),
('ia111111-1111-1111-1111-111111111118', 'i1111111-1111-1111-1111-111111111111', 'alice@example.com', 'status_changed', 'Changed status from PLANNING to CONFIRMED'),
('ia222222-2222-2222-2222-222222222221', 'i2222222-2222-2222-2222-222222222222', 'bob@example.com', 'created', 'Created itinerary "USA East Coast Adventure"'),
('ia222222-2222-2222-2222-222222222222', 'i2222222-2222-2222-2222-222222222222', 'bob@example.com', 'segment_added', 'Added segment: New York City (2024-09-15 to 2024-09-20)'),
('ia222222-2222-2222-2222-222222222223', 'i2222222-2222-2222-2222-222222222222', 'bob@example.com', 'segment_added', 'Added segment: New York City extension (2024-09-20 to 2024-09-25)'),
('ia333333-3333-3333-3333-333333333331', 'i3333333-3333-3333-3333-333333333333', 'charlie@example.com', 'created', 'Created itinerary "Asia Pacific Discovery"'),
('ia333333-3333-3333-3333-333333333332', 'i3333333-3333-3333-3333-333333333333', 'charlie@example.com', 'segment_added', 'Added segment: Tokyo'),
('ia333333-3333-3333-3333-333333333333', 'i3333333-3333-3333-3333-333333333333', 'charlie@example.com', 'segment_added', 'Added segment: Bangkok'),
('ia333333-3333-3333-3333-333333333334', 'i3333333-3333-3333-3333-333333333333', 'charlie@example.com', 'segment_added', 'Added segment: Sydney'),
('ia333333-3333-3333-3333-333333333335', 'i3333333-3333-3333-3333-333333333333', 'charlie@example.com', 'role_added', 'Granted EDITOR role to alice@example.com'),
('ia444444-4444-4444-4444-444444444441', 'i4444444-4444-4444-4444-444444444444', 'diana@example.com', 'created', 'Created itinerary "London Business Trip"'),
('ia444444-4444-4444-4444-444444444442', 'i4444444-4444-4444-4444-444444444444', 'diana@example.com', 'segment_added', 'Added segment: London (2024-05-10 to 2024-05-15)'),
('ia444444-4444-4444-4444-444444444443', 'i4444444-4444-4444-4444-444444444444', 'diana@example.com', 'status_changed', 'Changed status from PLANNING to CONFIRMED'),
('ia444444-4444-4444-4444-444444444444', 'i4444444-4444-4444-4444-444444444444', 'diana@example.com', 'status_changed', 'Changed status from CONFIRMED to COMPLETED'),
('ia555555-5555-5555-5555-555555555551', 'i5555555-5555-5555-5555-555555555555', 'eve@example.com', 'created', 'Created itinerary "Winter Getaway"');
