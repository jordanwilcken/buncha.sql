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

/***** LOCATION *****/
INSERT INTO LOCATION (location_code, location_description) VALUES (
  'npoldr', 'Napoleon Dynamit''es front doorstep'
);
/***** LOCATION *****/

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

CREATE SEQUENCE seq_precious_id;

CREATE TABLE seq_toy (
  the_id int,
  CONSTRAINT pk_id PRIMARY KEY (the_id)
);

INSERT INTO seq_toy VALUES(seq_id_seq.NEXTVAL);
SELECT * FROM story_event;

SELECT * FROM precious;

DROP SEQUENCE seq_id_seq;

SELECT table_name FROM dba_tables ORDER BY table_name DESC;

DROP TABLE lost_thing;

ALTER TABLE event ADD CONSTRAINT pk_event_id PRIMARY KEY (event_id);

/*All event descriptions for stories of losing previous with id 1
*/
SELECT event_description FROM event
INNER JOIN loss_story_event ON event.EVENT_ID = loss_story_event.event_id
INNER JOIN loss_story ON loss_story_event.LOSS_STORY_ID = loss_story.LOSS_STORY_ID
INNER JOIN precious ON loss_story.PRECIOUS_ID = precious.PRECIOUS_ID AND precious.PRECIOUS_ID = 1
GROUP BY event_description;

/***** Between what two events did I lose my currently lost antique cans? - I've not completed this one yet. *****/

             
/*** getting stories where the precious is stilll accounted for at the point of the last event - this doesn't work yet****/
SELECT loss_story_id
FROM loss_story
WHERE ( 
  (SELECT event_timestamp AS last_time_accounted_for
  FROM (
    SELECT event_timestamp
    FROM event
    INNER JOIN LOSS_STORY_EVENT ON event.event_id = loss_story_event.EVENT_ID AND loss_story_event.loss_story_id = loss_story_id
    WHERE event.event_precious_accounted_for = '1'
    ORDER BY event.event_timestamp DESC )
  WHERE ROWNUM = '1' )
>
  (
  SELECT event_timestamp AS last_unaccounted_for
  FROM (
    SELECT event_timestamp
    FROM event INNER JOIN LOSS_STORY_EVENT ON event.event_id = loss_story_event.EVENT_ID AND loss_story_event.loss_story_id = loss_story_id
    WHERE event.event_precious_accounted_for = '0' 
    ORDER BY event.event_timestamp DESC )
  WHERE ROWNUM = '1' )
  );
  
  SELECT * FROM event
  INNER JOIN loss_story_event ON event.EVENT_ID = loss_story_event.EVENT_ID AND loss_story_event.LOSS_STORY_ID = '1'
  ORDER BY event_timestamp ASC;
  
  SELECT event_timestamp AS last_time_accounted_for
  FROM (
    SELECT event_timestamp
    FROM event
    INNER JOIN LOSS_STORY_EVENT ON event.event_id = loss_story_event.EVENT_ID AND loss_story_event.LOSS_STORY_ID = '1'
    WHERE event.event_precious_accounted_for = '1'
    ORDER BY event.event_timestamp DESC )
  WHERE ROWNUM = '1';
  
   SELECT event_timestamp AS last_unaccounted_for
  FROM (
    SELECT event_timestamp
    FROM event INNER JOIN LOSS_STORY_EVENT ON event.event_id = loss_story_event.EVENT_ID AND loss_story_event.LOSS_STORY_ID = '1'
    WHERE event.event_precious_accounted_for = '0'
    ORDER BY event.event_timestamp DESC )
  WHERE ROWNUM = '1' ;
  
SELECT loss_story_id
FROM loss_story
WHERE (to_timestamp('2015-06-02', 'YYYY-MM-DD') > to_timestamp('2015-06-01', 'YYYY-MM-DD'));
  
/***** Between what two events did I lose my currently lost antique cans? *****/

SELECT * FROM loss_story;

RENAME story_event TO loss_story_event;
SELECT * FROM loss_story_event;
DELETE loss_story_event;

/***** EVENT *****/
DROP TABLE event;

SELECT COUNT(event_id) FROM event;
/***** EVENT *****/

CREATE TABLE dum_table (
  the_id INT NOT NULL);
  
  ALTER TABLE dum_table ADD CONSTRAINT constr_pk PRIMARY KEY (the_id);
  INSERT INTO dum_table (the_id) VALUES(23);
  
  CREATE TABLE refers_to_dum (
  dum_id INT NOT NULL,
  CONSTRAINT dum_contstraint FOREIGN KEY (dum_id) REFERENCES dum_table (the_id) ON DELETE CASCADE
  );
  ALTER TABLE refers_to_dum ADD other_varchar VARCHAR(100);
  
  INSERT INTO refers_to_dum (dum_id, some_varchar, other_varchar) VALUES(23, 'I am some', 'and I am other');
  
  DELETE dum_table;
  SELECT * FROM refers_to_dum;