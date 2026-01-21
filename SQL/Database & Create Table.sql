CREATE DATABASE jual_baju;
USE jual_baju;

CREATE TABLE kategori (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(50) NOT NULL,
    deskripsi VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE size (
    id_size INT AUTO_INCREMENT PRIMARY KEY,
    ukuran VARCHAR(10) NOT NULL,
    keterangan VARCHAR(50)
);

CREATE TABLE supplier (
    id_supplier INT AUTO_INCREMENT PRIMARY KEY,
    nama_supplier VARCHAR(100) NOT NULL,
    alamat VARCHAR(255),
    telepon VARCHAR(20),
    email VARCHAR(100),
    kontak_person VARCHAR(100)
);

CREATE TABLE karyawan (
    id_karyawan INT AUTO_INCREMENT PRIMARY KEY,
    nama_karyawan VARCHAR(100) NOT NULL,
    alamat VARCHAR(255),
    telepon VARCHAR(20),
    email VARCHAR(100),
    jabatan VARCHAR(50),
    tanggal_lahir DATE,
    tanggal_bergabung DATE
);

CREATE TABLE gaji (
    id_gaji INT AUTO_INCREMENT PRIMARY KEY,
    id_karyawan INT,
    bulan VARCHAR(20),
    tahun INT,
    jumlah_gaji DECIMAL(10,2),
    tanggal_pembayaran DATE,
    FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan)
);

CREATE TABLE produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(100) NOT NULL,
    id_kategori INT,
    id_supplier INT,
    id_size INT,
    harga DECIMAL(10,2),
    stok INT DEFAULT 0,
    deskripsi TEXT,
    gambar VARCHAR(255),
    FOREIGN KEY (id_kategori) REFERENCES kategori(id_kategori),
    FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier),
    FOREIGN KEY (id_size) REFERENCES size(id_size)
);

CREATE TABLE customer (
    id_customer INT AUTO_INCREMENT PRIMARY KEY,
    nama_customer VARCHAR(100) NOT NULL,
    alamat VARCHAR(255),
    telepon VARCHAR(20),
    email VARCHAR(100),
    tanggal_lahir DATE,
    jenis_customer ENUM('Online', 'Offline', 'Both') DEFAULT 'Both'
);

CREATE TABLE penjualan (
    id_penjualan INT AUTO_INCREMENT PRIMARY KEY,
    id_customer INT,
    id_karyawan INT,
    tanggal_penjualan DATE,
    total_harga DECIMAL(10,2),
    jenis_transaksi ENUM('Online', 'Offline') NOT NULL,
    status ENUM('Proses', 'Selesai', 'Dibatalkan') DEFAULT 'Proses',
    catatan TEXT,
    FOREIGN KEY (id_customer) REFERENCES customer(id_customer),
    FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan)
);

CREATE TABLE detail_penjualan (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_penjualan INT,
    id_produk INT,
    jumlah INT,
    harga_satuan DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_penjualan) REFERENCES penjualan(id_penjualan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

CREATE TABLE pengiriman (
    id_pengiriman INT AUTO_INCREMENT PRIMARY KEY,
    id_penjualan INT,
    alamat_pengiriman VARCHAR(255),
    kota VARCHAR(100),
    kode_pos VARCHAR(10),
    nama_penerima VARCHAR(100),
    telepon_penerima VARCHAR(20),
    status_pengiriman ENUM('Menunggu', 'Dikemas', 'Dikirim', 'Diterima') DEFAULT 'Menunggu',
    no_resi VARCHAR(100),
    tanggal_kirim DATE,
    tanggal_terima DATE,
    FOREIGN KEY (id_penjualan) REFERENCES penjualan(id_penjualan)
);

CREATE TABLE pembayaran (
    id_pembayaran INT AUTO_INCREMENT PRIMARY KEY,
    id_penjualan INT,
    metode_pembayaran ENUM('Transfer', 'COD', 'QRIS', 'Kartu Kredit', 'E-Wallet'),
    jumlah_pembayaran DECIMAL(10,2),
    status_pembayaran ENUM('Belum Dibayar', 'Dibayar Sebagian', 'Lunas') DEFAULT 'Belum Dibayar',
    tanggal_pembayaran DATE,
    bukti_pembayaran VARCHAR(255),
    catatan TEXT,
    FOREIGN KEY (id_penjualan) REFERENCES penjualan(id_penjualan)
);