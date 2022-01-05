﻿CREATE DATABASE QLBH
GO

USE QLBH
GO

--1. Tạo các quan hệ và khai báo các khóa chính, khóa ngoại của quan hệ.
--Tạo các quan hệ và các khóa chính
--KHACHHANG
CREATE TABLE KHACHHANG
(
	MAKH CHAR(4) NOT NULL,
	HOTEN VARCHAR(40),
	DCHI VARCHAR(50),
	SODT VARCHAR(20),
	NGSINH SMALLDATETIME,
	DOANHSO MONEY,
	NGDK SMALLDATETIME
)
GO

ALTER TABLE dbo.KHACHHANG ADD CONSTRAINT PK_KHACHHANG PRIMARY KEY(MAKH)
GO

--NHANVIEN
CREATE TABLE NHANVIEN
(
	MANV CHAR(4) NOT NULL,
	HOTEN VARCHAR(40),
	SODT VARCHAR(20),
	NGVL SMALLDATETIME
)
GO

ALTER TABLE dbo.NHANVIEN ADD CONSTRAINT PK_NV PRIMARY KEY(MANV)
GO

--SANPHAM
CREATE TABLE SANPHAM
(
	MASP CHAR(4) NOT NULL,
	TENSP VARCHAR(40),
	DVT VARCHAR(20),
	NUOCSX VARCHAR(40),
	GIA MONEY
)
GO

ALTER TABLE dbo.SANPHAM ADD CONSTRAINT PK_SP PRIMARY KEY(MASP)
GO

--HOADON
CREATE TABLE HOADON
(
	SOHD INT NOT NULL,
	NGHD SMALLDATETIME,
	MAKH CHAR(4),
	MANV CHAR(4),
	TRIGIA MONEY
)
GO

ALTER TABLE dbo.HOADON ADD CONSTRAINT PK_HD PRIMARY KEY(SOHD)
GO

--CTHD
CREATE TABLE CTHD
(
	SOHD INT NOT NULL,
	MASP CHAR(4) NOT NULL,
	SL INT
)
GO

ALTER TABLE dbo.CTHD ADD CONSTRAINT PK_CTHD PRIMARY KEY(SOHD,MASP)
GO

SET DATEFORMAT DMY
--KHACHHANG
INSERT INTO dbo.KHACHHANG VALUES('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','08823451','22/10/1960',13060000,'22/07/2006')
INSERT INTO dbo.KHACHHANG VALUES('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','0908256478','03/04/1974',280000,'30/07/2006')
INSERT INTO dbo.KHACHHANG VALUES('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','0938776266','12/06/1980',3860000,'08/05/2006')
INSERT INTO dbo.KHACHHANG VALUES('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','0917325476','09/03/1965',250000,'10/02/2006')
INSERT INTO dbo.KHACHHANG VALUES('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','08246108','10/03/1950', 21000,'28/10/2006')
INSERT INTO dbo.KHACHHANG VALUES('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','08631738','31/12/1981', 915000,'24/11/2006')
INSERT INTO dbo.KHACHHANG VALUES('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','0916783565','06/04/1971', 12500,'12/01/2006')
INSERT INTO dbo.KHACHHANG VALUES('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','0938435756','10/01/1971', 365000,'13/12/2006')
INSERT INTO dbo.KHACHHANG VALUES('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','08654763','03/09/1979', 70000,'14/01/2007')
INSERT INTO dbo.KHACHHANG VALUES('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','08768904','02/05/1983', 67500,'16/01/2007')

-- NHANVIEN
INSERT INTO dbo.NHANVIEN VALUES('NV01','Nguyen Nhu Nhut','0927345678','13/04/2006')
INSERT INTO dbo.NHANVIEN VALUES('NV02','Le Thi Phi Yen','0987567390','21/04/2006')
INSERT INTO dbo.NHANVIEN VALUES('NV03','Nguyen Van B','0997047382','27/04/2006')
INSERT INTO dbo.NHANVIEN VALUES('NV04','Ngo Thanh Tuan','0913758498','24/06/2006')
INSERT INTO dbo.NHANVIEN VALUES('NV05','Nguyen Thi Truc Thanh','0918590387','20/07/2006')

-- SANPHAM
INSERT INTO dbo.SANPHAM VALUES('BC01','But chi','cay','Singapore',3000)
INSERT INTO dbo.SANPHAM VALUES('BC02','But chi','cay','Singapore',5000)
INSERT INTO dbo.SANPHAM VALUES('BC03','But chi','cay','Viet Nam',3500)
INSERT INTO dbo.SANPHAM VALUES('BC04','But chi','hop','Viet Nam',30000)
INSERT INTO dbo.SANPHAM VALUES('BB01','But bi','cay','Viet Nam',5000)
INSERT INTO dbo.SANPHAM VALUES('BB02','But bi','cay','Trung Quoc',7000)
INSERT INTO dbo.SANPHAM VALUES('BB03','But bi','hop','Thai Lan',100000)
INSERT INTO dbo.SANPHAM VALUES('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
INSERT INTO dbo.SANPHAM VALUES('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
INSERT INTO dbo.SANPHAM VALUES('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
INSERT INTO dbo.SANPHAM VALUES('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
INSERT INTO dbo.SANPHAM VALUES('TV05','Tap 100 trang','chuc','Viet Nam',23000)
INSERT INTO dbo.SANPHAM VALUES('TV06','Tap 200 trang','chuc','Viet Nam',53000)
INSERT INTO dbo.SANPHAM VALUES('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
INSERT INTO dbo.SANPHAM VALUES('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
INSERT INTO dbo.SANPHAM VALUES('ST02','So tay loai 1','quyen','Viet Nam',55000)
INSERT INTO dbo.SANPHAM VALUES('ST03','So tay loai 2','quyen','Viet Nam',51000)
INSERT INTO dbo.SANPHAM VALUES('ST04','So tay','quyen','Thai Lan',55000)
INSERT INTO dbo.SANPHAM VALUES('ST05','So tay mong','quyen','Thai Lan',20000)
INSERT INTO dbo.SANPHAM VALUES('ST06','Phan viet bang','hop','Viet Nam',5000)
INSERT INTO dbo.SANPHAM VALUES('ST07','Phan khong bui','hop','Viet Nam',7000)
INSERT INTO dbo.SANPHAM VALUES('ST08','Bong bang','cai','Viet Nam',1000)
INSERT INTO dbo.SANPHAM VALUES('ST09','But long','cay','Viet Nam',5000)
INSERT INTO dbo.SANPHAM VALUES('ST10','But long','cay','Trung Quoc',7000)

--HOADON
INSERT INTO dbo.HOADON VALUES(1001,'23/07/2006','KH01','NV01',320000)
INSERT INTO dbo.HOADON VALUES(1002,'12/08/2006','KH01','NV02',840000)
INSERT INTO dbo.HOADON VALUES(1003,'23/08/2006','KH02','NV01',100000)
INSERT INTO dbo.HOADON VALUES(1004,'01/09/2006','KH02','NV01',180000)
INSERT INTO dbo.HOADON VALUES(1005,'20/10/2006','KH01','NV02',3800000)
INSERT INTO dbo.HOADON VALUES(1006,'16/10/2006','KH01','NV03',2430000)
INSERT INTO dbo.HOADON VALUES(1007,'28/10/2006','KH03','NV03',510000)
INSERT INTO dbo.HOADON VALUES(1008,'28/10/2006','KH01','NV03',440000)
INSERT INTO dbo.HOADON VALUES(1009,'28/10/2006','KH03','NV04',200000)
INSERT INTO dbo.HOADON VALUES(1010,'01/11/2006','KH01','NV01',5200000)
INSERT INTO dbo.HOADON VALUES(1011,'04/11/2006','KH04','NV03',250000)
INSERT INTO dbo.HOADON VALUES(1012,'30/11/2006','KH05','NV03',21000)
INSERT INTO dbo.HOADON VALUES(1013,'12/12/2006','KH06','NV01',5000)
INSERT INTO dbo.HOADON VALUES(1014,'31/12/2006','KH03','NV02',3150000)
INSERT INTO dbo.HOADON VALUES(1015,'01/01/2007','KH06','NV01',910000)
INSERT INTO dbo.HOADON VALUES(1016,'01/01/2007','KH07','NV02',12500)
INSERT INTO dbo.HOADON VALUES(1017,'02/01/2007','KH08','NV03',35000)
INSERT INTO dbo.HOADON VALUES(1018,'13/01/2007','KH08','NV03',330000)
INSERT INTO dbo.HOADON VALUES(1019,'13/01/2007','KH01','NV03',30000)
INSERT INTO dbo.HOADON VALUES(1020,'14/01/2007','KH09','NV04',70000)
INSERT INTO dbo.HOADON VALUES(1021,'16/01/2007','KH10','NV03',67500)
INSERT INTO dbo.HOADON VALUES(1022,'16/01/2007',Null,'NV03',7000)
INSERT INTO dbo.HOADON VALUES(1023,'17/01/2007',Null,'NV01',330000)

--CTHD
INSERT INTO dbo.CTHD VALUES(1001,'TV02',10)
INSERT INTO dbo.CTHD VALUES(1001,'ST01',5)
INSERT INTO dbo.CTHD VALUES(1001,'BC01',5)
INSERT INTO dbo.CTHD VALUES(1001,'BC02',10)
INSERT INTO dbo.CTHD VALUES(1001,'ST08',10)
INSERT INTO dbo.CTHD VALUES(1002,'BC04',20)
INSERT INTO dbo.CTHD VALUES(1002,'BB01',20)
INSERT INTO dbo.CTHD VALUES(1002,'BB02',20)
INSERT INTO dbo.CTHD VALUES(1003,'BB03',10)
INSERT INTO dbo.CTHD VALUES(1004,'TV01',20)
INSERT INTO dbo.CTHD VALUES(1004,'TV02',10)
INSERT INTO dbo.CTHD VALUES(1004,'TV03',10)
INSERT INTO dbo.CTHD VALUES(1004,'TV04',10)
INSERT INTO dbo.CTHD VALUES(1005,'TV05',50)
INSERT INTO dbo.CTHD VALUES(1005,'TV06',50)
INSERT INTO dbo.CTHD VALUES(1006,'TV07',20)
INSERT INTO dbo.CTHD VALUES(1006,'ST01',30)
INSERT INTO dbo.CTHD VALUES(1006,'ST02',10)
INSERT INTO dbo.CTHD VALUES(1007,'ST03',10)
INSERT INTO dbo.CTHD VALUES(1008,'ST04',8)
INSERT INTO dbo.CTHD VALUES(1009,'ST05',10)
INSERT INTO dbo.CTHD VALUES(1010,'TV07',50)
INSERT INTO dbo.CTHD VALUES(1010,'ST07',50)
INSERT INTO dbo.CTHD VALUES(1010,'ST08',100)
INSERT INTO dbo.CTHD VALUES(1010,'ST04',50)
INSERT INTO dbo.CTHD VALUES(1010,'TV03',100)
INSERT INTO dbo.CTHD VALUES(1011,'ST06',50)
INSERT INTO dbo.CTHD VALUES(1012,'ST07',3)
INSERT INTO dbo.CTHD VALUES(1013,'ST08',5)
INSERT INTO dbo.CTHD VALUES(1014,'BC02',80)
INSERT INTO dbo.CTHD VALUES(1014,'BB02',100)
INSERT INTO dbo.CTHD VALUES(1014,'BC04',60)
INSERT INTO dbo.CTHD VALUES(1014,'BB01',50)
INSERT INTO dbo.CTHD VALUES(1015,'BB02',30)
INSERT INTO dbo.CTHD VALUES(1015,'BB03',7)
INSERT INTO dbo.CTHD VALUES(1016,'TV01',5)
INSERT INTO dbo.CTHD VALUES(1017,'TV02',1)
INSERT INTO dbo.CTHD VALUES(1017,'TV03',1)
INSERT INTO dbo.CTHD VALUES(1017,'TV04',5)
INSERT INTO dbo.CTHD VALUES(1018,'ST04',6)
INSERT INTO dbo.CTHD VALUES(1019,'ST05',1)
INSERT INTO dbo.CTHD VALUES(1019,'ST06',2)
INSERT INTO dbo.CTHD VALUES(1020,'ST07',10)
INSERT INTO dbo.CTHD VALUES(1021,'ST08',5)
INSERT INTO dbo.CTHD VALUES(1021,'TV01',7)
INSERT INTO dbo.CTHD VALUES(1021,'TV02',10)
INSERT INTO dbo.CTHD VALUES(1022,'ST07',1)
INSERT INTO dbo.CTHD VALUES(1023,'ST04',6)

--Tạo khóa ngoại
--Hóa đơn
ALTER TABLE dbo.HOADON ADD CONSTRAINT FK1_HD FOREIGN KEY(MAKH) REFERENCES dbo.KHACHHANG(MAKH)
ALTER TABLE dbo.HOADON ADD CONSTRAINT FK2_HD FOREIGN KEY(MANV) REFERENCES dbo.NHANVIEN(MANV)

--dbo.CTHD
ALTER TABLE dbo.CTHD ADD CONSTRAINT FK1_CTHD FOREIGN KEY(SOHD) REFERENCES dbo.HOADON(SOHD)
ALTER TABLE dbo.CTHD ADD CONSTRAINT FK2_CTHD FOREIGN KEY(MASP) REFERENCES dbo.SANPHAM(MASP)

--2. Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ dbo.SANPHAM.
ALTER TABLE dbo.SANPHAM ADD GHICHU VARCHAR(20)
--3. Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG.
ALTER TABLE dbo.KHACHHANG ADD LOAIKH TINYINT
--4. Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ dbo.SANPHAM thành varchar(100).
ALTER TABLE dbo.SANPHAM ALTER COLUMN GHICHU VARCHAR(100)
--5. Xóa thuộc tính GHICHU trong quan hệ dbo.SANPHAM.
ALTER TABLE dbo.SANPHAM DROP COLUMN GHICHU
--6. Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị
--là: “Vang lai”, “Thuong xuyen”, “Vip”, ...
ALTER TABLE dbo.KHACHHANG ALTER COLUMN LOAIKH VARCHAR(20)
--7. Đơn vị tính của sản phẩm chỉ có thể là (“cay”,”hop”,”cai”,”quyen”,”chuc”)
ALTER TABLE dbo.SANPHAM ADD CONSTRAINT CHK_SANPHAM CHECK(DVT IN ('cay', 'hop', 'cai', 'quyen', 'chuc'))
--8. Giá bán của sản phẩm từ 500 đồng trở lên.
ALTER TABLE dbo.SANPHAM ADD CONSTRAINT CHK_GIA CHECK(GIA >= 500)
--9. Mỗi lần mua hàng, khách hàng phải mua ít nhất 1 sản phẩm.
ALTER TABLE dbo.CTHD ADD CONSTRAINT CHK_CTHD CHECK(SL >= 1)
--10. Ngày khách hàng đăng ký là khách hàng thành viên phải lớn hơn ngày sinh của người
--đó.

--II. Ngôn ngữ thao tác dữ liệu (Data Manipulation Language):
--1. Nhập dữ liệu cho các quan hệ trên.

--2. Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của quan hệ SANPHAM. Tạo quan hệ
--KHACHHANG1 chứa toàn bộ dữ liệu của quan hệ KHACHHANG.
SELECT * INTO SANPHAM1 FROM dbo.SANPHAM
SELECT * INTO KHACHHANG1 FROM dbo.KHACHHANG
--3. Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất (cho quan hệ
--SANPHAM1)
UPDATE dbo.SANPHAM1 SET GIA = GIA + GIA * 0.05 WHERE NUOCSX = 'Thai Lan'
SELECT * FROM dbo.SANPHAM1
--3.1. Cập nhật lại giá trị ban đầu
UPDATE dbo.SANPHAM1 SET GIA = GIA / 1.05 WHERE NUOCSX = 'Thai Lan'
--4. Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ
--10.000 trở xuống (cho quan hệ SANPHAM1).
UPDATE dbo.SANPHAM1 
SET GIA = GIA - GIA * 0.05
WHERE NUOCSX = 'Trung Quoc' AND GIA < 10000
--5. Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên trước
--ngày 1/1/2007 có doanh số từ 10.000.000 trở lên hoặc khách hàng đăng ký thành viên từ
--1/1/2007 trở về sau có doanh số từ 2.000.000 trở lên (cho quan hệ KHACHHANG1).
UPDATE dbo.KHACHHANG1
SET LOAIKH = 'Vip'
WHERE
(NGDK < '01/01/2007' AND DOANHSO >= 10000000)
OR
(NGDK > '01/01/2007' AND DOANHSO >= 2000000)
--5.1.Cập nhật những khách hàng còn lại với LOAIKH là "VANG LAI"
UPDATE dbo.KHACHHANG1 SET LOAIKH = 'VANG LAI' WHERE LOAIKH IS NULL
--III. Ngôn ngữ truy vấn dữ liệu:
--1. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'
--2. In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
SELECT MASP, TENSP
FROM SANPHAM
WHERE DVT IN ('cay', 'quyen')
--3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết
--thúc là “01”.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP LIKE 'B_01'
--4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000
--đến 40.000.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'
INTERSECT
SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA BETWEEN 30000 AND 40000

SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc' AND GIA BETWEEN 30000 AND 40000
--5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản
--xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc' AND GIA BETWEEN 30000 AND 40000
UNION
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Thai Lan' AND GIA BETWEEN 30000 AND 40000

SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX IN ('Thai Lan', 'Trung Quoc') AND GIA BETWEEN 30000 AND 40000
--6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SET DATEFORMAT DMY
SELECT SOHD, TRIGIA
FROM dbo.HOADON
WHERE NGHD = '01/01/2007' OR NGHD = '02/01/2007'
--7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và
--trị giá của hóa đơn (giảm dần).
SELECT SOHD, TRIGIA
FROM dbo.HOADON
WHERE MONTH(NGHD) = 1 AND YEAR(NGHD) = 2007
ORDER BY NGHD ASC, TRIGIA DESC
--8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SET DATEFORMAT DMY
SELECT KH.MAKH, KH.HOTEN
FROM dbo.KHACHHANG AS KH INNER JOIN dbo.HOADON AS HD
ON HD.MAKH = KH.MAKH
WHERE HD.NGHD = '01/01/2007'
--9. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày
--28/10/2006.
SELECT HD.SOHD, HD.TRIGIA
FROM dbo.NHANVIEN AS NV INNER JOIN dbo.HOADON AS HD
ON HD.MANV = NV.MANV
WHERE NV.HOTEN = 'Nguyen Van B'
AND HD.NGHD = '28/10/2006'
--10. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A”
--mua trong tháng 10/2006.
SELECT SP.MASP, SP.TENSP
FROM dbo.SANPHAM AS SP, dbo.KHACHHANG AS KH, dbo.HOADON AS HD, dbo.CTHD
WHERE HD.MAKH = KH.MAKH
AND CTHD.MASP = SP.MASP
AND HD.SOHD = CTHD.SOHD
AND KH.HOTEN = 'Nguyen Van A'
AND  MONTH(HD.NGHD) = 10 AND YEAR(HD.NGHD) = 2006
--11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT DISTINCT SOHD
FROM dbo.CTHD
WHERE MASP IN ('BB01', 'BB02')
--12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm
--mua với số lượng từ 10 đến 20.
SELECT DISTINCT SOHD
FROM dbo.CTHD
WHERE MASP IN ('BB01', 'BB02')
AND SL BETWEEN 10 AND 20
--13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản
--phẩm mua với số lượng từ 10 đến 20.
SELECT SOHD
FROM dbo.CTHD
WHERE MASP = 'BB01'
AND SL BETWEEN 10 AND 20
INTERSECT
SELECT SOHD
FROM dbo.CTHD
WHERE MASP = 'BB02'
AND SL BETWEEN 10 AND 20
--14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản
--phẩm được bán ra trong ngày 1/1/2007.
--Phép kết
SELECT DISTINCT SP.MASP, SP.TENSP
FROM (dbo.SANPHAM AS SP FULL OUTER	JOIN CTHD AS CT ON CT.MASP = SP.MASP)
		FULL OUTER JOIN dbo.HOADON AS HD ON CT.SOHD = HD.SOHD
WHERE SP.NUOCSX = 'Trung Quoc' OR HD.NGHD = '01/01/2007'

--UNION
SELECT DISTINCT MASP, TENSP
FROM dbo.SANPHAM
WHERE NUOCSX = 'Trung Quoc'
UNION
SELECT SP.MASP, SP.TENSP
FROM dbo.CTHD AS CT, dbo.HOADON AS HD, dbo.SANPHAM AS SP
WHERE CT.SOHD = HD.SOHD
AND CT.MASP = SP.MASP
AND HD.NGHD = '01/01/2007'
--15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
SELECT SP01.MASP, TENSP
FROM dbo.SANPHAM AS SP01
WHERE NOT EXISTS (  SELECT *
					FROM dbo.SANPHAM AS SP02 INNER JOIN dbo.CTHD AS CT
					ON CT.MASP = SP02.MASP
					AND SP01.MASP = SP02.MASP)
--16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
SELECT SP.MASP, TENSP
FROM dbo.SANPHAM AS SP
WHERE SP.MASP NOT IN (SELECT CT.MASP
						FROM dbo.HOADON AS HD INNER JOIN dbo.CTHD AS CT
						ON CT.SOHD = HD.SOHD
						WHERE YEAR(HD.NGHD) = 2006)
--17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán
--được trong năm 2006.
SELECT SP.MASP, TENSP
FROM dbo.SANPHAM AS SP
WHERE SP.NUOCSX = 'Trung Quoc'
AND SP.MASP NOT IN (SELECT CT.MASP
						FROM dbo.HOADON AS HD INNER JOIN dbo.CTHD AS CT
						ON CT.SOHD = HD.SOHD
						WHERE YEAR(HD.NGHD) = 2006)
--18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
SELECT HD.SOHD
FROM dbo.HOADON AS HD
WHERE NOT EXISTS ( SELECT *
					FROM dbo.SANPHAM AS SP
					WHERE SP.NUOCSX = 'Singapore'
					AND NOT EXISTS ( SELECT *
										FROM dbo.CTHD AS CT
										WHERE CT.MASP = SP.MASP
										AND CT.SOHD = HD.SOHD))

SELECT DISTINCT CT01.SOHD
FROM dbo.CTHD AS CT01
WHERE NOT EXISTS ( SELECT *
					FROM dbo.SANPHAM AS SP
					WHERE SP.NUOCSX = 'Singapore'
					AND NOT EXISTS ( SELECT *
										FROM dbo.CTHD AS CT02
										WHERE CT02.SOHD = CT01.SOHD
										AND CT02.MASP = SP.MASP))
--19. Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản
--xuất.
SELECT HD.SOHD
FROM dbo.HOADON AS HD
WHERE YEAR(HD.NGHD) = 2006 
AND NOT EXISTS ( SELECT *
					FROM dbo.SANPHAM AS SP
					WHERE SP.NUOCSX = 'Singapore'
					AND NOT EXISTS ( SELECT *
										FROM dbo.CTHD AS CT
										WHERE CT.MASP = SP.MASP
										AND CT.SOHD = HD.SOHD))
--20. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(*)
FROM dbo.HOADON AS H
WHERE NOT EXISTS (SELECT *
					FROM dbo.KHACHHANG AS KH
					WHERE KH.MAKH = H.MAKH)
SELECT COUNT(*)
FROM dbo.HOADON AS H
WHERE H.MAKH NOT IN (SELECT KH.MAKH
						FROM dbo.KHACHHANG AS KH
						WHERE KH.MAKH = H.MAKH)
--21. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT COUNT(DISTINCT CT.MASP)
FROM dbo.CTHD AS CT JOIN dbo.HOADON AS HD ON HD.SOHD = CT.SOHD
WHERE YEAR(HD.NGHD) = 2006
--22. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
SELECT MAX(TRIGIA) AS N'Cao nhất', MIN(TRIGIA) AS N'Thấp nhất'
FROM dbo.HOADON
--23. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT AVG(TRIGIA) AS TrigiaTB
FROM dbo.HOADON
WHERE YEAR(NGHD) = 2006
--24. Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(TRIGIA) AS DoanhThu
FROM dbo.HOADON
WHERE YEAR(NGHD) = 2006
--25. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT SOHD
FROM dbo.HOADON
WHERE YEAR(NGHD) = 2006
AND TRIGIA = (SELECT MAX(TRIGIA)
				FROM dbo.HOADON
				WHERE YEAR(NGHD) = 2006)

SELECT TOP 1 WITH TIES SOHD
FROM dbo.HOADON
WHERE YEAR(NGHD) = 2006
ORDER BY TRIGIA DESC
--26. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT KH.HOTEN
FROM dbo.KHACHHANG AS KH
WHERE KH.MAKH IN (SELECT MAKH
				FROM dbo.HOADON
				WHERE YEAR(dbo.HOADON.NGHD) = 2006
				AND TRIGIA = (SELECT MAX(TRIGIA)
								FROM dbo.HOADON
								WHERE YEAR(NGHD) = 2006))
SELECT KH.HOTEN
FROM dbo.KHACHHANG AS KH JOIN dbo.HOADON AS HD ON HD.MAKH = KH.MAKH
WHERE HD.SOHD IN (SELECT SOHD
					FROM dbo.HOADON
					WHERE YEAR(dbo.HOADON.NGHD) = 2006
					AND TRIGIA = (SELECT MAX(TRIGIA)
									FROM dbo.HOADON
									WHERE YEAR(NGHD) = 2006))

SELECT KH.HOTEN
FROM dbo.KHACHHANG AS KH JOIN dbo.HOADON AS HD01 ON HD01.MAKH = KH.MAKH
WHERE  YEAR(HD01.NGHD) = 2006 AND
HD01.TRIGIA IN (SELECT MAX(HD02.TRIGIA)
						FROM dbo.HOADON HD02
						WHERE YEAR(NGHD) = 2006)

SELECT KH.HOTEN
FROM KHACHHANG AS KH, HOADON AS HD01
WHERE HD01.MAKH = KH.MAKH AND
YEAR(HD01.NGHD) = 2006 AND
HD01.TRIGIA >=ALL ( SELECT MAX(HD02.TRIGIA) 
					FROM HOADON HD02 
					WHERE YEAR(HD02.NGHD) = 2006 )

SELECT TOP 1 WITH TIES KH.HOTEN
FROM dbo.HOADON AS HD JOIN dbo.KHACHHANG AS KH ON KH.MAKH = HD.MAKH
WHERE YEAR(NGHD) = 2006
ORDER BY TRIGIA DESC
--27. In ra danh sách 3 khách hàng đầu tiên (MAKH, HOTEN) sắp xếp theo doanh số giảm
--dần.
SELECT TOP 3 MAKH, HOTEN
FROM dbo.KHACHHANG
ORDER BY DOANHSO DESC
--28. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao
--nhất.
SELECT MASP, TENSP
FROM dbo.SANPHAM
WHERE GIA IN (SELECT DISTINCT TOP 3 GIA
				FROM dbo.SANPHAM
				ORDER BY GIA DESC)
--29. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1
--trong 3 mức giá cao nhất (của tất cả các sản phẩm).
SELECT MASP, TENSP
FROM dbo.SANPHAM
WHERE NUOCSX = 'Thai Lan'
AND GIA IN (SELECT DISTINCT TOP 3 GIA
				FROM dbo.SANPHAM
				ORDER BY GIA DESC)
--30. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1
--trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT MASP, TENSP
FROM dbo.SANPHAM
WHERE NUOCSX = 'Trung Quoc'
AND GIA IN (SELECT DISTINCT TOP 3 GIA
				FROM dbo.SANPHAM
				WHERE NUOCSX = 'Trung Quoc'
				ORDER BY GIA DESC)
--31. * In ra danh sách khách hàng nằm trong 3 hạng cao nhất (xếp hạng theo doanh số).
SELECT TOP 3 *
FROM dbo.KHACHHANG
ORDER BY DOANHSO DESC
--32. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
SELECT COUNT(DISTINCT MASP)
FROM dbo.SANPHAM
WHERE NUOCSX= 'Trung Quoc'
--33. Tính tổng số sản phẩm của từng nước sản xuất.
SELECT NUOCSX, COUNT(DISTINCT MASP) AS TONGSP
FROM dbo.SANPHAM
GROUP BY NUOCSX
--34. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
SELECT NUOCSX, MAX(GIA) AS CAONHAT, MIN(GIA) AS THAPNHAT, AVG(GIA) AS TB
FROM dbo.SANPHAM
GROUP BY NUOCSX
--35. Tính doanh thu bán hàng mỗi ngày.
SELECT NGHD, SUM(TRIGIA) AS DOANHTHU
FROM dbo.HOADON
GROUP BY NGHD
--36. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
SELECT SP.MASP, COUNT(DISTINCT SP.MASP) AS TONGSP
FROM dbo.SANPHAM AS SP
WHERE SP.MASP IN (SELECT CT.MASP
					FROM dbo.CTHD AS CT JOIN dbo.HOADON AS HD ON HD.SOHD = CT.SOHD
					WHERE MONTH(HD.NGHD) = 10 AND YEAR(HD.NGHD) = 2006)
GROUP BY SP.MASP

SELECT CT.MASP, COUNT(DISTINCT CT.MASP) AS TONGSP
FROM dbo.CTHD AS CT JOIN dbo.HOADON AS HD ON HD.SOHD = CT.SOHD
WHERE MONTH(HD.NGHD) = 10 AND YEAR(HD.NGHD) = 2006
GROUP BY CT.MASP
--37. Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT MONTH(NGHD) AS THANG, SUM(TRIGIA) AS DOANHTHU
FROM dbo.HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)
--38. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
SELECT *
FROM dbo.HOADON
WHERE SOHD IN (SELECT CT.SOHD
				FROM dbo.CTHD AS CT
				GROUP BY SOHD
				HAVING COUNT(DISTINCT CT.MASP) >= 4)
--39. Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
SELECT *
FROM dbo.HOADON
WHERE SOHD IN (	SELECT CT.SOHD
				FROM dbo.CTHD AS CT JOIN dbo.SANPHAM AS SP ON SP.MASP = CT.MASP
				WHERE SP.NUOCSX = 'Viet Nam'
				GROUP BY SOHD
				HAVING COUNT(DISTINCT CT.MASP) = 3)
--40. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
SELECT MAKH, HOTEN
FROM dbo.KHACHHANG
WHERE MAKH = (SELECT TOP 1 MAKH
				FROM dbo.HOADON
				GROUP BY MAKH
				ORDER BY COUNT(DISTINCT SOHD) DESC)
--41. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
SELECT TOP 1 MONTH(NGHD)
FROM dbo.HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)
ORDER BY SUM(TRIGIA) DESC
--42. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
SELECT MASP, TENSP
FROM dbo.SANPHAM
WHERE MASP = (SELECT TOP 1 CT.MASP
				FROM dbo.CTHD AS CT JOIN dbo.HOADON ON HOADON.SOHD = CT.SOHD
				WHERE YEAR(NGHD) = 2006
				GROUP BY CT.MASP
				ORDER BY SUM(SL) ASC)
GO
--43. *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
CREATE VIEW TEMP AS
SELECT NUOCSX, MAX(GIA) AS MAX
FROM dbo.SANPHAM
GROUP BY NUOCSX
GO

SELECT SP.NUOCSX, SP.MASP, SP.TENSP, GIA
FROM dbo.SANPHAM AS SP JOIN TEST ON TEST.MAX = SP.GIA
WHERE TEST.NUOCSX = SP.NUOCSX

SELECT SP01.NUOCSX, SP01.MASP, SP01.TENSP, SP01.GIA
FROM dbo.SANPHAM AS SP01
WHERE SP01.GIA IN ( SELECT MAX(SP02.GIA)
					FROM dbo.SANPHAM AS SP02
					WHERE SP02.NUOCSX = SP01.NUOCSX)
--44. Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
SELECT NUOCSX
FROM dbo.SANPHAM
GROUP BY NUOCSX
HAVING COUNT(DISTINCT GIA) >= 3
--45. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều
--nhất.
SELECT DS01.MAKH, DS01.HOTEN
FROM (SELECT TOP 10 KH01.MAKH, KH01.HOTEN
		FROM dbo.KHACHHANG KH01
		ORDER BY KH01.DOANHSO DESC) AS DS01 JOIN dbo.HOADON HD01 ON HD01.MAKH = DS01.MAKH
GROUP BY DS01.MAKH, DS01.HOTEN
HAVING COUNT(HD01.SOHD) >= ALL (SELECT COUNT(HD02.SOHD)
								FROM (SELECT TOP 10 KH02.MAKH
										FROM dbo.KHACHHANG AS KH02
										ORDER BY KH02.DOANHSO DESC) AS DS02 JOIN dbo.HOADON AS HD02 ON HD02.MAKH = DS02.MAKH
								GROUP BY DS02.MAKH)