CREATE Table recovery (
  lost_thing_code char(6) NOT NULL,
  location_code   char(6) NOT NULL,
  CONSTRAINT fk_lost_thing FOREIGN KEY (lost_thing_code) REFERENCES lost_thing (lost_thing_code),
  CONSTRAINT fk_location   FOREIGN KEY (location_code)   REFERENCES location (location_code),
  CONSTRAINT pk_recovery   PRIMARY KEY (lost_thing_code, location_code)
);

INSERT INTO recovery (lost_thing_code, location_code) VALUES (
  'keys',
  'undabd'
);
