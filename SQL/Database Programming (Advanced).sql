#A. Stored Procedure (Prosedur Tersimpan)
DELIMITER //

CREATE PROCEDURE proses_penjualan_baru(
    IN p_id_customer INT,
    IN p_id_karyawan INT,
    IN p_metode_penjualan VARCHAR(10),
    IN p_id_produk INT,
    IN p_jumlah INT,
    IN p_metode_bayar VARCHAR(50)
)
BEGIN
    DECLARE v_harga DECIMAL(10,2);
    DECLARE v_total DECIMAL(10,2);
    DECLARE v_id_penjualan INT;
    
    -- Ambil harga produk
    SELECT harga INTO v_harga FROM produk WHERE id_produk = p_id_produk;
    
    -- Hitung total
    SET v_total = v_harga * p_jumlah;
    
    -- Mulai transaksi
    START TRANSACTION;
    
    -- 1. Insert ke tabel penjualan (tanggal_penjualan DIHAPUS)
    INSERT INTO penjualan (id_customer, id_karyawan, metode_penjualan, total, status)
    VALUES (p_id_customer, p_id_karyawan, p_metode_penjualan, v_total, 'Selesai');
    
    -- 2. Dapatkan ID penjualan yang baru dibuat
    SET v_id_penjualan = LAST_INSERT_ID();
    
    -- 3. Insert ke tabel detail_penjualan
    INSERT INTO detail_penjualan (id_penjualan, id_produk, jumlah)
    VALUES (v_id_penjualan, p_id_produk, p_jumlah);
    
    -- 4. Insert ke tabel pembayaran
    INSERT INTO pembayaran (id_penjualan, metode, jumlah_bayar, status_bayar)
    VALUES (v_id_penjualan, p_metode_bayar, v_total, 'Lunas');
    
    -- 5. Kurangi stok produk
    UPDATE produk SET stok = stok - p_jumlah WHERE id_produk = p_id_produk;
    
    -- Selesaikan transaksi
    COMMIT;
    
    SELECT 'Penjualan berhasil diproses!' AS pesan, v_id_penjualan AS id_transaksi;
END //

DELIMITER ;

#1. Trigger: Mengurangi Stok Otomatis Setelah Transaksi
DELIMITER $$

CREATE TRIGGER trg_kurangi_stok
AFTER INSERT ON detail_penjualan
FOR EACH ROW
BEGIN
    UPDATE produk
    SET stok = stok - NEW.jumlah
    WHERE id_produk = NEW.id_produk;
END$$

DELIMITER ;

#2. Trigger: Validasi Stok Tidak Boleh Minus
DELIMITER $$

CREATE TRIGGER trg_cek_stok
BEFORE INSERT ON detail_penjualan
FOR EACH ROW
BEGIN
    DECLARE s INT;

    SELECT stok INTO s
    FROM produk
    WHERE id_produk = NEW.id_produk;

    IF s < NEW.jumlah THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stok produk tidak mencukupi';
    END IF;
END$$

DELIMITER ;

#3. Stored Procedure: Menghitung Total Transaksi
DELIMITER $$

CREATE PROCEDURE hitung_total_penjualan (
    IN p_id_penjualan INT
)
BEGIN
    DECLARE total_transaksi DECIMAL(12,2);

    SELECT SUM(dp.jumlah * pr.harga)
    INTO total_transaksi
    FROM detail_penjualan dp
    JOIN produk pr ON dp.id_produk = pr.id_produk
    WHERE dp.id_penjualan = p_id_penjualan;

    UPDATE penjualan
    SET total = total_transaksi
    WHERE id_penjualan = p_id_penjualan;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_set_jumlah_bayar
BEFORE INSERT ON pembayaran
FOR EACH ROW
BEGIN
    DECLARE total_penjualan DECIMAL(12,2);

    SELECT total_harga
    INTO total_penjualan
    FROM penjualan
    WHERE id_penjualan = NEW.id_penjualan;

    SET NEW.jumlah_pembayaran = total_penjualan;
END$$

DELIMITER ;

