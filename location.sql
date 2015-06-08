CREATE Table location (
  location_code char(6) NOT NULL,
  CONSTRAINT location_code PRIMARY KEY (location_code),
  location_description varchar(50)
);

INSERT INTO location (location_code, location_description) VALUES ( 'undabd', 'under my bed' );
INSERT INTO location (location_code, location_description) VALUES ( 'npoldr', 'Napoleon Dynamite''s front doorstep' );
INSERT INTO location (location_code, location_description) VALUES ( 'batcav', 'The BatCave' );
INSERT INTO location (location_code, location_description) VALUES ( 'lndmat', 'the laundromat' );
INSERT INTO location (location_code, location_description) VALUES ( 'lndma2', 'the laundromat' );
INSERT INTO location (location_code, location_description) VALUES ( 'bdroad', 'hole in the rock road, Escalante' );
