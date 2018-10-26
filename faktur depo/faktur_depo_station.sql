SELECT 
  #concat('''',fkt.No_Faktur,''',') 
  fkt.No_Faktur, dps.No_Depo, CONCAT(dps.Kode_Depo, " - ", dps.Nama_Depo) Depo, dps.Email_Depo, fkt.Tgl_Faktur
FROM sl_faktur fkt
  INNER JOIN sl_surat_pesanan_misc spm ON (spm.No_SP = fkt.No_Referensi)
  INNER JOIN ms_depo dps ON (dps.No_Depo = spm.No_Depo)
  LEFT JOIN sy_faktur_depo fdp ON (fdp.No_Faktur = fkt.No_Faktur)
WHERE
  (fkt.Status_Tercetak <> "B") AND (dps.Jenis_Depo = "STATION")
  #and isnull(fdp.No_Faktur) 
  AND (fkt.Tgl_Faktur>="2017-08-01")
#  and dps.Email_Depo='stokis_bojonegoro@binasanprima.com'
  ;
  SELECT*FROM ms_depo ;
  
  SELECT*FROM `sy_faktur_depo` WHERE `no_faktur`='FKCRB/201708/00007';
