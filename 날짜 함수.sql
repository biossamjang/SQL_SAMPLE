/*
- 형식

 scc , cc : 세기 표현

 year : 년도를 영어로 표현

yyyy, yyy, yy, y : 년도를 자릿수로 자른다

bc, ad : 서기 등으로 표시

q : 분기 표시

mm : 두자리로 월표시

month: 영어로 표시

mon: 영어로 3자리로 월표시

rm: 로마자로 표시 i, ii. xi

ww: 1년기준 몇째주 표시(일요일부터)
iw: 1년기준 몇째주 표시(월요일부터)

w:한달기준 몇째주 표시

ddd: 365(1년기준 ) 의 몇째 일

dd: 날짜를 두자리로 표시

d: 요일을 숫자로 표시

dy : 요일 한자리로 표시

day: 요일 표시

am, pm, a.m. , p.m. : 오전오후 표시

hh, hh12 : 12시 기준으로 표시

hh24 : 24시 기준으로 표시

/, "of" : 날짜의 중간에 문자 표시 -> to_char(to_date('19951201', 'yyyymmdd'),'yyyy "of" mm/dd')

spth : 날짜를 영문 서수로 표시

sp : 날짜를 영문 숫자로 표시

예)
select TRUNC(SYSDATE,'day') from dual;
*/

SELECT TO_CHAR(SYSDATE, 'MONTH'), TO_CHAR(SYSDATE, 'MON') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'DDD'), TO_CHAR(SYSDATE, 'DD'), TO_CHAR(SYSDATE, 'w') FROM DUAL;



-- 날자와 날짜사이의 시간 구하기
select (to_date('2009050309','yyyymmddhh')-to_date('2005090409', 'yyyymmddhh'))*24
from dual;
;

-- 날짜에 시간더하기
select to_char(to_date('200905021120', 'yyyymmddhh24mi'),  'yyyymmddhh24mi'),
to_char(to_date('200905021120', 'yyyymmddhh24mi') + (115/1440), 'yyyymmddhhmi') from dual;



-- 날짜수 구하기
select
  to_date('20090301', 'yyyymmdd')+1 - to_date('20090225', 'yyyymmdd')
from dual;
-->여기서 하루치를 더한거는 그마지막 날을 포함하기 위해 하루를 더해야한다



-- 개월수 구하기
select months_between(to_date('20090131', 'yyyymmdd'), to_date('20090201', 'yyyymmdd')) from dual;



-- 그달의 마지막 날짜 구하기
select to_char(last_day(to_date('20090201','yyyymmdd')), 'yyyymmdd')
from dual;

select to_char(last_day(to_date('20090201','yyyymmdd')), 'mm')
from dual;

select to_char(last_day(to_date('20090201','yyyymmdd')), 'dd')
from dual;



-- 하루를 더추가하고 2달 뒤의 일자구하기
select to_char(add_months(to_date('20090201','yyyymmdd')+1, 2), 'yyyymmdd')
from dual;



-- 하루를 더추가하고 2달 앞의 일자구하기
select to_char(add_months(to_date('20090201','yyyymmdd')+1, 2), 'yyyymmdd')
from dual;


-- 해달일부터 2달 뒤의 일자구하기
select to_char(add_months(to_date('20090201','yyyymmdd'),2), 'yyyymmdd')
from dual;



-- months_between : 두날짜간의 달수 구하기

select  ROUND(months_between (SYSDATE, to_date('20150101', 'yyyymmdd')))
from dual;



-- next_day 특정날자에서 가장가까운 요일의 날자 찾기
select next_day(to_date('20150527','yyyymmdd'), '월') from dual;



--이번 주의 주처음의 날을 취득
select TRUNC(SYSDATE,'day') from dual;


--
SELECT EXTRACT ( YEAR FROM SYSDATE ) FROM DUAL;

SELECT EXTRACT ( MONTH FROM DATE '2012-05-05' ) FROM DUAL;

SELECT EXTRACT ( DAY FROM SYSDATE ) FROM DUAL;



 select
       to_char(SYSDATE , 'YYYY-MM-DD HH24:MI:SS') A1  --현재일자
       ,to_char(add_months(SYSDATE, -3), 'yyyy-mm-dd') A2 -- 3달전
       ,TO_CHAR(SYSDATE - INTERVAL '3' YEAR, 'YYYY-MM-DD') A3    -- 3년전
       ,TO_CHAR(SYSDATE + INTERVAL '3' YEAR, 'YYYY-MM-DD') A4    -- 3년후
       ,TO_CHAR(SYSDATE - INTERVAL '01:30' MINUTE TO SECOND , 'YYYY-MM-DD HH24:MI:SS') A5  -- 1분 30초전
       ,TO_CHAR(SYSDATE - INTERVAL '01:30' HOUR TO MINUTE , 'YYYY-MM-DD HH24:MI:SS') A6    -- 1시간 30분전
from dual;