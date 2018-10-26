SELECT*FROM fi_bukti_kas_keluar  WHERE no_bkk IN('44/kk/0816/013','44/kk/0816/014');#hapus
SELECT*FROM fi_bukti_kas_keluar_detail  WHERE no_bkk IN('44/kk/0816/013','44/kk/0816/014');#hapus
SELECT*FROM `fi_bukti_kas_masuk_saldo`WHERE `No_BKM`='BKBEK/201608/00012'; #samain saldo
SELECT*FROM fi_bukti_kas_masuk_saldo WHERE  no_bkm IN(
'BKKDR/201607/00024','BKKDR/201607/00025'
);#saldo awal dan akhir harus sama