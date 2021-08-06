SELECT `NoFaktur`, COUNT(*) AS Jml
FROM `ac_etax_keluar` 
WHERE `tglpajak`="2019-10-25"
GROUP BY NoFaktur
HAVING jml>1;

-- NoFaktur               Jml  
-- ------------------  --------
-- FKSLO/201608/06205         2
-- FKSLO/201608/06261         2

SELECT*FROM `ac_etax_keluar` WHERE nofaktur IN('FKSLO/201608/06205','FKSLO/201608/06261');