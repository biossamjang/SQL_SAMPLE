with T as (
select to_date('2015-07-24 10:20:54','YYYY-MM-DD HH24:MI:SS') Dt from dual union all
select to_date('2015-07-26 10:25:54','YYYY-MM-DD HH24:MI:SS') Dt from dual union all
select to_date('2015-07-25 10:15:54','YYYY-MM-DD HH24:MI:SS') Dt from dual
)
SELECT sysdate + AVG(DT - sysdate) FROM T;


