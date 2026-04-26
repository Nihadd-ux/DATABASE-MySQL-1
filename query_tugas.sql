-- 1. Statistik Buku (5 Query)

-- Total buku seluruhnya
SELECT COUNT(*) AS total_buku FROM buku;

-- Total nilai inventaris (harga × stok)
SELECT SUM(harga * stok) AS total_inventaris FROM buku;

-- Rata-rata harga buku
SELECT AVG(harga) AS rata_rata_harga FROM buku;

-- Buku termahal
SELECT judul, harga 
FROM buku 
ORDER BY harga DESC 
LIMIT 1;

-- Buku dengan stok terbanyak
SELECT judul, stok 
FROM buku 
ORDER BY stok DESC 
LIMIT 1;

-- 2. Filter dan Pencarian (5 query)

-- Buku Programming harga < 100.000
SELECT * FROM buku 
WHERE kategori = 'Programming' AND harga < 100000;

-- Judul mengandung PHP atau MySQL
SELECT * FROM buku 
WHERE judul LIKE '%PHP%' OR judul LIKE '%MySQL%';

-- Buku tahun 2024
SELECT * FROM buku 
WHERE tahun_terbit = 2024;

-- Stok antara 5 - 10
SELECT * FROM buku 
WHERE stok BETWEEN 5 AND 10;

-- Pengarang tertentu
SELECT * FROM buku 
WHERE pengarang = 'Budi Raharjo';

-- 3. Grouping dan Agregasi (3 query)

-- Jumlah buku dan total stok per kategori
SELECT kategori, COUNT(*) AS jumlah_buku, SUM(stok) AS total_stok
FROM buku
GROUP BY kategori;

-- Rata-rata harga per kategori
SELECT kategori, AVG(harga) AS rata_harga
FROM buku
GROUP BY kategori;

-- Kategori dengan nilai inventaris terbesar
SELECT kategori, SUM(harga * stok) AS total_nilai
FROM buku
GROUP BY kategori
ORDER BY total_nilai DESC
LIMIT 1;

-- 4. Update Data (2 query)

-- Naikkan harga Programming 5%
UPDATE buku 
SET harga = harga * 1.05 
WHERE kategori = 'Programming';

-- Tambah stok 10 jika stok < 5
UPDATE buku 
SET stok = stok + 10 
WHERE stok < 5;

-- 5. Laporan Khusus (2 query)

-- Buku perlu restock
SELECT * FROM buku 
WHERE stok < 5;

-- Top 5 buku termahal
SELECT judul, harga 
FROM buku 
ORDER BY harga DESC 
LIMIT 5;