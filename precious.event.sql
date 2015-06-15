CREATE Table precious_event (
  precious_id INT NOT NULL,
  CONSTRAINT fk_precious_id3 FOREIGN KEY (precious_id) REFERENCES precious (precious_id),
  event_id INT NOT NULL,
  CONSTRAINT fk_event_id2 FOREIGN KEY (event_id) REFERENCES event (event_id),
  CONSTRAINT pk_precious_event PRIMARY KEY (precious_id, event_id)
);

INSERT INTO precious_event (precious_id, event_id)
  SELECT precious.precious_id, event.event_id
  FROM precious, event
  WHERE ROWNUM < 20;
  
  SELECT * FROM precious_event;
