SELECT*FROM `ar_alokasi` WHERE  no_alokasi="ALJK1/201701/15836";
SELECT*FROM `ar_alokasi_detail` WHERE  no_alokasi="ALJK1/201701/15836";
SELECT no_alokasi, SUM(`Jumlah_Alokasi`) FROM `ar_alokasi_detail`  WHERE no_alokasi="ALJK1/201701/15836" GROUP BY `no_alokasi`;