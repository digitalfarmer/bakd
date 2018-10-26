SELECT *FROM sl_faktur WHERE no_faktur="FKBKU/201603/00448";
STATUS tercetak =B;
SELECT *FROM sl_faktur_pajak WHERE no_faktur="FKBKU/201603/00448";
STATUS tercetak =B;

SPBKU/201603/00490;
DOBKU/201603/00453;

SELECT *FROM sl_surat_pesanan WHERE no_sp="SPBKU/201603/00490";
STATUS sp=Batal;
SELECT *FROM in_delivery WHERE no_delivery="DOBKU/201603/00453";
STATUS tercetak= B;