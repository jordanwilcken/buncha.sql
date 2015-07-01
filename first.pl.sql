DECLARE
  myVar varchar(20) := 'hey dude!';
BEGIN
  DBMS_OUTPUT.put_line(myVar);
END;
/

CREATE OR REPLACE FUNCTION
  multiply (arg1 IN INT, arg2 IN INT)
  RETURN INT
IS
BEGIN
  RETURN arg1 * arg2;
END multiply;
/

BEGIN
  DBMS_OUTPUT.put_line(multiply(3, 6));
END;
/

DROP FUNCTION multiply;

CREATE OR REPLACE FUNCTION
  getPrecedingEventId (preciousId IN INT, recoveryTimestamp IN TIMESTAMP)
  RETURN INT
IS
  eventId INT;
BEGIN
  SELECT preceding_events.event_id
  INTO eventId
  FROM
    (
      SELECT event.event_id
      FROM event
        INNER JOIN precious_event ON event.event_id = precious_event.event_id
          AND precious_event.precious_id = preciousId
      WHERE event_timestamp < recoveryTimestamp
    ) preceding_events
  WHERE ROWNUM = 1;
  
  RETURN eventId;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN -1;
END getPrecedingEventId;
/

BEGIN
  DBMS_OUTPUT.put_line(multiply(3, 6));
END;
/

BEGIN
DBMS_OUTPUT.put_line(GETPRECEDINGEVENTID(7, to_timestamp('2015-06-04', 'YYYY-MM-DD')));
END;
/

SELECT preceding_events.event_id
  FROM
    (
      SELECT event.event_id
      FROM event
        INNER JOIN precious_event ON event.event_id = precious_event.event_id
          AND precious_event.precious_id = 7
      WHERE event_timestamp < to_timestamp('2015-06-04', 'YYYY-MM-DD')
      ORDER BY event.event_timestamp DESC
    ) preceding_events
  WHERE ROWNUM = 1;
