SELECT*FROM sl_faktur_kategori WHERE no_faktur IN (
'FKPMS/201802/02186',
'FKPMS/201801/03358',
'FKPMS/201801/01680'

) AND Klasifikasi_Piutang='p3o';

SELECT*FROM ar_klasifikasi_piutang WHERE no_mutasi IN (
SELECT no_mutasi FROM ar_klasifikasi_piutang_detail WHERE no_faktur IN (
'FKPMS/201802/02186',
'FKPMS/201801/03358',
'FKPMS/201801/01680'
)) AND Klasifikasi_Akhir='p3o';