SELECT precious.precious_id,
             precious_description,
             (SELECT COUNT(recovery.precious_id)
              FROM recovery
              WHERE recovery.recovery_timestamp > TO_TIMESTAMP('2015-01-01', 'YYYY-MM-DD')
                AND recovery.precious_id = precious.precious_id) + precious_is_lost AS loss_count
FROM precious;