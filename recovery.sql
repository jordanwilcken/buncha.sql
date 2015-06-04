CREATE Table recovery (
  precious_id INT NOT NULL,
  location_code char(6) NOT NULL,
  CONSTRAINT fk_precious_id FOREIGN KEY (precious_id) REFERENCES precious (precious_id),
  CONSTRAINT fk_location   FOREIGN KEY (location_code)   REFERENCES location (location_code),
  CONSTRAINT pk_recovery   PRIMARY KEY (precious_id, location_code)
);

INSERT INTO recovery (precious_id, location_code)
  SELECT precious_id, 'undabd' FROM precious;
  
  DROP TABLE hold_this;