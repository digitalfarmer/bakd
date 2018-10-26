SELECT*FROM sl_terima_barang_retur WHERE no_tbr="TRBGR/201610/00611";
SELECT*FROM sl_terima_barang_retur_detail WHERE no_tbr="TRBGR/201610/00611";
   No_TBR              Kode_Barang  Satuan  Batch   Jumlah  Jumlah_Diterima  Tgl_Kadaluarsa  No_Faktur  No_Faktur_Pajak   Kode_Personil  Jenis_Retur                       Penggantian  Keterangan  Alasan_Tolak  Status_Barang  P3BO    Pengajuan_P3BO  Harga_Barang  Diskon_Barang  Diskon_Tambahan  Potongan  Cash_Diskon  Pembebanan_PPN  Tgl_Pajak   
------------------  -----------  ------  ------  ------  ---------------  --------------  ---------  ----------------  -------------  --------------------------------  -----------  ----------  ------------  -------------  ------  --------------  ------------  -------------  ---------------  --------  -----------  --------------  ------------
TRBGR/201610/00611  MPM-AJR-01   DUS     Z002CO       1                1  2017-03-01      NA         0100001619032536  82315035       ISI/KEMASAN RUSAK, BELUM EXPIRED  PIUTANG                                REJECT         TIDAK                0  5335.000      0.000          0.000            0.000     0.000                        2016-07-15  ;

SELECT*FROM sl_retur_barang WHERE no_brb="RJBGR/201610/00699";
SELECT*FROM sl_nota_retur WHERE no_faktur_retur='FRBGR/201610/00542';
SELECT*FROM sl_retur_barang_detail WHERE no_brb="RJBGR/201610/00699";

SELECT*FROM sl_faktur_retur WHERE no_faktur_retur="NA";
SELECT*FROM `sl_faktur_retur_detail` WHERE no_faktur_retur="FRBGR/201610/00542";


#untuk rubah tanggal
SELECT*FROM   `sl_nota_retur`WHERE no_faktur_retur="FRsby/201612/00002";
SELECT*FROM `ar_pengurangan_piutang` WHERE `no_referensi`='FRBGR/201610/00542';

SELECT*FROM `ar_pengurangan_piutang` WHERE `no_referensi`="FRBGR/201610/00542";
No_TBR              Kode_Barang  Satuan  Batch   Jumlah  Jumlah_Diterima  Tgl_Kadaluarsa  No_Faktur           No_Faktur_Pajak   Kode_Personil  Jenis_Retur                       Penggantian  Keterangan  Alasan_Tolak  Status_Barang  P3BO    Pengajuan_P3BO  Harga_Barang  Diskon_Barang  Diskon_Tambahan  Potongan  Cash_Diskon  Pembebanan_PPN  Tgl_Pajak   
------------------  -----------  ------  ------  ------  ---------------  --------------  ------------------  ----------------  -------------  --------------------------------  -----------  ----------  ------------  -------------  ------  --------------  ------------  -------------  ---------------  --------  -----------  --------------  ------------
TRMDN/201512/00159  MPM-FIT-01   SACHET  B014HO      20               20  2017-08-01      FKSMD/201501/06288  0100001548509060  09LAM          ISI/KEMASAN RUSAK, BELUM EXPIRED  PIUTANG                                REJECT         TIDAK                0      1664.950          0.000            0.000     0.000        0.000                  2015-01-31  
TRMDN/201512/00159  MPM-JRG-01   STRIP   BKEO         1                1  2018-05-01      FKSMD/201501/06288  0100001548509060  09LAM          ISI/KEMASAN RUSAK, BELUM EXPIRED  PIUTANG                                REJECT         TIDAK                0      1665.000          0.000            0.000     0.000        0.000                  2015-01-31  ;
