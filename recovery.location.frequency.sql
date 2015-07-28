SELECT location.location_code,
             location_description,
             COUNT(recovery.location_code) AS recoveries_here
FROM location
  INNER JOIN recovery ON recovery.location_code = location.location_code
GROUP BY location.location_code, location.location_description
ORDER BY recoveries_here DESC;