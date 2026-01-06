-- Hapus database jika sudah ada untuk fresh start
DROP DATABASE IF EXISTS jual_baju_unnormalized;
CREATE DATABASE jual_baju_unnormalized;
USE jual_baju_unnormalized;

-- TABEL MASTER YANG BELUM DINORMALISASI (VERSI PERBAIKAN)
CREATE TABLE transaksi_penjualan_master (
    id_master INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Informasi Utama Transaksi
    id_penjualan INT,
    tanggal_penjualan DATE,
    jenis_transaksi ENUM('Online', 'Offline'),
    status_transaksi ENUM('Proses', 'Diproses', 'Dikirim', 'Selesai', 'Dibatalkan'),

    -- Informasi Customer
    id_customer INT,
    nama_customer VARCHAR(100),
    alamat_customer VARCHAR(255),
    telepon_customer VARCHAR(20),
    email_customer VARCHAR(100),

    -- Informasi Karyawan
    id_karyawan INT,
    nama_karyawan VARCHAR(100),
    jabatan_karyawan VARCHAR(50),

    -- Informasi Detail Produk
    id_produk INT,
    nama_produk VARCHAR(100),
    kategori_produk VARCHAR(50),
    ukuran_produk VARCHAR(10),
    nama_supplier VARCHAR(100),
    jumlah_produk INT,
    harga_satuan DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),

    -- Informasi Pengiriman
    alamat_pengiriman VARCHAR(255),
    kota_pengiriman VARCHAR(100),
    status_pengiriman VARCHAR(50),
    no_resi VARCHAR(100),
    ongkir DECIMAL(10,2),

    -- Informasi Pembayaran (SUDAH DIPERBAIKI)
    metode_pembayaran ENUM('Cash', 'Transfer', 'COD', 'QRIS', 'Kartu Kredit', 'E-Wallet'),
    status_pembayaran ENUM('Belum Dibayar', 'Dibayar Sebagian', 'Lunas'),
    jumlah_bayar DECIMAL(10, 2)
);

-- MEMASUKKAN DATA (VERSI PERBAIKAN)
-- Perhatikan penambahan NULL di awal untuk kolom id_master yang AUTO_INCREMENT

INSERT INTO transaksi_penjualan_master VALUES
-- Transaksi 1: Ali Pratama beli 2 Kaos Polos (Offline)
(NULL, 1, '2025-01-15', 'Offline', 'Selesai',
 1, 'Ali Pratama', 'Jakarta', '0819000001', 'ali@mail.com',
 1, 'Andi', 'Kasir',
 1, 'Kaos Polos', 'Kaos', 'M', 'PT Sumber Textile', 2, 75000.00, 150000.00,
 NULL, NULL, NULL, NULL, NULL,
 'Cash', 'Lunas', 150000),

-- Transaksi 2: Bima Saputra beli 1 Kemeja Formal (Online)
(NULL, 2, '2025-01-16', 'Online', 'Diproses',
 2, 'Bima Saputra', 'Bandung', '0819000002', 'bima@mail.com',
 NULL, NULL, NULL,
 2, 'Kemeja Formal', 'Kemeja', 'L', 'CV Kain Nusantara', 1, 150000.00, 150000.00,
 'Bandung', 'Bandung', 'Dikirim', 'JNE202501002', 20000,
 'Transfer', 'Lunas', 200000),

-- Transaksi 3: Cindy Lestari beli 1 Jaket Hoodie (Offline)
(NULL, 3, '2025-01-17', 'Offline', 'Selesai',
 3, 'Cindy Lestari', 'Bekasi', '0819000003', 'cindy@mail.com',
 2, 'Budi', 'Kasir',
 3, 'Jaket Hoodie', 'Jaket', 'XL', 'PT Fashion Indo', 1, 200000.00, 200000.00,
 NULL, NULL, NULL, NULL, NULL,
 'Cash', 'Lunas', 180000),

-- Transaksi 4: Doni Kurniawan beli 2 Sweater Rajut (Online)
(NULL, 4, '2025-01-18', 'Online', 'Dikirim',
 4, 'Doni Kurniawan', 'Depok', '0819000004', 'doni@mail.com',
 NULL, NULL, NULL,
 4, 'Sweater Rajut', 'Sweater', 'L', 'CV Rajut Jaya', 2, 175000.00, 350000.00,
 'Depok', 'Depok', 'Diproses', 'JNT202501004', 18000,
 'QRIS', 'Lunas', 220000),

-- Transaksi 5: Evi Handayani beli 3 Polo Shirt (Offline)
(NULL, 5, '2025-01-19', 'Offline', 'Selesai',
 5, 'Evi Handayani', 'Bogor', '0819000005', 'evi@mail.com',
 3, 'Citra', 'Admin',
 5, 'Polo Shirt', 'Polo', 'M', 'PT Garment Sejahtera', 3, 125000.00, 375000.00,
 NULL, NULL, NULL, NULL, NULL,
 'Cash', 'Lunas', 175000),

-- Transaksi 6: Farah Azzahra beli 1 Jaket Denim (Online)
(NULL, 6, '2025-01-20', 'Online', 'Diproses',
 6, 'Farah Azzahra', 'Tangerang', '0819000006', 'farah@mail.com',
 NULL, NULL, NULL,
 6, 'Jaket Denim', 'Jaket', 'XL', 'PT Textile Makmur', 1, 250000.00, 250000.00,
 'Tangerang', 'Tangerang', 'Dikirim', 'SCP202501006', 22000,
 'Transfer', 'Lunas', 250000),

-- Transaksi 7: Gina Amelia beli 1 Dress Wanita (Offline)
(NULL, 7, '2025-01-21', 'Offline', 'Selesai',
 7, 'Gina Amelia', 'Jakarta', '0819000007', 'gina@mail.com',
 4, 'Dewi', 'Gudang',
 7, 'Dress Wanita', 'Dress', 'FS', 'CV Cotton Prima', 1, 220000.00, 220000.00,
 NULL, NULL, NULL, NULL, NULL,
 'Cash', 'Lunas', 220000),

-- Transaksi 8: Hadi Santoso beli 2 Celana Jeans (Online)
(NULL, 8, '2025-01-22', 'Online', 'Dikirim',
 8, 'Hadi Santoso', 'Bandung', '0819000008', 'hadi@mail.com',
 NULL, NULL, NULL,
 8, 'Celana Jeans', 'Jeans', 'L', 'PT Denim Indonesia', 2, 180000.00, 360000.00,
 'Bandung', 'Bandung', 'Selesai', 'JNE202501008', 20000,
 'COD', 'Lunas', 180000),

-- Transaksi 9: Ira Wulandari beli 2 Celana Chino (Offline)
(NULL, 9, '2025-01-23', 'Offline', 'Selesai',
 9, 'Ira Wulandari', 'Bekasi', '0819000009', 'ira@mail.com',
 5, 'Eko', 'Manajer',
 9, 'Celana Chino', 'Chino', 'L', 'CV Baju Anak', 2, 160000.00, 320000.00,
 NULL, NULL, NULL, NULL, NULL,
 'Cash', 'Lunas', 160000),

-- Transaksi 10: Jani Maulana beli 1 Rok Mini (Online)
(NULL, 10, '2025-01-24', 'Online', 'Diproses',
 10, 'Jani Maulana', 'Depok', '0819000010', 'jani@mail.com',
 NULL, NULL, NULL,
 10, 'Rok Mini', 'Rok', 'FS', 'PT Urban Wear', 1, 120000.00, 120000.00,
 'Depok', 'Depok', 'Dikirim', 'JNT202501010', 18000,
 'Transfer', 'Lunas', 120000),

-- Transaksi 11: Kiki Rahman beli 1 Hoodie Oversize (Offline)
(NULL, 11, '2025-01-25', 'Offline', 'Selesai',
 11, 'Kiki Rahman', 'Bogor', '0819000011', 'kiki@mail.com',
 6, 'Fajar', 'Kasir',
 11, 'Hoodie Oversize', 'Hoodie', 'OS-XL', 'PT Casual Wear', 1, 210000.00, 210000.00,
 NULL, NULL, NULL, NULL, NULL,
 'Cash', 'Lunas', 210000),

-- Transaksi 12: Lukman Hakim beli 3 Tank Top (Online)
(NULL, 12, '2025-01-26', 'Online', 'Dikirim',
 12, 'Lukman Hakim', 'Solo', '0819000012', 'lukman@mail.com',
 NULL, NULL, NULL,
 12, 'Tank Top', 'Tank Top', 'S', 'CV Trend Mode', 3, 60000.00, 180000.00,
 'Solo', 'Solo', 'Diproses', 'POS202501012', 15000,
 'QRIS', 'Lunas', 60000),

-- Transaksi 13: Mega Puspita beli 2 Crop Top (Offline)
(NULL, 13, '2025-01-27', 'Offline', 'Selesai',
 13, 'Mega Puspita', 'Yogyakarta', '0819000013', 'mega@mail.com',
 7, 'Gilang', 'Admin',
 13, 'Crop Top', 'Crop Top', 'S', 'PT Style Modern', 2, 90000.00, 180000.00,
 NULL, NULL, NULL, NULL, NULL,
 'Cash', 'Lunas', 90000),

-- Transaksi 14: Nando Pratama beli 1 Vest Casual (Online)
(NULL, 14, '2025-01-28', 'Online', 'Diproses',
 14, 'Nando Prڍatama', 'Semarang', '0819000014', 'nando@mail.com',
 NULL, NULL, NULL,
 14, 'Vest Casual', 'Vest', 'M', 'CV Daily Outfit', 1, 130000.00, 130000.00,
 'Semarang', 'Semarang', 'Dikirim', 'JNE202501014', 20000,
 'Transfer', 'Lunas', 130000),

-- Transaksi 15: Ocha Permata beli 1 Overall Denim (Offline)
(NULL, 15, '2025-01-29', 'Offline', 'Selesai',
 15, 'Ocha Permata', 'Surabaya', '0819000015', 'ocha@mail.com',
 8, 'Hana', 'Gudang',
 15, 'Overall Denim', 'Overall', 'L', 'PT Fashion Global', 1, 260000.00, 260000.00,
 NULL, NULL, NULL, NULL, NULL,
 'Cash', 'Lunas', 260000),

-- Transaksi 16: Putri Ayu beli 2 Cardigan (Online)
(NULL, 16, '2025-01-30', 'Online', 'Dikirim',
 16, 'Putri Ayu', 'Malang', '0819000016', 'putri@mail.com',
 NULL, NULL, NULL,
 16, 'Cardigan', 'Cardigan', 'M', 'CV Ready Stock', 2, 140000.00, 280000.00,
 'Malang', 'Malang', 'Dikirim', 'SCP202501016', 22000,
 'COD', 'Lunas', 140000),

-- Transaksi 17: Raka Wijaya beli 1 Outer Casual (Offline)
(NULL, 17, '2025-01-31', 'Offline', 'Selesai',
 17, 'Raka Wijaya', 'Jakarta', '0819000017', 'raka@mail.com',
 9, 'Indra', 'Kasir',
 17, 'Outer Casual', 'Outer', 'L', 'PT Premium Wear', 1, 190000.00, 190000.00,
 NULL, NULL, NULL, NULL, NULL,
 'Cash', 'Lunas', 190000),

-- Transaksi 18: Sinta Maharani beli 2 Jogger Pants (Online)
(NULL, 18, '2025-02-01', 'Online', 'Diproses',
 18, 'Sinta Maharani', 'Bandung', '0819000018', 'sinta@mail.com',
 NULL, NULL, NULL,
 18, 'Jogger Pants', 'Jogger', 'L', 'CV Local Brand', 2, 155000.00, 310000.00,
 'Bandung', 'Bandung', 'Selesai', 'JNT202501018', 18000,
 'Transfer', 'Lunas', 155000),

-- Transaksi 19: Taufik Hidayat beli 3 Short Pants (Offline)
(NULL, 19, '2025-02-02', 'Offline', 'Selesai',
 19, 'Taufik Hidayat', 'Bekasi', '0819000019', 'taufik@mail.com',
 10, 'Joko', 'Admin',
 19, 'Short Pants', 'Short Pants', 'M', 'PT Young Fashion', 3, 110000.00, 330000.00,
 NULL, NULL, NULL, NULL, NULL,
 'Cash', 'Lunas', 110000),

-- Transaksi 20: Vina Lestari beli 1 Blazer Formal (Online)
(NULL, 20, '2025-02-03', 'Online', 'Dikirim',
 20, 'Vina Lestari', 'Depok', '0819000020', 'vina@mail.com',
 NULL, NULL, NULL,
 20, 'Blazer Formal', 'Blazer', 'L', 'CV Smart Textile', 1, 300000.00, 300000.00,
 'Depok', 'Depok', 'Diproses', 'JNE202501020', 20000,
 'QRIS', 'Lunas', 300000);