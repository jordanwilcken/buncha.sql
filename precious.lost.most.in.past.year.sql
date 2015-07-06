SELECT * FROM (
  SELECT recovery.precious_id,
               precious_description,
               COUNT(recovery.precious_id) as recovery_count
  FROM precious
    INNER JOIN recovery ON recovery.precious_id = precious.precious_id
  WHERE recovery.recovery_timestamp > SYSDATE - INTERVAL '1' YEAR
  GROUP BY recovery.precious_id, precious_description
  ORDER BY recovery_count DESC
) most_recovered_items INNER JOIN (
  SELECT MAX(COUNT(precious_id)) as count
  FROM recovery
  GROUP BY precious_id
) highest_recovery_count ON highest_recovery_count.count = most_recovered_items.recovery_count;
               