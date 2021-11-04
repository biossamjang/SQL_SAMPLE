DECLARE
  job_no number;
BEGIN

	DBMS_JOB.SUBMIT( job_no 
					,'ANAM_CDW.P_CDW_MAIN();'  /* ���ν����� ���ڰ��� �ִ� ��� ���ڰ� �Է� */
					, SYSDATE              /* ���۽ð� */
					, 'TRUNC(SYSDATE + 1) + 8/24'    /* repeat_interval : ���� ���� 8��  */
					, TRUE);               /* parsing ���� */

END;