DROP TABLE IF EXISTS t_retur_pajak;
CREATE TABLE t_retur_pajak (
no_tbr CHAR(19),
no_brb CHAR(19),
no_fr CHAR(19),
tgl DATE,
KEY idx1 (no_tbr,no_brb,no_fr)
);

INSERT INTO t_retur_pajak VALUES
("TRMKS/201608/01506","RJMKS/201609/00106","FRMKS/201609/00221","2016-7-31"),
("TRMKS/201609/00037","RJMKS/201609/00174","FRMKS/201609/00222","2016-7-8"),
("TRMKS/201609/00030","RJMKS/201609/00165","FRMKS/201609/00223","2016-7-31"),
("TRMKS/201609/00030","RJMKS/201609/00166","FRMKS/201609/00224","2016-7-31"),
("TRMKS/201608/01467","RJMKS/201609/00078","FRMKS/201609/00225","2016-7-5"),
("TRMKS/201608/01466","RJMKS/201609/00076","FRMKS/201609/00281","2016-7-30"),
("TRMKS/201608/01466","RJMKS/201609/00077","FRMKS/201609/00282","2016-7-30"),
("TRMKS/201609/00267","RJMKS/201609/00614","FRMKS/201609/00427","2016-7-7"),
("TRMKS/201607/00345","RJMKS/201607/00524","FRMKS/201609/00634","2016-7-10"),
("TRMKS/201607/00345","RJMKS/201607/00525","FRMKS/201609/00635","2016-7-10"),
("TRMKS/201607/00534","RJMKS/201607/00824","FRMKS/201609/00636","2016-7-8"),
("TRMKS/201607/00534","RJMKS/201607/00825","FRMKS/201609/00637","2016-7-8");

SELECT * FROM sl_terima_barang_retur tbr,t_retur_pajak t
WHERE t.no_tbr=tbr.no_tbr;

UPDATE sl_terima_barang_retur tbr, t_retur_pajak t
SET 
tbr.tgl_tbr=t.tgl
WHERE tbr.no_tbr=t.no_tbr;

UPDATE sl_retur_barang brb, t_retur_pajak t
SET 
brb.tgl_brb=t.tgl
WHERE brb.no_brb=t.no_brb;

UPDATE sl_faktur_retur fr, t_retur_pajak t
SET 
fr.tgl_faktur_retur=t.tgl
WHERE fr.no_faktur_retur=t.no_fr;

UPDATE ar_pengurangan_piutang kp, t_retur_pajak t
SET 
kp.tgl_pengurangan=t.tgl
WHERE kp.no_referensi=t.no_fr;

DROP TABLE t_retur_pajak;
