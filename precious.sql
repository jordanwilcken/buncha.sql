CREATE Table precious (
  precious_id INT NOT NULL,
  CONSTRAINT pk_precious_id PRIMARY KEY (precious_id),
  precious_category VARCHAR(20),
  precious_description VARCHAR(50),
  precious_is_lost CHAR CHECK (precious_is_lost in (0,1)) NOT NULL
);

BEGIN
FOR i IN 1..5 LOOP
  INSERT INTO precious (precious_id, precious_is_lost) VALUES(
    seq_precious_id.NEXTVAL,
    1);
END LOOP;
END;