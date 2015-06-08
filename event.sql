CREATE Table event (
  event_id INT NOT NULL,
  CONSTRAINT pk_event_id PRIMARY KEY (event_id),
  location_code CHAR(6) NOT NULL,
  CONSTRAINT fk_location_code FOREIGN KEY (location_code) REFERENCES location (location_code),
  event_description VARCHAR(120) NOT NULL,
  event_was_precious_present CHAR CHECK (event_was_precious_present IN (0,1)) NOT NULL
);

CREATE SEQUENCE seq_event_id;

INSERT INTO event (event_id, location_code, event_description, event_was_precious_present)
  VALUES (seq_event_id.NEXTVAL, 'npoldr', 'I was trying to sell boondoggle keychains to earn money for college.', '1');
INSERT INTO event (event_id, location_code, event_description, event_was_precious_present)
  VALUES (seq_event_id.NEXTVAL, 'npoldr', 'I was fighting crime.', '1');