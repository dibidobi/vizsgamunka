-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2020. Ápr 16. 10:46
-- Kiszolgáló verziója: 10.1.40-MariaDB
-- PHP verzió: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `barkacsbolt`
--
CREATE DATABASE IF NOT EXISTS `barkacsbolt` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `barkacsbolt`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nev` varchar(42) COLLATE utf8_hungarian_ci NOT NULL,
  `pass` text COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `admin`
--

INSERT INTO `admin` (`id`, `nev`, `pass`) VALUES
(1, 'Admin', '123456');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bolt_adatai`
--

CREATE TABLE `bolt_adatai` (
  `nev` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `iranyitoszam` int(11) NOT NULL,
  `varos` text COLLATE utf8_hungarian_ci NOT NULL,
  `cim` text COLLATE utf8_hungarian_ci NOT NULL,
  `email` text COLLATE utf8_hungarian_ci NOT NULL,
  `telefon` text COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `bolt_adatai`
--

INSERT INTO `bolt_adatai` (`nev`, `iranyitoszam`, `varos`, `cim`, `email`, `telefon`) VALUES
('Kiss Barkácsbolt', 9900, 'Körmend', 'Németh Mária u. 2.', 'barkacs2@t-online.hu', '94414063');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szamla`
--

CREATE TABLE `szamla` (
  `id` int(11) NOT NULL,
  `bolt` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `vasarloID` int(11) NOT NULL,
  `reszletID` int(11) NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `szamla`
--

INSERT INTO `szamla` (`id`, `bolt`, `vasarloID`, `reszletID`, `datum`) VALUES
(3, 'Kiss Barkácsbolt', 1, 1, '2020-02-27'),
(4, 'Kiss Barkácsbolt', 1, 2, '2020-02-28'),
(5, 'Kiss Barkácsbolt', 1, 5, '2020-03-18'),
(8, 'Kiss Barkácsbolt', 1, 8, '2020-03-18');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szamla_reszlet`
--

CREATE TABLE `szamla_reszlet` (
  `id` int(11) NOT NULL,
  `termekID` int(11) NOT NULL,
  `mennyiseg` int(11) NOT NULL,
  `megjegyzes` text COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `szamla_reszlet`
--

INSERT INTO `szamla_reszlet` (`id`, `termekID`, `mennyiseg`, `megjegyzes`) VALUES
(1, 1, 3, ''),
(2, 2, 10, ''),
(5, 4, 3, ''),
(6, 7, 1, ''),
(7, 10, 15, ''),
(8, 8, 3, ''),
(9, 9, 2, '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termekek`
--

CREATE TABLE `termekek` (
  `id` int(11) NOT NULL,
  `nev` text COLLATE utf8_hungarian_ci NOT NULL,
  `marka` text COLLATE utf8_hungarian_ci NOT NULL,
  `mennyiseg` int(11) NOT NULL,
  `m_egys` varchar(3) COLLATE utf8_hungarian_ci NOT NULL,
  `besz_ar` int(11) NOT NULL,
  `eladasi_ar` int(11) NOT NULL,
  `afa` int(11) NOT NULL,
  `brutto_ar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `termekek`
--

INSERT INTO `termekek` (`id`, `nev`, `marka`, `mennyiseg`, `m_egys`, `besz_ar`, `eladasi_ar`, `afa`, `brutto_ar`) VALUES
(1, '3 pontos ajtózár', 'Elzett', 2, 'db', 9088, 11811, 27, 15000),
(2, '5 pontos ajtózár', 'Abus', 1, 'db', 7047, 9354, 27, 11880),
(3, 'Ütvefúró ', 'Hitachi ', 4, 'db', 79000, 85000, 27, 107950),
(4, 'Sarokcsiszoló ', 'Einhell', 5, 'db', 45000, 5500, 27, 69850),
(5, 'Motorfűrész', 'Makita', 3, 'db', 160000, 180000, 27, 210000),
(6, 'Hőlégfúvó B360', 'Master', 5, 'db', 400000, 487717, 27, 619400),
(7, 'Monto Tribilo 3x10 fokos sokcélú létra', 'Krause', 10, 'db', 35000, 49556, 27, 62936),
(8, 'Klinkertégla- és kerámiaolaj', 'Mellerud', 30, 'L', 800, 1697, 27, 2155),
(9, 'Huzalszeg 80-as 5kg', 'Fémiszk', 250, 'kg', 3100, 3897, 27, 4499),
(10, 'Építődeszka 2,3x10x200cm', 'PEFC', 30, 'm', 650, 825, 27, 1280),
(11, 'Kerítésfestő ecsetkészlet 3 db-os', 'márka nélküli', 4, 'db', 425, 610, 27, 779);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vasarlok`
--

CREATE TABLE `vasarlok` (
  `id` int(11) NOT NULL,
  `nev` text COLLATE utf8_hungarian_ci NOT NULL,
  `felhaszNev` varchar(38) COLLATE utf8_hungarian_ci NOT NULL,
  `neme` varchar(1) COLLATE utf8_hungarian_ci NOT NULL,
  `szuldat` varchar(15) COLLATE utf8_hungarian_ci NOT NULL,
  `iranyitoszam` int(11) NOT NULL,
  `varos` text COLLATE utf8_hungarian_ci NOT NULL,
  `cim` text COLLATE utf8_hungarian_ci NOT NULL,
  `email` text COLLATE utf8_hungarian_ci NOT NULL,
  `pass` text COLLATE utf8_hungarian_ci NOT NULL,
  `telefon` text COLLATE utf8_hungarian_ci NOT NULL,
  `regisztral_dat` varchar(15) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `vasarlok`
--

INSERT INTO `vasarlok` (`id`, `nev`, `felhaszNev`, `neme`, `szuldat`, `iranyitoszam`, `varos`, `cim`, `email`, `pass`, `telefon`, `regisztral_dat`) VALUES
(1, 'Dobos Ádám', 'kisdobos', 'f', '1999. 05. 09', 9913, 'Döröske', 'Fő utca 42.', 'kisdobos119@gmail.com', '123456', '06702751799', '2020. 02. 16'),
(2, 'Varró Patrik', 'Tupac', 'f', '1998. 09. 12', 8900, 'Zalaegerszeg', 'Király utca 23.', 'varro.patrik@freemail.com', '654321', '06201548637', '2020. 03. 03'),
(3, 'Varga Réka', 'rekuci', 'n', '2003. 04. 17', 8935, 'Nagykapornak', 'Sass Károly utca 55.', 'varga.reka@indamail.hu', '458763', '+36301564588', '2020. 03. 31'),
(5, 'Bonczók Norbert', 'Boss', 'f', '1999. 10. 13', 8500, 'Pápa', 'Boros utca 11.', 'Bnorbi66@levelezek.hu', '783645', '06301548973', '2020. 07. 08'),
(7, 'Dalos Donát', 'webmester', 'f', '2004. 12. 03', 9700, 'Szombathely', 'Sipos Sándor utca 21.', 'dalos@i-mail.com', '459632', '+36304532781', '2020. 03. 30'),
(8, 'Krajczár Kristóf', 'nagyszaju', 'f', '2010. 07. 09', 9970, 'Szentgotthárd', 'Kiss utca 30.', 'kkrajczar107@gmail.com', 'kArd08', '06703806079', '2020. 03. 15'),
(11, 'Krajczár Adél', 'Leda', 'n', '1999. 05. 09', 9970, 'Szentgotthárd', 'Kiss utca 30.', 'adel.krajczar@gmail.com', '123456', '06702154789', '2020. 03. 16'),
(12, 'Molnár Barnabás', 'barna', 'f', '1997. 01. 19', 8900, 'Zalaegerszeg', 'Klaplak György utca 51.', 'barni19@csany-zeg.hu', '15498762', '06306495781', '2020. 03. 18');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vendeg_vevo`
--

CREATE TABLE `vendeg_vevo` (
  `id` int(11) NOT NULL,
  `nev` text COLLATE utf8_hungarian_ci NOT NULL,
  `iranyitoszam` int(11) NOT NULL,
  `varos` text COLLATE utf8_hungarian_ci NOT NULL,
  `cim` text COLLATE utf8_hungarian_ci NOT NULL,
  `email` text COLLATE utf8_hungarian_ci NOT NULL,
  `telefon` text COLLATE utf8_hungarian_ci NOT NULL,
  `rendelesDT` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `vendeg_vevo`
--

INSERT INTO `vendeg_vevo` (`id`, `nev`, `iranyitoszam`, `varos`, `cim`, `email`, `telefon`, `rendelesDT`) VALUES
(1, 'Bach Béla', 9900, 'Körmend', 'Rákóczi utca 8.', 'backbela@levelez.hu', '+36302154789', '2020-02-11'),
(2, 'Kovács István', 4286, 'Bagamér', 'Soros utca 22.', 'bagamer55@indamail.hu', '+3694555624', '2020-03-09'),
(3, 'Szűcs Andrea', 8879, 'Szécsisziget', 'Fő utca 32.', 'andi1204@freemail.com', '+36205546981', '2020-03-15');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nev` (`nev`);

--
-- A tábla indexei `bolt_adatai`
--
ALTER TABLE `bolt_adatai`
  ADD UNIQUE KEY `nev` (`nev`);

--
-- A tábla indexei `szamla`
--
ALTER TABLE `szamla`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vasarloID` (`vasarloID`),
  ADD KEY `reszletID` (`reszletID`),
  ADD KEY `bolt` (`bolt`);

--
-- A tábla indexei `szamla_reszlet`
--
ALTER TABLE `szamla_reszlet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `termekID` (`termekID`);

--
-- A tábla indexei `termekek`
--
ALTER TABLE `termekek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `vasarlok`
--
ALTER TABLE `vasarlok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `felhaszNev` (`felhaszNev`);

--
-- A tábla indexei `vendeg_vevo`
--
ALTER TABLE `vendeg_vevo`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `szamla`
--
ALTER TABLE `szamla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `szamla_reszlet`
--
ALTER TABLE `szamla_reszlet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `termekek`
--
ALTER TABLE `termekek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT a táblához `vasarlok`
--
ALTER TABLE `vasarlok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `vendeg_vevo`
--
ALTER TABLE `vendeg_vevo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `szamla`
--
ALTER TABLE `szamla`
  ADD CONSTRAINT `szamla_ibfk_1` FOREIGN KEY (`vasarloID`) REFERENCES `vasarlok` (`id`),
  ADD CONSTRAINT `szamla_ibfk_2` FOREIGN KEY (`vasarloID`) REFERENCES `vendeg_vevo` (`id`),
  ADD CONSTRAINT `szamla_ibfk_3` FOREIGN KEY (`reszletID`) REFERENCES `szamla_reszlet` (`id`),
  ADD CONSTRAINT `szamla_ibfk_4` FOREIGN KEY (`bolt`) REFERENCES `bolt_adatai` (`nev`),
  ADD CONSTRAINT `szamla_ibfk_5` FOREIGN KEY (`vasarloID`) REFERENCES `vendeg_vevo` (`id`);

--
-- Megkötések a táblához `szamla_reszlet`
--
ALTER TABLE `szamla_reszlet`
  ADD CONSTRAINT `szamla_reszlet_ibfk_1` FOREIGN KEY (`termekID`) REFERENCES `termekek` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
