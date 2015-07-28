SELECT location_description,
             LISTAGG (event_description, ' | ') WITHIN GROUP (ORDER BY event_description)
FROM EVENT
  INNER JOIN location ON location.location_code = event.location_code
GROUP BY location_description;

SELECT object_name FROM ALL_OBJECTS;