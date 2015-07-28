SELECT location_frequency.location_description,
             location_frequency.event_count,
             max_frequency.mx
FROM (
SELECT location_description,
             COUNT (event.location_code) AS event_count
FROM location
  INNER JOIN event ON event.location_code = location.location_code
GROUP BY location_description
) location_frequency
INNER JOIN (SELECT MAX(COUNT(location_code))  AS mx FROM event GROUP BY location_code) max_frequency ON location_frequency.event_count = max_frequency.mx;