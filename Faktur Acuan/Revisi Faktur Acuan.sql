
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
("TRPLB/201810/00324","RJPLB/201810/00571","FRPLB/201810/00219","100011843275508","42982","2018-7-4","MJI-EGV-29"),
("TRPLB/201810/00324","RJPLB/201810/00571","FRPLB/201810/00219","100011843275508","42982","2018-7-4","MJI-SKH-09");

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
