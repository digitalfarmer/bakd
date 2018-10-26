
SELECT*FROM  `in_stock_opname_selisih`WHERE  `kode_barang` ='NFI-thc-09';no_sp='spcrb/201608/14856';
SELECT*FROM `in_stok_barang` WHERE kode_barang='NFI-thc-09' AND STATUS='available' AND kode_gudang='CRB08';
SELECT spd.*,sp.`Status_SP`,`tgl_sp`FROM sl_surat_pesanan_detail spd INNER JOIN sl_surat_pesanan sp ON spd.no_sp =sp.no_sp  WHERE   status_sp IN('Batal pengiriman', 'siap cetak') AND tgl_sp >='2016-07-01' AND`kode_barang`='NFI-thc-09';
SELECT*FROM `ms_depo` LIMIT 10;