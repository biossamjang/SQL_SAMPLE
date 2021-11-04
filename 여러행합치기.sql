
 select 
-- xmlagg(xmlelement())
        sql_id 
        , listagg(sql_text, '') within group (order by sql_id, piece)
--        ,sql_text
--        ,xmlagg(xmlelement())
   from v$sqltext
 group by sql_id