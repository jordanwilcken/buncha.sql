CREATE Table event (
  event_id INT NOT NULL,
  event_description VARCHAR(120) NOT NULL,
  event_was_precious_present CHAR CHECK (event_was_precious_present IN (0,1)) NOT NULL
);

CREATE SEQUENCE seq_event_id;

INSERT INTO event (event_id, event_description, event_was_precious_present)
  VALUES (seq_event_id.NEXTVAL, 'I was trying to sell boondoggle keychains to earn money for college.', '1');
