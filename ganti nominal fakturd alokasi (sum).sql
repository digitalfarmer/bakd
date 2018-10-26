SELECT * FROM ms_offset_piutang ; CHECK jenis kode OFFSET;
SELECT * FROM ar_offset WHERE no_offset="OFBLG/201604/06378";

SELECT*FROM ar_pengurangan_piutang WHERE no_referensi="OFBLG/201604/06378";
SELECT*FROM ar_alokasi WHERE no_pengurangan="KPBLG/201604/00268";
SELECT*FROM ar_alokasi_detail WHERE no_alokasi="ALBLG/201604/13356";
SELECT 532463+1041205.000;
