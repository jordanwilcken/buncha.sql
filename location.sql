CREATE Table location (
  location_code char(6) NOT NULL,
  CONSTRAINT location_code PRIMARY KEY (location_code),
  location_description varchar(50)
);

INSERT INTO location (location_code, location_description) VALUES (
  'undabd',
  'under my bed'
);
