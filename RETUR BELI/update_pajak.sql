-- SELECT*FROM pc_retur_beli_pajak WHERE No_Retur_Beli IN(
UPDATE `bisskb`.`pc_retur_beli_pajak` SET `No_Faktur_Pajak` = '010.033-16.24822681' ,`Tgl_Faktur_Pajak` = '2018-08-02' WHERE `No_Retur_Beli` IN(
'PB/SKB/FFI/FFI/2018/08/0002'
);

-- SELECT*FROM pc_nota_retur_pajak WHERE No_Nota_Retur IN(
UPDATE `bisskb`.`pc_nota_retur_pajak` SET `No_Faktur_Pajak` = '010.033-16.24822681' WHERE `No_Nota_Retur` IN(
'PN/SKB/FFI/FFI/2018/08/0002'
);
-- SELECT*FROM pc_debit_note_detail WHERE No_Debit_Note IN(
UPDATE `bisskb`.`pc_debit_note_detail` SET `No_Faktur_Pajak` = '010.033-16.24822681' WHERE `No_Debit_Note` IN(
'DNPST/201808/00129'
);