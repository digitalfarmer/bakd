SELECT*FROM sl_terima_barang_retur WHERE no_tbr="TRBJM/201806/00080";
SELECT*FROM sl_terima_barang_retur_detail WHERE no_tbr="TRBJM/201806/00080";

SELECT*FROM `sl_terima_barang_retur_nr` WHERE no_tbr="TRJK2/201612/01474";
 SELECT*FROM `ms_jenis_retur`;
SELECT*FROM sl_retur_barang WHERE no_brb ='RJBJM/201806/00137';
SELECT*FROM sl_retur_barang_detail WHERE no_brb="RJBJM/201806/00137";

SELECT *FROM sl_faktur_retur WHERE no_faktur_retur ='FRBJM/201806/00127';
SELECT*FROM `sl_faktur_retur_detail` WHERE no_faktur_retur ='FRBJM/201806/00127';

#untuk rubah tanggal
SELECT*FROM   `sl_nota_retur`WHERE no_faktur_retur="FRJK2/201703/00389";
SELECT*FROM   `sl_nota_retur_plgn`WHERE `no_nota_retur`="FRBJM/201806/00127";


SELECT*FROM `ar_pengurangan_piutang` WHERE `no_referensi`="FRJK2/201703/00312";
No_TBR              Kode_Barang  Satuan  Batch   Jumlah  Jumlah_Diterima  Tgl_Kadaluarsa  No_Faktur           No_Faktur_Pajak   Kode_Personil  Jenis_Retur                       Penggantian  Keterangan  Alasan_Tolak  Status_Barang  P3BO    Pengajuan_P3BO  Harga_Barang  Diskon_Barang  Diskon_Tambahan  Potongan  Cash_Diskon  Pembebanan_PPN  Tgl_Pajak   
------------------  -----------  ------  ------  ------  ---------------  --------------  ------------------  ----------------  -------------  --------------------------------  -----------  ----------  ------------  -------------  ------  --------------  ------------  -------------  ---------------  --------  -----------  --------------  ------------
TRMDN/201512/00159  MPM-FIT-01   SACHET  B014HO      20               20  2017-08-01      FKSMD/201501/06288  0100001548509060  09LAM          ISI/KEMASAN RUSAK, BELUM EXPIRED  PIUTANG                                REJECT         TIDAK                0      1664.950          0.000            0.000     0.000        0.000                  2015-01-31  
TRMDN/201512/00159  MPM-JRG-01   STRIP   BKEO         1                1  2018-05-01      FKSMD/201501/06288  0100001548509060  09LAM          ISI/KEMASAN RUSAK, BELUM EXPIRED  PIUTANG                                REJECT         TIDAK                0      1665.000          0.000            0.000     0.000        0.000                  2015-01-31  ;
