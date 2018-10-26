SELECT*FROM sl_faktur WHERE no_faktur="FKSB2/201604/17844" ;
SPSB2/201604/18298;
DOSB2/201604/17239;
SELECT*FROM sl_faktur_detail WHERE no_faktur="FKSB2/201604/17844" AND kode_barang="DBR-POA-02" ;
SELECT*FROM sl_surat_pesanan_detail WHERE no_sp="SPSB2/201604/18298" AND kode_barang="DBR-POA-02";
SELECT*FROM in_delivery_detail WHERE no_delivery="DOSB2/201604/17239" AND kode_barang="DBR-POA-02" ;
SELECT*FROM in_delivery_subdetail WHERE no_delivery="DOSB2/201604/17239" AND kode_barang="DBR-POA-02" ;


SELECT*FROM sl_faktur WHERE no_faktur="FKSB2/201604/10832";
SPSB2/201604/12081  DOSB2/201604/10653;
SELECT*FROM sl_faktur_detail WHERE no_faktur="FKSB2/201604/10832" AND kode_barang="DBR-CLP-03" ;
SELECT*FROM sl_surat_pesanan_detail WHERE no_sp="SPSB2/201604/12081" AND kode_barang="DBR-CLP-03";
SELECT*FROM in_delivery_detail WHERE no_delivery="DOSB2/201604/10653" AND kode_barang="DBR-CLP-03" ;
SELECT*FROM in_delivery_subdetail WHERE no_delivery="DOSB2/201604/10653" AND kode_barang="DBR-CLP-03" ;