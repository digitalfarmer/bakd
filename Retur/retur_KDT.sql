UPDATE sl_faktur_retur_global
SET bebas_ppn_std = sub_total
WHERE tgl_faktur_retur BETWEEN "2019-04-01" AND "2019-02-31" AND status_tercetak<>"B"
AND kode_divisi_produk IN (SELECT Kode_Divisi_Produk FROM ms_divisi_produk_bebas_ppn)
AND bebas_ppn_std <> sub_total
