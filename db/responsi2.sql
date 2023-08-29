-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2021 at 06:08 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `responsi2`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `nomor_ktp` varchar(16) NOT NULL,
  `nama_customer` varchar(100) NOT NULL,
  `notelp` text NOT NULL,
  `jenkel` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`nomor_ktp`, `nama_customer`, `notelp`, `jenkel`, `alamat`) VALUES
('34567813213', 'Sifa', '0812344555', 'Laki-laki', 'Jalan Jakarta No.13'),
('8762316582916578', 'Alfin Aseggaf', '081917188226', 'Laki-laki', 'Jalan Diponegoro No.9 Pekalongan');

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE `mobil` (
  `nopol_mobil` varchar(10) NOT NULL,
  `merk_mobil` varchar(50) NOT NULL,
  `tahun_pembuatan` int(11) NOT NULL,
  `warna_mobil` varchar(20) NOT NULL,
  `kapasitas_mobil` int(11) NOT NULL,
  `tarif` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mobil`
--

INSERT INTO `mobil` (`nopol_mobil`, `merk_mobil`, `tahun_pembuatan`, `warna_mobil`, `kapasitas_mobil`, `tarif`) VALUES
('G 2019 LG', 'Honda Brio', 2019, 'Merah', 5, 300000),
('G 2830 LH', 'Daihatsu xenia', 2019, 'Hitam', 4, 300000);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `kode_peminjaman` char(10) NOT NULL,
  `nomor_ktp` varchar(16) NOT NULL,
  `nopol_mobil` varchar(10) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `durasi_sewa` int(120) NOT NULL,
  `total_bayar` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`kode_peminjaman`, `nomor_ktp`, `nopol_mobil`, `tanggal`, `durasi_sewa`, `total_bayar`) VALUES
('PJ03', '6518295134658212', 'G 2019 LG', '2021-01-28', 12, 3530000),
('PJO21', '8762316582916578', 'G 2019 LG', '2021-01-21', 7, 2050000),
('PNJ02', '34567813213', 'G 2019 LG', '2021-01-14', 10, 2930000),
('PNJ03', '8762316582916578', 'G 2830 LH', '2021-01-22', 3, 1470000),
('PNJ04', '8762316582916578', 'G 2019 LG', '2021-01-14', 33, 9830000);

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `kode_pengembalian` char(10) NOT NULL,
  `kode_peminjaman` char(10) NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`kode_pengembalian`, `kode_peminjaman`, `tanggal_pengembalian`, `status`) VALUES
('KMB01', 'PJ03', '2021-01-15', 'Diterima'),
('KMB03', 'PNJ03', '2021-01-21', 'Diterima'),
('PGM01', 'PJO21', '2021-01-12', 'Diterima');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `kode_user` varchar(11) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`kode_user`, `nama_user`, `username`, `password`, `level`) VALUES
('US001', 'Alfin Aseggaf', 'alfin', 'admin', 'admin'),
('US002', 'Aseggaf', 'asggf', 'tamu', 'pegawai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`nomor_ktp`);

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`nopol_mobil`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`kode_peminjaman`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`kode_pengembalian`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`kode_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
