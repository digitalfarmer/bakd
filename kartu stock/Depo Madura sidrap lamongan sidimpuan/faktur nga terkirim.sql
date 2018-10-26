# Kirim ulang (Exim) faktur Depo Pasif Plus
SELECT dpo.* 
FROM
  sy_faktur_depo dpo 
  INNER JOIN sl_faktur fk ON fk.`No_Faktur`=dpo.`No_Faktur`
  INNER JOIN ms_pelanggan pg ON pg.`Kode_Pelanggan`=fk.`Kode_Pelanggan`
WHERE 
  #fk.Tgl_Faktur='2016-10-25'
  fk.`No_Faktur` BETWEEN'FKSB2/201706/10425' AND 'FKSB2/201706/10464'
  AND pg.`No_Depo`=1;	