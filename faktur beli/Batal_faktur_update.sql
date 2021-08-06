
UPDATE sl_surat_pesanan SET Status_SP='BATAL', Status_Tercetak='B' WHERE no_sp IN(
'SPBDG/201912/17075'
);

UPDATE in_delivery SET  Status_Tercetak='B' WHERE no_delivery IN(
'DOBDG/201912/15812'
);

UPDATE sl_faktur SET Status_Tercetak='B' WHERE no_faktur IN(
'FKBDG/201912/15548'
);
UPDATE sl_faktur_pajak SET Status_Tercetak='B' WHERE no_faktur IN(
'FKBDG/201912/15548'
);
SELECT*FROM ar_alokasi_detail WHERE no_penambahan ='FKBDG/201912/15548';
SELECT*FROM sl_faktur WHERE no_faktur ='FKBDG/201912/15548';


