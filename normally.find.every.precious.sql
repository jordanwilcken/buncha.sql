/*** I want precious_id, precious_description, and a location_description for where I have most often recovered that precious *****/

SELECT precious_id,
             precious_description,
             location_description AS most_likely_place
FROM (
            SELECT precious_id,
                         precious_description,
                         location_description,
                         ROW_NUMBER() OVER (PARTITION BY recovery_location_frequencies.precious_id ORDER BY recovery_location_frequencies.recoveries_at_location DESC) as row_number
            FROM  (
                        SELECT recovery.precious_id,
                                     precious_description,
                                     location_description,
                                     COUNT(recovery.location_code) OVER (PARTITION BY recovery.location_code) AS recoveries_at_location
                        FROM precious
                          INNER JOIN recovery ON recovery.precious_id = precious.precious_id
                          INNER JOIN location ON location.location_code = recovery.location_code
                        ORDER BY recovery.precious_id
                      ) recovery_location_frequencies
          )
WHERE row_number = 1;