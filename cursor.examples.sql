/**** Implicit Cursor *****/
DECLARE
  first_precious precious%ROWTYPE;
BEGIN
  SELECT *
  INTO first_precious
  FROM precious
  WHERE ROWNUM = '1';
  
  DBMS_OUTPUT.put_line (
      first_precious.precious_description);
END;
/
/**** Implicit Cursor *****/

/***** Implicit Cursor to get all multiple rows in a table *****/
DECLARE
BEGIN
  FOR recovery_rec IN (
    SELECT *
    FROM recovery)
  LOOP
    DBMS_OUTPUT.put_line(recovery_rec.location_code);
  END LOOP;
END;
/
/***** Implicit Cursor to get all multiple rows in a table *****/

/***** Function to return cursor for getting events *****/
CREATE OR REPLACE FUNCTION get_event_cursor
  RETURN SYS_REFCURSOR
IS
  the_cursor SYS_REFCURSOR;
BEGIN
  OPEN the_cursor FOR
    SELECT *
    FROM
    event;
    
  return the_cursor;
END;
/

DECLARE
  the_cursor SYS_REFCURSOR;
  the_event event%ROWTYPE;
BEGIN
  the_cursor := get_event_cursor();
  
  LOOP
    FETCH the_cursor INTO the_event;
    
    EXIT WHEN the_cursor%NOTFOUND;
    DBMS_OUTPUT.put_line(the_event.location_code);
  END LOOP;
END;
/
/***** Function to return cursor for getting events *****/