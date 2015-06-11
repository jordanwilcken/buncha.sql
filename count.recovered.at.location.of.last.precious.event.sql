/***** How many times did I recover my precious at the last location where I knew I had it?  Let's show the precious description and the location description *****/
get recovery time and then get the first event before that has a corresponding precious_event
get the descriptions if the location for our recovery matches the location for our event

SELECT precious_description, location_description

SELECT location_description
FROM location WHERE(
  recovery_location_code = (event_location_code
                                         SELECT event_location_code
                                         FROM event
                                         INNER JOIN precious_event ON precious_event.precious_id
                                        )
);


SELECT event_id, event_timestamp, precious_id, recovery_timestamp
FROM (
  SELECT event.event_id, event.event_timestamp, recovery.precious_id, recovery.recovery_timestamp
  FROM event
    INNER JOIN precious_event ON event.event_id = (
      SELECT event_id_inner FROM (
        SELECT e2.event_id FROM event e2
          INNER JOIN precious_event p_e2 ON recovery.precious_id = p_e2.precious_id
        WHERE e2.event_timestamp < recovery.recovery_timestamp
        ORDER BY e2.event_timestamp DESC
      )
      WHERE ROWNUM = '1'
      )
    INNER JOIN recovery ON precious_event.precious_id = recovery.precious_id
  WHERE recovery.recovery_timestamp > event.event_timestamp
);

FROM precious_id IN (SELECT precious_id FROM recovery)

