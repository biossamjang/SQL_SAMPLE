/*
- ����

 scc , cc : ���� ǥ��

 year : �⵵�� ����� ǥ��

yyyy, yyy, yy, y : �⵵�� �ڸ����� �ڸ���

bc, ad : ���� ������ ǥ��

q : �б� ǥ��

mm : ���ڸ��� ��ǥ��

month: ����� ǥ��

mon: ����� 3�ڸ��� ��ǥ��

rm: �θ��ڷ� ǥ�� i, ii. xi

ww: 1����� ��°�� ǥ��(�Ͽ��Ϻ���)
iw: 1����� ��°�� ǥ��(�����Ϻ���)

w:�Ѵޱ��� ��°�� ǥ��

ddd: 365(1����� ) �� ��° ��

dd: ��¥�� ���ڸ��� ǥ��

d: ������ ���ڷ� ǥ��

dy : ���� ���ڸ��� ǥ��

day: ���� ǥ��

am, pm, a.m. , p.m. : �������� ǥ��

hh, hh12 : 12�� �������� ǥ��

hh24 : 24�� �������� ǥ��

/, "of" : ��¥�� �߰��� ���� ǥ�� -> to_char(to_date('19951201', 'yyyymmdd'),'yyyy "of" mm/dd')

spth : ��¥�� ���� ������ ǥ��

sp : ��¥�� ���� ���ڷ� ǥ��

��)
select TRUNC(SYSDATE,'day') from dual;
*/

SELECT TO_CHAR(SYSDATE, 'MONTH'), TO_CHAR(SYSDATE, 'MON') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'DDD'), TO_CHAR(SYSDATE, 'DD'), TO_CHAR(SYSDATE, 'w') FROM DUAL;



-- ���ڿ� ��¥������ �ð� ���ϱ�
select (to_date('2009050309','yyyymmddhh')-to_date('2005090409', 'yyyymmddhh'))*24
from dual;
;

-- ��¥�� �ð����ϱ�
select to_char(to_date('200905021120', 'yyyymmddhh24mi'),  'yyyymmddhh24mi'),
to_char(to_date('200905021120', 'yyyymmddhh24mi') + (115/1440), 'yyyymmddhhmi') from dual;



-- ��¥�� ���ϱ�
select
  to_date('20090301', 'yyyymmdd')+1 - to_date('20090225', 'yyyymmdd')
from dual;
-->���⼭ �Ϸ�ġ�� ���ѰŴ� �׸����� ���� �����ϱ� ���� �Ϸ縦 ���ؾ��Ѵ�



-- ������ ���ϱ�
select months_between(to_date('20090131', 'yyyymmdd'), to_date('20090201', 'yyyymmdd')) from dual;



-- �״��� ������ ��¥ ���ϱ�
select to_char(last_day(to_date('20090201','yyyymmdd')), 'yyyymmdd')
from dual;

select to_char(last_day(to_date('20090201','yyyymmdd')), 'mm')
from dual;

select to_char(last_day(to_date('20090201','yyyymmdd')), 'dd')
from dual;



-- �Ϸ縦 ���߰��ϰ� 2�� ���� ���ڱ��ϱ�
select to_char(add_months(to_date('20090201','yyyymmdd')+1, 2), 'yyyymmdd')
from dual;



-- �Ϸ縦 ���߰��ϰ� 2�� ���� ���ڱ��ϱ�
select to_char(add_months(to_date('20090201','yyyymmdd')+1, 2), 'yyyymmdd')
from dual;


-- �ش��Ϻ��� 2�� ���� ���ڱ��ϱ�
select to_char(add_months(to_date('20090201','yyyymmdd'),2), 'yyyymmdd')
from dual;



-- months_between : �γ�¥���� �޼� ���ϱ�

select  ROUND(months_between (SYSDATE, to_date('20150101', 'yyyymmdd')))
from dual;



-- next_day Ư�����ڿ��� ���尡��� ������ ���� ã��
select next_day(to_date('20150527','yyyymmdd'), '��') from dual;



--�̹� ���� ��ó���� ���� ���
select TRUNC(SYSDATE,'day') from dual;


--
SELECT EXTRACT ( YEAR FROM SYSDATE ) FROM DUAL;

SELECT EXTRACT ( MONTH FROM DATE '2012-05-05' ) FROM DUAL;

SELECT EXTRACT ( DAY FROM SYSDATE ) FROM DUAL;



 select
       to_char(SYSDATE , 'YYYY-MM-DD HH24:MI:SS') A1  --��������
       ,to_char(add_months(SYSDATE, -3), 'yyyy-mm-dd') A2 -- 3����
       ,TO_CHAR(SYSDATE - INTERVAL '3' YEAR, 'YYYY-MM-DD') A3    -- 3����
       ,TO_CHAR(SYSDATE + INTERVAL '3' YEAR, 'YYYY-MM-DD') A4    -- 3����
       ,TO_CHAR(SYSDATE - INTERVAL '01:30' MINUTE TO SECOND , 'YYYY-MM-DD HH24:MI:SS') A5  -- 1�� 30����
       ,TO_CHAR(SYSDATE - INTERVAL '01:30' HOUR TO MINUTE , 'YYYY-MM-DD HH24:MI:SS') A6    -- 1�ð� 30����
from dual;