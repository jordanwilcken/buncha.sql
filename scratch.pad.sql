SELECT lost_thing_description AS lost_item,
       location_description AS where_found
FROM lost_thing
  INNER JOIN recovery ON lost_thing.LOST_THING_CODE = recovery.LOST_THING_CODE
  INNER JOIN location ON recovery.LOCATION_CODE = location.LOCATION_CODE;
  
SELECT location_description AS best_place_to_look
FROM ( SELECT location_description,
              COUNT(location_description) AS location_count
         FROM location
           INNER JOIN recovery ON location.LOCATION_CODE = recovery.LOCATION_CODE
             GROUP BY location_description
               ORDER BY location_count DESC )
WHERE ROWNUM = 1;

INSERT INTO lost_thing (LOST_THING_CODE, LOST_THING_CATEGORY, LOST_THING_DESCRIPTION)
  VALUES('shdkey', 'accessors', 'It''s the key to the workshed.');
  
SELECT lost_thing_description
FROM lost_thing;

SELECT * FROM recovery;

INSERT INTO lost_thing (LOST_THING_CODE, LOST_THING_CATEGORY, LOST_THING_DESCRIPTION)
  SELECT 'newcod', LOST_THING_CATEGORY, LOST_THING_DESCRIPTION
  FROM lost_thing
  WHERE LOST_THING_CODE = 'nvlcod';

ALTER TABLE recovery
DROP CONSTRAINT fk_lost_thing;

DELETE FROM lost_thing
WHERE LOST_THING_CODE = 'keys';

INSERT INTO recovery (LOST_THING_CODE, LOCATION_CODE) VALUES('frgwlt', 'undabd');

SELECT location_code
FROM
  ( SELECT location_code, location_description
    FROM location ) myTab
WHERE myTab.location_description = 'under my bed';

SELECT some_count
         FROM (SELECT COUNT(DISTINCT lost_thing_description) AS some_count FROM lost_thing);
         
CREATE OR REPLACE VIEW locationView
AS
SELECT *
FROM recovery;

SELECT view_name FROM user_views;

DELETE codes;

INSERT INTO recovery VALUES('sight', 'undabd');
SELECT * FROM locationView;

DROP VIEW codes;
