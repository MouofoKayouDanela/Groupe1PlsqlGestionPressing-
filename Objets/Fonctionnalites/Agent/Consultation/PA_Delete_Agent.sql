CREATE OR REPLACE PROCEDURE Delete_Agent
(
    id IN agent.id%type
)
AS 
    BEGIN 
        DELETE FROM agent where id = id ;
        IF SQL%ROWCOUNT = 1 THEN 
            DBMS_OUTPUT.PUT_LINE('succes !');
            END IF ;
                EXCEPTION 
                WHEN OTHERS THEN 
                DBMS_OUTPUT.PUT_LINE('error occurred deleteAgent : '||SQLERRM);
                END ;
/
