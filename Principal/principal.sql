SELECT*FROM `ms_pelanggan` WHERE nama_pelanggan LIKE'%marguna%';  Kode_Pelanggan='01JA.S008';
SELECT*FROM `ms_pelanggan_npwp` WHERE  Kode_Pelanggan='01JA.M007'; 
SELECT*FROM `ms_principal` WHERE `Nama_Principal` LIKE'%PT. MARGUNA TARULATA APK FARMA%';  Kode_Pelanggan='01JA.S008'; #01 622 053 5 441 000
SELECT*FROM `ms_principal_pajak` WHERE `kode_principal`='CFL';
SELECT*FROM `ms_pelanggan` WHERE `kode_pelanggan`= '01JA.M007';

SELECT*FROM `ac_etax_update` WHERE tanggal='2017-07-13';No_Pengajuan        Tgl_Pengajuan  Kode_Pelanggan  Nama_Faktur_Pajak               Alamat_Pelanggan                       Kode_Kota  Kode_Kec  Kode_Pos  NPWP                  Tgl_NPWP    NPPKP                 STATUS  User_ID           Time_Stamp  Pemungut        Mulai_Berlaku  
------------------  -------------  --------------  ------------------------------  -------------------------------------  ---------  --------  --------  --------------------  ----------  --------------------  ------  -------  -------------------  --------  ---------------------
JKSUB/201706/00001  2017-06-21     01JA.M007       PT. MARGUNA TARULATA APK FARMA  JL. A YANI NO 157 GROBOG KULON, TEGAL  2514                           01 107 642 9 511 000  1985-04-01  01 107 642 9 511 000  POST    WIDIA    2017-06-21 16:25:59  TIDAK       2017-06-01 00:00:00
JKSUB/201707/00001  2017-07-14     01JA.M007       PT. MARGUNA TARULATA APK FARMA  JL. A YANI NO 157 GROBOG KULON, TEGAL  2514                           01 107 642 9 511 000  1985-04-01  01 107 642 9 511 000  POST    widia    2017-07-14 16:57:00  TIDAK       2017-07-01 00:00:00
;
SELECT*FROM `ms_pelanggan_pajak` WHERE  Kode_Pelanggan='01JA.M007';
                                                                                                                                                                                                          ;