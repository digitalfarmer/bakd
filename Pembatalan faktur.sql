SELECT * FROM sl_faktur WHERE no_faktur="FKBKU/201603/00446";


SELECT * FROM sl_faktur_pajak WHERE no_faktur="FKBKU/201603/00446";

#hapus record nominal jika = saldo;
SELECT * FROM ar_penambahan_piutang WHERE no_referensi="FKBKU/201603/00446";

SELECT * FROM sl_faktur WHERE no_faktur="FKBLG/201604/15157";
SPBLG/201604/17235  DOBLG/201604/14974     ;

SELECT * FROM sl_faktur_pajak WHERE no_faktur="FKBLG/201604/15157";
SELECT*FROM sl_surat_pesanan WHERE no_sp="SPBLG/201604/17235";
SELECT*FROM in_delivery WHERE no_delivery="DOBLG/201604/14974";

#hapus record nominal jika = saldo;
SELECT * FROM ar_penambahan_piutang WHERE no_referensi="FKBLG/201604/15157";



