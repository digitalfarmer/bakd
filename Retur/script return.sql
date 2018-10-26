/*
NOte
1: BATAL RETUR JUAL
   masukan nomor TR
   cek minimal harus ada TR, RJ
 
*/
 
SET @no_fr="RSjk2/200707/00183";
 
SELECT 
    fr.no_faktur_retur,
    fr.total_teralokasi,
    fr.total_faktur_retur,
    kp.saldo,
    rb.no_brb,
    tbr.no_tbr,
    tbr.no_brb_manual
INTO
    @no_fr,
    @alokasi,
    @total,
    @saldo,
    @no_brb,
    @no_tbr,
    @brb
FROM sl_retur_barang rb
LEFT JOIN sl_faktur_retur fr ON fr.no_brb=rb.no_brb
LEFT JOIN ar_pengurangan_piutang kp ON kp.no_referensi=fr.no_faktur_retur
LEFT JOIN sl_terima_barang_retur tbr ON tbr.no_tbr=rb.no_tbr
WHERE (1=1)
-- and fr.no_faktur_retur=@no_fr;
AND rb.no_tbr="TRPLB/201110/00411";
 
SET @no_fr="RSjk2/200707/00183";
 
SELECT 
    fr.no_faktur_retur,
    fr.total_teralokasi,
    fr.total_faktur_retur,
    kp.saldo,
    rb.no_brb,
    tbr.no_tbr,
    tbr.no_brb_manual
FROM sl_retur_barang rb
LEFT JOIN sl_faktur_retur fr ON fr.no_brb=rb.no_brb
LEFT JOIN ar_pengurangan_piutang kp ON kp.no_referensi=fr.no_faktur_retur
LEFT JOIN sl_terima_barang_retur tbr ON tbr.no_tbr=rb.no_tbr
WHERE (1=1)
-- and fr.no_faktur_retur=@no_fr;
AND rb.no_tbr="TRPLB/201110/00395";
 
-- ------ BAKD
;
SET 
@no_fr:="FRSMG/201010/00045", 
@no_brb="RJJK1/201110/00738",-- 12-09-2011
@no_tbr="TRJK1/201110/00598";-- 06-09-2011
 
SELECT * FROM sl_faktur_retur WHERE no_faktur_retur=@no_fr;
SELECT * FROM sl_faktur_retur_detail WHERE no_faktur_retur=@no_fr;
 
SELECT * FROM sl_nota_retur WHERE no_faktur_retur=@no_fr;
SELECT * FROM sl_nota_retur_plgn WHERE no_nota_retur=@no_fr;
SELECT * FROM ar_pengurangan_piutang WHERE no_referensi=@no_fr;
 
SELECT * FROM sl_retur_barang WHERE no_brb=@no_brb;
SELECT * FROM sl_retur_barang_detail WHERE no_brb=@no_brb;
 
SELECT * FROM sl_terima_barang_retur WHERE no_tbr=@no_tbr;
SELECT * FROM sl_terima_barang_retur_detail WHERE no_tbr=@no_tbr;
SELECT * FROM sl_terima_barang_retur_nr WHERE no_tbr=@no_tbr;
 
SELECT * FROM sl_terima_barang_retur WHERE no_tbr LIKE 'TRJK1/201109/%' ORDER BY no_tbr DESC LIMIT 5;
SELECT * FROM sl_retur_barang WHERE no_brb LIKE 'RJJK1/201109/%' ORDER BY no_brb DESC LIMIT 5;
 
-- cek di apakah ada FR nya jika status di sl_terima_barang_retur tidak 'NOTA RETUR PAJAK'
SELECT * FROM sl_faktur_retur WHERE no_brb = @no_brb;
 
SELECT * FROM sl_ppbo_detail WHERE no_tbr=@no_tbr;
 
SHOW TABLES WHERE Tables_in_bisplb LIKE '%jenis%';
SELECT * FROM ms_jenis_retur;
 
 
-- ------ Cari PPN
;
SELECT
ROUND((SUM(frd.harga_barang*frd.jumlah*(1-IFNULL(frd.diskon_barang,0)/100)*(1-IFNULL(frd.diskon_tambahan,0)/100))-IFNULL(fr.potongan,0))*(1-IFNULL(fr.diskon,0)/100)*(IFNULL(fr.ppn,0)/100)) PPN
FROM sl_faktur_retur fr,
sl_faktur_retur_detail frd
WHERE fr.no_faktur_retur=frd.no_faktur_retur
AND fr.no_faktur_retur=@no_fr;
 
-- ----- Cari Total FR
;
SELECT ROUND((SUM(frd.jumlah*frd.harga_barang*(1-frd.diskon_barang/100)*(1-frd.diskon_tambahan/100))-fr.potongan)*(1-fr.diskon/100)*(1+fr.ppn/100)+fr.materai) total
FROM sl_faktur_retur fr, sl_faktur_retur_detail frd
WHERE fr.no_faktur_retur=@no_fr
AND fr.no_faktur_retur=frd.no_faktur_retur;
 
-- ----- Cari Total RJ
;
SELECT ROUND((SUM(rbd.jumlah*rbd.harga_barang*(1-rbd.diskon_barang/100)*(1-rbd.diskon_tambahan/100))-rb.potongan)*(1-rb.diskon_brb/100)*(1+rb.ppn/100)+rb.materai) total
FROM sl_retur_barang rb, sl_retur_barang_detail rbd
WHERE rb.no_brb=@no_brb
AND rb.no_brb=rbd.no_brb;
 
-- ----- update sl_retur_barang_detail
UPDATE sl_retur_barang_detail
SET HNA=harga_barang*jumlah,
HNADisc=harga_barang*jumlah*(1-IFNULL(diskon_barang,0)/100)*(1-IFNULL(diskon_tambahan,0)/100)
WHERE no_brb=@no_brb ;
 
-- ----- update sl_faktur_retur_detail
UPDATE sl_faktur_retur_detail
SET HNA=harga_barang*jumlah,
HNADisc=harga_barang*jumlah*(1-IFNULL(diskon_barang,0)/100)*(1-IFNULL(diskon_tambahan,0)/100)
WHERE no_faktur_retur=@no_fr;
