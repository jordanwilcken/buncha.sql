CREATE Table lost_thing (
  lost_thing_code char(6) NOT NULL,
  CONSTRAINT pk_code PRIMARY KEY (lost_thing_code),
  lost_thing_category varchar(20),
  lost_thing_description varchar(50)
);

INSERT INTO lost_thing (lost_thing_code, lost_thing_category, lost_thing_description) VALUES (
  'keys',
  'accessor',
  'all of my keys and the keyring they are on'
);
