DELETE FROM `sl_faktur_detail` WHERE `No_Faktur` = 'FKBDG/202007/14057' AND  `Kode_Barang` = 'CFL-CBE-01' ; 
DELETE FROM `sl_surat_pesanan_detail` WHERE `No_SP` = 'SPBDG/202007/15130' AND `Kode_Barang` = 'CFL-CBE-01'; 
DELETE FROM `in_delivery_detail` WHERE `No_Delivery` = 'DOBDG/202007/14462' AND `Kode_Barang` = 'CFL-CBE-01'; 
DELETE FROM `in_delivery_subdetail` WHERE `No_Delivery` = 'DOBDG/202007/14462' AND `Kode_Barang` = 'CFL-CBE-01'; 