
-- 해당월 첫날, 마지막 날
SELECT TRUNC(TO_DATE(:YY||:MM,'YYYYMM'), 'MM'), LAST_DAY(TO_DATE(:YY||:MM,'YYYYMM')) 
  FROM DUAL
;
  
--  예시
  SELECT * FROM SEHRMGR.SZRESULMT
 WHERE 1=1
   AND ORDR_YMD BETWEEN TRUNC(TO_DATE(:YY||:MM,'YYYYMM'), 'MM') AND LAST_DAY(TO_DATE(:YY||:MM,'YYYYMM')) 