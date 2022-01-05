CREATE DATABASE QLHH
GO

USE QLHH
GO

CREATE TABLE Nhacungcap 
(
	maNCC VARCHAR(5),
	tenNCC VARCHAR(20), 
	trangthai NUMERIC(2),
	thanhpho VARCHAR(30),
	CONSTRAINT PKNcc PRIMARY KEY (maNCC)
)

CREATE TABLE Phutung 
(
	maPT VARCHAR(5),
	tenPT VARCHAR(10),
	mausac VARCHAR(10),
	khoiluong FLOAT,
	thanhpho VARCHAR(30),
	CONSTRAINT PKPt PRIMARY KEY (maPT) 
)

CREATE TABLE Vanchuyen 
(
	maNCC VARCHAR(5) ,
	maPT VARCHAR(5),
	soluong NUMERIC(5), 
	CONSTRAINT PKVc PRIMARY KEY (maNCC,maPT),
	CONSTRAINT FKShip1 FOREIGN KEY (maNCC) REFERENCES Nhacungcap (maNCC),
	CONSTRAINT FKShip2 FOREIGN KEY (maPT) REFERENCES Phutung (maPT)
)

INSERT INTO Nhacungcap VALUES ('S1','Smith','20','London')
INSERT INTO Nhacungcap VALUES ('S2','Jones','10','Paris')
INSERT INTO Nhacungcap VALUES ('S3','Blake','30','Paris')
INSERT INTO Nhacungcap VALUES ('S4','Clark','20','London')
INSERT INTO Nhacungcap VALUES ('S5','Adams','30','Athens')

INSERT INTO Phutung VALUES  ( 'P1' , 'Nut' , 'Red' , 12.0 , 'London')
INSERT INTO Phutung VALUES  ( 'P2' , 'Bolt' , 'Green', 17.0 , 'Paris')
INSERT INTO Phutung VALUES  ( 'P3' , 'Screw' , 'Blue', 17.0 , 'Oslo')
INSERT INTO Phutung VALUES  ( 'P4' , 'Screw' , 'Red' , 14.0 , 'London')
INSERT INTO Phutung VALUES  ( 'P5' , 'Cam' , 'Blue' , 12.0 , 'Paris')
INSERT INTO Phutung VALUES  ( 'P6' , 'Cog' , 'Red' , 19.0 , 'London')

INSERT INTO Vanchuyen VALUES ('S1','P1',300)
INSERT INTO Vanchuyen VALUES ('S1','P2',200)
INSERT INTO Vanchuyen VALUES ('S1','P3',400)
INSERT INTO Vanchuyen VALUES ('S1','P4',200)
INSERT INTO Vanchuyen VALUES ('S1','P5',100)
INSERT INTO Vanchuyen VALUES ('S1','P6',100)
INSERT INTO Vanchuyen VALUES ('S2','P1',300)
INSERT INTO Vanchuyen VALUES ('S2','P2',400)
INSERT INTO Vanchuyen VALUES ('S3','P2',200)
INSERT INTO Vanchuyen VALUES ('S4','P2',200)
INSERT INTO Vanchuyen VALUES ('S4','P4',300)
INSERT INTO Vanchuyen VALUES ('S4','P5',400)

--1. Hiển thị thông tin (maNCC, tenNCC, thanhpho) của tất cả nhà cung cấp.
SELECT maNCC, tenNCC, thanhpho 
FROM dbo.Nhacungcap
--2. Hiển thị thông tin của tất cả các phụ tùng.
SELECT * FROM dbo.Phutung
--3. Hiển thị thông tin các nhà cung cấp ở thành phố London.
SELECT * FROM dbo.Nhacungcap
WHERE thanhpho = 'London'
--4. Hiển thị mã phụ tùng, tên và màu sắc của tất cả các phụ tùng ở thành
--phố Paris.
SELECT maPT, tenPT, mausac 
FROM dbo.Phutung
WHERE thanhpho = 'Paris'
--5. Hiển thị mã phụ tùng, tên, khối lượng của những phụ tùng có khối
--lượng lớn hơn 15.
SELECT maPT, tenPT, khoiluong 
FROM dbo.Phutung
WHERE khoiluong > 15
--6. Tìm những phụ tùng (maPT, tenPt, mausac) có khối lượng lớn hơn 15,
--không phải màu đỏ (red).
SELECT maPT, tenPT, mausac
FROM dbo.Phutung
WHERE khoiluong > 15 AND mausac <> 'red'
--7. Tìm những phụ tùng (maPT, tenPt, mausac) có khối lượng lớn hơn 15,
--màu sắc khác màu đỏ (red) và xanh (green).
SELECT maPT, tenPT, mausac
FROM dbo.Phutung
WHERE 
khoiluong > 15 AND mausac NOT IN ('red', 'green')
--8. Hiển thị những phụ tùng (maPT, tenPT, khối lượng) có khối lượng lớn
--hơn 15 và nhỏ hơn 20, sắp xếp theo tên phụ tùng.
SELECT maPT, tenPT, khoiluong
FROM dbo.Phutung
WHERE khoiluong BETWEEN 16 AND 19
ORDER BY tenPT
--9. Hiển thị những phụ tùng được vận chuyển bởi nhà cung cấp có mã số S1.
--Không hiển thị kết quả trùng. (sử dụng phép kết).
SELECT DISTINCT PT.*
FROM dbo.Phutung AS PT JOIN dbo.Vanchuyen AS VC
ON VC.maPT = PT.maPT
WHERE VC.maNCC = 'S1'

--Không sử dụng phép kết
SELECT DISTINCT PT.*
FROM dbo.Phutung AS PT, dbo.Vanchuyen AS VC
WHERE VC.maPT = PT.maPT
AND VC.maNCC = 'S1'
--10. Hiển thị những nhà cung cấp vận chuyển phụ tùng có mã là P1 (sử dụng
--phép kết)
SELECT NCC.*
FROM dbo.Nhacungcap AS NCC JOIN dbo.Vanchuyen AS VC
ON VC.maNCC = NCC.maNCC
WHERE VC.maPT = 'P1'
--11. Hiển thị thông tin nhà cung cấp ở thành phố London và có vận chuyển
--phụ tùng của thành phố London. Không hiển thị kết quả trùng. (Sử dụng
--phép kết)
SELECT DISTINCT NCC.*
FROM (dbo.Nhacungcap AS NCC JOIN dbo.Vanchuyen AS VC ON VC.maNCC = NCC.maNCC) 
		JOIN dbo.Phutung AS PT ON PT.maPT = VC.maPT
WHERE NCC.thanhpho = 'London'
AND PT.thanhpho = 'London'
--12. Lặp lại câu 9 nhưng sử dụng toán tử IN.
SELECT *
FROM dbo.Phutung AS PT
WHERE maPT IN ( SELECT VC.maPT
				FROM dbo.Vanchuyen AS VC
				WHERE VC.maPT = PT.maPT
				AND VC.maNCC = 'S1')
--13. Lặp lại câu 10 nhưng sử dụng toán tử IN
SELECT *
FROM dbo.Nhacungcap AS NCC
WHERE NCC.maNCC IN (SELECT VC.maNCC
					FROM dbo.Vanchuyen AS VC
					WHERE VC.maPT = 'P1')
--14. Lặp lại câu 9 nhưng sử dụng toán tử EXISTS
SELECT *
FROM dbo.Phutung AS PT
WHERE EXISTS ( SELECT *
				FROM dbo.Vanchuyen AS VC
				WHERE VC.maPT = PT.maPT
				AND VC.maNCC = 'S1')
--15. Lặp lại câu 10 nhưng sử dụng toán tử EXISTS
SELECT *
FROM dbo.Nhacungcap AS NCC
WHERE EXISTS (SELECT VC.maNCC
					FROM dbo.Vanchuyen AS VC
					WHERE VC.maNCC = NCC.maNCC
					AND VC.maPT = 'P1')
--16. Lặp lại câu 11 nhưng sử dụng truy vấn con. Sử dụng toán tử IN.
SELECT DISTINCT *
FROM dbo.Nhacungcap AS NCC
WHERE NCC.thanhpho = 'London'
AND NCC.maNCC IN ( SELECT VC.maNCC
					FROM dbo.Vanchuyen AS VC JOIN dbo.Phutung AS PT
					ON PT.maPT = VC.maPT
					WHERE PT.thanhpho = 'London')
--17. Lặp lại câu 11 nhưng dùng truy vấn con. Sử dụng toán tử EXISTS.
SELECT DISTINCT *
FROM dbo.Nhacungcap AS NCC
WHERE NCC.thanhpho = 'London'
AND EXISTS (SELECT VC.maNCC
			FROM dbo.Vanchuyen AS VC JOIN dbo.Phutung AS PT
			ON PT.maPT = VC.maPT
			WHERE PT.thanhpho = 'London'
			AND VC.maNCC = NCC.maNCC)
--18. Tìm nhà cung cấp chưa vận chuyển bất kỳ phụ tùng nào. Sử dụng NOT
--IN.
SELECT *
FROM dbo.Nhacungcap AS NCC
WHERE NCC.maNCC NOT IN (SELECT VC.maNCC
						FROM dbo.Vanchuyen AS VC
						WHERE VC.maNCC=NCC.maNCC)
--19. Tìm nhà cung cấp chưa vận chuyển bất kỳ phụ tùng nào. Sử dụng NOT
--EXISTS.
SELECT *
FROM dbo.Nhacungcap AS NCC
WHERE NOT EXISTS ( SELECT *
					FROM dbo.Vanchuyen AS VC
					WHERE VC.maNCC=NCC.maNCC)
--20. Tìm nhà cung cấp chưa vận chuyển bất kỳ phụ tùng nào. Sử dụng outer
--JOIN (Phép kết ngoài)
SELECT NCC.*
FROM dbo.Nhacungcap AS NCC LEFT JOIN dbo.Vanchuyen AS VC
ON VC.maNCC = NCC.maNCC
WHERE VC.maPT IS NULL
--21. Có tất cả bao nhiêu nhà cung cấp?
SELECT COUNT(maNCC) AS SL_NCC
FROM dbo.Nhacungcap
--22. Có tất cả bao nhiêu nhà cung cấp ở London?
SELECT COUNT(maNCC) AS SL_NCC_London
FROM dbo.Nhacungcap
WHERE thanhpho = 'London'
--23. Hiển thị trị giá cao nhất, thấp nhất của trangthai của các nhà cung
--cấp.
SELECT MAX(trangthai) AS MAX_trangthai, MIN(trangthai) AS MIN_trangthai
FROM dbo.Nhacungcap
--24. Hiển thị giá trị cao nhất, thấp nhất của trangthai trong table
--nhacungcap ở thành phố London.
SELECT MAX(trangthai) AS MAX_trangthai, MIN(trangthai) AS MIN_trangthai
FROM dbo.Nhacungcap
WHERE thanhpho = 'London'
--25. Mỗi nhà cung cấp vận chuyển bao nhiêu phụ tùng? Chỉ hiển thị mã nhà
--cung cấp, tổng số phụ tùng đã vận chuyển.
SELECT NCC.maNCC, SUM(soluong) AS TongPhuTung
FROM dbo.Nhacungcap AS NCC LEFT JOIN dbo.Vanchuyen AS VC ON NCC.maNCC = VC.maNCC
GROUP BY NCC.maNCC
--26. Mỗi nhà cung cấp vận chuyển bao nhiêu phụ tùng? Hiển thị mã nhà cung
--cấp, tên, thành phố của nhà cung cấp và tổng số phụ tùng đã vận chuyển
SELECT NCC.maNCC, NCC.tenNCC, NCC.thanhpho, SUM(soluong) AS TongPhuTung
FROM dbo.Nhacungcap AS NCC LEFT JOIN dbo.Vanchuyen AS VC ON NCC.maNCC = VC.maNCC
GROUP BY NCC.maNCC, NCC.tenNCC, NCC.thanhpho
--27. Nhà cung cấp nào đã vận chuyển tổng cộng nhiều hơn 500 phụ tùng? Chỉ
--hiển thị mã nhà cung cấp
SELECT maNCC, SUM(soluong)
FROM dbo.Vanchuyen
GROUP BY maNCC
HAVING SUM(soluong) > 500
--28. Nhà cung cấp nào đã vận chuyển nhiều hơn 300 phụ tùng màu đỏ (red).
--Chỉ hiển thị mã nhà cung cấp.
SELECT maNCC, SUM(soluong)
FROM dbo.Vanchuyen AS VC JOIN dbo.Phutung AS PT ON PT.maPT = VC.maPT
WHERE PT.mausac = 'red'
GROUP BY maNCC
HAVING SUM(soluong) > 300
--29. Nhà cung cấp nào đã vận chuyển nhiều hơn 300 phụ tùng màu đỏ (red).
--Hiển thị mã nhà cung cấp, tên, thành phố và số lượng phụ tùng màu đỏ đã
--vận chuyển.
SELECT NCC.maNCC, NCC.tenNCC, NCC.thanhpho, SUM(soluong) AS SoLuongPhuTung
FROM (dbo.Vanchuyen AS VC JOIN dbo.Phutung AS PT ON PT.maPT = VC.maPT) JOIN dbo.Nhacungcap AS NCC ON NCC.maNCC = VC.maNCC
WHERE PT.mausac = 'red'
GROUP BY NCC.maNCC, NCC.tenNCC, NCC.thanhpho
HAVING SUM(soluong) > 300
--30. Có bao nhiêu nhà cung cấp ở mỗi thành phố.
SELECT thanhpho, COUNT(maNCC)
FROM dbo.Nhacungcap
GROUP BY thanhpho
--31. Nhà cung cấp nào đã vận chuyển nhiều phụ tùng nhất. Hiển thị tên nhà
--cung cấp và số lượng phụ tùng đã vận chuyển.
SELECT TOP 1 NCC.maNCC, NCC.tenNCC, SUM(soluong) AS SOLUONG
FROM dbo.Vanchuyen AS VC JOIN dbo.Nhacungcap AS NCC ON NCC.maNCC = VC.maNCC
GROUP BY NCC.maNCC, NCC.tenNCC
ORDER BY SUM(soluong) DESC
--32. Thành phố nào có cả nhà cung cấp và phụ tùng.
SELECT DISTINCT thanhpho
FROM dbo.Nhacungcap
INTERSECT
SELECT DISTINCT thanhpho
FROM dbo.Phutung
--33. Viết câu lệnh SQL để insert nhà cung cấp mới: S6, Duncan, 30, Paris.
INSERT INTO dbo.Nhacungcap VALUES('S6', 'Duncan', 30, 'Paris')
--34. Viết câu lệnh SQL để thay đổi thanh phố S6 (ở câu 33) thành Sydney.
UPDATE dbo.Nhacungcap SET thanhpho = 'Sydney' WHERE maNCC = 'S6'
--35. Viết câu lệnh SQL tăng trangthai của nhà cung cấp ở London lên thêm
--10.
UPDATE dbo.Nhacungcap
SET trangthai = trangthai + 10
WHERE thanhpho = 'London'
--36. Viết câu lệnh SQL xoá nhà cung cấp S6
DELETE FROM dbo.Nhacungcap WHERE thanhpho = 'Sydney'