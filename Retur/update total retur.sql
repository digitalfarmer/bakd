UPDATE sl_faktur_retur_detail
SET HNA=harga_barang*jumlah,
HNADisc=harga_barang*jumlah*(1-IFNULL(diskon_barang,0)/100)*(1-IFNULL(diskon_tambahan,0)/100)
WHERE
no_faktur_retur IN (
"FRSMG/201503/00142"
);

UPDATE sl_retur_barang_detail 
SET HNA=harga_barang*jumlah, 
HNADisc=harga_barang*jumlah*(1-IFNULL(diskon_barang,0)/100)*(1-IFNULL(diskon_tambahan,0)/100) 
WHERE no_brb IN (
"RJSMG/201502/01431"
);




UPDATE sl_faktur_retur fr
SET fr.total_faktur_retur=
(
  SELECT 
  ROUND((SUM(frd.jumlah*frd.harga_barang*(1-frd.diskon_barang/100)*(1-frd.diskon_tambahan/100))-fr.potongan)*(1-fr.diskon/100)*(1+fr.ppn/100)+fr.materai) total
  FROM sl_faktur_retur_detail frd
  WHERE frd.no_faktur_retur=fr.no_faktur_retur
)
-
IFNULL(
(
  SELECT
  IFNULL(ROUND( 
    ( 
     SUM( 
         frd.jumlah*frd.harga_barang* 
         (1-IFNULL(frd.diskon_barang,0)/100)* 
         (1-IFNULL(frd.diskon_tambahan,0)/100) 
     )-
     IFNULL(fr.potongan,0) 
    )* (1-IFNULL(fr.diskon,0)/100)* IFNULL(fr.ppn,0)/100 
  ),0) 
  FROM sl_faktur_retur_detail frd, sl_faktur f 
  WHERE frd.no_faktur_retur=fr.no_faktur_retur 
  AND f.no_faktur=fr.no_faktur 
  AND EXISTS  
      (
       SELECT bb.bebas_ppn 
       FROM ms_barang_bebas_ppn bb 
       WHERE bb.bebas_ppn="YA" 
       AND bb.kode_barang=frd.kode_barang 
       AND f.tgl_faktur BETWEEN DATE(bb.tgl_mulai_berlaku) AND DATE(bb.tgl_akhir_berlaku) 
      ) 
 GROUP BY frd.no_faktur_retur
),0)
WHERE 
fr.no_faktur_retur IN (
"FRSMG/201503/00142"
);

UPDATE ar_pengurangan_piutang kp,sl_faktur_retur fr
SET kp.nominal_awal=fr.total_faktur_retur,
kp.saldo=fr.total_faktur_retur
WHERE kp.no_referensi=fr.no_faktur_retur
AND kp.no_referensi IN (
"FRSMG/201503/00142"
);

UPDATE sl_nota_retur nr
SET nr.jml_retur=
(
  SELECT 
  ROUND((SUM(frd.harga_barang*frd.jumlah*(1-IFNULL(frd.diskon_barang,0)/100)*(1-IFNULL(frd.diskon_tambahan,0)/100))-IFNULL(fr.potongan,0))*(1-IFNULL(fr.diskon,0)/100)*(IFNULL(fr.ppn,0)/100))  
  FROM sl_faktur_retur fr,
  sl_faktur_retur_detail frd
  WHERE fr.no_faktur_retur=frd.no_faktur_retur
  AND fr.no_faktur_retur=nr.no_faktur_retur
)
WHERE 
nr.no_faktur_retur IN (
"FRSMG/201503/00142"
);

UPDATE sl_retur_barang rb, sl_faktur_retur fr
SET rb.total_harga=fr.total_faktur_retur
WHERE 
fr.no_brb=rb.no_brb
AND fr.no_faktur_retur IN (
"FRSMG/201503/00142"
);
