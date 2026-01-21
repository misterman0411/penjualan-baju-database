# CRUD
# 1.Create
INSERT INTO customer (nama_customer, telepon, email, alamat, jenis_customer)
VALUES ('Rina Wijaya', '0819000021', 'rina@mail.com', 'Tangerang', 'Offline');

INSERT INTO penjualan
(id_customer, id_karyawan, tanggal_penjualan, total_harga, jenis_transaksi, status)
VALUES
(21, 1, CURDATE(), 75000, 'Offline', 'Selesai');

INSERT INTO detail_penjualan (id_penjualan, id_produk, jumlah)
VALUES (LAST_INSERT_ID(), 1, 1);

INSERT INTO pembayaran
(id_penjualan, metode_pembayaran, jumlah_pembayaran, status_pembayaran, tanggal_pembayaran)
VALUES
(LAST_INSERT_ID(), 'COD', 75000, 'Lunas', CURDATE());

# 2.Read 
SELECT 
    p.nama_produk, 
    p.harga, 
    p.stok, 
    k.nama_kategori, 
    s.nama_supplier
FROM produk p
JOIN kategori k ON p.id_kategori = k.id_kategori
JOIN supplier s ON p.id_supplier = s.id_supplier;

# 3.Update
UPDATE pengiriman 
SET 
    status_pengiriman = 'Diterima',
    tanggal_terima = CURDATE()
WHERE id_penjualan = 2;

# 4.Delete
DELETE FROM customer 
WHERE id_customer NOT IN (
    SELECT DISTINCT id_customer FROM penjualan WHERE id_customer IS NOT NULL
);

# DML
#1. Laporan Penjualan Lengkap
SELECT   
    p.id_penjualan,  
    p.tanggal_penjualan,  
    c.nama_customer AS nama_customer,  
    k.nama_karyawan AS nama_karyawan,  
    SUM(dp.jumlah * pr.harga) AS total_transaksi  
FROM penjualan p  
JOIN customer c   
    ON p.id_customer = c.id_customer  
LEFT JOIN karyawan k   
    ON p.id_karyawan = k.id_karyawan  
JOIN detail_penjualan dp   
    ON p.id_penjualan = dp.id_penjualan  
JOIN produk pr   
    ON dp.id_produk = pr.id_produk  
GROUP BY   
    p.id_penjualan,  
    p.tanggal_penjualan,  
    c.nama_customer,  
    k.nama_karyawan;

#2. Produk Terlaris
SELECT 
    pr.nama_produk,
    SUM(dp.jumlah) AS total_terjual
FROM detail_penjualan dp
JOIN produk pr 
    ON dp.id_produk = pr.id_produk
GROUP BY 
    pr.id_produk,
    pr.nama_produk
ORDER BY total_terjual DESC
LIMIT 5;

#3. Menampilkan 5 produk termahal.
SELECT nama_produk, harga, nama_kategori
FROM produk
JOIN kategori ON produk.id_kategori = kategori.id_kategori
ORDER BY produk.harga DESC
LIMIT 5;