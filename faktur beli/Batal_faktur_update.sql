SELECT*FROM sl_faktur WHERE no_faktur ='FKTGL/201808/08020';
UPDATE sl_surat_pesanan SET Status_SP='BATAL', Status_Tercetak='B' WHERE no_sp IN(
'SPTGL/201808/08851'
);

UPDATE in_delivery SET  Status_Tercetak='B' WHERE no_delivery IN(
'DOTGL/201808/08048'
);

UPDATE sl_faktur SET Status_Tercetak='B' WHERE no_faktur IN(
'FKTGL/201808/08020'
);
