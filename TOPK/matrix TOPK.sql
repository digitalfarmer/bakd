DROP TABLE IF EXISTS t_matrix;

CREATE TABLE t_matrix (

kode_pelanggan CHAR(15),

kode_divisi_produk CHAR(5),

kode_jenis_jual CHAR(5),

topf INT,

topk INT,

PRIMARY KEY (kode_pelanggan,kode_divisi_produk,kode_jenis_jual)

);


INSERT INTO t_matrix VALUES

("2701.T492","API","KR",30,67),
("2701.T492","AWI","KR",30,67);

UPDATE ms_jenis_jual_pelanggan jjp,t_matrix t

SET jjp.TOP=t.topk,jjp.topf=t.topf

WHERE t.kode_pelanggan=jjp.Kode_Pelanggan

AND t.kode_divisi_produk=jjp.Kode_Divisi_Produk

AND t.kode_jenis_jual=jjp.Kode_Jenis_Jual;

DROP TABLE t_matrix;

 

