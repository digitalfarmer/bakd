DROP TABLE IF EXISTS t_top_faktur;

 

CREATE TABLE t_top_faktur (

no_faktur CHAR(19) PRIMARY KEY,

topf INT,

topk INT

);

 

INSERT INTO t_top_faktur VALUES 

("FKBEK/202107/00542",60,75),
("FKBEK/202107/00546",60,75);

SELECT * FROM t_top_faktur t, sl_faktur_top ft

WHERE ft.No_Faktur=t.no_faktur;

 

UPDATE t_top_faktur t, sl_faktur_top ft

SET ft.TOPF=t.topf,

ft.TOPK=t.topk

WHERE ft.No_Faktur=t.no_faktur;

 

SELECT * FROM sl_faktur f, t_top_faktur t

WHERE t.No_Faktur=f.No_Faktur;

 

UPDATE sl_faktur f, t_top_faktur t

SET f.Tgl_Jatuh_Tempo=DATE_ADD(f.Tgl_Faktur,INTERVAL t.topf DAY),

f.Tgl_pembayaran=DATE_ADD(f.Tgl_Faktur,INTERVAL t.topf DAY)

WHERE t.No_Faktur=f.No_Faktur;

 

SELECT * FROM sl_surat_pesanan sp, sl_faktur f, t_top_faktur t

WHERE t.No_Faktur=f.No_Faktur

AND sp.no_sp=f.No_Referensi;

 

UPDATE sl_surat_pesanan sp, sl_faktur f, t_top_faktur t

SET sp.TOP=t.topf

WHERE t.No_Faktur=f.No_Faktur

AND sp.no_sp=f.No_Referensi;

 

DROP TABLE t_top_faktur;
