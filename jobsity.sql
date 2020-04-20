-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2020 at 07:16 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobsity`
--

-- --------------------------------------------------------

--
-- Table structure for table `balance_histories`
--

CREATE TABLE `balance_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `balance_change` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_histories`
--

CREATE TABLE `chat_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender` bigint(20) NOT NULL DEFAULT 0,
  `reciever` bigint(20) NOT NULL DEFAULT 0,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `value`, `name`, `created_at`, `updated_at`) VALUES
(1, 'AFN', 'Afgaanse afgani', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(2, 'AFA', 'Afghan Afghani (1927–2002)', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(3, 'ALL', 'Albanese lek', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(4, 'ALK', 'Albanian Lek (1946–1965)', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(5, 'DZD', 'Algeriese dinar', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(6, 'USD', 'Amerikaanse dollar', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(7, 'ADP', 'Andorran Peseta', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(8, 'AOK', 'Angolan Kwanza (1977–1991)', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(9, 'AON', 'Angolan New Kwanza (1990–2000)', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(10, 'AOR', 'Angolan Readjusted Kwanza (1995–1999)', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(11, 'AOA', 'Angolese kwanza', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(12, 'ARA', 'Argentine Austral', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(13, 'ARM', 'Argentine Peso (1881–1970)', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(14, 'ARP', 'Argentine Peso (1983–1985)', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(15, 'ARL', 'Argentine Peso Ley (1970–1983)', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(16, 'ARS', 'Argentynse peso', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(17, 'AMD', 'Armeense dram', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(18, 'AWG', 'Arubaanse floryn', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(19, 'AUD', 'Australiese dollar', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(20, 'ATS', 'Austrian Schilling', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(21, 'AZM', 'Azerbaijani Manat (1993–2006)', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(22, 'AZN', 'Azerbeidjaanse manat', '2020-04-20 18:59:44', '2020-04-20 18:59:44'),
(23, 'BSD', 'Bahamiaanse dollar', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(24, 'BHD', 'Bahreinse dinar', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(25, 'BDT', 'Bangladesjiese taka', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(26, 'BBD', 'Barbados-dollar', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(27, 'BYB', 'Belarusian Ruble (1994–1999)', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(28, 'BEF', 'Belgian Franc', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(29, 'BEC', 'Belgian Franc (convertible)', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(30, 'BEL', 'Belgian Franc (financial)', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(31, 'BZD', 'Beliziese dollar', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(32, 'BYN', 'Belo-Russiese roebel', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(33, 'BYR', 'Belo-Russiese roebel (2000–2016)', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(34, 'BMD', 'Bermuda-dollar', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(35, 'BTN', 'Bhoetanese ngoeltroem', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(36, 'BOB', 'Boliviaanse boliviano', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(37, 'BOL', 'Bolivian Boliviano (1863–1963)', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(38, 'BOV', 'Bolivian Mvdol', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(39, 'BOP', 'Bolivian Peso', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(40, 'BAD', 'Bosnia-Herzegovina Dinar (1992–1994)', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(41, 'BAN', 'Bosnia-Herzegovina New Dinar (1994–1997)', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(42, 'BAM', 'Bosnies-Herzegowiniese omskakelbare marka', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(43, 'BWP', 'Botswana pula', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(44, 'BRL', 'Brasilliaanse reaal', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(45, 'BRC', 'Brazilian Cruzado (1986–1989)', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(46, 'BRZ', 'Brazilian Cruzeiro (1942–1967)', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(47, 'BRE', 'Brazilian Cruzeiro (1990–1993)', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(48, 'BRR', 'Brazilian Cruzeiro (1993–1994)', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(49, 'BRN', 'Brazilian New Cruzado (1989–1990)', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(50, 'BRB', 'Brazilian New Cruzeiro (1967–1986)', '2020-04-20 18:59:45', '2020-04-20 18:59:45'),
(51, 'GBP', 'Britse pond', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(52, 'BND', 'Broeneise dollar', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(53, 'BGN', 'Bulgaarse lev', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(54, 'BGL', 'Bulgarian Hard Lev', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(55, 'BGO', 'Bulgarian Lev (1879–1952)', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(56, 'BGM', 'Bulgarian Socialist Lev', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(57, 'BUK', 'Burmese Kyat', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(58, 'BIF', 'Burundiese frank', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(59, 'XOF', 'CFA frank BCEAO', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(60, 'XAF', 'CFA frank BEAC', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(61, 'XPF', 'CFP-frank', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(62, 'KYD', 'Cayman-eilande dollar', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(63, 'CLE', 'Chilean Escudo', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(64, 'CLF', 'Chilean Unit of Account (UF)', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(65, 'CLP', 'Chileense peso', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(66, 'CNX', 'Chinese People’s Bank Dollar', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(67, 'COP', 'Colombiaanse peso', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(68, 'COU', 'Colombian Real Value Unit', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(69, 'KMF', 'Comoraanse frank', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(70, 'CRC', 'Costa Ricaanse colón', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(71, 'HRD', 'Croatian Dinar', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(72, 'CYP', 'Cypriot Pound', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(73, 'CSK', 'Czechoslovak Hard Koruna', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(74, 'DKK', 'Deense kroon', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(75, 'DJF', 'Djiboeti frank', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(76, 'DOP', 'Dominikaanse peso', '2020-04-20 18:59:46', '2020-04-20 18:59:46'),
(77, 'NLG', 'Dutch Guilder', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(78, 'DDM', 'East German Mark', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(79, 'ECS', 'Ecuadorian Sucre', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(80, 'ECV', 'Ecuadorian Unit of Constant Value', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(81, 'EGP', 'Egiptiese pond', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(82, 'GQE', 'Equatorial Guinean Ekwele', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(83, 'ERN', 'Eritrese nakfa', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(84, 'EEK', 'Estonian Kroon', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(85, 'ETB', 'Etiopiese birr', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(86, 'EUR', 'Euro', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(87, 'XEU', 'European Currency Unit', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(88, 'FKP', 'Falkland-eilande pond', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(89, 'FJD', 'Fidjiaanse dollar', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(90, 'PHP', 'Filippynse peso', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(91, 'FIM', 'Finnish Markka', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(92, 'FRF', 'French Franc', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(93, 'XFO', 'French Gold Franc', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(94, 'XFU', 'French UIC-Franc', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(95, 'GMD', 'Gambiese dalasi', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(96, 'GEK', 'Georgian Kupon Larit', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(97, 'GEL', 'Georgiese lari', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(98, 'DEM', 'German Mark', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(99, 'GHS', 'Ghanese cedi', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(100, 'GHC', 'Ghanese cedi (1979–2007)', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(101, 'GIP', 'Gibraltarese pond', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(102, 'GRD', 'Greek Drachma', '2020-04-20 18:59:47', '2020-04-20 18:59:47'),
(103, 'GTQ', 'Guatemalaanse quetzal', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(104, 'GWP', 'Guinea-Bissau Peso', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(105, 'GNF', 'Guinese frank', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(106, 'GNS', 'Guinese syli', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(107, 'GYD', 'Guyanese dollar', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(108, 'HTG', 'Haïtiaanse gourde', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(109, 'HNL', 'Hondurese lempira', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(110, 'HKD', 'Hong Kong dollar', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(111, 'HUF', 'Hongaarse florint', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(112, 'ISJ', 'Icelandic Króna (1918–1981)', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(113, 'INR', 'Indiese roepee', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(114, 'IDR', 'Indonesiese roepia', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(115, 'IQD', 'Irakse dinar', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(116, 'IRR', 'Iranse rial', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(117, 'IEP', 'Irish Pound', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(118, 'ILP', 'Israeli Pound', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(119, 'ILR', 'Israeli Shekel (1980–1985)', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(120, 'ILS', 'Israeliese nuwe sikkel', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(121, 'ITL', 'Italiaanse lier', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(122, 'JMD', 'Jamaikaanse dollar', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(123, 'JPY', 'Japannese jen', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(124, 'YER', 'Jemenitiese rial', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(125, 'JOD', 'Jordaniese dinar', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(126, 'CVE', 'Kaap Verdiese escudo', '2020-04-20 18:59:48', '2020-04-20 18:59:48'),
(127, 'KHR', 'Kambodjaanse riel', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(128, 'CAD', 'Kanadese dollar', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(129, 'QAR', 'Katarrese rial', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(130, 'KZT', 'Kazakse tenge', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(131, 'KES', 'Keniaanse sjieling', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(132, 'KGS', 'Kirgisiese som', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(133, 'KWD', 'Koeweitse dinar', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(134, 'CDF', 'Kongolese frank', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(135, 'HRK', 'Kroatiese kuna', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(136, 'CUC', 'Kubaanse omskakelbare peso', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(137, 'CUP', 'Kubaanse peso', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(138, 'LAK', 'Laosiaanse kip', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(139, 'LVR', 'Latvian Ruble', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(140, 'LBP', 'Lebanese pond', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(141, 'LSL', 'Lesotho loti', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(142, 'LVL', 'Lettiese lats', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(143, 'LRD', 'Liberiese dollar', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(144, 'LYD', 'Libiese dinar', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(145, 'LTL', 'Litause litas', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(146, 'LTT', 'Lithuanian Talonas', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(147, 'LUL', 'Luxembourg Financial Franc', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(148, 'LUC', 'Luxembourgian Convertible Franc', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(149, 'LUF', 'Luxembourgian Franc', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(150, 'MOP', 'Macaose pataca', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(151, 'MKN', 'Macedonian Denar (1992–1993)', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(152, 'MKD', 'Macedoniese denar', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(153, 'MGF', 'Malagasy Franc', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(154, 'MWK', 'Malawiese kwacha', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(155, 'MVP', 'Maldivian Rupee (1947–1981)', '2020-04-20 18:59:49', '2020-04-20 18:59:49'),
(156, 'MVR', 'Malediviese rufia', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(157, 'MYR', 'Maleisiese ringgit', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(158, 'MGA', 'Malgassiese ariary', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(159, 'MLF', 'Malian Franc', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(160, 'MTL', 'Maltese Lira', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(161, 'MTP', 'Maltese Pound', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(162, 'MAD', 'Marokkaanse dirham', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(163, 'MRO', 'Mauritaniese ouguiya', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(164, 'MUR', 'Mauritiaanse rupee', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(165, 'MXN', 'Meksikaanse peso', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(166, 'MXV', 'Mexican Investment Unit', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(167, 'MXP', 'Mexican Silver Peso (1861–1992)', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(168, 'MMK', 'Mianmese kyat', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(169, 'MDC', 'Moldovan Cupon', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(170, 'MDL', 'Moldowiese leu', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(171, 'MCF', 'Monegasque Franc', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(172, 'MNT', 'Mongoolse toegrik', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(173, 'MAF', 'Moroccan Franc', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(174, 'MZN', 'Mosambiekse metical', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(175, 'MZM', 'Mosambiekse metical (1980–2006)', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(176, 'MZE', 'Mozambican Escudo', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(177, 'NAD', 'Namibiese dollar', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(178, 'ANG', 'Nederlands-Antilliaanse gulde', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(179, 'NPR', 'Nepalese roepee', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(180, 'NIO', 'Nicaraguaanse córdoba', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(181, 'NIC', 'Nicaraguan Córdoba (1988–1991)', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(182, 'NZD', 'Nieu-Seeland dollar', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(183, 'NGN', 'Nigeriese naira', '2020-04-20 18:59:50', '2020-04-20 18:59:50'),
(184, 'KPW', 'Noord-Koreaanse won', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(185, 'NOK', 'Noorse kroon', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(186, 'TWD', 'Nuwe Taiwanese dollar', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(187, 'UAH', 'Oekraïnse hriwna', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(188, 'UZS', 'Oezbekiese som', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(189, 'OMR', 'Omaanse rial', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(190, 'XCD', 'Oos-Karibbiese dollar', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(191, 'PKR', 'Pakistanse roepee', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(192, 'PAB', 'Panamese balboa', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(193, 'PGK', 'Papoea-Nieu-Guinese kina', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(194, 'PYG', 'Paraguaanse guarani', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(195, 'PEN', 'Peruaanse sol', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(196, 'PEI', 'Peruvian Inti', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(197, 'PES', 'Peruvian Sol (1863–1965)', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(198, 'PLZ', 'Polish Zloty (1950–1995)', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(199, 'PLN', 'Poolse zloty', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(200, 'PTE', 'Portuguese Escudo', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(201, 'GWE', 'Portuguese Guinea Escudo', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(202, 'XRE', 'RINET Funds', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(203, 'RHD', 'Rhodesian Dollar', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(204, 'RON', 'Roemeense leu', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(205, 'ROL', 'Romanian Leu (1952–2006)', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(206, 'RUR', 'Russian Ruble (1991–1998)', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(207, 'RUB', 'Russiese roebel', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(208, 'RWF', 'Rwandiese frank', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(209, 'SBD', 'Salomonseilande dollar', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(210, 'SVC', 'Salvadoran Colón', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(211, 'WST', 'Samoaanse tala', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(212, 'SAR', 'Saoedi-Arabiese riyal', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(213, 'CSD', 'Serbian Dinar (2002–2006)', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(214, 'RSD', 'Serbiese dinar', '2020-04-20 18:59:51', '2020-04-20 18:59:51'),
(215, 'SCR', 'Seychellese rupee', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(216, 'SLL', 'Sierra Leoniese leone', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(217, 'SGD', 'Singapoer dollar', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(218, 'SHP', 'Sint Helena pond', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(219, 'SYP', 'Siriese pond', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(220, 'CNY', 'Sjinese joean renminbi', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(221, 'SKK', 'Slovak Koruna', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(222, 'SIT', 'Slovenian Tolar', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(223, 'SDG', 'Soedannese pond', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(224, 'SDP', 'Soedannese pond (1957–1998)', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(225, 'SOS', 'Somaliese sjieling', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(226, 'ZAL', 'South African Rand (financial)', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(227, 'KRH', 'South Korean Hwan (1953–1962)', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(228, 'KRO', 'South Korean Won (1945–1953)', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(229, 'SUR', 'Soviet Rouble', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(230, 'ESP', 'Spanish Peseta', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(231, 'ESA', 'Spanish Peseta (A account)', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(232, 'ESB', 'Spanish Peseta (convertible account)', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(233, 'LKR', 'Sri Lankaanse roepee', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(234, 'SDD', 'Sudanese Dinar (1992–2007)', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(235, 'ZAR', 'Suid-Afrikaanse rand', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(236, 'KRW', 'Suid-Koreaanse won', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(237, 'SSP', 'Suid-Soedanese pond', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(238, 'SRD', 'Surinaamse dollar', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(239, 'SRG', 'Surinamese Guilder', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(240, 'SZL', 'Swazilandse lilangeni', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(241, 'SEK', 'Sweedse kroon', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(242, 'CHF', 'Switserse frank', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(243, 'STD', 'São Tomé en Príncipe dobra', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(244, 'TJS', 'Tadjikse roebel', '2020-04-20 18:59:52', '2020-04-20 18:59:52'),
(245, 'TJR', 'Tajikistani Ruble', '2020-04-20 18:59:53', '2020-04-20 18:59:53'),
(246, 'TZS', 'Tanzaniese sjieling', '2020-04-20 18:59:53', '2020-04-20 18:59:53'),
(247, 'THB', 'Thaise baht', '2020-04-20 18:59:53', '2020-04-20 18:59:53'),
(248, 'TPE', 'Timorese Escudo', '2020-04-20 18:59:53', '2020-04-20 18:59:53'),
(249, 'TOP', 'Tongaanse pa’anga', '2020-04-20 18:59:53', '2020-04-20 18:59:53'),
(250, 'TTD', 'Trinidad en Tobago dollar', '2020-04-20 18:59:53', '2020-04-20 18:59:53'),
(251, 'CZK', 'Tsjeggiese kroon', '2020-04-20 18:59:53', '2020-04-20 18:59:53'),
(252, 'TND', 'Tunisiese dinar', '2020-04-20 18:59:53', '2020-04-20 18:59:53'),
(253, 'TMT', 'Turkmeense manat', '2020-04-20 18:59:53', '2020-04-20 18:59:53'),
(254, 'TMM', 'Turkmenistani Manat (1993–2009)', '2020-04-20 18:59:53', '2020-04-20 18:59:53'),
(255, 'TRY', 'Turkse lier', '2020-04-20 18:59:53', '2020-04-20 18:59:53'),
(256, 'TRL', 'Turkse lier (1922–2005)', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(257, 'USN', 'US Dollar (Next day)', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(258, 'USS', 'US Dollar (Same day)', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(259, 'UGS', 'Ugandan Shilling (1966–1987)', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(260, 'UGX', 'Ugandese sjieling', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(261, 'UAK', 'Ukrainian Karbovanets', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(262, 'UYU', 'Uruguaanse peso', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(263, 'UYP', 'Uruguayan Peso (1975–1993)', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(264, 'UYI', 'Uruguayan Peso (Indexed Units)', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(265, 'VUV', 'Vanuatuse vatu', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(266, 'VEF', 'Venezolaanse bolivar', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(267, 'VEB', 'Venezuelan Bolívar (1871–2008)', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(268, 'AED', 'Verenigde Arabiese Emirate dirham', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(269, 'VNN', 'Vietnamese Dong (1978–1985)', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(270, 'VND', 'Viëtnamese dong', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(271, 'CHE', 'WIR Euro', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(272, 'CHW', 'WIR Franc', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(273, 'YDD', 'Yemeni Dinar', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(274, 'ISK', 'Yslandse kroon', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(275, 'YUN', 'Yugoslavian Convertible Dinar (1990–1992)', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(276, 'YUD', 'Yugoslavian Hard Dinar (1966–1990)', '2020-04-20 18:59:54', '2020-04-20 18:59:54'),
(277, 'YUM', 'Yugoslavian New Dinar (1994–2002)', '2020-04-20 18:59:55', '2020-04-20 18:59:55'),
(278, 'YUR', 'Yugoslavian Reformed Dinar (1992–1993)', '2020-04-20 18:59:55', '2020-04-20 18:59:55'),
(279, 'ZRN', 'Zairean New Zaire (1993–1998)', '2020-04-20 18:59:55', '2020-04-20 18:59:55'),
(280, 'ZRZ', 'Zairean Zaire (1971–1993)', '2020-04-20 18:59:55', '2020-04-20 18:59:55'),
(281, 'ZMW', 'Zambiese kwacha', '2020-04-20 18:59:55', '2020-04-20 18:59:55'),
(282, 'ZMK', 'Zambiese kwacha (1968–2012)', '2020-04-20 18:59:55', '2020-04-20 18:59:55'),
(283, 'ZWR', 'Zimbabwean Dollar (2008)', '2020-04-20 18:59:55', '2020-04-20 18:59:55'),
(284, 'ZWL', 'Zimbabwean Dollar (2009)', '2020-04-20 18:59:55', '2020-04-20 18:59:55'),
(285, 'ZWD', 'Zimbabwiese dollar', '2020-04-20 18:59:55', '2020-04-20 18:59:55');

-- --------------------------------------------------------

--
-- Table structure for table `currency_api_keys`
--

CREATE TABLE `currency_api_keys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency_api_keys`
--

INSERT INTO `currency_api_keys` (`id`, `website`, `api_key`, `created_at`, `updated_at`) VALUES
(1, 'fixer.io', '8ae7671a42590a94bd92491d90c138e2', '2020-04-20 20:40:48', '2020-04-20 20:40:48'),
(2, 'amdoren.com', 'Aq9g5mCabHziDdjEyMRciGdtq5qNpf', '2020-04-20 20:40:48', '2020-04-20 20:40:48');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2020_04_18_035838_create_balance_histories_table', 1),
(3, '2020_04_18_181436_create_currencies_table', 1),
(4, '2020_04_19_192306_create_chat_histories_table', 1),
(5, '2020_04_20_163244_create_currency_api_keys_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` double(100,3) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `default_currency`, `balance`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ignacio Pinto', 'ignacio.pinto.e@gmail.com', 'CLP', 150000.000, NULL, '$2y$10$AOGCRVgATC4zete/.cc9.OAMB9KRFMH1RRIkdDs7EEa2kCjrj8IY2', NULL, '2020-04-20 18:59:44', '2020-04-20 20:48:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balance_histories`
--
ALTER TABLE `balance_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `balance_histories_users_id_foreign` (`users_id`);

--
-- Indexes for table `chat_histories`
--
ALTER TABLE `chat_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_api_keys`
--
ALTER TABLE `currency_api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `balance_histories`
--
ALTER TABLE `balance_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_histories`
--
ALTER TABLE `chat_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;

--
-- AUTO_INCREMENT for table `currency_api_keys`
--
ALTER TABLE `currency_api_keys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `balance_histories`
--
ALTER TABLE `balance_histories`
  ADD CONSTRAINT `balance_histories_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
