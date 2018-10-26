SELECT*FROM fi_bank_cair WHERE no_cair="BM/TGL/MDR06/01/2016/06/01357";

SELECT*FROM fi_bank_masuk WHERE no_bbm="BBJMB/201603/00980";
SELECT*FROM ar_pengurangan_piutang WHERE no_referensi="BBJMB/201603/00980";

SELECT*FROM fi_bukti_bank_keluar WHERE no_bbk="12/bk/mdrpt1/0316/013";
SELECT*FROM fi_bukti_bank_keluar  LIMIT 5;
SELECT*FROM fi_kas_bank_print  WHERE no_referensi="BBTGL/201606/01514";
