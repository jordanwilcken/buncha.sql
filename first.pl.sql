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
