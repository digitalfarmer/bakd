
DROP TABLE IF EXISTS t_retur_pajak;
CREATE TABLE t_retur_pajak (
no_tbr CHAR(19),
no_brb CHAR(19),
no_fr CHAR(19),
no_faktur CHAR(19),
no_faktur_pajak CHAR(30),
tgl_pajak DATE,
KEY idx1 (no_tbr,no_brb,no_fr)
);

INSERT INTO t_retur_pajak VALUES
("TRKDR/201604/00389","RJKDR/201604/00527","FRKDR/201701/00282","NA","0100001786121071","2015-01-13"),
("TRKDR/201606/00157","RJKDR/201612/00259","FRKDR/201701/00245","NA","0100001617302877 ","2015-01-14");

SELECT * FROM sl_terima_barang_retur_detail tbrd,t_retur_pajak t
WHERE t.no_tbr=tbrd.no_tbr;

UPDATE sl_terima_barang_retur_detail tbrd, t_retur_pajak t
SET tbrd.no_faktur_pajak=t.no_faktur_pajak,
tbrd.tgl_pajak=t.tgl_pajak,
tbrd.no_faktur=t.no_faktur
WHERE tbrd.no_tbr=t.no_tbr;

UPDATE sl_retur_barang brb, t_retur_pajak t
SET brb.no_faktur_pajak=t.no_faktur_pajak,
brb.tgl_pajak=t.tgl_pajak,
brb.no_faktur=t.no_faktur
WHERE brb.no_brb=t.no_brb;

UPDATE sl_faktur_retur fr, t_retur_pajak t
SET fr.no_faktur_pajak=t.no_faktur_pajak,
fr.tgl_pajak=t.tgl_pajak,
fr.no_faktur=t.no_faktur
WHERE fr.no_faktur_retur=t.no_fr;

DROP TABLE t_retur_pajak;

