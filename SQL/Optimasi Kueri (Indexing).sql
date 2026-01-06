-- Membuat indeks pada kolom yang sering dicari
CREATE INDEX idx_nama_produk ON produk(nama_produk);
CREATE INDEX idx_nama_customer ON customer(nama);

-- Indeks pada Foreign Key biasanya sudah dibuat otomatis, 
-- tapi tidak ada salahnya memastikannya atau membuatnya secara eksplisit
CREATE INDEX idx_fk_penjualan_customer ON penjualan(id_customer);
CREATE INDEX idx_fk_detail_penjualan_produk ON detail_penjualan(id_produk);