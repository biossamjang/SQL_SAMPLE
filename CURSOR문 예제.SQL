DECLARE
    CURSOR C1
    IS
        SELECT DISTINCT PTNO FROM ANAM_CDW.TEST_DATA1 A
        WHERE 1=1
          AND NOT EXISTS (SELECT 1 FROM MDPADIAGT X WHERE A.PTNO = X.PTNO)
          and rownum < 1000
          ;
    BEGIN
        FOR R1 IN C1
        LOOP
            INSERT INTO MDPADIAGT
            SELECT * FROM SEHRMGR.MDPADIAGT@CDWLINK
            WHERE 1=1
              AND PTNO = R1.PTNO
              ;
   
            DBMS_OUTPUT.PUT_LINE(R1.PTNO);
        END LOOP;
    

END;