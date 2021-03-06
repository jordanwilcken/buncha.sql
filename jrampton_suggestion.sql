SELECT *
  FROM (
        SELECT R.PRECIOUS_ID,
               P.PRECIOUS_DESCRIPTION,
               RL.LOCATION_DESCRIPTION RECOVERY_LOCATION_DESCRIPTION,
               R.RECOVERY_TIMESTAMP,
               W.EVENT_ID,
               W.LOCATION_DESCRIPTION LAST_EVENT_LOCATION_DECRIPTION,
               W.EVENT_TIMESTAMP LAST_EVENT_TIMESTAMP,
               W.EVENT_DESCRIPTION LAST_EVENT_DESCRIPTION,
               ROW_NUMBER() OVER (PARTITION BY R.ROWID ORDER BY W.EVENT_TIMESTAMP DESC) RN /* IDENTIFY MOST RECENT EVENT TO RECOVERY */
          FROM RECOVERY R, /* WHEN WAS I RECOVERED AND WHERE */
               (
                /* WHERE HAVE I BEEN */
                SELECT PE.PRECIOUS_ID,
                       L.LOCATION_DESCRIPTION,
                       E.EVENT_DESCRIPTION,
                       E.EVENT_TIMESTAMP,
                       E.EVENT_ID
                  FROM event E,
                       precious_event PE,
                       LOCATION L
                 WHERE E.event_id = PE.event_id
                   AND E.LOCATION_CODE = L.LOCATION_CODE
                ) W,
                LOCATION RL,
                PRECIOUS P
          WHERE R.PRECIOUS_ID = W.PRECIOUS_ID /* WHAT WAS RECOVERED */
            AND R.RECOVERY_TIMESTAMP > W.EVENT_TIMESTAMP /* GET ALL EVENTS PRIOR TO RECOVERY */
            AND R.LOCATION_CODE = RL.LOCATION_CODE
            AND R.PRECIOUS_ID = P.PRECIOUS_ID
        )
 WHERE RN = 1 /* ONLY RETURN MOST RECENT EVENT TO RECOVERY */
;
    
SELECT P.PRECIOUS_ID,
       P.PRECIOUS_DESCRIPTION,
       RL.LOCATION_DESCRIPTION RECOVERY_LOCATION_DESCRIPTION,
       R.RECOVERY_TIMESTAMP,
       E.EVENT_ID,
       EL.LOCATION_DESCRIPTION LAST_EVENT_LOCATION_DECRIPTION,
       E.EVENT_TIMESTAMP LAST_EVENT_TIMESTAMP,
       E.EVENT_DESCRIPTION LAST_EVENT_DESCRIPTION
  FROM RECOVERY R,
       LOCATION RL,
       LOCATION EL,
       EVENT E,
       PRECIOUS P
 WHERE R.LOCATION_CODE = RL.LOCATION_CODE
   AND R.PRECIOUS_ID = P.PRECIOUS_ID
   AND E.LOCATION_CODE = EL.LOCATION_CODE
   AND E.EVENT_ID = (/* FIND MOST RECENT EVENT BEFORE RECOVERY */
                     SELECT MAX(XE.EVENT_ID)
                       FROM event XE,
                            PRECIOUS_EVENT XPE
                      WHERE XE.EVENT_ID = XPE.EVENT_ID
                        AND XE.EVENT_TIMESTAMP < R.RECOVERY_TIMESTAMP
                        AND XPE.PRECIOUS_ID = R.PRECIOUS_ID);