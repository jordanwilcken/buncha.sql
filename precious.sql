CREATE Table precious (
  precious_id char(6) NOT NULL,
  CONSTRAINT pk_id PRIMARY KEY (precious_id),
  precious_category varchar(20),
  precious_description varchar(50)
);

INSERT INTO precious (lost_thing_code, lost_thing_category, lost_thing_description) VALUES (
  seq_precious_id.NEXTVALUE,
  'accessor',
  'all of my keys and the keyring they are on'
);
