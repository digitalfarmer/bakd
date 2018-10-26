UPDATE sl_faktur_retur
SET tipe="SEDERHANA"
WHERE no_faktur_retur IN (
"FRsby/201612/00001"
);

DELETE FROM ac_etax_retur_keluar
WHERE nofakturretur IN (
"FRsby/201612/00001"
);
