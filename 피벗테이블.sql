WITH TEMP_TABLE AS (

SELECT (TO_DATE('20140101','YYYYMMDD') + LEVEL-1) DTE

   FROM DUAL

    CONNECT BY LEVEL-1 <= TO_DATE('20141231','YYYYMMDD') - TO_DATE('20140101','YYYYMMDD')

)


--���� ���ϰǼ� (PIVOT �̿�)

SELECT *

   FROM (

  SELECT to_char(DTE,'MM') || '��' MON

              , decode(to_char(DTE,'D'),'1','��','2','��','3','ȭ','4','��','5','��','6','��','7','��') WEEK

              , DTE

     FROM TEMP_TABLE

              )

PIVOT

(

COUNT(DTE)

FOR WEEK IN ('��','��','ȭ','��','��','��','��')

)

    ORDER BY MON
