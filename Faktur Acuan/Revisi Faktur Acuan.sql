
CREATE TABLE t_retur_pajak (
no_tbr CHAR(19),
no_brb CHAR(19),
no_fr CHAR(19),
no_faktur CHAR(19),
no_faktur_pajak CHAR(30),
tgl_pajak DATE,
kode_barang CHAR(15),
KEY idx1 (no_tbr,no_brb,no_fr,kode_barang)
);

INSERT INTO t_retur_pajak VALUES
("TRPLB/201511/00019","RJPLB/201511/00044","FRPLB/201511/00018","FKPLB/201502/03807","0100001548357258","2015-2-12","UMI-UMC-01"),
("TRPLB/201511/00019","RJPLB/201511/00044","FRPLB/201511/00018","FKPLB/201502/03807","0100001548357258","2015-2-12","UMI-UMM-01"),
("TRPLB/201511/00021","RJPLB/201511/00048","FRPLB/201511/00022","FKPLB/201503/04821","0100001548369119","2015-3-14","UMI-UMM-02"),
("TRPLB/201511/00021","RJPLB/201511/00048","FRPLB/201511/00022","FKPLB/201503/04821","0100001548369119","2015-3-14","UMI-UMS-02");

UPDATE sl_terima_barang_retur_detail tbrd, t_retur_pajak t
SET tbrd.no_faktur=t.no_faktur,
tbrd.no_faktur_pajak=t.no_faktur_pajak,
tbrd.tgl_pajak=t.tgl_pajak
WHERE tbrd.no_tbr=t.no_tbr
AND tbrd.kode_barang=t.kode_barang;

UPDATE sl_retur_barang brb, t_retur_pajak t
SET brb.no_faktur=t.no_faktur,
brb.no_faktur_pajak=t.no_faktur_pajak,
brb.tgl_pajak=t.tgl_pajak
WHERE brb.no_brb=t.no_brb;

UPDATE sl_faktur_retur fr, t_retur_pajak t
SET fr.no_faktur=t.no_faktur,
fr.no_faktur_pajak=t.no_faktur_pajak,
fr.tgl_pajak=t.tgl_pajak
WHERE fr.no_faktur_retur=t.no_fr;

DROP TABLE t_retur_pajak;
