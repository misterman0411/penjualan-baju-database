# CRUD
# 1.Create
INSERT INTO customer (nama, no_hp, email, alamat) 
VALUES ('Rina Wijaya', '0819000021', 'rina@mail.com', 'Tangerang');

INSERT INTO penjualan (id_customer, id_karyawan, metode_penjualan, total, status, tanggal_penjualan)
VALUES (21, 1, 'Offline', 75000, 'Selesai', NOW());

INSERT INTO detail_penjualan (id_penjualan, id_produk, jumlah)
VALUES (21, 1, 1);

INSERT INTO pembayaran (id_penjualan, metode, jumlah_bayar, status_bayar)
VALUES (21, 'Cash', 75000, 'Lunas');

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
SET status_pengiriman = 'Selesai', tanggal_terima = NOW()
WHERE id_penjualan = 2;

# 4.Delete
DELETE FROM customer 
WHERE id_customer NOT IN (SELECT DISTINCT id_customer FROM penjualan WHERE id_customer IS NOT NULL);

# DML
#1. Laporan Penjualan Lengkap
SELECT 
    p.id_penjualan,
    p.tanggal,
    c.nama AS nama_customer,
    k.nama AS nama_karyawan,
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
    p.tanggal,
    c.nama,
    k.nama;

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