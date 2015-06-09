CREATE Table loss_story (
  loss_story_id INT NOT NULL,
  CONSTRAINT pk_loss_story_id PRIMARY KEY (loss_story_id),
  precious_id INT NOT NULL,
  CONSTRAINT fk_precious_id2 FOREIGN KEY (precious_id) REFERENCES precious (precious_id)
);

CREATE SEQUENCE seq_loss_story_id;

INSERT INTO loss_story (loss_story_id, precious_id)
  SELECT seq_loss_story_id.NEXTVAL, precious_id FROM precious WHERE precious.PRECIOUS_IS_LOST = '1';
