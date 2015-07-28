/***** I am just trying to order all the combined timestamps from event and recovery *****/
SELECT *
FROM (
  SELECT event_timestamp AS time
  FROM event
  UNION
  SELECT recovery_timestamp as time
  FROM recovery
)
ORDER BY time ASC;

/***** Playing with INTERSECT. Show me preciouses that have precious events. *****/
SELECT precious_id, precious_description
FROM precious
WHERE precious_id IN (
SELECT precious_id
FROM precious
INTERSECT
SELECT precious_id
FROM precious_event);