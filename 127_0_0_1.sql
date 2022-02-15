-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2021 at 03:52 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bukustore`
--
CREATE DATABASE IF NOT EXISTS `bukustore` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bukustore`;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_barang`
--

CREATE TABLE `tabel_barang` (
  `KodeBarang` char(5) NOT NULL,
  `NamaBarang` varchar(15) DEFAULT NULL,
  `Jenis` varchar(15) DEFAULT NULL,
  `HargaSatuanRp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tabel_barang`
--

INSERT INTO `tabel_barang` (`KodeBarang`, `NamaBarang`, `Jenis`, `HargaSatuanRp`) VALUES
('BR001', ' Garry Botter A', 'Novel', 150000),
('BR002', ' Get Your Best ', 'Buku Roh', 300000),
('BR003', ' Fantasiana', 'Majalah', 45000),
('BR004', ' Babby And', 'Komik', 15000),
('BR005', ' Keroro and Fri', 'Komik', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_customer`
--

CREATE TABLE `tabel_customer` (
  `kodeCustomer` char(5) NOT NULL,
  `NamaCustomer` varchar(15) DEFAULT NULL,
  `Alamat_Customer` varchar(30) DEFAULT NULL,
  `Phone_Customer` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tabel_customer`
--

INSERT INTO `tabel_customer` (`kodeCustomer`, `NamaCustomer`, `Alamat_Customer`, `Phone_Customer`) VALUES
('MB008', 'Utik', 'Palembang', '456');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_detail_transaksi`
--

CREATE TABLE `tabel_detail_transaksi` (
  `NoFaktur` char(5) NOT NULL,
  `KodeBarang` char(5) NOT NULL,
  `QTY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tabel_detail_transaksi`
--

INSERT INTO `tabel_detail_transaksi` (`NoFaktur`, `KodeBarang`, `QTY`) VALUES
('FTR01', 'BR001', 20),
('FTR01', 'BR002', 35),
('FTR01', 'BR003', 15),
('FTR01', 'BR004', 17),
('FTR01', 'BR005', 12);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_staff`
--

CREATE TABLE `tabel_staff` (
  `Idstaff` char(5) NOT NULL,
  `NamaStaff` varchar(15) DEFAULT NULL,
  `PosisiStaff` varchar(15) DEFAULT NULL,
  `AlamatStaff` varchar(30) DEFAULT NULL,
  `PhoneStaff` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tabel_staff`
--

INSERT INTO `tabel_staff` (`Idstaff`, `NamaStaff`, `PosisiStaff`, `AlamatStaff`, `PhoneStaff`) VALUES
('STF01', 'Belinda', 'Bagian Penjuala', 'Banyuwangi', '457');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_transaksi`
--

CREATE TABLE `tabel_transaksi` (
  `NoFaktur` char(5) NOT NULL,
  `TanggalPembelian` date DEFAULT NULL,
  `kodeCustomer` char(5) DEFAULT NULL,
  `IdStaff` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tabel_transaksi`
--

INSERT INTO `tabel_transaksi` (`NoFaktur`, `TanggalPembelian`, `kodeCustomer`, `IdStaff`) VALUES
('FTR01', '2021-11-12', 'MB008', 'STF01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabel_barang`
--
ALTER TABLE `tabel_barang`
  ADD PRIMARY KEY (`KodeBarang`);

--
-- Indexes for table `tabel_customer`
--
ALTER TABLE `tabel_customer`
  ADD PRIMARY KEY (`kodeCustomer`);

--
-- Indexes for table `tabel_detail_transaksi`
--
ALTER TABLE `tabel_detail_transaksi`
  ADD PRIMARY KEY (`NoFaktur`,`KodeBarang`),
  ADD KEY `KodeBarang` (`KodeBarang`);

--
-- Indexes for table `tabel_staff`
--
ALTER TABLE `tabel_staff`
  ADD PRIMARY KEY (`Idstaff`);

--
-- Indexes for table `tabel_transaksi`
--
ALTER TABLE `tabel_transaksi`
  ADD PRIMARY KEY (`NoFaktur`),
  ADD KEY `kodeCustomer` (`kodeCustomer`),
  ADD KEY `IdStaff` (`IdStaff`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tabel_detail_transaksi`
--
ALTER TABLE `tabel_detail_transaksi`
  ADD CONSTRAINT `tabel_detail_transaksi_ibfk_1` FOREIGN KEY (`NoFaktur`) REFERENCES `tabel_transaksi` (`NoFaktur`),
  ADD CONSTRAINT `tabel_detail_transaksi_ibfk_2` FOREIGN KEY (`KodeBarang`) REFERENCES `tabel_barang` (`KodeBarang`);

--
-- Constraints for table `tabel_transaksi`
--
ALTER TABLE `tabel_transaksi`
  ADD CONSTRAINT `tabel_transaksi_ibfk_1` FOREIGN KEY (`kodeCustomer`) REFERENCES `tabel_customer` (`kodeCustomer`),
  ADD CONSTRAINT `tabel_transaksi_ibfk_2` FOREIGN KEY (`IdStaff`) REFERENCES `tabel_staff` (`Idstaff`);
--
-- Database: `db_koperasi_pupuk`
--
CREATE DATABASE IF NOT EXISTS `db_koperasi_pupuk` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_koperasi_pupuk`;

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` char(5) NOT NULL,
  `nama_anggota` varchar(45) DEFAULT NULL,
  `alamat` varchar(45) DEFAULT NULL,
  `no_hp` char(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama_anggota`, `alamat`, `no_hp`) VALUES
('KOP01', 'Ilham', 'Jember', '085111222333'),
('KOP02', 'Tanti', 'Jember', '085444555666'),
('KOP03', 'Eka', 'Situbondo', '085777888999');

-- --------------------------------------------------------

--
-- Table structure for table `pupuk`
--

CREATE TABLE `pupuk` (
  `id_pupuk` char(5) NOT NULL,
  `nama_pupuk` varchar(45) DEFAULT NULL,
  `jenis_pupuk` varchar(45) DEFAULT NULL,
  `harga` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pupuk`
--

INSERT INTO `pupuk` (`id_pupuk`, `nama_pupuk`, `jenis_pupuk`, `harga`) VALUES
('P001', 'NPK', 'Kimia', '50000'),
('P002', 'N', 'Kimia', '75000'),
('P003', 'N', 'Organik', '150000');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` char(5) NOT NULL,
  `nama_supplier` varchar(45) DEFAULT NULL,
  `alamat_supplier` varchar(45) DEFAULT NULL,
  `no_hp` char(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat_supplier`, `no_hp`) VALUES
('SP001', 'Kaka', 'Surabaya', '081000111222'),
('SP002', 'Kiki', 'Sidoarjo', '081000333444');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `pupuk`
--
ALTER TABLE `pupuk`
  ADD PRIMARY KEY (`id_pupuk`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);
--
-- Database: `mahasiswa`
--
CREATE DATABASE IF NOT EXISTS `mahasiswa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mahasiswa`;

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `nim` varchar(20) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`nim`, `password`) VALUES
('E4123450', '12345678'),
('E4123451', '12345678'),
('E4123456', '12345678'),
('E4123457', '12345678'),
('E4123458', '12345678'),
('E4123459', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `daftar_dosen`
--

CREATE TABLE `daftar_dosen` (
  `NIP` char(10) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `no_hp` char(13) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daftar_dosen`
--

INSERT INTO `daftar_dosen` (`NIP`, `nama_dosen`, `no_hp`, `alamat`) VALUES
('0160436012', 'Rina Wulandhari', '081233735903', 'Banyuwangi'),
('0160436013', 'Lusy Damayanti', '081233735904', 'Ponorogo'),
('0160436014', 'Satria Yuda Pamungkas', '081233735905', 'Jember'),
('0160436015', 'Sugeng Budi Saputra', '081233735906', 'Jawa Timur'),
('0160436016', 'Siti Rohilah', '081233735907', 'Jember'),
('0160436017', 'Lord Adi', '081233735908', 'Jember'),
('0160436018', 'Nila Putri Rosidania', '081233735909', 'Gresik'),
('0160436019', 'Karen Novita', '081233735900', 'Solo');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `kode_matkul` char(5) NOT NULL,
  `nama_matkul` varchar(50) NOT NULL,
  `jumlah_SKS` tinyint(3) UNSIGNED DEFAULT 2,
  `kode_jur` char(5) DEFAULT NULL,
  `nip` char(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`kode_matkul`, `nama_matkul`, `jumlah_SKS`, `kode_jur`, `nip`) VALUES
('CITRA', 'Pengolahan Citra', 2, '544', '0160436017'),
('FIDAS', 'Fisika Dasar', 2, '542', '0160436019'),
('JRKOM', 'Jaringan Komputer', 2, '540', '0160436018'),
('KIMDA', 'Kimia Dasar', 2, '545', '0160436012'),
('MMDAS', 'Matematika Dasar', 4, '541', '0160436013'),
('PBASE', 'Pengaturan Database', 2, '543', '0160436014');

-- --------------------------------------------------------

--
-- Table structure for table `mhs`
--

CREATE TABLE `mhs` (
  `nim` varchar(20) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `alamat` varchar(45) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `kode_jur` char(5) DEFAULT NULL,
  `nip` char(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mhs`
--

INSERT INTO `mhs` (`nim`, `nama`, `alamat`, `phone`, `kode_jur`, `nip`) VALUES
('E4123450', 'Rinas', 'Bwi', '081234567890', '540', '0160436012'),
('E4123451', 'Wito', 'Jogja', '081234567891', '541', '0160436013'),
('E4123456', 'Wulandhari', 'Sanggar', '081234567892', '542', '0160436014'),
('E4123457', 'Sube', 'Dambuntung', '081234567893', '543', '0160436015'),
('E4123458', 'Skyuza', 'Persen', '081234567894', '544', '0160436013'),
('E4123459', 'Bondan', 'Kaliwatu', '081234567895', '545', '0160436014');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detail_krs`
--

CREATE TABLE `tbl_detail_krs` (
  `kode_krs` char(10) DEFAULT NULL,
  `kode_matkul` char(5) DEFAULT NULL,
  `hari` varchar(7) DEFAULT NULL,
  `jam` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jurusan`
--

CREATE TABLE `tbl_jurusan` (
  `kode_jur` char(5) NOT NULL,
  `nama_jur` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_jurusan`
--

INSERT INTO `tbl_jurusan` (`kode_jur`, `nama_jur`) VALUES
('540', 'Teknik Informatika'),
('541', 'Bahasa Inggris'),
('542', 'Pertanian'),
('543', 'Kehutanan'),
('544', 'Teknik Lingkungan'),
('545', 'Teknik Perminyakan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_krs`
--

CREATE TABLE `tbl_krs` (
  `kode_krs` char(10) NOT NULL,
  `tanggal_krs` datetime DEFAULT NULL,
  `nim` char(9) DEFAULT NULL,
  `kode_jur` char(5) DEFAULT NULL,
  `jumlah_sks` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_krs`
--

INSERT INTO `tbl_krs` (`kode_krs`, `tanggal_krs`, `nim`, `kode_jur`, `jumlah_sks`) VALUES
('KRS098', '0000-00-00 00:00:00', 'E4123456', '542', 2),
('KRS451', '0000-00-00 00:00:00', 'E4123457', '543', 7),
('KRS453', '2021-12-06 01:00:00', 'E4123450', '540', 4),
('KRS564', '2021-08-06 08:00:00', 'E4123458', '544', 3),
('KRS612', '0000-00-00 00:00:00', 'E4123451', '541', 8),
('KRS912', '2021-06-06 02:00:00', 'E4123459', '545', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `daftar_dosen`
--
ALTER TABLE `daftar_dosen`
  ADD PRIMARY KEY (`NIP`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`kode_matkul`),
  ADD KEY `kode_jur` (`kode_jur`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `mhs`
--
ALTER TABLE `mhs`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `kode_jur` (`kode_jur`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `tbl_detail_krs`
--
ALTER TABLE `tbl_detail_krs`
  ADD KEY `kode_krs` (`kode_krs`),
  ADD KEY `kode_matkul` (`kode_matkul`);

--
-- Indexes for table `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  ADD PRIMARY KEY (`kode_jur`);

--
-- Indexes for table `tbl_krs`
--
ALTER TABLE `tbl_krs`
  ADD PRIMARY KEY (`kode_krs`),
  ADD KEY `nim` (`nim`),
  ADD KEY `kode_jur` (`kode_jur`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD CONSTRAINT `mata_kuliah_ibfk_1` FOREIGN KEY (`kode_jur`) REFERENCES `tbl_jurusan` (`kode_jur`),
  ADD CONSTRAINT `mata_kuliah_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `daftar_dosen` (`NIP`);

--
-- Constraints for table `mhs`
--
ALTER TABLE `mhs`
  ADD CONSTRAINT `mhs_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `akun` (`nim`),
  ADD CONSTRAINT `mhs_ibfk_2` FOREIGN KEY (`kode_jur`) REFERENCES `tbl_jurusan` (`kode_jur`),
  ADD CONSTRAINT `mhs_ibfk_3` FOREIGN KEY (`nip`) REFERENCES `daftar_dosen` (`NIP`);

--
-- Constraints for table `tbl_detail_krs`
--
ALTER TABLE `tbl_detail_krs`
  ADD CONSTRAINT `tbl_detail_krs_ibfk_1` FOREIGN KEY (`kode_krs`) REFERENCES `tbl_krs` (`kode_krs`),
  ADD CONSTRAINT `tbl_detail_krs_ibfk_2` FOREIGN KEY (`kode_matkul`) REFERENCES `mata_kuliah` (`kode_matkul`);

--
-- Constraints for table `tbl_krs`
--
ALTER TABLE `tbl_krs`
  ADD CONSTRAINT `tbl_krs_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mhs` (`nim`),
  ADD CONSTRAINT `tbl_krs_ibfk_2` FOREIGN KEY (`kode_jur`) REFERENCES `tbl_jurusan` (`kode_jur`);
--
-- Database: `mata_kuliah`
--
CREATE DATABASE IF NOT EXISTS `mata_kuliah` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mata_kuliah`;

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `kode_matkul` char(5) NOT NULL,
  `nama_matkul` varchar(50) NOT NULL,
  `jumlah_SKS` tinyint(3) UNSIGNED DEFAULT 2,
  `nama_jurusan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`kode_matkul`, `nama_matkul`, `jumlah_SKS`, `nama_jurusan`) VALUES
('CITRA', 'Pengolahan Citra', 2, 'Ilmu Komputer'),
('FIDAS', 'FIisika Dasar', 2, 'Fisika'),
('JRKOM', 'Jaringan Komputer', 2, 'Ilmu Komputer'),
('KIMDA', 'Kimia Dasar', 2, 'Kimia'),
('MMDAS', 'Matematika Dasar', 4, 'Matematika'),
('PBASE', 'Pengaturan Database', 2, 'Ilmu Komputer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`kode_matkul`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\",\"small_big_all\":\">\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"mahasiswa\",\"table\":\"mata_kuliah\"},{\"db\":\"bukustore\",\"table\":\"tabel_customer\"},{\"db\":\"bukustore\",\"table\":\"tabel_barang\"},{\"db\":\"bukustore\",\"table\":\"tabel_detail_transaksi\"},{\"db\":\"bukustore\",\"table\":\"tabel_transaksi\"},{\"db\":\"bukustore\",\"table\":\"tabel_staff\"},{\"db\":\"mahasiswa\",\"table\":\"tbl_krs\"},{\"db\":\"mahasiswa\",\"table\":\"tbl_detail_krs\"},{\"db\":\"mahasiswa\",\"table\":\"mhs\"},{\"db\":\"mahasiswa\",\"table\":\"tbl_jurusan\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2021-11-17 02:50:55', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":221}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
