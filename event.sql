CREATE Table event (
  event_id INT NOT NULL,
  CONSTRAINT pk_event_id PRIMARY KEY (event_id),
  location_code CHAR(6) NOT NULL,
  CONSTRAINT fk_location_code FOREIGN KEY (location_code) REFERENCES location (location_code),
  event_description VARCHAR(120) NOT NULL,
  event_precious_accounted_for CHAR CHECK (event_was_precious_present IN (0,1)) NOT NULL,
  event_timestamp TIMESTAMP(0) NOT NULL
);

CREATE SEQUENCE seq_event_id;

INSERT INTO event (event_id, location_code, event_description, event_was_precious_present, event_timestamp)
  VALUES (seq_event_id.NEXTVAL, 'npoldr', 'I was trying to sell boondoggle keychains to earn money for college.', '1', TIMESTAMP '2014-12-24 09:30:00');
INSERT INTO event (event_id, location_code, event_description, event_was_precious_present, event_timestamp)
  VALUES (seq_event_id.NEXTVAL, 'npoldr', 'I was fighting crime.', '1', TIMESTAMP '2015-06-01 09:30:00');
INSERT INTO event (event_id, location_code, event_description, event_was_precious_present, event_timestamp)
  VALUES (seq_event_id.NEXTVAL, 'batcav', 'Attended a wild party in The BatCave', '1', TIMESTAMP '2015-06-01 10:30:00');
INSERT INTO event (event_id, location_code, event_description, event_was_precious_present, event_timestamp)
  VALUES (seq_event_id.NEXTVAL, 'lndma2', 'I washed a soiled sleeping bag', '1', TIMESTAMP '2015-06-01 12:30:00');
INSERT INTO event (event_id, location_code, event_description, event_was_precious_present, event_timestamp)
  VALUES (seq_event_id.NEXTVAL, 'bdroad', 'I gave an elderly couple a ride into town from the Hole in the Rock Road', '1', TIMESTAMP '2015-06-02 13:30:00');
  
  UPDATE event SET event_was_precious_present = '0'
  WHERE event_timestamp  >= to_timestamp('2015-06-01', 'YY-MM-DD') AND event_timestamp < to_timestamp('2015-06-02', 'YY-MM-DD');

