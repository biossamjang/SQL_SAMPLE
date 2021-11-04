SELECT ddf.tablespace_name "Tablespace Name",
        ddf.bytes/1024/1024 "Bytes(MB)",
        (ddf.bytes - dfs.bytes)/1024/1024 "Used(MB)",
        round(((ddf.bytes - dfs.bytes) / ddf.bytes) * 100, 2) "Percent(%)",
        dfs.bytes/1024/1024 "Free(MB)",
        round((1 - ((ddf.bytes - dfs.bytes) / ddf.bytes)) * 100, 2) "Free(%)",
        ROUND(ddf.MAXBYTES / 1024/1024,2) "MaxBytes(MB)"
FROM
       (SELECT tablespace_name, sum(bytes) bytes, sum(maxbytes) maxbytes
          FROM dba_data_files
         GROUP BY tablespace_name) ddf,
       (SELECT tablespace_name, sum(bytes) bytes
          FROM dba_free_space
         GROUP BY tablespace_name) dfs
WHERE ddf.tablespace_name = dfs.tablespace_name
ORDER BY 1;