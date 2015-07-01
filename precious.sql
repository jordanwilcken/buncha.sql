CREATE Table precious (
  precious_id INT NOT NULL,
  CONSTRAINT pk_precious_id PRIMARY KEY (precious_id),
  precious_category VARCHAR(20),
  precious_description VARCHAR(50),
  precious_is_lost CHAR CHECK (precious_is_lost in (0,1)) NOT NULL
);

CREATE SEQUENCE seq_precious_id;

INSERT INTO precious (precious_id, precious_is_lost, precious_description) VALUES(seq_precious_id.NEXTVAL, '1', 'antique cans');
INSERT INTO precious (precious_id, precious_is_lost, precious_description) VALUES(seq_precious_id.NEXTVAL, '1', 'Sauron''s Ring');
INSERT INTO precious (precious_id, precious_is_lost, precious_description) VALUES(seq_precious_id.NEXTVAL, '1', 'Boots of Stomping');
INSERT INTO precious (precious_id, precious_is_lost, precious_description) VALUES(seq_precious_id.NEXTVAL, '1', 'The pencil sharpener');
INSERT INTO precious (precious_id, precious_is_lost, precious_description) VALUES(seq_precious_id.NEXTVAL, '1', 'mom''s keys');