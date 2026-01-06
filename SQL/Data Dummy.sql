INSERT INTO kategori (id_kategori, nama_kategori) VALUES
(1,'Kaos'),(2,'Kemeja'),(3,'Jaket'),(4,'Hoodie'),(5,'Sweater'),
(6,'Blazer'),(7,'Polo'),(8,'Cardigan'),(9,'Dress'),(10,'Tunik'),
(11,'Jeans'),(12,'Chino'),(13,'Jogger'),(14,'Short Pants'),
(15,'Rok'),(16,'Outer'),(17,'Vest'),(18,'Overall'),
(19,'Crop Top'),(20,'Tank Top');

INSERT INTO size (id_size, nama_size) VALUES
(1,'XS'),(2,'S'),(3,'M'),(4,'L'),(5,'XL'),
(6,'XXL'),(7,'3XL'),(8,'SS'),
(9,'SM'),(10,'SL'),
(11,'OS-S'),(12,'OS-M'),
(13,'OS-L'),(14,'OS-XL'),
(15,'K-S'),(16,'K-M'),(17,'K-L'),
(18,'FS'),(19,'PT'),(20,'TL');

INSERT INTO supplier (id_supplier, nama_supplier, kontak, alamat) VALUES
(1,'PT Sumber Textile','0811111111','Bandung'),
(2,'CV Kain Nusantara','0811111112','Jakarta'),
(3,'PT Fashion Indo','0811111113','Tangerang'),
(4,'CV Rajut Jaya','0811111114','Bogor'),
(5,'PT Garment Sejahtera','0811111115','Bekasi'),
(6,'PT Textile Makmur','0811111116','Solo'),
(7,'CV Cotton Prima','0811111117','Yogyakarta'),
(8,'PT Denim Indonesia','0811111118','Surabaya'),
(9,'CV Baju Anak','0811111119','Malang'),
(10,'PT Urban Wear','0811111120','Depok'),
(11,'PT Casual Wear','0811111121','Jakarta'),
(12,'CV Trend Mode','0811111122','Bandung'),
(13,'PT Style Modern','0811111123','Semarang'),
(14,'CV Daily Outfit','0811111124','Cirebon'),
(15,'PT Fashion Global','0811111125','Jakarta'),
(16,'CV Ready Stock','0811111126','Solo'),
(17,'PT Premium Wear','0811111127','Bandung'),
(18,'CV Local Brand','0811111128','Bogor'),
(19,'PT Young Fashion','0811111129','Jakarta'),
(20,'CV Smart Textile','0811111130','Tangerang');

INSERT INTO karyawan (id_karyawan, nama, jabatan) VALUES
(1,'Andi','Kasir'),
(2,'Budi','Kasir'),
(3,'Citra','Admin'),
(4,'Dewi','Gudang'),
(5,'Eko','Manajer'),
(6,'Fajar','Kasir'),
(7,'Gilang','Admin'),
(8,'Hana','Gudang'),
(9,'Indra','Kasir'),
(10,'Joko','Admin'),
(11,'Kevin','Kasir'),
(12,'Lina','Gudang'),
(13,'Maya','Kasir'),
(14,'Nina','Admin'),
(15,'Oscar','Gudang'),
(16,'Putra','Kasir'),
(17,'Rina','Admin'),
(18,'Sari','Gudang'),
(19,'Tono','Kasir'),
(20,'Yuni','Manajer');

INSERT INTO gaji 
(id_karyawan, gaji_pokok, tunjangan, potongan, total_gaji, periode_gaji) VALUES
(1, 3000000, 500000, 0, 3500000, '2025-01'),
(2, 3000000, 500000, 0, 3500000, '2025-01'),
(3, 4000000, 500000, 0, 4500000, '2025-01'),
(4, 3500000, 500000, 0, 4000000, '2025-01'),
(5, 6500000, 500000, 0, 7000000, '2025-01'),
(6, 3000000, 500000, 0, 3500000, '2025-01'),
(7, 4000000, 500000, 0, 4500000, '2025-01'),
(8, 3500000, 500000, 0, 4000000, '2025-01'),
(9, 3000000, 500000, 0, 3500000, '2025-01'),
(10, 4000000, 500000, 0, 4500000, '2025-01'),
(11, 3000000, 500000, 0, 3500000, '2025-01'),
(12, 3500000, 500000, 0, 4000000, '2025-01'),
(13, 3000000, 500000, 0, 3500000, '2025-01'),
(14, 4000000, 500000, 0, 4500000, '2025-01'),
(15, 3500000, 500000, 0, 4000000, '2025-01'),
(16, 3000000, 500000, 0, 3500000, '2025-01'),
(17, 4000000, 500000, 0, 4500000, '2025-01'),
(18, 3500000, 500000, 0, 4000000, '2025-01'),
(19, 3000000, 500000, 0, 3500000, '2025-01'),
(20, 6500000, 500000, 0, 7000000, '2025-01');

INSERT INTO produk 
(id_produk, nama_produk, harga, stok, id_supplier, id_kategori, id_size) VALUES
(1,'Kaos Polos',75000,100,1,1,3),
(2,'Kemeja Formal',150000,80,2,2,4),
(3,'Jaket Hoodie',200000,60,3,3,5),
(4,'Sweater Rajut',175000,50,4,5,4),
(5,'Polo Shirt',125000,90,5,7,3),
(6,'Jaket Denim',250000,40,6,3,5),
(7,'Dress Wanita',220000,30,7,9,18),
(8,'Celana Jeans',180000,70,8,11,4),
(9,'Celana Chino',160000,65,9,12,4),
(10,'Rok Mini',120000,45,10,15,18),
(11,'Hoodie Oversize',210000,55,11,4,13),
(12,'Tank Top',60000,120,12,20,2),
(13,'Crop Top',90000,85,13,19,2),
(14,'Vest Casual',130000,40,14,17,3),
(15,'Overall Denim',260000,25,15,18,4),
(16,'Cardigan',140000,60,16,8,3),
(17,'Outer Casual',190000,50,17,16,4),
(18,'Jogger Pants',155000,75,18,13,4),
(19,'Short Pants',110000,90,19,14,3),
(20,'Blazer Formal',300000,20,20,6,4);

INSERT INTO customer (nama, no_hp, email, alamat) VALUES
('Ali Pratama','0819000001','ali@mail.com','Jakarta'),
('Bima Saputra','0819000002','bima@mail.com','Bandung'),
('Cindy Lestari','0819000003','cindy@mail.com','Bekasi'),
('Doni Kurniawan','0819000004','doni@mail.com','Depok'),
('Evi Handayani','0819000005','evi@mail.com','Bogor'),
('Farah Azzahra','0819000006','farah@mail.com','Tangerang'),
('Gina Amelia','0819000007','gina@mail.com','Jakarta'),
('Hadi Santoso','0819000008','hadi@mail.com','Bandung'),
('Ira Wulandari','0819000009','ira@mail.com','Bekasi'),
('Jani Maulana','0819000010','jani@mail.com','Depok'),
('Kiki Rahman','0819000011','kiki@mail.com','Bogor'),
('Lukman Hakim','0819000012','lukman@mail.com','Solo'),
('Mega Puspita','0819000013','mega@mail.com','Yogyakarta'),
('Nando Prڍatama','0819000014','nando@mail.com','Semarang'),
('Ocha Permata','0819000015','ocha@mail.com','Surabaya'),
('Putri Ayu','0819000016','putri@mail.com','Malang'),
('Raka Wijaya','0819000017','raka@mail.com','Jakarta'),
('Sinta Maharani','0819000018','sinta@mail.com','Bandung'),
('Taufik Hidayat','0819000019','taufik@mail.com','Bekasi'),
('Vina Lestari','0819000020','vina@mail.com','Depok');

INSERT INTO penjualan 
(id_customer, id_karyawan, metode_penjualan, total, status) VALUES
(1, 1, 'Offline', 0, 'Selesai'),
(2, NULL, 'Online', 0, 'Diproses'),
(3, 2, 'Offline', 0, 'Selesai'),
(4, NULL, 'Online', 0, 'Dikirim'),
(5, 3, 'Offline', 0, 'Selesai'),
(6, NULL, 'Online', 0, 'Diproses'),
(7, 4, 'Offline', 0, 'Selesai'),
(8, NULL, 'Online', 0, 'Dikirim'),
(9, 5, 'Offline', 0, 'Selesai'),
(10, NULL, 'Online', 0, 'Diproses'),
(11, 6, 'Offline', 0, 'Selesai'),
(12, NULL, 'Online', 0, 'Dikirim'),
(13, 7, 'Offline', 0, 'Selesai'),
(14, NULL, 'Online', 0, 'Diproses'),
(15, 8, 'Offline', 0, 'Selesai'),
(16, NULL, 'Online', 0, 'Dikirim'),
(17, 9, 'Offline', 0, 'Selesai'),
(18, NULL, 'Online', 0, 'Diproses'),
(19, 10, 'Offline', 0, 'Selesai'),
(20, NULL, 'Online', 0, 'Dikirim');

INSERT INTO detail_penjualan
(id_detail, id_penjualan, id_produk, jumlah) VALUES
(1,1,1,2),(2,2,2,1),(3,3,3,1),(4,4,4,2),(5,5,5,3),
(6,6,6,1),(7,7,7,1),(8,8,8,2),(9,9,9,2),(10,10,10,1),
(11,11,11,1),(12,12,12,3),(13,13,13,2),(14,14,14,1),
(15,15,15,1),(16,16,16,2),(17,17,17,1),(18,18,18,2),
(19,19,19,3),(20,20,20,1);

INSERT INTO pengiriman
(id_penjualan, ekspedisi, no_resi, ongkir, status_pengiriman) VALUES
(2, 'JNE', 'JNE202501002', 20000, 'Dikirim'),
(4, 'J&T', 'JNT202501004', 18000, 'Diproses'),
(6, 'SiCepat', 'SCP202501006', 22000, 'Dikirim'),
(8, 'JNE', 'JNE202501008', 20000, 'Selesai'),
(10, 'J&T', 'JNT202501010', 18000, 'Dikirim'),
(12, 'POS Indonesia', 'POS202501012', 15000, 'Diproses'),
(14, 'JNE', 'JNE202501014', 20000, 'Dikirim'),
(16, 'SiCepat', 'SCP202501016', 22000, 'Dikirim'),
(18, 'J&T', 'JNT202501018', 18000, 'Selesai'),
(20, 'JNE', 'JNE202501020', 20000, 'Diproses');

INSERT INTO pembayaran
(id_penjualan, metode, jumlah_bayar, status_bayar) VALUES
(1, 'Cash', 150000, 'Lunas'),
(2, 'Transfer', 200000, 'Lunas'),
(3, 'Cash', 180000, 'Lunas'),
(4, 'QRIS', 220000, 'Lunas'),
(5, 'Cash', 175000, 'Lunas'),
(6, 'Transfer', 250000, 'Lunas'),
(7, 'Cash', 220000, 'Lunas'),
(8, 'COD', 180000, 'Lunas'),
(9, 'Cash', 160000, 'Lunas'),
(10, 'Transfer', 120000, 'Lunas'),
(11, 'Cash', 210000, 'Lunas'),
(12, 'QRIS', 60000, 'Lunas'),
(13, 'Cash', 90000, 'Lunas'),
(14, 'Transfer', 130000, 'Lunas'),
(15, 'Cash', 260000, 'Lunas'),
(16, 'COD', 140000, 'Lunas'),
(17, 'Cash', 190000, 'Lunas'),
(18, 'Transfer', 155000, 'Lunas'),
(19, 'Cash', 110000, 'Lunas'),
(20, 'QRIS', 300000, 'Lunas');