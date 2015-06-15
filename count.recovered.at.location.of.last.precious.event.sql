/***** How many times did I recover my precious at the last location where I knew I had it?  Let's show the precious description and the location description
get recovery time and then get the first event before that has a corresponding precious_event
get the descriptions if the location for our recovery matches the location for our event
 *****/
 
SELECT precious.precious_id, precious_description, location_description
FROM precious
  INNER JOIN recovery ON precious.precious_id = recovery.precious_id
  INNER JOIN location ON recovery.location_code = location.location_code
WHERE location.location_code = 
  (SELECT location_code
   FROM 
     (SELECT event.location_code,
                   FIRST_VALUE(event_timestamp) OVER (PARTITION BY precious_event.precious_id ORDER BY event_timestamp DESC) AS last_possession_time
      FROM event
        INNER JOIN precious_event ON event.event_id = precious_event.event_id
        INNER JOIN recovery ON precious_event.precious_id = recovery.precious_id
      WHERE event.event_timestamp < recovery.recovery_timestamp
     )
   WHERE ROWNUM = '1'
  );