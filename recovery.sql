CREATE Table recovery (
  precious_id INT NOT NULL,
  location_code char(6) NOT NULL,
  recovery_timestamp TIMESTAMP(0) NOT NULL,
  CONSTRAINT fk_precious_id FOREIGN KEY (precious_id) REFERENCES precious (precious_id),
  CONSTRAINT fk_location   FOREIGN KEY (location_code)   REFERENCES location (location_code),
  CONSTRAINT pk_recovery   PRIMARY KEY (precious_id, recovery_timestamp)
);

INSERT INTO recovery (precious_id, location_code, recovery_timestamp)
  VALUES(1, 'batcav', TIMESTAMP '2014-08-06 11:32:00');
INSERT INTO recovery (precious_id, location_code, recovery_timestamp)
  VALUES(7, 'bdroad', TIMESTAMP '2015-06-04 00:00:00');
INSERT INTO recovery (precious_id, location_code, recovery_timestamp)
  VALUES(8, 'lndmat', TIMESTAMP '2015-05-13 13:13:13');
INSERT INTO recovery (precious_id, location_code, recovery_timestamp)
  VALUES(9, 'npoldr', TIMESTAMP '2015-03-17 17:17:17');
INSERT INTO recovery (precious_id, location_code, recovery_timestamp)
  VALUES(10, 'undabd', TIMESTAMP '2014-12-31 12:12:12');