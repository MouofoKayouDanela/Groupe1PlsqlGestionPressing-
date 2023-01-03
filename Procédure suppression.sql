declare
v_count number;
v_sql varchar2(100);

begin
select count * int v_count from user_tables ;
if v_count>0 
v_sql:='delete from table';
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
else
v_sql : = 'create table (col 1 number)';
dbms_output_put_line(v_sql);
execute immediate v_sql
end if;
end;