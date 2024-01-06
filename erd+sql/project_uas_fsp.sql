-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 06, 2024 at 07:52 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_uas_fsp`
--

-- --------------------------------------------------------

--
-- Table structure for table `cerita`
--

CREATE TABLE `cerita` (
  `idcerita` int(11) NOT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `iduser_pembuat_awal` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cerita`
--

INSERT INTO `cerita` (`idcerita`, `judul`, `iduser_pembuat_awal`) VALUES
(11, 'Rahasia di Bawah Cahaya Rembulan', '160421001'),
(12, 'Jejak-jejak Harapan', '160421058'),
(13, 'Bayangan di Balik Senyuman', '160421072'),
(14, 'Melodi Senja di Antara Jingga', '160421001'),
(15, 'Bayang-Bayang Waktu di Kota Terlupakan', '160421058'),
(16, 'Serenade Bintang di Negeri Awan', '160421072'),
(17, 'Pulau Kenangan', '160421001'),
(18, 'Buku Ajaib di Perpustakaan Kuno', '160421001'),
(19, 'Lukisan Terlupakan', '160421058'),
(20, 'Sarang Burung Sorgawi', '160421058'),
(21, 'Tarian Cahaya Malam', '160421072'),
(22, 'Pesona Penyihir Kecil', '160421072'),
(23, 'Pintu Menuju Waktu', '160421072'),
(24, 'Gelombang Ajaib', '160421058'),
(25, 'Pencarian Bintang Jatuh', '160421001'),
(26, 'Pesona Kamera Lama', '160421072'),
(27, 'Melodi Hujan', '160421058'),
(28, 'Kesatria Bayangan', '160421001');

-- --------------------------------------------------------

--
-- Table structure for table `paragraf`
--

CREATE TABLE `paragraf` (
  `idparagraf` int(11) NOT NULL,
  `iduser` varchar(40) NOT NULL,
  `idcerita` int(11) NOT NULL,
  `isi_paragraf` varchar(700) DEFAULT NULL,
  `tanggal_buat` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paragraf`
--

INSERT INTO `paragraf` (`idparagraf`, `iduser`, `idcerita`, `isi_paragraf`, `tanggal_buat`) VALUES
(27, '160421001', 11, 'Di sebuah kota pelabuhan tua yang dikelilingi oleh cerita-cerita mistis, hiduplah Damar, seorang pemuda yang penuh rasa penasaran. Ketika malam datang, bulan purnama menerangi kota dengan cahayanya yang lembut, dan di bawah cahaya rembulan itulah tersembunyi rahasia-rahasia kuno yang melibatkan keluarga Damar. Dalam pencariannya untuk mengungkap misteri yang melingkupi keluarganya, Damar merenungi legenda-legenda setempat, mitos-mitos kuno, dan perjumpaan-perjumpaan tak terduga yang membawanya ke dalam dunia yang gelap dan menarik. Akankah Damar berhasil mengungkap rahasia di bawah cahaya rembulan yang misterius tersebut?', '2023-10-14 06:55:35'),
(28, '160421058', 12, 'Di desa kecil yang dikepung oleh perbukitan hijau, tinggal lah Rani, seorang gadis desa yang bercita-cita tinggi. Di dalam hatinya terdapat jejak-jejak harapan yang tumbuh subur, meskipun desa itu sendiri terpuruk dalam kemiskinan dan keterbatasan. Rani memiliki impian untuk merubah takdir desanya melalui kecerdasan dan tekadnya yang bulat. Namun, apakah harapan-harapan itu dapat bertahan di tengah kerasnya realitas dan rintangan hidup di desa yang penuh dengan kejutan tak terduga?', '2023-10-14 06:59:49'),
(29, '160421058', 11, 'Damar terus menyusuri lorong-lorong kota pelabuhan yang penuh misteri, menemui petunjuk-petunjuk tersembunyi di antara riwayat keluarganya. Setiap langkah membawanya lebih dalam ke dalam pusaran rahasia, dan Damar menyadari bahwa kebenaran sering kali lebih kompleks daripada yang terlihat di permukaan. Di bawah cahaya rembulan yang mengambang, Damar menemukan konspirasi kuno yang melibatkan keluarganya dan menyadari bahwa ia harus memilih antara memutuskan warisan keluarganya atau mengejar nasibnya yang sendiri.', '2023-10-14 07:00:02'),
(30, '160421072', 13, 'Di tengah hiruk-pikuk kota Jakarta yang gemerlap, terselip cerita tentang Maya, seorang wanita muda dengan senyumnya yang selalu berseri. Namun, di balik kebahagiaan yang terpancar dari wajahnya, Maya menyimpan bayangan yang kelam. Kehidupannya yang tampak sempurna tergores oleh rahasia kelam dari masa lalu yang ingin ia kubur. Kini, perjalanan hidupnya menjadi seperti perburuan bayangan, dan senyumnya menjadi tirai yang menutupi kisah kelamnya. Apakah Maya akan berhasil menghadapi bayangan di balik senyumnya dan menemukan cahaya kebenaran?', '2023-10-14 07:01:03'),
(31, '160421072', 12, 'Rani terus berusaha menggapai harapannya, namun desa yang terisolasi membawa tantangan besar. Dia memutuskan untuk memimpin perubahan dengan membangun jembatan antara desa dan dunia luar. Dalam perjalanannya, Rani menghadapi perlawanan keras dari orang-orang yang takut akan perubahan. Namun, dengan tekadnya yang kuat dan dukungan dari teman-temannya, Rani mulai merajut jejak-jejak harapan yang memungkinkan desanya untuk bersinar dalam sinar kemajuan.', '2023-10-14 07:01:16'),
(32, '160421001', 13, 'Maya merasa beban bayangan masa lalu semakin berat, dan dia memutuskan untuk menyelusuri jejak-jejak yang terkubur dalam ingatannya. Perjalanan itu membawanya ke kisah-kisah kelam yang perlahan terungkap, memaksa Maya untuk menghadapi kebenaran yang sulit diterima. Dalam perjalanan pencarian diri ini, Maya menemui pertemanan yang tak terduga dan membangun kekuatan untuk mengatasi bayang-bayang yang selama ini menghantuinya.', '2023-10-14 07:01:42'),
(33, '160421001', 14, 'Di desa terpencil di perbukitan, hidup seorang seniman bernama Arya yang terobsesi dengan melodi senja yang terdengar di antara dedaunan jingga. Ia berkelana melintasi hutan dan sungai, mencari sumber melodi misterius itu yang dianggapnya sebagai kunci kebahagiaan sejati. Namun, semakin dekat Arya mendekati tujuannya, semakin jauh melodi itu bersembunyi. Dalam perjalanan pencariannya, Arya menemui pertemuan yang tak terduga dan menemukan makna sejati dari melodi senja yang selama ini memikat hatinya.', '2023-10-14 07:03:13'),
(34, '160421001', 14, 'Meski melodi senja masih menggantung di udara, Arya terus menjelajah tanah-tanah yang belum dijelajahi, berharap menemukan sumber keajaiban yang menginspirasinya. Setiap langkah yang diambilnya membawanya lebih dekat pada rahasia melodi yang menuntunnya ke dalam keindahan yang tak terduga. Di ujung perjalanan, Arya menemukan bahwa melodi sejati yang dicarinya tidak hanya terletak dalam suara, tetapi juga dalam kehidupan sehari-hari yang penuh warna dan kebahagiaan.', '2023-10-14 07:03:29'),
(35, '160421058', 15, 'Kota tua yang telah dilupakan oleh sejarah menyimpan bayang-bayang waktu yang terlupakan. Di tengah reruntuhan bangunan bersejarah, hidup seorang arkeolog bernama Maya yang tertarik pada misteri kota tersebut. Ditemani oleh catatan-catatan kuno dan petunjuk-petunjuk yang terlupakan, Maya berusaha menggali dan memahami kisah-kisah yang telah terkubur. Namun, semakin dalam ia menyelidiki, semakin jelas bahwa bayang-bayang waktu membawa cerita yang tak terduga dan membingungkan.', '2023-10-14 07:04:08'),
(36, '160421058', 15, 'Maya terus menggali lapisan waktu yang lama terlupakan, mengungkap rahasia dan kisah-kisah yang telah terkubur di bawah debu sejarah. Dalam setiap serpihan arsitektur yang retak, ia menemukan serpihan cerita hidup yang menggugah dan meresapi jiwa. Meski banyak yang mencoba melupakan kota tersebut, Maya berhasil membawa kembali citra dan memori kota terlupakan, memberikan suara pada orang-orang yang telah lama hilang dalam bayang-bayang waktu.', '2023-10-14 07:04:29'),
(37, '160421072', 16, 'Di negeri yang tersembunyi di antara awan, hidup seorang pemuda bernama Rama yang memiliki mimpi untuk mencapai serenade bintang yang legendaris. Berbekal peta kuno dan tekad yang kuat, Rama memulai perjalanan melintasi pegunungan tinggi dan lembah-lembah misterius. Di sepanjang perjalanan, ia menemui makhluk-makhluk ajaib dan menghadapi ujian-ujian tak terduga. Serenade bintang yang ia cari bukan hanya tentang melodi yang indah, tetapi juga tentang pertumbuhan diri dan keajaiban yang ada di sepanjang perjalanan hidupnya.', '2023-10-14 07:05:02'),
(38, '160421072', 16, 'Rama melanjutkan perjalanannya melalui negeri awan yang menyimpan kejutan dan keindahan di setiap tikungan. Di tengah cahaya bintang yang berserakan di langit malam, ia menemukan bahwa serenade yang dicari bukan hanya milik bintang, tetapi juga milik hati yang terbuka pada keajaiban dunia. Dengan harapan yang membimbingnya, Rama menemukan bahwa petualangan sejati adalah tentang menghargai keindahan kecil di sepanjang perjalanan, dan bahwa serenade bintang sejati ada dalam setiap langkah yang diambil menuju impian.', '2023-10-14 07:05:16'),
(39, '160421001', 17, 'Di tepi pantai terpencil, seorang wanita bernama Maya menemukan sebuah pulau kecil yang dipenuhi dengan bunga berwarna-warni. Setiap bunga memiliki kekuatan untuk mengingatkan orang-orang tentang kenangan terindah dalam hidup mereka. Maya, yang sedang mencari makna kehidupan, memutuskan untuk menjelajahi pulau tersebut dan menemukan kejutan-kejutan yang mengubah pandangannya tentang arti sejati dari kenangan.', '2024-01-06 06:46:27'),
(40, '160421001', 18, 'Dalam perpustakaan kuno yang terlupakan, seorang mahasiswa bernama Ryan menemukan sebuah buku ajaib yang dapat membawanya ke dalam dunia cerita-cerita klasik. Setiap kali ia membaca halaman-halaman buku tersebut, Ryan tiba-tiba menjadi bagian dari kisah yang hidup, menjelajahi dunia fantasi yang penuh petualangan dan keajaiban.', '2024-01-06 06:46:27'),
(41, '160421058', 19, 'Seorang seniman muda, Mia, menemukan sebuah lukisan tua yang terlupakan di loteng rumahnya. Lukisan tersebut tidak hanya menghidupkan kembali kenangan masa kecilnya, tetapi juga membuka pintu menuju petualangan baru yang menggoyahkan kehidupannya dengan nuansa keindahan dan inspirasi.', '2024-01-06 06:46:27'),
(42, '160421058', 20, 'Di tengah hutan yang tenang, seorang anak laki-laki bernama Rama menemukan sarang burung yang indah dan misterius. Setiap kali dia berada di dekat sarang tersebut, dia merasakan kehadiran sesuatu yang magis, membawanya pada pengembaraan spiritual yang memperdalam pemahamannya tentang alam dan kehidupan.', '2024-01-06 06:46:27'),
(43, '160421072', 21, 'Seorang penari jalanan bernama Lila menemukan panggung terbuka yang terletak di tengah kota yang ramai. Setiap malam, ketika cahaya bulan menerangi panggung, Lila menari dengan penuh semangat, menginspirasi orang-orang di sekitarnya untuk mengejar impian mereka melalui ekspresi seni.', '2024-01-06 06:46:27'),
(44, '160421072', 22, 'Ketika seorang anak perempuan, Elsa, menemukan topi penyihir tua di toko barang antik, dia tak tahu bahwa topi itu memiliki kekuatan magis. Dengan topi itu, Elsa memasuki dunia fantasi yang penuh dengan petualangan ajaib, membantunya mengatasi rintangan dan menemukan keberanian di dalam dirinya yang belum pernah dia sadari sebelumnya.', '2024-01-06 06:46:27'),
(45, '160421072', 23, 'Di ruang bawah tanah rumah tua keluarganya, seorang remaja bernama Arka menemukan pintu kecil yang membawanya ke zaman lampau. Setiap kali Arka melangkah keluar dari pintu tersebut, dia menemukan dirinya di tengah-tengah peristiwa sejarah yang memukau, memberinya pelajaran berharga tentang kehidupan dan nilai-nilai yang telah terkubur dalam lembaran waktu.', '2024-01-06 06:51:25'),
(46, '160421058', 24, 'Di tepi pantai yang terkenal dengan ombak besarnya, seorang surfer bernama Kira menemukan gelombang ajaib yang hanya muncul pada malam bulan purnama. Setiap kali Kira berhasil menaklukkan gelombang tersebut, dia merasakan energi mistis yang memberinya wawasan baru tentang hubungan antara manusia dan alam, menciptakan ikatan yang tak terputus.', '2024-01-06 06:51:25'),
(47, '160421001', 25, 'Ketika bintang jatuh yang langka muncul di langit, seorang anak kecil bernama Aria memutuskan untuk mencarinya. Dengan setiap langkah petualangannya, Aria menemui orang-orang yang memberinya petunjuk berharga tentang keberanian, persahabatan, dan kekuatan impian yang dapat mengubah takdir.', '2024-01-06 06:51:25'),
(48, '160421072', 26, 'Seorang fotografer bernama Ben menemukan sebuah kamera vintage di toko barang antik. Setiap kali ia menggunakan kamera tersebut, Ben tak hanya mengabadikan momen-momen indah, tetapi juga menemukan kemampuannya untuk mengungkapkan kebenaran yang tersembunyi di balik kisah hidup orang-orang di sekitarnya.', '2024-01-06 06:51:25'),
(49, '160421058', 27, 'Di tengah hutan hujan yang lebat, seorang musisi jalanan bernama Nia menemukan tempat yang magis di mana setiap tetes hujan berubah menjadi melodi indah. Melalui melodi hujan tersebut, Nia belajar menerima dan merayakan perubahan, menciptakan harmoni dengan segala aspek kehidupan.', '2024-01-06 06:51:25'),
(50, '160421001', 28, 'Seorang anak laki-laki bernama Aldo menemukan buku ajaib yang membawanya ke dunia fantasi di mana dia menjadi kesatria bayangan, melindungi tanah ajaib dari kegelapan. Melalui petualangannya, Aldo memahami bahwa keberanian dan kekuatan sejati datang dari hati yang tulus, bahkan di dunia yang hanya ada dalam imajinasi.', '2024-01-06 06:51:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `iduser` varchar(40) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`iduser`, `nama`, `password`, `salt`) VALUES
('160421001', 'Steven', '01cc2e4c4ce86aa35b57157d300a034b', 'PvIndHrtSk'),
('160421058', 'Bayu', '4e7fed3cff76dd5c7b54d512c8af5a32', 'HPInStdrkv'),
('160421072', 'Vincent', '76229e1e196c4a26916f45d5b2076811', 'PSnrtdvIHk');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cerita`
--
ALTER TABLE `cerita`
  ADD PRIMARY KEY (`idcerita`),
  ADD KEY `fk_cerita_users_idx` (`iduser_pembuat_awal`);

--
-- Indexes for table `paragraf`
--
ALTER TABLE `paragraf`
  ADD PRIMARY KEY (`idparagraf`),
  ADD KEY `fk_paragraf_users1_idx` (`iduser`),
  ADD KEY `fk_paragraf_cerita1_idx` (`idcerita`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cerita`
--
ALTER TABLE `cerita`
  MODIFY `idcerita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `paragraf`
--
ALTER TABLE `paragraf`
  MODIFY `idparagraf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cerita`
--
ALTER TABLE `cerita`
  ADD CONSTRAINT `fk_cerita_users` FOREIGN KEY (`iduser_pembuat_awal`) REFERENCES `users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `paragraf`
--
ALTER TABLE `paragraf`
  ADD CONSTRAINT `fk_paragraf_cerita1` FOREIGN KEY (`idcerita`) REFERENCES `cerita` (`idcerita`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_paragraf_users1` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
