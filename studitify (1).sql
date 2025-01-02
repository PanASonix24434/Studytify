-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2024 at 08:56 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studitify`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'hai', '65e84be33532fb784c48129675f9eff3a682b27168c0ea744b2cf58ee02337c5');

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `created_by` varchar(50) DEFAULT 'user',
  `image` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`id`, `user_id`, `name`, `created_by`, `image`, `genre`) VALUES
(7, NULL, 'Jiwang', 'admin', 'uploads/images (1).jpeg', 'Rock Kapak'),
(8, NULL, 'Zikir Pagi', 'admin', 'uploads/download (4).jpeg', 'Nasyid'),
(9, NULL, 'HAPPY OR SAD', 'admin', 'uploads/download.png', 'POP');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `artist` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `playlist_id`, `title`, `artist`, `url`, `genre`, `image`) VALUES
(4, 7, 'Kasihnya Laila', 'Jinbara', 'uploads/Jinbara - Kasihnya Laila (Lyrics).mp3', 'Rock Kapak', 'uploads/laila.jpeg'),
(6, 7, 'Taman Rashidah Utama', 'WINGS', 'uploads/WINGS - Taman Rashidah Utama (lirik).mp3', 'Rock Kapak', 'uploads/b1bac03b1ce3677ceaf1ef630656130a.jpg'),
(7, 8, 'Asmaul Husna', 'Hamba Allah', 'uploads/Asma-ul-Husna (99 Names of Allah).mp3', 'Nasyid', 'uploads/download (5).jpeg'),
(8, 8, 'Doa Pagi', 'Hijjaz', 'uploads/Hijjaz - Doa Pagi (Lirik Arab & Maksud)  Ulama al-Fathoni.mp3', 'Nasyid', 'uploads/images (2).jpeg'),
(9, 9, 'A Year Ago', 'James Arthur', 'uploads/James Arthur - A Year Ago.mp3', 'POP', 'uploads/download.jpeg'),
(10, 9, 'Car\'s Outside', 'James Arthur', 'uploads/James Arthur - Car\'s Outside (Official Lyric Video).mp3', 'Pop', 'uploads/download (1).jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reset_token` varchar(64) DEFAULT NULL,
  `reset_token_expires` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `reset_token`, `reset_token_expires`) VALUES
(1, 'imran', 'a@example.com', '$2y$10$lGeBualWPeXhp4JukJjH4e/E.oX0B.s4hsMqc48C3ZuQ/tpyI58mK', NULL, NULL),
(2, 'hai', 'b@example.com', '$2y$10$.eBf2wA.NA4XVq4rXaAgyuEj6V53Dso29Pxb43JpnxCpL0G3cWMz2', '2f8f346eaad0b25c80912298f62815825cbcd363c8f70df1c29c499cbce59971', '2024-07-06 07:25:27'),
(3, 'ayam', 'ayam@a.a', '$2y$10$QQLCw37rQxfeBoXfTDZAlOuDLMG6tDLUaWv6IPXrjXCWfZaeCPfna', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `songs_ibfk_1` (`playlist_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `playlists`
--
ALTER TABLE `playlists`
  ADD CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
