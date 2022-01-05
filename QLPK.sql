CREATE DATABASE QLPK
GO

USE QLPK
GO

CREATE TABLE Phongkham
(
	maph CHAR(4) NOT NULL,
	tenph VARCHAR(50),
	diachi VARCHAR(50)
)
GO

CREATE TABLE Nhacungcap
(
	mancc CHAR(4) NOT NULL,
	tenncc VARCHAR(50),
	diachi VARCHAR(50)
)
GO

CREATE TABLE Thuoc
(
	mathuoc CHAR(4) NOT NULL,
	tenthuoc VARCHAR(20),
	dvt VARCHAR(5),
	giathuoc MONEY,
	mancc CHAR(4)
)
GO

CREATE TABLE Benhnhan
(
	mabn CHAR(4) NOT NULL,
	hoten VARCHAR(50),
	sdt VARCHAR(10),
	ngsinh SMALLDATETIME,
	gioitinh CHAR(3)
)
GO

CREATE TABLE Khambenh
(
	makb CHAR(10) NOT NULL,
	maph CHAR(4),
	mabn CHAR(4),
	ngkham SMALLDATETIME,
	chandoan VARCHAR(50),
	ghichu VARCHAR(100)
)
GO

CREATE TABLE Donthuoc
(
	makb CHAR(10) NOT NULL,
	mathuoc CHAR(4) NOT NULL,
	sl INT,
	thanhtien MONEY
)
GO

--Phongkham
ALTER TABLE dbo.Phongkham ADD CONSTRAINT PK_PhK PRIMARY KEY (maph)
GO

--Nhacungcap
ALTER TABLE dbo.Nhacungcap ADD CONSTRAINT PK_Ncc PRIMARY KEY (mancc)
GO

--Thuoc
ALTER TABLE dbo.Thuoc ADD CONSTRAINT PK_Th PRIMARY KEY (mathuoc)
GO

ALTER TABLE dbo.Thuoc ADD CONSTRAINT FK_Th FOREIGN KEY (mancc) REFERENCES dbo.Nhacungcap(mancc)
GO

--Benhnhan
ALTER TABLE dbo.Benhnhan ADD CONSTRAINT PK_Bn PRIMARY KEY (mabn)
GO

--Khambenh
ALTER TABLE dbo.Khambenh ADD CONSTRAINT PK_Kb PRIMARY KEY (makb)
GO

ALTER TABLE dbo.Khambenh ADD CONSTRAINT FK_Kb FOREIGN KEY (maph) REFERENCES dbo.Phongkham(maph)
GO

--Donthuoc
ALTER TABLE dbo.Donthuoc ADD CONSTRAINT PK_Dt PRIMARY KEY (makb, mathuoc)
GO

ALTER TABLE dbo.Donthuoc ADD CONSTRAINT FK01_Dt FOREIGN KEY (makb) REFERENCES dbo.Khambenh(makb)
GO

ALTER TABLE dbo.Donthuoc ADD CONSTRAINT FK02_Dt FOREIGN KEY (mathuoc) REFERENCES dbo.Thuoc(mathuoc)
GO

--Insert
--PhongKham
INSERT INTO Phongkham VALUES ('PK01', 'Tam Tri', 'Cao Lanh')
INSERT INTO Phongkham VALUES ('PK02', 'Tu Nhan', 'Thong Nhat')
INSERT INTO Phongkham VALUES ('PK03', 'Hoa Dong', 'Hoi An')

--Nhacungcap
INSERT INTO Nhacungcap VALUES ('N001', 'A', 'Ho Chi Minh')
INSERT INTO Nhacungcap VALUES ('N002', 'B', 'Cao Lanh')
INSERT INTO Nhacungcap VALUES ('N003', 'C', 'Hoi An')

--Thuoc
INSERT INTO Thuoc VALUES ('T001', 'Thuoc ngu', 'vien', 5000, 'N001')
INSERT INTO Thuoc VALUES ('T002', 'Thuoc nho mat', 'chai', 12000, 'N002')
INSERT INTO Thuoc VALUES ('T003', 'Da day', 'hop', 20000, 'N003')

--Benhnhan
INSERT INTO Benhnhan VALUES ('BN01', 'Nguyen Van A', '0368754987', '02/01/1998', 'Nam')
INSERT INTO Benhnhan VALUES ('BN02', 'Nguyen Thi B', '0795413254', '12/04/1990', 'Nu')
INSERT INTO Benhnhan VALUES ('BN03', 'Tran Van C', '0826339633', '07/10/2000', 'Nam')

--Khambenh
INSERT INTO Khambenh VALUES ('KB001', 'PK01', 'BN02', '03/10/2010', 'Stress', NULL)
INSERT INTO Khambenh VALUES ('KB002', 'PK02', 'BN03', '10/07/2020', 'Roi loan tieu hoa', NULL)
INSERT INTO Khambenh VALUES ('KB003', 'PK03', 'BN02', '06/08/2016', 'Moi mat', NULL)

--Donthuoc
INSERT INTO Donthuoc VALUES ('KB001', 'T003', 2, 40000)
INSERT INTO Donthuoc VALUES ('KB002', 'T003', 5, 100000)
INSERT INTO Donthuoc VALUES ('KB001', 'T002', 10, 120000)

--1.2. Thêm cột ghichu có kiểu dữ liệu varchar(50) vào bảng Nhacungcap. (0.25 đ)
ALTER TABLE dbo.Nhacungcap ADD ghichu VARCHAR(50)
GO
--2. Hiện thực các ràng buộc toàn vẹn sau (2đ)
--2.1. Giá thuốc (giathuoc) phải lớn hơn 0. (0.5đ)
ALTER TABLE dbo.Thuoc ADD CONSTRAINT CK_giathuoc CHECK (giathuoc > 0)
GO
--2.2. Đơn vị tính (dvt) của thuốc phải là chai, hop, vien. (0.5đ)
ALTER TABLE dbo.Thuoc ADD CONSTRAINT CK_dvt CHECK (dvt IN ('chai', 'hop', 'vien'))
GO
--2.3. Mỗi khi thêm mới hoặc cập nhật số lượng (sl) thuốc thì thành tiền phải được tự động
--tính lại. (1đ)
--3. Viết câu lệnh SQL thực hiện các câu truy vấn sau (6đ)
--3.1. Hiển thị thông tin thuốc và tên nhà cung cấp thuốc. Sắp xếp theo giá thuốc tăng dần.
SELECT *
FROM dbo.Thuoc AS T JOIN dbo.Nhacungcap AS NCC ON NCC.mancc = T.mancc
ORDER BY T.giathuoc DESC
--3.2. Hiển thị thông tin phòng khám (maph) và tổng doanh thu của từng phòng khám theo
--từng tháng trong năm 2017.
SELECT MONTH(K.ngkham) AS THANG, K.maph, SUM(DT.thanhtien) DOANHTHU
FROM dbo.Donthuoc AS DT JOIN dbo.Khambenh AS K ON K.makb = DT.makb
WHERE YEAR(K.ngkham) = 2020
GROUP BY MONTH(K.ngkham), K.maph
--3.3. Nhà cung cấp nào (mancc, tenncc) chỉ cung cấp thuốc có giá bán lớn hơn 30000.
SELECT NCC.mancc, NCC.tenncc
FROM dbo.Nhacungcap AS NCC JOIN dbo.Thuoc AS T ON T.mancc = NCC.mancc
WHERE T.giathuoc > 10000
--3.4. Bệnh nhân nào (mabn, hoten) trong năm 2017 có số lần đi khám nhiều nhất.
SELECT BN.mabn, BN.hoten
FROM dbo.Benhnhan AS BN JOIN dbo.Khambenh AS KB ON KB.mabn = BN.mabn
GROUP BY BN.mabn, BN.hoten
HAVING COUNT(KB.makb) >= ALL (SELECT COUNT(makb) FROM dbo.Khambenh GROUP BY mabn)
--3.5. Trong ngày '1/1/2017' bệnh nhân nào (mabn, hoten) khám ở cả hai phòng khám có
--mã số là 'pk1' và 'pk2'.
SELECT BN.mabn, BN.hoten
FROM dbo.Benhnhan AS BN JOIN dbo.Khambenh AS KB ON KB.mabn = BN.mabn
WHERE KB.ngkham = '1/1/2017'
AND KB.maph = 'PK01'
INTERSECT
SELECT BN.mabn, BN.hoten
FROM dbo.Benhnhan AS BN JOIN dbo.Khambenh AS KB ON KB.mabn = BN.mabn
WHERE KB.ngkham = '1/1/2017'
AND KB.maph = 'PK02'
--3.6. Phòng khám nào đã khám cho tất cả các bệnh nhân nữ (gioitinh='Nu') sinh năm
--1960.
SELECT *
FROM dbo.Phongkham AS PK
WHERE NOT EXISTS(SELECT *
					FROM dbo.Benhnhan AS BN
					WHERE BN.gioitinh = 'Nu'
					AND YEAR(BN.ngsinh) = 1960
					AND NOT EXISTS (SELECT * 
										FROM dbo.Khambenh AS KB
										WHERE BN.mabn = KB.mabn
										AND KB.maph = PK.maph))

SELECT *
FROM dbo.Phongkham AS PK
WHERE NOT EXISTS ((SELECT BN.mabn
					FROM Benhnhan AS BN
					WHERE BN.gioitinh = 'Nu'
					AND YEAR(BN.ngsinh) = 1960)
					EXCEPT
					(SELECT KB.mabn
						FROM Khambenh AS KB
						WHERE KB.maph = PK.maph))