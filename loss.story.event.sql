CREATE Table story_event (
  loss_story_id INT NOT NULL,
  event_id INT NOT NULL,
  CONSTRAINT fk_loss_story_id FOREIGN KEY (loss_story_id) REFERENCES loss_story (loss_story_id),
  CONSTRAINT fk_event_id   FOREIGN KEY (event_id) REFERENCES event (event_id),
  CONSTRAINT pk_loss_story_event_id PRIMARY KEY (loss_story_id, event_id)
);

INSERT INTO story_event (loss_story_id, event_id)
  SELECT loss_story.loss_story_id, event.event_id
  FROM loss_story, event;
