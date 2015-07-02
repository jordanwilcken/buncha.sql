/***** Between what two events did I lose my currently lost antique cans? - I've not completed this one yet. *****/

SELECT last_precious_event.event_description AS last_had_event,
             first_lost_event.event_description AS first_lost_event
FROM (
            SELECT ROW_NUMBER() OVER (ORDER BY event_timestamp DESC) as row_num,
                         event.event_id,
                         event_description,
                         event_timestamp
            FROM event
              INNER JOIN precious_event ON precious_event.event_id = event.event_id
                AND precious_event.precious_id = 21
          ) last_precious_event
  INNER JOIN (
                        SELECT ROW_NUMBER() OVER (ORDER BY event_timestamp ASC) as row_num,
                                     event_id,
                                     event_description,
                                     event_timestamp
                        FROM event
                          WHERE event.event_id NOT IN (
                                                                           SELECT event.event_id
                                                                           FROM event
                                                                             INNER JOIN precious_event ON precious_event.event_id = event.event_id
                                                                               AND precious_event.precious_id = 21
                                                                         )
                      ) first_lost_event ON first_lost_event.event_timestamp > last_precious_event.event_timestamp
WHERE last_precious_event.row_num = 1 AND first_lost_event.row_num = 1;