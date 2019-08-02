
UPDATE sl_surat_pesanan SET Status_SP='BATAL', Status_Tercetak='B' WHERE no_sp IN(
'SPTGL/201808/08851'
);

UPDATE in_delivery SET  Status_Tercetak='B' WHERE no_delivery IN(
'DOTGL/201808/08048'
);

UPDATE sl_faktur SET Status_Tercetak='B' WHERE no_faktur IN(
'FKBDG/201907/00112'
);
UPDATE sl_faktur_pajak SET Status_Tercetak='B' WHERE no_faktur IN(
'FKBDG/201907/00112'
);
SELECT*FROM sl_faktur WHERE no_faktur ='FKBDG/201907/00112';
