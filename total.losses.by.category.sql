SELECT precious_category,
             SUM(losses_count)
FROM (
  SELECT precious.*,
               (SELECT COUNT(*)
                FROM recovery
                WHERE recovery.precious_id = precious.precious_id) + precious.precious_is_lost AS losses_count
  FROM precious
)
GROUP BY precious_category;