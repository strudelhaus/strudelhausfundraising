INSERT INTO product_type
    ("type")
VALUES
    ('sweet'),
    ('savory');

INSERT INTO product
    ("name",description,price,sku,product_type)
VALUES
    ('Apple Strudel', 'Made with Haralson Apples from Pepin Heights Orchard in Lake City, our strudel is perfectly matched with the right balance of cinnamon and sugar.', '15.00', '100', 1),
    ('THREE-BERRY CREAM CHEESE STRUDEL', 'Raspberries. Marion berries and Blueberries and a bit of brown sugar and cinnamon and cream cheese, eggs and brown sugar are blended together for a taste of Heaven.', '15.00', '101', 1),
    ('APPLE CHEDDAR STRUDEL', 'Haralson apples mixed with our special blend of seasonings with grated sharp cheddar.', '15.00', '102', 1),
    ('PEAR-GINGER STRUDEL', 'A wonderful combination of sweet Bartlett pears, brown sugar and ginger wrapped in a flakey puff pastry.', '15.00', '103', 1),
    ('STRAWBERRY-RHUBARB STRUDEL', 'Made from locally grown rhubarb and strawberries combined with the perfect balance of sugar, cinnamon and nutmeg.', '15.00', '104', 1),
    ('RASPBERRY TOASTED-ALMOND CREAM CHEESE STRUDEL', 'Raspberries, on top of a layer of sweetened cream cheese blended with toasted almonds. Mmmmmmm…', '15.00', '105', 1),
    ('REUBEN STRUDEL', 'Corned Beef, sauerkraut, Swiss cheese and Thousand Island dressing make this a new favorite of many.', '20.00', '106', 2),
    ('CHICKEN MARINARA MOZZARELLA STRUDEL', 'Chicken, mozzarella, Parmesan and a touch of onion, then married to a marinara sauce baked to perfection inside a puff pastry.', '20.00', '107', 2),
    ('CHICKEN POT PIE STRUDEL', 'Just like grandma used to make, our chicken pot pie strudel combines chicken breast meat, a plethora of vegetables, and a hand-made gravy.  Certain to channel the presence of grandma.', '20.00', '108', 2),
    ('STRUDEL LORRAINE', 'Breakfast never tasted so good.  Eggs, cream, spinach, sundried tomatoes and Swiss cheese are skillfully combined to create this unique and delicious strudel.', '20.00', '109', 2),
    ('SALMON DUXELLES STRUDEL', 'We take the freshest salmon seasonally available and add a sauté of diced mushroom and shallots teamed with chardonnay and cream and finish them with roasted red pepper and wrap in a delicate puff pastry.', '20.00', '110', 2),
    ('MUCHO BURRITO STRUDEL', 'Lean ground beef, onions, black beans, diced tomatoes, salsa and chipotle chili combined with Cheddar and Monterrey Jack cheeses make this a wonderful choice for the spicy appetite.', '20.00', '111', 2); 

INSERT INTO organization
    (person_id, name, street_address, city, state, zip_code, contact_name, contact_phone, contact_email)
VALUES
    (2, 'Eagan HS', '4185 Braddock Trail', 'Eagan', 'MN', '55123', 'Jim', '123-456-7890', 'test@email.com'),
    (3, 'Orono-Mound Swim Team', '685 N. Old Crystal Bay Road', 'Long Lake', 'MN', '55356', 'Jodene', '123-456-7890', 'test@email.com'),
    (3, 'Orono-Mound Schools', '685 N. Old Crystal Bay Road', 'Long Lake', 'MN', '55356', 'Jodene', '123-456-7890', 'test@email.com'),
    (4, 'Twin Cities German Immersion School', '1031 Como Avenue', 'St.Paul', 'MN', '55103', 'Dana', '123-456-7890', 'test@email.com'),
    (5, 'St. Pascals Troop 294 Boy Scouts', '1757 Conway Street', 'St.Paul', 'MN', '55106', 'John', '123-456-7890', 'test@email.com');

INSERT INTO campaign
    (organization_id,url,name,date_start,date_end,notes,info_url,goal)
VALUES
    (1,'eaganhsfall2018','Eagan HS fall 2018 drive','10-1-2018','11-1-2018','n/a','http://www.eaganhs.portal.rschooltoday.com/','10,000.00'),
    (1,'eaganhssummer2018','Eagan HS Summer 2018 drive','6-1-2018','7-1-2018','lots of apple','http://www.eaganhs.portal.rschooltoday.com/','4,000'),
    (2,'orono-mound-swim-team','Orono-Mound Swim Team Spring 2019','4-1-19','4-21-19','n/a','https://sites.google.com/a/orono.k12.mn.us/boys-swim-dive/','1,000'),
    (3,'oms-dance-winter-2018','Orono-Mound Schools Dance Winter 2019','1-7-2019','2-7-2019','may need extra strawberries','https://www.westonka.k12.mn.us/','2,500.00'),
    (3,'oms-baseball-summer-2018','Orono-Mound Schools Baseball Summer 2018','5-1-18','6-1-18','n/a','https://www.westonka.k12.mn.us/','2,000.00'),
    (3,'oms-choir-winter 2018','Orono-Mound Schools Choir Winter 2018','11-14-18','12-7-18','May need extra chicken','https://www.westonka.k12.mn.us/','1,500.00'),
    (4,'tcgis-spring-2018-drive','Twin Cities German Immersion School Spring 2018 Drive','3-1-18','4-1-18','n/a','https://www.tcgis.org/','5000'),
    (4,'tcgis-summer-2018-drive','Twin Cities German Immersion School Summer 2018 Drive','6-1-18','6-30-18','n/a','https://www.tcgis.org/','5000'),
    (4,'tcgis-fall-2018-drive','Twin Cities German Immersion School Summer 2018 Drive','9-1-18','9-30-18','n/a','https://www.tcgis.org/','5000'),
    (4,'tcgis-winter-2017-drive','Twin Cities German Immersion School Winter 2017 Drive','12-1-18','1-7-18','n/a','https://www.tcgis.org/','7500'),
    (5,'stpascals-troop-294','St. Pascals Troop 294 Boy Scouts Drive','2-1-18','2-28-18','new client make good strudel','http://www.troop294.net/index.php','750.00');

INSERT INTO available_item
    (campaign_id,product_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 10),
    (1, 7),
    (1, 8),
    (1, 9),
    (1, 11),
    (2, 1),
    (2, 2),
    (2, 3),
    (2, 4),
    (2, 5),
    (2, 7),
    (2, 8),
    (2, 9),
    (2, 10),
    (2, 11),
    (3, 2),
    (3, 3),
    (3, 4),
    (3, 5),
    (3, 6),
    (3, 7),
    (3, 8),
    (3, 9),
    (3, 10),
    (3, 12),
    (4, 5),
    (4, 4),
    (4, 3),
    (4, 2),
    (4, 1),
    (4, 12),
    (4, 11),
    (4, 10),
    (4, 9),
    (4, 8),
    (5, 1),
    (5, 2),
    (5, 3),
    (5, 4),
    (5, 5),
    (5, 6),
    (5, 7),
    (5, 8),
    (5, 9),
    (5, 10),
    (6, 2),
    (6, 4),
    (6, 6),
    (6, 10),
    (6, 1),
    (6, 3),
    (6, 12),
    (6, 11),
    (6, 9),
    (6, 8),
    (7, 1),
    (7, 2),
    (7, 3),
    (7, 5),
    (7, 6),
    (7, 7),
    (7, 8),
    (7, 9),
    (7, 10),
    (7, 11),
    (8, 3),
    (8, 2),
    (8, 4),
    (8, 5),
    (8, 6),
    (8, 10),
    (8, 11),
    (8, 12),
    (8, 9),
    (8, 7),
    (9, 12),
    (9, 10),
    (9, 9),
    (9, 8),
    (9, 7),
    (9, 3),
    (9, 4),
    (9, 2),
    (9, 5),
    (9, 1),
    (10, 11),
    (10, 10),
    (10, 9),
    (10, 8),
    (10, 7),
    (10, 6),
    (10, 5),
    (10, 4),
    (10, 3),
    (10, 2),
    (11, 9),
    (11, 8),
    (11, 1),
    (11, 2),
    (11, 4),
    (11, 7),
    (11, 3),
    (11, 10),
    (11, 11),
    (11, 6);


INSERT INTO customer
    (campaign_id,notes,street_address,city,state,zip_code,name,email_address,name_of_reference)
VALUES
    (4,'will pick up at school','123 fake street','Eagan','MN','55123','Lou V Strudel','LouS@email.com','billy west'),
    (4,'I love strudel','124 fake street','Eagan','MN','55123','Janite FFace','JFF@email.com','timmothy FF'),
    (4,'will pick up at school','125 fake street','Eagan','MN','55123','Greg B','GB@email.com','Luke B'),
    (4,'will pick up at school','125 fake street','Eagan','MN','55123','Greg B','GB@email.com','Luke B'),
    (4,'will pick up at school','126 fake street','Eagan','MN','55123','Biron Rundel','BiRun@email.com','billy west'),
    (7,'deliver to my summer home please','1010 sunny Drive','Phoenix','AZ','85001','tom Zut', 'TZ@email.com','no contact'),
    (7,'will pickup at school','111 great plains blvd','Eagan','MN','55123','Buyer 1', 'B1@email.com','Frankie M'),
    (7,'I like strudel','124 fake street','Eagan','MN','55123','Janite FFace', 'JFF@email.com','Timmothy FF'),
    (7,'Timmy FF will deliver','123 super old way','Eagan','MN','55123','Andy FF', 'AFF@email.com','Timmothy FF'),
    (11,'pick up','','','','','Joe T','JT@email.com','jake L'),
    (11,'pick up','','','','','Jill T','JillT@email.com','jake L'),
    (11,'pick up','','','','','Frank T','FT@email.com','jake L'),
    (11,'pick up','','','','','Zoe T','ZT@email.com','jake L');


INSERT INTO "order"
    (customer_id,available_item_id,quantity)
VALUES
    (1, 31, 2),
    (1, 32, 3),
    (2, 35, 1),
    (2, 38, 2),
    (2, 31, 3),
    (3, 31, 1),
    (3, 32, 1),
    (3, 33, 1),
    (3, 34, 1),
    (3, 35, 1),
    (3, 36, 1),
    (3, 37, 1),
    (3, 38, 1),
    (3, 39, 1),
    (3, 40, 1),
    (4, 31, 1),
    (4, 32, 1),
    (4, 33, 1),
    (4, 34, 1),
    (4, 35, 1),
    (4, 36, 1),
    (4, 37, 1),
    (4, 38, 1),
    (4, 39, 1),
    (4, 40, 1),
    (5, 37, 1),
    (6, 70, 2),
    (6, 65, 3),
    (6, 61, 1),
    (7, 64, 4),
    (7, 62, 4),
    (8, 69, 1),
    (9, 63, 2),
    (9, 65, 3),
    (10, 101, 2),
    (10, 102, 2),
    (10, 103, 2),
    (10, 104, 2),
    (10, 105, 2),
    (10, 109, 2),
    (10, 110, 2),
    (10, 108, 2),
    (11, 101, 10),
    (12, 110, 5),
    (12, 109, 5),
    (13, 108, 20);
