DECLARE
  job_no number;
BEGIN

	DBMS_JOB.SUBMIT( job_no 
					,'ANAM_CDW.P_CDW_MAIN();'  /* 프로시저의 인자값이 있는 경우 인자값 입력 */
					, SYSDATE              /* 시작시간 */
					, 'TRUNC(SYSDATE + 1) + 8/24'    /* repeat_interval : 매일 오전 8시  */
					, TRUE);               /* parsing 시점 */

END;