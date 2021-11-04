-- 오라클

select * from 테이블 as of timestamp to_timestamp('2017-11-20 08:00:00','YYYY-MM-DD HH24:MI:SS')
 ;

-- 티베로

SELECT * FROM 테이블 AS OF TIMESTAMP(SYSTIMESTAMP - INTERVAL '5' MINUTE)