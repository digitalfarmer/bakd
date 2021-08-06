UPDATE `sl_faktur_detail` SET `Jumlah` = '1' WHERE `No_Faktur` = 'FKPTI/202007/18978'  AND `Kode_Barang` = 'FFI-SKM-01' ; 
UPDATE `sl_surat_pesanan_detail` SET `Jumlah` = '1' WHERE `no_sp` = 'SPPTI/202007/20324'  AND `Kode_Barang` = 'FFI-SKM-01' ; 
UPDATE `in_delivery_detail` SET `Jumlah` = '1' WHERE `no_delivery` = 'DOPTI/202007/18752'  AND `Kode_Barang` = 'FFI-SKM-01' ; 
UPDATE `in_delivery_subdetail` SET `Jumlah` = '1' WHERE `no_delivery` = 'DOPTI/202007/18752'  AND `Kode_Barang` = 'FFI-SKM-01' ; 