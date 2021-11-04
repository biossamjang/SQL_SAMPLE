WITH TEMP AS
(
select
  extract(DAY from end_date- start_date) AS DAY
, extract(hour from end_date- start_date) AS HH
, extract(minute from end_date - start_date) AS MI
, extract(second from end_date - start_date) AS SS
, A.*
  from anam_cdw_ods.cdw_log a
order by log_no
)

SELECT CASE WHEN DAY > 0 THEN DAY||'일' || CASE WHEN HH > 0 THEN HH||'시간' || CASE WHEN MI > 0 THEN MI||'분' || CASE WHEN SS > 0 THEN SS||'초'
                                                                                                                                ELSE '0'
                                                     					                                                 END
                                                                                              ELSE CASE WHEN SS > 0 THEN SS||'초'
                                                                                                                    ELSE '0'
                                                     					                                      END
                                                                              END
                                                           ELSE CASE WHEN MI > 0 THEN MI||'분' || CASE WHEN SS > 0 THEN SS||'초'
                                                                                                                  ELSE '0'
                                                     					                                     END
                                                                                 ELSE CASE WHEN SS > 0 THEN SS||'초'
                                                                                                       ELSE '0'
                                                     					                         END
                                                                END
                                          END
                         ELSE CASE WHEN HH > 0 THEN HH||'시간' || CASE WHEN MI > 0 THEN MI||'분' || CASE WHEN SS > 0 THEN SS||'초'
                                                                                                                   ELSE '0'
                                                     					                                     END
                                                                                  ELSE CASE WHEN SS > 0 THEN SS||'초'
                                                                                                        ELSE '0'
                                                     					                          END
                                                                  END
                                               ELSE CASE WHEN MI > 0 THEN MI||'분' || CASE WHEN SS > 0 THEN SS||'초'
                                                                                           ELSE '0'
                                                     					                        END
                                                                     ELSE CASE WHEN SS > 0 THEN SS||'초'
                                                                                           ELSE '0'
                                                     					             END
                                                     END
                               END
        END as "소요시간"
      , T.*
  FROM TEMP T
  ORDER BY T.LOG_NO