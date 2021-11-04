WITH TEMP_TABLE AS (

SELECT (TO_DATE('20140101','YYYYMMDD') + LEVEL-1) DTE

   FROM DUAL

    CONNECT BY LEVEL-1 <= TO_DATE('20141231','YYYYMMDD') - TO_DATE('20140101','YYYYMMDD')

)


--월별 요일건수 (PIVOT 이용)

SELECT *

   FROM (

  SELECT to_char(DTE,'MM') || '월' MON

              , decode(to_char(DTE,'D'),'1','일','2','월','3','화','4','수','5','목','6','금','7','토') WEEK

              , DTE

     FROM TEMP_TABLE

              )

PIVOT

(

COUNT(DTE)

FOR WEEK IN ('일','월','화','수','목','금','토')

)

    ORDER BY MON
