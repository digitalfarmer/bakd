 SELECT *  FROM ms_personil mp 
                INNER JOIN ms_jabatan mj ON mp.kode_jabatan=mj.kode_jabatan  
                WHERE mj.nama_jabatan="FS"
                AND mp.na_personil="F" LIMIT 1  ;


SELECT*FROM ms_personil;
SELECT*FROM ;