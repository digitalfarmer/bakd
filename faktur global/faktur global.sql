REPLACE INTO sl_faktur_global
        SELECT 
        f.no_faktur,
        f.tgl_faktur,
        f.kode_divisi_produk,
        f.status_tercetak,
        "SALES" transaksi, 
        IFNULL(f.kode_jenis_jual,"NON TAC") kode_jenis_jual, 
        IFNULL(
         (
           SELECT
           ROUND(SUM(fd.jumlah*fd.harga_barang),0)
           FROM sl_faktur_detail fd
           WHERE fd.no_faktur=f.no_faktur
         ),
         0
         ) hna, 
        IFNULL(
         (
           SELECT
           ROUND(SUM(fd.jumlah*fd.harga_barang*(1-fd.diskon_tertera_standar/100)*(1-fd.diskon_tertera_tambahan/100)),0)
           FROM sl_faktur_detail fd
           WHERE fd.no_faktur=f.no_faktur
         ),
         0
         ) sub_total, 
        IFNULL(
           (
               SELECT
               ROUND(SUM(IF ((1-fd.diskon_tertera_standar/100)*(1-fd.diskon_tertera_tambahan/100)<>0,       fd.jumlah*fd.harga_barang*(1-(1-fd.diskon_tertera_standar/100)*(1-fd.diskon_tertera_tambahan/100)),0)))       FROM sl_faktur_detail fd
               WHERE fd.no_faktur=f.no_faktur
           ),
           0
         ) diskon_item,  
        IFNULL(
         (
           SELECT
           ROUND(SUM(IF(((1-fd.diskon_tertera_standar/100)*(1-fd.diskon_tertera_tambahan/100))=0,
          fd.jumlah*fd.harga_barang*(1-(1-fd.diskon_tertera_standar/100)*(1-fd.diskon_tertera_tambahan/100)),0)))
           FROM sl_faktur_detail fd
           WHERE fd.no_faktur=f.no_faktur
         ),
         0
        ) extra, 
 
        IFNULL(
         ROUND(
           (
             (
               SELECT
               SUM(fd.jumlah*fd.harga_barang*(1-fd.diskon_tertera_standar/100)*(1-fd.diskon_tertera_tambahan/100))
               FROM sl_faktur_detail fd
               WHERE fd.no_faktur=f.no_faktur
             )-
               f.potongan
           )*
           f.diskon/100
         ),
         0 ) cash_diskon, 
        IFNULL(
         (
           SELECT
           ROUND(
                 (
                   SUM(fd.jumlah*fd.harga_barang*(1-fd.diskon_tertera_standar/100)*(1-fd.diskon_tertera_tambahan/100))-
                   f.potongan
                 )*
                 (1-f.diskon/100)*
                  f.ppn/100
           )
           FROM sl_faktur_detail fd
           WHERE fd.no_faktur=f.no_faktur
         ),
         0)
          nom_ppn,
	IF(p.npwp_pelanggan<>"",
	  IF( NOT EXISTS
	      (
		SELECT b.bebas_ppn 
		FROM sl_faktur_detail fd
		INNER JOIN ms_barang b ON b.kode_barang=fd.kode_barang
		WHERE b.bebas_ppn="YA" 
		AND fd.no_faktur=f.No_Faktur
	      ),
	      (
		IF(f_brg_bebasppn(f.no_faktur)<>0,
		   f_brg_bebasppn(f.no_faktur),
		   f_plg_bebasPPN(f.no_faktur)) 
	      ),0)
	,0) PPN_td_STD,
	IF(p.npwp_pelanggan="",
	  IF( NOT EXISTS
	      (
		SELECT b.bebas_ppn 
		FROM sl_faktur_detail fd
		INNER JOIN ms_barang b ON b.kode_barang=fd.kode_barang
		WHERE b.bebas_ppn="YA" 
		AND fd.no_faktur=f.No_Faktur
	      ),
	      (
		IF(f_brg_bebasppn(f.no_faktur)<>0,
		   f_brg_bebasppn(f.no_faktur),
		   f_plg_bebasPPN(f.no_faktur)) 
	      ),
	0),
	0) PPN_TD_SDRHN,
	
	IF(f.kode_divisi_produk IN ("CGR","GAR") OR (f.no_faktur LIKE "%BTM%" AND p.Bebas_PPN="YA"),
         IFNULL(
          (
            SELECT
            ROUND(SUM(fd.jumlah*fd.harga_barang*(1-fd.diskon_tertera_standar/100)*(1-fd.diskon_tertera_tambahan/100)),0)
            FROM sl_faktur_detail fd
            WHERE fd.no_faktur=f.no_faktur
          )*(1-f.diskon/100)          
          ,0)
	,
(
	IF(p.npwp_pelanggan<>"",
	  IF( EXISTS
	      (
		SELECT b.bebas_ppn 
		FROM sl_faktur_detail fd
		INNER JOIN ms_barang b ON b.kode_barang=fd.kode_barang
		WHERE b.bebas_ppn="YA" 
		AND fd.no_faktur=f.No_Faktur
	      ),
	      (
		IF(f_brg_bebasppn(f.no_faktur)<>0,
		   f_brg_bebasppn(f.no_faktur),
		   f_plg_bebasPPN(f.no_faktur)) 
	      ),0)
	,0)
)	
	) BEBAS_PPN_STD,
	
	/*
	IF(p.npwp_pelanggan<>"",
	  IF( EXISTS
	      (
		SELECT b.bebas_ppn 
		FROM sl_faktur_detail fd
		INNER JOIN ms_barang b ON b.kode_barang=fd.kode_barang
		WHERE b.bebas_ppn="YA" 
		AND fd.no_faktur=f.No_Faktur
	      ),
	      (
		IF(f_brg_bebasppn(f.no_faktur)<>0,
		   f_brg_bebasppn(f.no_faktur),
		   f_plg_bebasPPN(f.no_faktur)) 
	      ),0)
	,0) BEBAS_PPN_STD,
	*/
	
	IF(p.npwp_pelanggan="",
	  IF( EXISTS
	      (
		SELECT b.bebas_ppn 
		FROM sl_faktur_detail fd
		INNER JOIN ms_barang b ON b.kode_barang=fd.kode_barang
		WHERE b.bebas_ppn="YA" 
		AND fd.no_faktur=f.No_Faktur
	      ),
	      (
		IF(f_brg_bebasppn(f.no_faktur)<>0,
		   f_brg_bebasppn(f.no_faktur),
		   f_plg_bebasPPN(f.no_faktur)) 
	      ),
	0),
	0) BEBAS_PPN_SDRHN,
		
        ROUND(f.potongan) potongan,
        IF(p.faktur_gabungan<>"YA",
	ROUND(f.total_tagihan),
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
            ) -
            (
            
		SELECT IF(f_brg_bebasppn(f.no_faktur)<>0,
		          f_brg_bebasppn(f.no_faktur),
		          f_plg_bebasPPN(f.no_faktur))
            )
	+f.materai) total,
        ROUND(f.materai) materai
        FROM sl_faktur f
        LEFT JOIN ms_pelanggan p ON p.kode_pelanggan=f.kode_pelanggan
        WHERE
	f.no_faktur='FKCRB/201906/10565'
	AND f.tgl_faktur>=(SELECT nilai FROM sy_konfigurasi WHERE item="singularity")
-- 	AND IF(MONTH(f.tgl_faktur)=12 AND (YEAR(f.time_stamp)>YEAR(f.tgl_faktur)),MONTH(f.time_stamp)+12,MONTH(f.time_stamp))-MONTH(f.tgl_faktur)<=1
        GROUP BY f.no_faktur, f.kode_divisi_produk;