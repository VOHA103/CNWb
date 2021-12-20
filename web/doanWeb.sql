create DATABASE QLSANPHAM
GO
USE QLSANPHAM
GO
CREATE TABLE DANHMUC
(
	ID INT IDENTITY,
	MADM INT NOT NULL PRIMARY KEY,
	TEN NVARCHAR(50),
	tenkhongdau varchar(200),
	noibat int,--0 k hiển thị, 1 là có
)
GO
CREATE TABLE SANPHAM
(
	ID INT IDENTITY NOT NULL PRIMARY KEY,
	TENSANPHAM NVARCHAR(200),
	MADM INT,
	HANGSX nvarchar(100),
	CONSTRAINT FK_SP_DM FOREIGN KEY (MADM) REFERENCES DANHMUC(MADM),
	MOTA NVARCHAR(200),
	MOTA2 NVARCHAR(MAX),
	HINHDAIDIEN VARCHAR(50),
	GIABAN FLOAT,
	GIAKHUYENMAI FLOAT DEFAULT NULL,
	SOLUONG INT,
	SANPHAMMOI BIT, --1:LÀ SẢN PHẨM MỚI
	SANPHAMBANCHAY BIT, --1:BÁN CHẠY
	TRANGTHAI BIT ,--1:ĐANG BÁN
	TENKHONGDAU VARCHAR(300)
)
GO
CREATE TABLE CHITIETSANPHAM
(
	ID INT IDENTITY primary key,
	IDSANPHAM INT ,
	CONSTRAINT FK_CTSANPHAM_SANPHAM FOREIGN KEY (IDSANPHAM) REFERENCES SANPHAM(ID),
	HINHANH VARCHAR(50),
	STT INT
)

CREATE TABLE TIMHIEUSANPHAM
(
ID INT IDENTITY PRIMARY KEY,
MASP INT,
hoten nvarchar(200),
sdt int,
EMAIL VARCHAR(200),
NOTE NVARCHAR(200),
NGAYTAO DATETIME,
CONSTRAINT FK_THSP_SANPHAM FOREIGN KEY (MASP) REFERENCES SANPHAM(ID)
)
GO
CREATE TABLE ACCOUNT
(
	ID INT IDENTITY PRIMARY KEY,
	EMAIL VARCHAR(50) NOT NULL UNIQUE,
	MATKHAU VARCHAR(50),
	TRANGTHAI BIT,
	CHUADMIN BIT, 
)
GO
---BẢNG DANH MỤC
INSERT INTO DANHMUC VALUES(1,N'Laptop','laptop',1)
INSERT INTO DANHMUC VALUES(2,N'Mainboard','Mainboard',1)
INSERT INTO DANHMUC VALUES(3,N'CPU','cpu',1)
INSERT INTO DANHMUC VALUES(4,N'RAM','ram',1)
INSERT INTO DANHMUC VALUES(5,N'VGA','vga',1)
INSERT INTO DANHMUC VALUES(6,N'SSD','ssd',1)
INSERT INTO DANHMUC VALUES(7,N'HDD','hdd',1)
INSERT INTO DANHMUC VALUES(8,N'VỎ MÁY TÍNH','vo-may-tinh',1)
INSERT INTO DANHMUC VALUES(9,N'PSU','psu',1)
INSERT INTO DANHMUC VALUES(10,N'TẢN NHIỆT','tan-nhiet',1)
INSERT INTO DANHMUC VALUES(11,N'TAI NGHE','tai-nghe',1)
INSERT INTO DANHMUC VALUES(12,N'BÀN PHÍM','ban-phim',1)
INSERT INTO DANHMUC VALUES(13,N'MÀN HÌNH','man-hinh',1)
INSERT INTO DANHMUC VALUES(14,N'CHUỘT','chuot',1)
INSERT INTO DANHMUC VALUES(15,N'THIẾT BỊ MẠNG','thiet-bi-mang',1)

GO
---BẢNG SẢN PHẨM
INSERT INTO SANPHAM(TENSANPHAM,MADM,HANGSX,MOTA,MOTA2,HINHDAIDIEN,GIABAN,SOLUONG,SANPHAMMOI,SANPHAMBANCHAY,TRANGTHAI,TENKHONGDAU) 
VALUES 
('ASUS ROG STRIX G G512 IAL013T',1,'ASUS','motane',N'Mang đến ngôn ngữ thiết kế hiện đại, chiến những tựa game nặng kí nhất.','imagelp1.jpg',21990000,100,1,1,1,'asus-rog-strix'),
('MACBOOK PRO 13 2020 Z11B000CT',1,'APPLE','motane',N'Mỏng nhẹ chỉ 15.6 mm, trọng lượng 1.4 kg có thể tự tin đồng hành cùng bạn đến bất cứ đâu.','imagelp2.jpg',36990000,100,0,0,1,'macbook-pro-13'),
('ACER ASPIRE 3 A315 57G 524Z',1,'ACER','motane',N'15.6", 1920 x 1080 Pixel, TN, 60 Hz, Acer ComfyView LED-backlit','imagelp3.jpg',15490000,100,1,0,1,'acer-aspire-3-a315'),
('ASUS VIVOBOOK D515UA Ẹ045T',1,'ASUS','motane',N'Có hiệu năng thực sự mạnh mẽ với bộ vi xử lý Ryzen 5 5000 series mới nhất từ nhà AMD','imagelp4.jpg',13490000,100,1,1,1,'asus-vivobook-d515'),
('MSI MODERN 14 B11MO 011VN',1,'MSI','motane',N'Mang đến sức mạnh mà người dùng phải ngạc nhiên khi nó vượt xa cả mong đợi của mình ','imagelp5.jpg',20990000,100,0,0,1,'msi-modern-14'),
('LENOVO IDEAPAD SLIM 3 14IIL05 81WD00VJVN',1,'LENOVO','motane',N'Mỏng nhẹ, mạnh mẽ và tính bảo mật cao, Lenovo IdeaPad 3-14IIL05 chính là lựa chọn tuyệt vời dành cho bạn.','imagelp6.jpg',10490000,100,0,0,1,'lenovo-ideapad-14'),

('ASUS H410M-E',2,'ASUS','motane',N'Mang đến ngôn ngữ thiết kế hiện đại, chiến những tựa game nặng kí nhất.','imagemb1.jpg',1865000,100,1,1,1,'ASUS-H410M-E'),
('GIGABYTE B460M GAMING HD',2,'GIGABYTE','motane',N'Mỏng nhẹ chỉ 15.6 mm, trọng lượng 1.4 kg có thể tự tin đồng hành cùng bạn đến bất cứ đâu.','imagemb2.jpg',1990000,100,0,0,1,'GIGABYTE-B460M-GAMIN-HD'),
('ASUS H410M-CS',2,'ASUS','motane',N'15.6", 1920 x 1080 Pixel, TN, 60 Hz, Acer ComfyView LED-backlit','imagemb3.jpg',1810000,100,1,0,1,'ASUS-H410M-CS'),
('MSI MAG B365M MORTAR',2,'MSI','motane',N'Có hiệu năng thực sự mạnh mẽ với bộ vi xử lý Ryzen 5 5000 series mới nhất từ nhà AMD','imagemb4.jpg',2390000,100,1,1,1,'MSI-MAG-B365M-MORTAR'),
('GIGABYTE B365M GAMING HD',2,'GIGABYTE','motane',N'Mang đến sức mạnh mà người dùng phải ngạc nhiên khi nó vượt xa cả mong đợi của mình ','imagemb5.jpg',1750000,100,0,0,1,'GIGABYTE-B365M-GAMING-HD'),
('GIGABYTE Z390 GAMING X',2,'GIGABYTE','motane',N'Mỏng nhẹ, mạnh mẽ và tính bảo mật cao, Lenovo IdeaPad 3-14IIL05 chính là lựa chọn tuyệt vời dành cho bạn.','imagemb6.jpg',4090000,100,0,0,1,'GIGABYTE-Z390-GAMING-X'),

('AMD Ryzen 7 3700x',3,'AMD','motane',N'Mang đến ngôn ngữ thiết kế hiện đại, chiến những tựa game nặng kí nhất.','imagecp1.jpg',8490000,100,1,1,1,'AMD-Ryzen-7-3700x'),
('AMD Ryzen 9 5900X',3,'AMD','motane',N'Mỏng nhẹ chỉ 15.6 mm, trọng lượng 1.4 kg có thể tự tin đồng hành cùng bạn đến bất cứ đâu.','imagecp2.jpg',15290000,100,0,0,1,'AMD-Ryzen-9-5900X'),
('AMD Ryzen Threadripper PRO',3,'AMD','motane',N'15.6", 1920 x 1080 Pixel, TN, 60 Hz, Acer ComfyView LED-backlit','imagecp3.jpg',72000000,100,1,0,1,'AMD-Ryzen-Threadripper-PRO'),
('AMD Ryzen 5 2600',3,'AMD','motane',N'Có hiệu năng thực sự mạnh mẽ với bộ vi xử lý Ryzen 5 5000 series mới nhất từ nhà AMD','imagecp4.jpg',5050000,100,1,1,1,'AMD-Ryzen-5-2600'),
('Intel Celeron G4900',3,'Intel','motane',N'Mang đến sức mạnh mà người dùng phải ngạc nhiên khi nó vượt xa cả mong đợi của mình ','imagecp5.jpg',1150000,100,0,0,1,'Intel-Celeron-G4900'),

('Adata Value Value 4GB',4,'Adata','motane',N'Mang đến ngôn ngữ thiết kế hiện đại, chiến những tựa game nặng kí nhất.','imagera1.jpg',550000,100,1,1,1,'Adata-Value-Value-4GB'),
('Gigabyte Memory 2666',4,'Gigabyte','motane',N'Mỏng nhẹ chỉ 15.6 mm, trọng lượng 1.4 kg có thể tự tin đồng hành cùng bạn đến bất cứ đâu.','imagera2.jpg',1190000,100,0,0,1,'Gigabyte-Memory-2666'),
('G.SKILL Ripjaws V',4,'G.SKILL','motane',N'15.6", 1920 x 1080 Pixel, TN, 60 Hz, Acer ComfyView LED-backlit','imagera3.jpg',1190000,100,1,0,1,'G-SKILL-Ripjaws-V'),
('G.SKILL Trident Z RGB',4,'G.SKILL','motane',N'Có hiệu năng thực sự mạnh mẽ với bộ vi xử lý Ryzen 5 5000 series mới nhất từ nhà AMD','imagera4.jpg',2890000,100,1,1,1,'G-SKILL-Trident-Z-RGB'),
('G.SKILL Z Neo',4,'G.SKILL','motane',N'Mang đến sức mạnh mà người dùng phải ngạc nhiên khi nó vượt xa cả mong đợi của mình ','imagera5.jpg',4390000,100,0,0,1,'G-SKILL-Z-Neo'),
('Corsair Vengeance RGB PRO',4,'Corsair','motane',N'Mỏng nhẹ, mạnh mẽ và tính bảo mật cao, Lenovo IdeaPad 3-14IIL05 chính là lựa chọn tuyệt vời dành cho bạn.','imagera6.jpg',11990000,100,0,0,1,'Corsair-Vengeance-RGB-PRO'),

('MSI GeForce RTX 3090 SUPRIM X 24G',5,'MSI','motane',N'Mang đến ngôn ngữ thiết kế hiện đại, chiến những tựa game nặng kí nhất.','imagevg1.jpg',75990000,100,1,1,1,'MSI-GeForce-RTX-3090-SUPRIM-X-24G'),
('MSI Geforce RTX 3090 GAMING X TRIO 24G',5,'MSI','motane',N'Mỏng nhẹ chỉ 15.6 mm, trọng lượng 1.4 kg có thể tự tin đồng hành cùng bạn đến bất cứ đâu.','imagevg2.jpg',72990000,100,0,0,1,'MSI-Geforce-RTX-3090-GAMING-X-TRIO-24G'),
('MSI Geforce RTX 3080 SUPRIM X 10G',5,'MSI','motane',N'15.6", 1920 x 1080 Pixel, TN, 60 Hz, Acer ComfyView LED-backlit','imagevg3.jpg',60990000,100,1,0,1,'MSI Geforce-RTX-3080-SUPRIM-X-10G'),
('GIGABYTE AORUS Geforce RTX 3070 MASTER 8G',5,'GIGABYTE','motane',N'Có hiệu năng thực sự mạnh mẽ với bộ vi xử lý Ryzen 5 5000 series mới nhất từ nhà AMD','imagevg4.jpg',35990000,100,1,1,1,'GIGABYTE-AORUS-Geforce-RTX-3070-MASTER-8G'),
('GIGABYTE AORUS Radeon RX 6800 MASTER 16G',5,'GIGABYTE','motane',N'Mang đến sức mạnh mà người dùng phải ngạc nhiên khi nó vượt xa cả mong đợi của mình ','imagevg5.jpg',31990000,100,0,0,1,'GIGABYTE-AORUS-Radeon-RX-6800-MASTER-16G'),
('ASUS Dual Radeon RX 6700',5,'ASUS','motane',N'Mỏng nhẹ, mạnh mẽ và tính bảo mật cao, Lenovo IdeaPad 3-14IIL05 chính là lựa chọn tuyệt vời dành cho bạn.','imagevg6.jpg',22490000,100,0,0,1,'ASUS-Dual-Radeon-RX-6700'),

('PNY SSD CS900 240GB 2.5" Sata 3',6,'PNY','motane',N'Mang đến ngôn ngữ thiết kế hiện đại, chiến những tựa game nặng kí nhất.','imagess1.jpg',75990000,100,1,1,1,'PNY-SSD-CS900-240GB-2-5'),
('SSD SAMSUNG 980 M.2 PCLe NVMe 250GB',6,'SSD','motane',N'Mỏng nhẹ chỉ 15.6 mm, trọng lượng 1.4 kg có thể tự tin đồng hành cùng bạn đến bất cứ đâu.','imagess2.jpg',72990000,100,0,0,1,'SSD-SAMSUNG-980-M.2-PCLe-NVMe-250GB'),
('SSD SAMSUNG 980 PRO 250GB M.2 NVMe MZ -V8P250BW',6,'SSD','motane',N'15.6", 1920 x 1080 Pixel, TN, 60 Hz, Acer ComfyView LED-backlit','imagess3.jpg',60990000,100,1,0,1,'SSD-SAMSUNG-980-PRO-250GB-M-2-NVMe-MZ-V8P250BW'),
('SSD KINGSTON A2000 1TB M.2 NVMe-SA2000M8/1000G',6,'SSD','motane',N'Có hiệu năng thực sự mạnh mẽ với bộ vi xử lý Ryzen 5 5000 series mới nhất từ nhà AMD','imagess4.jpg',35990000,100,1,1,1,'SSD-KINGSTON-A2000-1TB-M-2-NVMe-SA2000M8-1000G'),
('WD SSD Black SN750 500GB M.2 NVMe PCIe 3470/2600 MB/s',6,'SSD','motane',N'Mang đến sức mạnh mà người dùng phải ngạc nhiên khi nó vượt xa cả mong đợi của mình ','imagess5.jpg',31990000,100,0,0,1,'WD-SSD-Black-SN750-500GB-M-2-NVMe-PCIe-3470-2600-MB-s'),
('SSD WD SN850 500GB M.2 PCIe NVMe (Gen 4)',6,'SSD','motane',N'Mỏng nhẹ, mạnh mẽ và tính bảo mật cao, Lenovo IdeaPad 3-14IIL05 chính là lựa chọn tuyệt vời dành cho bạn.','imagess6.jpg',22490000,100,0,0,1,'SSD-WD-SN850-500GB-M-2-PCIe-NVMe-Gen-4'),

('HDD WD Blue 1TB 7200rpm',7,'HDD','motane',N'Mang đến ngôn ngữ thiết kế hiện đại, chiến những tựa game nặng kí nhất.','imagehd1.jpg',1050000,100,1,1,1,'HDD-WD-Blue-1TB-7200rpm'),
('HDD WD Red 2TB 5400rpm',7,'HDD','motane',N'Mỏng nhẹ chỉ 15.6 mm, trọng lượng 1.4 kg có thể tự tin đồng hành cùng bạn đến bất cứ đâu.','imagehd2.jpg',2190000,100,0,0,1,'HDD-WD-Red-2TB-5400rpm'),
('HDD WD Black 1TB 7200rpm',7,'HDD','motane',N'15.6", 1920 x 1080 Pixel, TN, 60 Hz, Acer ComfyView LED-backlit','imagehd3.jpg',2000000,100,1,0,1,'HDD-WD-Black-1TB-7200rpm'),
('WD HDD Black 2TB 7200rpm',7,'HDD','motane',N'Có hiệu năng thực sự mạnh mẽ với bộ vi xử lý Ryzen 5 5000 series mới nhất từ nhà AMD','imagehd4.jpg',3690000,100,1,1,1,'WD-HDD-Black-2TB-7200rpm'),
('HDD Seagate Ironwolf PRO 4TB 7200rpm',7,'HDD','motane',N'Mang đến sức mạnh mà người dùng phải ngạc nhiên khi nó vượt xa cả mong đợi của mình ','imagehd5.jpg',5090000,100,0,0,1,'HDD-Seagate-Ironwolf-PRO-4TB-7200rpm'),
('HDD Seagate Ironwolf PRO 14TB 7200rpm',7,'HDD','motane',N'Mỏng nhẹ, mạnh mẽ và tính bảo mật cao, Lenovo IdeaPad 3-14IIL05 chính là lựa chọn tuyệt vời dành cho bạn.','imagehd6.jpg',14490000,100,0,0,1,'HDD-Seagate-Ironwolf-PRO-14TB-7200rpm'),

('Case XIGMATEK AERO 2F',8,'Case','motane',N'Mang đến ngôn ngữ thiết kế hiện đại, chiến những tựa game nặng kí nhất.','imagevm1.jpg',690000,100,1,1,1,'Case-XIGMATEK-AERO-2F'),
('Case XIGMATEK GAMING X 3FX',8,'Case','motane',N'Mỏng nhẹ chỉ 15.6 mm, trọng lượng 1.4 kg có thể tự tin đồng hành cùng bạn đến bất cứ đâu.','imagevm2.jpg',850000,100,0,0,1,'Case-XIGMATEK-GAMING-X-3FX'),
('Case MSI MAG VAMPIRIC 100R',8,'Case','motane',N'15.6", 1920 x 1080 Pixel, TN, 60 Hz, Acer ComfyView LED-backlit','imagevm3.jpg',1490000,100,1,0,1,'Case-MSI-MAG-VAMPIRIC-100R'),
('Case Antec NX800',8,'Case','motane',N'Có hiệu năng thực sự mạnh mẽ với bộ vi xử lý Ryzen 5 5000 series mới nhất từ nhà AMD','imagevm4.jpg',1750000,100,1,1,1,'Case-Antec-NX800'),
('Case Xigmatek Aquarius Plus-Black',8,'Case','motane',N'Mang đến sức mạnh mà người dùng phải ngạc nhiên khi nó vượt xa cả mong đợi của mình ','imagevm5.jpg',2000000,100,0,0,1,'Case-Xigmatek-Aquarius-Plus-Black'),
('Case Deepcool CL500 4F',8,'Case','motane',N'Mỏng nhẹ,mạnh mẽ và tính bảo mật cao,Lenovo IdeaPad 3-14IIL05 chính là lựa chọn tuyệt vời dành cho bạn.','imagevm6.jpg',2190000,100,0,0,1,'Case-Deepcool-CL500-4F'),

(N'(600W) Nguồn SliverStone ST60F-ES230-80 Plus',9,'SliverStone','motane',N'Biến áp được nâng cấp cải thiện sự cân bằng giữa các quy định điện áp 12V, 3.3V và 5V và tăng cường sự ổn định','imageps1.jpg',1090000,100,1,1,1,'SliverStone-ST60F-ES230-80-Plus'),
(N'(750W) Nguồn CoolerMaster MWE 750 BRONZE-V2 230V',9,'CoolerMaster','motane',N'Biến áp được nâng cấp cải thiện sự cân bằng giữa các quy định điện áp 12V, 3.3V và 5V và tăng cường sự ổn định.','imageps2.jpg',2090000,100,0,0,1,'CoolerMaster-MWE-750-BRONZE-V2-230V'),
(N'(650W) Nguồn Corsair RM650-80 Plus Gold-Full Modular',9,'Corsair','motane',N'Biến áp được nâng cấp cải thiện sự cân bằng giữa các quy định điện áp 12V, 3.3V và 5V và tăng cường sự ổn định','imageps3.jpg',2690000,100,1,0,1,'Corsair-RM650-80-Plus-Gold-Full-Modular'),
(N'(850W) Nguồn Corsair RM850-80 Plus Gold-Full Modular',9,'Corsair','motane',N'Biến áp được nâng cấp cải thiện sự cân bằng giữa các quy định điện áp 12V, 3.3V và 5V và tăng cường sự ổn định','imageps4.jpg',3290000,100,1,1,1,'Corsair-RM650-80-Plus-Gold-Full-Modular'),
(N'(850W) Nguồn Corsair RM850X-80 Plus Gold-Full Modular',9,'Corsair','motane',N'Biến áp được nâng cấp cải thiện sự cân bằng giữa các quy định điện áp 12V, 3.3V và 5V và tăng cường sự ổn định ','imageps5.jpg',3790000,100,0,0,1,'Corsair-RM650-80-Plus-Gold-Full-Modular'),
(N'(1200W)Nguồn Corsair AX1200i-1200 Watt-80 Plus Platinum-Full Modular',9,'Corsair','motane',N'Biến áp được nâng cấp cải thiện sự cân bằng giữa các quy định điện áp 12V, 3.3V và 5V và tăng cường sự ổn định.','imageps6.jpg',9200000,100,0,0,1,'Corsair-AX1200i-1200-Watt-80-Plus-Platinum-Full-Modular'),

(N'Fan DEEPCOOL CF120-FAN RGB(CF120)',10,'DEEPCOOL','motane',N'có động cơ mạnh mẽ - tản nhiệt hơi nóng cho máy tính hiệu quả, sử dụng động cơ cuộn lõi đồng tạo ra một nguồn không khí lạnh liên tục.','imagetn1.jpg',450000,100,1,1,1,'DEEPCOOL-CF120-FAN-RGB-CF120'),
(N'Tản nhiệt Xigmatek Windpower Pro ARGB',10,'Xigmatek','motane',N'có động cơ mạnh mẽ - tản nhiệt hơi nóng cho máy tính hiệu quả, sử dụng động cơ cuộn lõi đồng tạo ra một nguồn không khí lạnh liên tục.','imagetn2.jpg',890000,100,0,0,1,'Xigmatek-Windpower-Pro-ARGB'),
(N'Fan Cooler Master MASTERFAN MF120 PRISMATIC 3 IN 1',10,'Cooler','motane',N'có động cơ mạnh mẽ - tản nhiệt hơi nóng cho máy tính hiệu quả, sử dụng động cơ cuộn lõi đồng tạo ra một nguồn không khí lạnh liên tục','imagetn3.jpg',1550000,100,1,0,1,'Cooler-Master-MASTERFAN-MF120-PRISMATIC-3-IN-1'),
(N'Tản nhiệt Cooler Master MASTERAIR MA610P ARGB',10,'Cooler','motane',N'có động cơ mạnh mẽ - tản nhiệt hơi nóng cho máy tính hiệu quả, sử dụng động cơ cuộn lõi đồng tạo ra một nguồn không khí lạnh liên tục','imagetn4.jpg',1750000,100,1,1,1,'Cooler-Master-MASTERAIR-MA610P-ARGB'),
(N'Tản nhiệt GIGABYTE AORUS ATC800',10,'GIGABYTE','motane',N'có động cơ mạnh mẽ - tản nhiệt hơi nóng cho máy tính hiệu quả, sử dụng động cơ cuộn lõi đồng tạo ra một nguồn không khí lạnh liên tục','imagetn5.jpg',2050000,100,0,0,1,'GIGABYTE-AORUS-ATC800'),
(N'Tản nhiệt Deepcool Assassin III',10,'Deepcool','motane',N'có động cơ mạnh mẽ - tản nhiệt hơi nóng cho máy tính hiệu quả, sử dụng động cơ cuộn lõi đồng tạo ra một nguồn không khí lạnh liên tục.','imagetn6.jpg',2250000,100,0,0,1,'Deepcool-Assassin-III'),

(N'Tai nghe DareU EH416 RGB',11,'DareU','motane',N'có microphone thu tiếng trong và rõ có thể xoay dễ dàng để điều chỉnh.','imagetn1.jpg',350000,100,1,1,1,'DareU-EH416-RGB'),
(N'Tai nghe HyperX Cloud II RED',11,'HyperX','motane',N'có microphone thu tiếng trong và rõ có thể xoay dễ dàng để điều chỉnh.','imagetn2.jpg',2090000,100,0,0,1,'HyperX-Cloud-II-RED'),
(N'Tai nghe Gaming Logitech G Pro Gen 2',11,'Gaming','motane',N'có microphone thu tiếng trong và rõ có thể xoay dễ dàng để điều chỉnh','imagetn3.jpg',2390000,100,1,0,1,'Gaming-Logitech-G-Pro-Gen-2'),
(N'Tai nghe HyperX Cloud Stinger Core',11,'HyperX','motane',N'có microphone thu tiếng trong và rõ có thể xoay dễ dàng để điều chỉnh','imagetn4.jpg',799000,100,1,1,1,'HyperX-Cloud-Stinger-Core'),
(N'Tai nghe Razer Hammerhead True Wireless Earbuds',11,'Razer','motane',N'có microphone thu tiếng trong và rõ có thể xoay dễ dàng để điều chỉnh','imagetn5.jpg',2290000,100,0,0,1,'Razer-Hammerhead-True-Wireless-Earbuds'),
(N'Tai nghe Cooler Master MH710',11,'Cooler','motane',N'có microphone thu tiếng trong và rõ có thể xoay dễ dàng để điều chỉnh.','imagetn6.jpg',990000,100,0,0,1,'Cooler-Master-MH710'),

(N'Bàn phím Razer Huntsman Mini',12,'Razer','motane',N'Có LED nhiều màu ấn tượng, ban đêm tắt điện vẫn sử dụng bàn phím bình thường.','imagebp1.jpg',3190000,100,1,1,1,'Razer-Huntsman-Mini'),
(N'Bàn phím Razer Blackwidow V3',12,'Razer','motane',N'Có LED nhiều màu ấn tượng, ban đêm tắt điện vẫn sử dụng bàn phím bình thường.','imagebp2.jpg',3590000,100,0,0,1,'Razer-Blackwidow-V3'),
(N'Bàn phím Razer Blackwidow V3 Pro',12,'Razer','motane',N'Có LED nhiều màu ấn tượng, ban đêm tắt điện vẫn sử dụng bàn phím bình thường','imagebp3.jpg',5990000,100,1,0,1,'Razer-Blackwidow-V3-Pro'),
(N'Bàn phím Logitech G813 RGB',12,'Logitech','motane',N'Có LED nhiều màu ấn tượng, ban đêm tắt điện vẫn sử dụng bàn phím bình thường','imagebp4.jpg',3090000,100,1,1,1,'Logitech-G813-RGB'),
(N'Bàn phím Logitech G913 TKL Lightspeed Wireless',12,'Logitech','motane',N'Có LED nhiều màu ấn tượng, ban đêm tắt điện vẫn sử dụng bàn phím bình thường','imagebp5.jpg',3990000,100,0,0,1,'Logitech-G913-TKL-Lightspeed-Wireless'),
(N'Bàn phím Leopold FC660MPD Light Pink',12,'Leopold','motane',N'Có LED nhiều màu ấn tượng, ban đêm tắt điện vẫn sử dụng bàn phím bình thường.','imagebp6.jpg',2750000,100,0,0,1,'Leopold-FC660MPD-Light-Pink'),

(N'Màn hình ViewSonic VX2458-P 24',13,'ViewSonic','motane',N'bạn có thể xem những nội dung 4K và HDR như hằng mơ ước..','imagemh1.jpg',4350000,100,1,1,1,'ViewSonic-VX2458-P-24'),
(N'Màn hình Asus TUF GAMING VG249Q 24',13,'Asus','motane',N'bạn có thể xem những nội dung 4K và HDR như hằng mơ ước..','imagemh2.jpg',5450000,100,0,0,1,'Asus-TUF-GAMING-VG249Q-24'),
(N'Màn hình ViewSonic VP2458 24 IPS chuyên đồ họa',13,'ViewSonic','motane',N'bạn có thể xem những nội dung 4K và HDR như hằng mơ ước.','imagemh3.jpg',4500000,100,1,0,1,'ViewSonic-VP2458-24-IPS-chuyen-do-hoa'),
(N'Màn hình ASUS ProArt PA248QV 24" IPS 75Hz 16:10 chuyên đồ họa',13,'ASUS','motane',N'bạn có thể xem những nội dung 4K và HDR như hằng mơ ước.','imagemh4.jpg',5190000,100,1,1,1,'ASUS ProArt PA248QV-24-IPS-75Hz-16-10-chuyen-do-hoa'),
(N'Màn hình Dell UltraSharp U2721DE 27" IPS 2K chuyên đồ họa',13,'Dell','motane',N'bạn có thể xem những nội dung 4K và HDR như hằng mơ ước.','imagemh5.jpg',10690000,100,0,0,1,'UltraSharp-U2721DE-27'),
(N'Màn hình cong Philips 322M8CZ 32" VA 165Hz Freesync',13,'Philips','motane',N'bạn có thể xem những nội dung 4K và HDR như hằng mơ ước..','imagemh6.jpg',6290000,100,0,0,1,'322M8CZ-32'),

(N'Chuột Logitech G102 Lightsync RGB Black',14,'Logitech','motane',N'Thời gian sử dụng: 50 triệu lần click..','imagech1.jpg',400000,100,1,1,1,'G102-Lightsync-RGB-Black'),
(N'Chuột Logitech G502 Hero',14,'Logitech','motane',N'Thời gian sử dụng: 50 triệu lần click..','imagech2.jpg',990000,100,0,0,1,'G502-Hero'),
(N'Chuột Logitech G Pro Wireless',14,'Logitech','motane',N'Thời gian sử dụng: 50 triệu lần click.','imagech3.jpg',2690000,100,1,0,1,'G-Pro-Wireless'),
(N'Chuột Razer DeathAdder V2',14,'Razer','motane',N'Thời gian sử dụng: 50 triệu lần click.','imagech4.jpg',1690000,100,1,1,1,'DeathAdder-V2'),
(N'Chuột Razer DeathAdder V2 Pro',14,'Razer','motane',N'Thời gian sử dụng: 50 triệu lần click.','imagech5.jpg',2990000,100,0,0,1,'DeathAdder-V2-Pro'),
(N'Chuột Steelseries Rival 650 VA 165Hz Freesync',14,'Steelseries','motane',N'Thời gian sử dụng: 50 triệu lần click..','imagech6.jpg',2590000,100,0,0,1,'Rival-650-VA-165Hz-Freesync'),

(N'Bộ định tuyến WiFi 5 ASUS RT-AC1500UHP Chuẩn AC1500 (Xuyên tường)',15,'ASUS','motane',N'Hỗ trợ IGMP Proxy/Snooping, Cầu nối and Tag VLAN để tối ưu hóa luồng IPTV.','imagetbm1.jpg',1690000,100,1,1,1,'RT-AC1500UHP-Chuan-AC1500-Xuyen-tuong'),
(N'Bộ định tuyến WiFi 6 Asus RT-AX82U Gundam Edition',15,'ASUS','motane',N'Hỗ trợ IGMP Proxy/Snooping, Cầu nối and Tag VLAN để tối ưu hóa luồng IPTV.','imagetbm2.jpg',6390000,100,0,0,1,'RT-AX82U-Gundam-Edition'),
(N'Bộ định tuyến WiFi 6 Asus RT-AX86U Zaku II Gundam Edition',15,'ASUS','motane',N'Hỗ trợ IGMP Proxy/Snooping, Cầu nối and Tag VLAN để tối ưu hóa luồng IPTV','imagetbm3.jpg',7390000,100,1,0,1,'RT-AX86U-Zaku-II-Gundam-Edition'),
(N'Bộ định tuyến WiFi 6 ASUS RT-AX88U Chuẩn AX6000',15,'ASUS','motane',N'Hỗ trợ IGMP Proxy/Snooping, Cầu nối and Tag VLAN để tối ưu hóa luồng IPTV','imagetbm4.jpg',8190000,100,1,1,1,'RT-AX88U-Chuan-AX6000'),
(N'Bộ định tuyến WiFi 6 ASUS RT-AX92U Chuẩn AX6100',15,'ASUS','motane',N'Hỗ trợ IGMP Proxy/Snooping, Cầu nối and Tag VLAN để tối ưu hóa luồng IPTV','imagetbm5.jpg',9090000,100,0,0,1,'RT-AX88U-Chuan-AX6100'),
(N'Bộ định tuyến WiFi 6 ROG Rapture GT-AX11000 Chuẩn AX11000',15,'ROG','motane',N'Hỗ trợ IGMP Proxy/Snooping, Cầu nối and Tag VLAN để tối ưu hóa luồng IPTV.','imagetbm6.jpg',14490000,100,0,0,1,'Rapture-GT-AX11000-Chuan-AX11000')

GO
INSERT INTO CHITIETSANPHAM(IDSANPHAM,HINHANH,STT)
VALUES 
(1,'imagelp1.jpg',1),
(1,'imagelp2.jpg',2),
(1,'imagelp3.jpg',3),
(1,'imagelp4.jpg',4),
(1,'imagelp5.jpg',5),
(1,'imagelp6.jpg',6),

(2,'imagemb1.jpg',7),
(2,'imagemb2.jpg',8),
(2,'imagemb3.jpg',9),
(2,'imagemb4.jpg',10),
(2,'imagemb5.jpg',11),
(2,'imagemb6.jpg',12),

(3,'imagecp1.jpg',13),
(3,'imagecp2.jpg',14),
(3,'imagecp3.jpg',15),
(3,'imagecp4.jpg',16),
(3,'imagecp5.jpg',17),

(4,'imagera1.jpg',18),
(4,'imagera2.jpg',19),
(4,'imagera3.jpg',20),
(4,'imagera4.jpg',21),
(4,'imagera5.jpg',22),
(4,'imagera6.jpg',23),

(5,'imagevg1.jpg',24),
(5,'imagevg2.jpg',25),
(5,'imagevg3.jpg',26),
(5,'imagevg4.jpg',27),
(5,'imagevg5.jpg',28),
(5,'imagevg6.jpg',29),

(6,'imagess1.jpg',30),
(6,'imagess2.jpg',31),
(6,'imagess3.jpg',32),
(6,'imagess4.jpg',33),
(6,'imagess5.jpg',34),
(6,'imagess6.jpg',35),

(7,'imagehd1.jpg',36),
(7,'imagehd2.jpg',37),
(7,'imagehd3.jpg',38),
(7,'imagehd4.jpg',39),
(7,'imagehd5.jpg',40),
(7,'imagehd6.jpg',41),

(8,'imagevm1.jpg',42),
(8,'imagevm2.jpg',43),
(8,'imagevm3.jpg',44),
(8,'imagevm4.jpg',45),
(8,'imagevm5.jpg',46),
(8,'imagevm6.jpg',47),

(9,'imageps1.jpg',48),
(9,'imageps2.jpg',49),
(9,'imageps3.jpg',50),
(9,'imageps4.jpg',51),
(9,'imageps5.jpg',52),
(9,'imageps6.jpg',53),

(10,'imagetn1.jpg',54),
(10,'imagetn2.jpg',55),
(10,'imagetn3.jpg',56),
(10,'imagetn4.jpg',57),
(10,'imagetn5.jpg',58),
(10,'imagetn6.jpg',59),

(11,'imagetng1.jpg',60),
(11,'imagetng2.jpg',61),
(11,'imagetng3.jpg',62),
(11,'imagetng4.jpg',63),
(11,'imagetng5.jpg',64),
(11,'imagetng6.jpg',65),

(12,'imagebp1.jpg',66),
(12,'imagebp2.jpg',67),
(12,'imagebp3.jpg',68),
(12,'imagebp4.jpg',69),
(12,'imagebp5.jpg',70),
(12,'imagebp6.jpg',71),

(13,'imagemh1.jpg',72),
(13,'imagemh2.jpg',73),
(13,'imagemh3.jpg',74),
(13,'imagemh4.jpg',75),
(13,'imagemh5.jpg',76),
(13,'imagemh6.jpg',77),

(14,'imagech1.jpg',78),
(14,'imagech2.jpg',79),
(14,'imagech3.jpg',80),
(14,'imagech4.jpg',81),
(14,'imagech5.jpg',82),
(14,'imagech6.jpg',83),

(15,'imagetbm1.jpg',84),
(15,'imagetbm2.jpg',85),
(15,'imagetbm3.jpg',86),
(15,'imagetbm4.jpg',87),
(15,'imagetbm5.jpg',88),
(15,'imagetbm6.jpg',89)

GO 
INSERT INTO ACCOUNT(EMAIL,MATKHAU,TRANGTHAI,CHUADMIN)
VALUES('TEST@GMAIL.COM','e1adc3949ba59abbe56e057f2f883e',1,1)