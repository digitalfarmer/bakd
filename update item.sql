#SELECT *FROM in_delivery_subdetail WHERE no_delivery="DOSB2/201604/14845";

/*update total tagihan*/
        UPDATE sl_faktur f 
        SET f.total_tagihan=
        ROUND( 
          ( 
            ( 
              SELECT 
              SUM(jumlah*harga_barang*(1-diskon_tertera_standar/100)*(1-diskon_tertera_tambahan/100)) 
              FROM sl_faktur_detail df 
              WHERE df.no_faktur=f.no_faktur 
            )- 
            f.potongan 
          )* 
          (1-f.diskon/100)  
        )+ 
        ( 
          SELECT 
          ROUND( 
            ( 
              SUM( 
                jumlah*harga_barang* 
                (1-diskon_tertera_standar/100)* 
                (1-diskon_tertera_tambahan/100) 
              )- 
              f.potongan 
            )* 
            (1-f.diskon/100)* 
            f.ppn/100 
          ) 
          FROM sl_faktur_detail df 
          WHERE df.no_faktur=f.no_faktur 
        )+ 
        f.materai 
        WHERE f.no_faktur IN (
'FKPLB/201608/10543'
);

/*faktur_pajak*/
        UPDATE
        sl_faktur_pajak fp
	SET fp.jml_pajak=
	(SELECT 
          ROUND( 
            ( 
              SUM( 
                jumlah*harga_barang* 
                (1-diskon_tertera_standar/100)* 
                (1-diskon_tertera_tambahan/100) 
              )- 
              f.potongan 
            )* 
            (1-f.diskon/100)* 
            f.ppn/100 
          ) 
          FROM sl_faktur_detail df, sl_faktur f 
          WHERE df.no_faktur=f.no_faktur 
          AND f.no_faktur=fp.no_faktur
	)
	WHERE fp.no_faktur IN (
'FKPLB/201608/10543'

);

UPDATE
ar_penambahan_piutang pp, sl_faktur f
SET
pp.nominal_awal=f.total_tagihan,	
pp.saldo=f.total_tagihan-f.total_bayar
WHERE 
pp.no_referensi=f.no_faktur AND f.no_faktur IN 
(
'FKPLB/201608/10543'
);

UPDATE sl_surat_pesanan sp
LEFT JOIN sl_faktur f ON f.no_referensi=sp.no_sp
SET sp.total_harga=f.total_tagihan
WHERE f.no_faktur IN 
(
'FKPLB/201608/10543'
);