-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 07 Jan 2024 pada 21.32
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poliklinik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(3, 'bejo', '$2y$10$Gv3C4thV4wuw6bkBQej8c.Yyz8psRwUtH6h7lkEdog3/mk1BOG6bG'),
(4, 'sindi', '$2y$10$dPr9DHJ79ilKumBC./1FP.5hjf91FIdbsdM6ROkmsVQNI9Xc7RyTm'),
(6, 'admin', '$2y$10$80f.zcoZK6nnBtDDIasOyuQn8S7Sfh.g3zAER5QO6bByqOXX3Cy82'),
(7, 'Tata', '$2y$10$8HzQ89ZQFaM5NnOjiM9cnuIpvzFbuSKyYtgRLwyCRJcx5jZ/Bbkiy'),
(8, 'Dina', '$2y$10$M1rVzA2plRBbLLWnE0gjh.5ng/xbHy11QdKXeT9LJeDun4xL1eaC2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_poli`
--

CREATE TABLE `daftar_poli` (
  `id` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `keluhan` text NOT NULL,
  `no_antrian` int(11) NOT NULL,
  `status_periksa` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `daftar_poli`
--

INSERT INTO `daftar_poli` (`id`, `id_pasien`, `id_jadwal`, `keluhan`, `no_antrian`, `status_periksa`) VALUES
(7, 7, 6, 'Pusing, Mual, Demam', 1, 1),
(8, 8, 7, 'Scaling gigi', 1, 1),
(9, 9, 10, 'Mata berair dan merah', 1, 1),
(10, 10, 8, 'Tenggorokan kering dan gatel ', 1, 0),
(11, 11, 6, 'Asam lambung naik', 2, 0),
(12, 12, 7, 'Gigi berlubang', 2, 0),
(13, 14, 6, 'Asam lambung Naik', 3, 1),
(14, 15, 8, 'Mual, pusing', 2, 1),
(15, 16, 7, 'Gigi berlubang', 3, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int(11) NOT NULL,
  `id_periksa` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_periksa`
--

INSERT INTO `detail_periksa` (`id`, `id_periksa`, `id_obat`) VALUES
(6, 1, 13),
(7, 2, 14),
(14, 5, 13),
(15, 5, 14),
(16, 6, 13),
(19, 7, 14),
(20, 8, 14),
(21, 9, 15),
(22, 9, 17),
(23, 10, 19),
(24, 11, 13),
(25, 11, 15),
(26, 11, 17),
(27, 12, 16),
(28, 13, 17),
(29, 14, 17),
(30, 15, 19);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `id_poli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `password`, `alamat`, `no_hp`, `id_poli`) VALUES
(7, 'dr. Tuti', '$2y$10$Gh62IJ186outdfUgWfKkEeXH2gST5Vz97jASm/fM2iPv3VBbxsmNe', 'Semarang', '081326518173', 1),
(8, 'dr. Yohana', '$2y$10$QSBLYSgTWuGJajg6al1OouqYlLaCdSPuoLCfeRFgvZ4ciZdLFco0O', 'Demak', '0895410209765', 3),
(9, 'dr. Oriwarda', '$2y$10$ih9fLLU3RQ98Ce9eSIyzveXkESQExXNumETWmAVaeiP7MbDMdfWuq', 'Semarang', '0895410209761', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_periksa`
--

CREATE TABLE `jadwal_periksa` (
  `id` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `nama_dokter` varchar(20) NOT NULL,
  `hari` varchar(10) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `aktif` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `jadwal_periksa`
--

INSERT INTO `jadwal_periksa` (`id`, `id_dokter`, `nama_dokter`, `hari`, `jam_mulai`, `jam_selesai`, `aktif`) VALUES
(6, 9, 'dr. Tuti', 'Senin', '08:30:00', '09:30:00', 'Y'),
(7, 7, 'dr. Oriwarda', 'Selasa', '12:00:00', '14:00:00', 'N'),
(8, 7, 'dr. Tuti', 'Rabu', '09:35:00', '10:35:00', 'N'),
(9, 8, 'dr. Yohana', 'Kamis', '16:00:00', '18:00:00', 'N'),
(10, 8, 'dr. Yohana', 'Jumat', '10:00:00', '12:00:00', 'N');

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(100) NOT NULL,
  `kemasan` varchar(35) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`) VALUES
(13, 'Amoxicillin Dry Sirup', '5ml', 12000),
(14, 'Paracetamol Pro', '100ml', 30000),
(15, 'Paratusin', '10 Tablet', 20000),
(16, 'Latipress Eye Drops', '2.5ml', 245000),
(17, 'Demacolin', '10 Tablet', 10000),
(18, 'Rohto Cool Eye Drop', '7ml', 20000),
(19, 'Ponstan 500 mg ', '10 Tablet', 38000),
(20, 'Rhinos SR', '10 Kapsul', 110000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `no_rm` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `password`, `alamat`, `no_ktp`, `no_hp`, `no_rm`) VALUES
(7, 'Alodya', '$2y$10$vfqCfxSl437GSStXudk8eeYixFU8HExV.X1pr.YG6CiBb51CJolzy', 'Demak', '3525017006650078', '082192013087', '202401-002'),
(8, 'Orin', '$2y$10$falNVXcFl59pvy6EwC34ceL76X6z33zrBGmlJFC5kbFTXZbfyE8VC', 'Pedurungan', '3525013006580042', ' 081226450207', '202401-003'),
(9, 'Lala', '$2y$10$f4j6LFPQMav0jEOQM7bFPe35LTeAVP7VL0svbjP5pJ.AeoNwLl5KW', 'Dempet', '3525015212920003', '085249693948', '202401-004'),
(10, 'Prima', '$2y$10$wZhp7VCY5.m91giYUEF5i.yAPLn6CHni4SHyzcc9/KruVx0R6lVly', 'Grobogan', '3525010609510002', '085696228417', '202401-005'),
(11, 'Rossy', '$2y$10$YzfTeKgYXElUvJgAPov42u.ROmUr55oty/fbXo.nPG33.jiD6BVtW', 'Tempuran', '3525010505720003', '083870815121', '202401-006'),
(12, 'Frany', '$2y$10$tvqSm2CB7l.dJEfse9AIX.GSYclL4afyIEaJBankWlLvluG2ZqS7O', 'Ungaran', '3525015305700001', '085399074249', '202401-007'),
(13, 'Kevin', '$2y$10$CuZz29jC7BtwceddojQYg.B82VuiVZg.MBT65YSFSCkvOqDaNERta', 'Demak', '3324509802006', '0896541234567', '202401-008'),
(14, 'Aryo', '$2y$10$BOn5klJfQlVe70YofzN4O.axC0o/IgeIjeHwcEmMQXoeus.OqQedu', 'Demak', '33245640101970', '085225435678', '202401-009'),
(15, 'Lilis', '$2y$10$jS4ddL6YEnoTcL945I34mu/4oZqVcv/W7y0l2ldHqLu20kTIIvLVe', 'Semarang', '3329807071970', '089754234567', '202401-010'),
(16, 'Krista', '$2y$10$4qgKya8lxJhyJm81WZ5KPOnRYOIfMa/ZZZHNRLyfTKZ9P100Zwa86', 'Semarang', '3525013006920008', '0895410209761', '202401-011');

-- --------------------------------------------------------

--
-- Struktur dari tabel `periksa`
--

CREATE TABLE `periksa` (
  `id` int(11) NOT NULL,
  `id_daftar_poli` int(11) NOT NULL,
  `tgl_periksa` datetime NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `periksa`
--

INSERT INTO `periksa` (`id`, `id_daftar_poli`, `tgl_periksa`, `catatan`, `biaya_periksa`) VALUES
(1, 1, '2023-12-26 09:24:50', 'Minum obat', 300000),
(2, 2, '2023-12-26 12:03:35', 'Minum Obate maseeeh ben sehat', 120000),
(5, 6, '2024-01-04 18:46:00', 'Minum obat secara teratur ya', 120000),
(6, 5, '2024-01-04 18:47:00', 'Sering bersihkan telinga dan minum obatnya', 90000),
(7, 3, '2024-01-27 00:14:00', 'Catatan uPDATE', 30000),
(8, 2, '2024-01-10 17:22:00', 'Minum', 180000),
(9, 3, '2024-01-08 00:29:00', 'Minum 3x1 sehari secara teratur', 180000),
(10, 8, '2024-01-08 01:17:00', 'Rajin menjaga kesehatan gigi', 188000),
(11, 7, '2024-01-08 01:25:00', 'Istirahat yang cukup', 192000),
(12, 9, '2024-01-08 01:33:00', 'Jangan mengucek mata ketika gatal, dan teteskan obat sesuai resep', 395000),
(13, 13, '2024-01-08 02:23:00', 'Janna sering begadang, minum obat secara teratur ', 160000),
(14, 14, '2024-01-08 02:32:00', 'Janna sering begadang, Istirahat yang cukup', 160000),
(15, 15, '2024-01-08 03:06:00', 'Jangan lupa selalu membersihkan gigi', 188000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `poli`
--

CREATE TABLE `poli` (
  `id` int(11) NOT NULL,
  `nama_poli` varchar(25) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `poli`
--

INSERT INTO `poli` (`id`, `nama_poli`, `keterangan`) VALUES
(1, 'Poli Umum', 'Mengenai Penyakit Umum'),
(2, 'Poli Gigi & Mulut', 'Mengenai Gigi & Mulut'),
(3, 'Poli Mata', 'Mengenai Mata');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Indeks untuk tabel `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detail_periksa_obat` (`id_obat`),
  ADD KEY `id_periksa` (`id_periksa`);

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_poli` (`id_poli`);

--
-- Indeks untuk tabel `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_daftar_poli` (`id_daftar_poli`);

--
-- Indeks untuk tabel `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `daftar_poli`
--
ALTER TABLE `daftar_poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `poli`
--
ALTER TABLE `poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD CONSTRAINT `daftar_poli_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `detail_periksa_ibfk_1` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`),
  ADD CONSTRAINT `fk_detail_periksa_obat` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`);

--
-- Ketidakleluasaan untuk tabel `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD CONSTRAINT `jadwal_periksa_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`);

--
-- Ketidakleluasaan untuk tabel `poli`
--
ALTER TABLE `poli`
  ADD CONSTRAINT `poli_ibfk_1` FOREIGN KEY (`id`) REFERENCES `dokter` (`id_poli`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
