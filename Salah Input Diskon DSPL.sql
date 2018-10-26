SELECT*FROM sl_faktur_detail WHERE no_faktur="FKDPS/201604/04749";
SPDPS/201604/04612;
DODPS/201604/04837;
ID_Program_Diskon               Kode_Barang  Diskon_Standar  Diskon_Tambahan  Diskon  Tertera_Standar  Tertera_Tambahan  Tertera  Harga_Jadi  Minimum_Harga  Minimum_Jumlah  Minimum_Satuan  BSP_Share  Principal_Share  
------------------------------  -----------  --------------  ---------------  ------  ---------------  ----------------  -------  ----------  -------------  --------------  --------------  ---------  -----------------
PD/DS/DPS/AIM/AIM/2016/04/0070  aim-asp-01            6.000            3.000   8.820            6.000             3.000    8.820  115371.880   12653200.000             100  MASTER BOX          8.820              0.000
;
##check program diskon
SELECT*FROM ms_program_diskon_barang WHERE id_program_diskon="PD/DS/DPS/AIM/AIM/2016/04/0070";

SELECT * FROM sl_surat_pesanan_detail WHERE no_sp="SPDPS/201604/04612";