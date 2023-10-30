-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2023 a las 04:37:06
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add area', 6, 'add_area'),
(22, 'Can change area', 6, 'change_area'),
(23, 'Can delete area', 6, 'delete_area'),
(24, 'Can view area', 6, 'view_area'),
(25, 'Can add user', 7, 'add_usuario'),
(26, 'Can change user', 7, 'change_usuario'),
(27, 'Can delete user', 7, 'delete_usuario'),
(28, 'Can view user', 7, 'view_usuario'),
(29, 'Can add cliente', 8, 'add_cliente'),
(30, 'Can change cliente', 8, 'change_cliente'),
(31, 'Can delete cliente', 8, 'delete_cliente'),
(32, 'Can view cliente', 8, 'view_cliente'),
(33, 'Can add compra', 9, 'add_compra'),
(34, 'Can change compra', 9, 'change_compra'),
(35, 'Can delete compra', 9, 'delete_compra'),
(36, 'Can view compra', 9, 'view_compra'),
(37, 'Can add empleado', 10, 'add_empleado'),
(38, 'Can change empleado', 10, 'change_empleado'),
(39, 'Can delete empleado', 10, 'delete_empleado'),
(40, 'Can view empleado', 10, 'view_empleado'),
(41, 'Can add ingresos', 11, 'add_ingresos'),
(42, 'Can change ingresos', 11, 'change_ingresos'),
(43, 'Can delete ingresos', 11, 'delete_ingresos'),
(44, 'Can view ingresos', 11, 'view_ingresos'),
(45, 'Can add materiaprima', 12, 'add_materiaprima'),
(46, 'Can change materiaprima', 12, 'change_materiaprima'),
(47, 'Can delete materiaprima', 12, 'delete_materiaprima'),
(48, 'Can view materiaprima', 12, 'view_materiaprima'),
(49, 'Can add producto', 13, 'add_producto'),
(50, 'Can change producto', 13, 'change_producto'),
(51, 'Can delete producto', 13, 'delete_producto'),
(52, 'Can view producto', 13, 'view_producto'),
(53, 'Can add proveedor', 14, 'add_proveedor'),
(54, 'Can change proveedor', 14, 'change_proveedor'),
(55, 'Can delete proveedor', 14, 'delete_proveedor'),
(56, 'Can view proveedor', 14, 'view_proveedor'),
(57, 'Can add registra', 15, 'add_registra'),
(58, 'Can change registra', 15, 'change_registra'),
(59, 'Can delete registra', 15, 'delete_registra'),
(60, 'Can view registra', 15, 'view_registra'),
(61, 'Can add proveen', 16, 'add_proveen'),
(62, 'Can change proveen', 16, 'change_proveen'),
(63, 'Can delete proveen', 16, 'delete_proveen'),
(64, 'Can view proveen', 16, 'view_proveen'),
(65, 'Can add producen', 17, 'add_producen'),
(66, 'Can change producen', 17, 'change_producen'),
(67, 'Can delete producen', 17, 'delete_producen'),
(68, 'Can view producen', 17, 'view_producen'),
(69, 'Can add pedido', 18, 'add_pedido'),
(70, 'Can change pedido', 18, 'change_pedido'),
(71, 'Can delete pedido', 18, 'delete_pedido'),
(72, 'Can view pedido', 18, 'view_pedido'),
(73, 'Can add lineadetalle', 19, 'add_lineadetalle'),
(74, 'Can change lineadetalle', 19, 'change_lineadetalle'),
(75, 'Can delete lineadetalle', 19, 'delete_lineadetalle'),
(76, 'Can view lineadetalle', 19, 'view_lineadetalle'),
(77, 'Can add ingresan', 20, 'add_ingresan'),
(78, 'Can change ingresan', 20, 'change_ingresan'),
(79, 'Can delete ingresan', 20, 'delete_ingresan'),
(80, 'Can view ingresan', 20, 'view_ingresan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombres` varchar(80) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `fec_nac` date DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `celular_alt` int(11) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombres`, `apellido`, `dni`, `fec_nac`, `celular`, `celular_alt`, `email`, `direccion`, `fecha_creacion`, `fecha_modificacion`, `estado`) VALUES
(1, 'Florina', 'Sureda', 74672980, '1991-05-20', 684269662, 699809413, 'iglesiasabilio@example.net', 'Acceso Obdulia Rosselló 33\nSalamanca, 40223', '2022-07-15', '2021-02-19', 'True'),
(2, 'Itziar', 'Martinez', 73143571, '1985-02-21', 687663985, 606776953, 'benigna05@example.org', 'Urbanización Patricio Tejedor 28\nCeuta, 32148', '2022-07-01', '2022-06-25', 'True'),
(3, 'Prudencia', 'Zabaleta', 13021872, '1982-10-12', 668285807, 683355028, 'ursula69@example.org', 'Cañada de Adalberto Barba 2\nCuenca, 36591', '2020-06-03', '2021-07-01', 'True'),
(4, 'Alexandra', 'Espejo', 47357073, '1996-01-23', 619624114, 645927884, 'fcoll@example.org', 'Camino Pascual Perera 8 Apt. 42 \nÁlava, 49345', '2020-07-26', '2023-08-11', 'True'),
(5, 'Alejo', 'Talavera', 47894300, '1964-07-30', 644952023, 644570985, 'rosendo11@example.org', 'Ronda Perla Agustín 80 Puerta 5 \nValencia, 13045', '2022-10-22', '2020-05-06', 'True'),
(6, 'Azahara', 'Solsona', 17683198, '1961-12-29', 628520817, 678785778, 'eliana41@example.net', 'C. Dora Pagès 61 Apt. 28 \nNavarra, 02160', '2020-01-30', '2021-12-08', 'True'),
(7, 'Manu', 'Gras', 53788229, '1966-11-18', 617751783, 621205614, 'marita87@example.org', 'Paseo Jimena Landa 66\nCuenca, 12092', '2022-01-29', '2020-12-28', 'True'),
(8, 'Lucio', 'Falcó', 83352397, '1989-07-04', 644154470, 666095488, 'cuencamilagros@example.com', 'Pasadizo Tania Mata 55 Puerta 7 \nSanta Cruz de Tenerife, 33847', '2020-08-09', '2023-01-15', 'True'),
(9, 'Araceli', 'Vilalta', 80378247, '1991-06-04', 660127245, 601243362, 'walteralvarez@example.com', 'Callejón de Adora Reyes 27\nCastellón, 52094', '2021-06-30', '2022-12-15', 'True'),
(10, 'Narcisa', 'Alegre', 52906570, '2004-05-27', 620159617, 612787369, 'ulillo@example.org', 'Avenida de Josué Zurita 90\nCádiz, 31151', '2021-11-19', '2020-11-07', 'True'),
(11, 'Raimundo', 'Ayllón', 40624697, '2004-09-20', 638720998, 646496470, 'gema77@example.org', 'Alameda de Evangelina Jordán 3 Puerta 8 \nPalencia, 41784', '2020-12-18', '2022-07-24', 'True'),
(12, 'Consuela', 'Izquierdo', 58185940, '1987-03-29', 689105043, 600208243, 'qgimenez@example.com', 'Via de Norberto Ortega 20\nAsturias, 33715', '2023-02-26', '2022-04-18', 'True'),
(13, 'Graciano', 'Segarra', 17963443, '1994-03-19', 661345053, 678904584, 'edgar54@example.org', 'Urbanización de Soledad Aramburu 33 Puerta 5 \nCiudad, 45712', '2023-10-08', '2023-04-04', 'True'),
(14, 'Amaya', 'Sola', 33841678, '1964-11-26', 650680501, 698684997, 'gamezsalud@example.com', 'Cuesta Fortunata Llorente 76 Piso 7 \nTeruel, 47941', '2021-12-24', '2022-07-18', 'True'),
(15, 'Leoncio', 'Pedrosa', 27490802, '1986-07-23', 664928006, 610075826, 'ramiscirino@example.org', 'Plaza Raimundo Salas 32\nLa Rioja, 10803', '2020-04-11', '2022-06-28', 'True'),
(16, 'Mateo', 'Seco', 50495319, '1959-07-17', 657846090, 683457753, 'llabresdionisia@example.net', 'Vial de Margarita Casal 77\nTeruel, 42698', '2022-11-12', '2022-09-16', 'True'),
(17, 'Telmo', 'Amador', 52891513, '1963-02-27', 619721578, 692007629, 'marcocarballo@example.com', 'Callejón de Zoraida Salgado 4 Puerta 4 \nMálaga, 18460', '2022-09-09', '2022-09-28', 'True'),
(18, 'Federico', 'Cózar', 84558114, '1968-07-16', 626145627, 662844207, 'tcuenca@example.net', 'Rambla Bernardino Rosa 41 Apt. 07 \nÁlava, 20879', '2023-02-22', '2023-05-13', 'True'),
(19, 'Pelayo', 'Pastor', 40533376, '1997-06-11', 621599391, 656887447, 'adoracionperal@example.com', 'Calle de Patricia Ferrándiz 23 Puerta 6 \nVizcaya, 29342', '2020-11-03', '2023-10-14', 'True'),
(20, 'Aníbal', 'Nogueira', 46044811, '1960-08-15', 680095325, 662531413, 'lucas51@example.org', 'Plaza de Baudelio Roca 33\nHuelva, 43724', '2021-12-12', '2023-03-29', 'True'),
(21, 'Cándido', 'Benavent', 22850995, '1998-03-19', 622653843, 607383595, 'delfina90@example.com', 'Camino Celso Luján 2 Apt. 78 \nBurgos, 07128', '2023-06-30', '2021-08-03', 'True'),
(22, 'Rosenda', 'Alcalde', 57212065, '1965-01-14', 614428167, 640480743, 'gomezjose-luis@example.net', 'Rambla de Amado Bustos 181 Puerta 4 \nGranada, 05729', '2022-06-09', '2021-10-02', 'True'),
(23, 'Teodoro', 'Tur', 34478192, '1993-01-03', 690612768, 635174383, 'castilloadora@example.org', 'Acceso Vinicio Solera 19 Apt. 01 \nGirona, 49138', '2022-07-29', '2022-06-06', 'True'),
(24, 'Fausto', 'Llabrés', 23096290, '1970-06-29', 696166752, 604762815, 'bmur@example.net', 'Cañada Benita Alcolea 44\nOurense, 04293', '2022-08-02', '2022-03-02', 'True'),
(25, 'Mirta', 'Jerez', 40034410, '1979-11-29', 639768926, 658264888, 'felixgomez@example.com', 'Cañada de Melania Ochoa 46\nCádiz, 25868', '2023-08-19', '2021-12-29', 'True'),
(26, 'Chelo', 'Sanabria', 99032370, '2001-09-29', 645129946, 679987811, 'manuacuna@example.com', 'Ronda Mateo Salazar 38\nGirona, 29960', '2023-10-26', '2021-08-07', 'True'),
(27, 'Baldomero', 'Hidalgo', 63463154, '1989-02-17', 646928574, 691047413, 'salvador97@example.net', 'Via de Clementina Bermúdez 94 Apt. 68 \nÁlava, 31997', '2020-01-24', '2023-03-30', 'True'),
(28, 'Natalia', 'Gomez', 15615150, '1980-05-26', 659220881, 650373776, 'baqueroisaac@example.org', 'Camino Verónica Oliver 42 Apt. 89 \nMurcia, 46496', '2020-02-14', '2020-07-19', 'True'),
(29, 'Prudencia', 'Rosell', 27017067, '1987-04-14', 654340561, 624652919, 'cabreroflora@example.org', 'Via de Leire Iglesias 70 Piso 7 \nBarcelona, 43201', '2020-12-15', '2020-04-09', 'True'),
(30, 'Xiomara', 'Benito', 61622572, '1987-05-05', 615746853, 652633478, 'bautistamartin@example.com', 'Vial de Joan Iñiguez 97 Apt. 82 \nMadrid, 08190', '2021-07-12', '2021-10-16', 'True'),
(31, 'Paz', 'Bas', 86209997, '1996-05-08', 651389909, 627997422, 'fioldomitila@example.com', 'Plaza Mireia Bayón 826\nMelilla, 36814', '2023-02-26', '2023-09-24', 'True'),
(32, 'Valero', 'Mosquera', 99020954, '2005-10-05', 620299001, 695508245, 'portajose@example.org', 'Pasadizo Haydée Uriarte 755 Piso 5 \nLas Palmas, 50340', '2023-04-25', '2021-10-15', 'True'),
(33, 'Natalio', 'Segarra', 42762689, '2004-01-07', 694506037, 649585178, 'veraespana@example.com', 'Urbanización Dan Amaya 23 Puerta 6 \nMadrid, 19780', '2022-02-04', '2021-12-30', 'True'),
(34, 'Eutimio', 'Vilar', 88437089, '1988-08-21', 624680276, 695373445, 'nereidarubio@example.net', 'Calle de Josep Noguera 36 Piso 9 \nPontevedra, 09241', '2020-03-02', '2023-06-23', 'True'),
(35, 'Zaira', 'Guillen', 56697338, '1970-07-29', 654472976, 682315541, 'sanzainoa@example.com', 'Vial Luis Villalobos 57\nSalamanca, 30931', '2022-10-04', '2021-01-12', 'True'),
(36, 'Consuela', 'Molins', 43726049, '2000-08-15', 674174621, 651263846, 'che91@example.com', 'Acceso de Alba Arjona 12\nJaén, 29145', '2023-05-03', '2023-10-02', 'True'),
(37, 'Luís', 'Blasco', 58109623, '2002-07-25', 603854647, 643906538, 'aavila@example.net', 'Glorieta Hortensia Carreras 7\nNavarra, 21786', '2020-08-22', '2020-06-09', 'True'),
(38, 'Valentina', 'Jara', 51915146, '1977-08-10', 628543100, 662495543, 'xsanjuan@example.net', 'Pasadizo Manola Guzman 60\nGirona, 42839', '2020-09-03', '2022-06-07', 'True'),
(39, 'Guillermo', 'Rivera', 58789429, '1959-01-05', 610535460, 673564053, 'arjonajuanito@example.net', 'Urbanización de Román Río 398\nJaén, 18651', '2023-06-18', '2022-11-28', 'True'),
(40, 'Maricela', 'Sureda', 31912402, '1976-03-08', 682133052, 607298475, 'esmeralda22@example.org', 'C. de Yaiza Alba 248 Puerta 7 \nMurcia, 39711', '2021-08-24', '2023-09-24', 'True'),
(41, 'Luis Miguel', 'Solera', 81810789, '1992-05-06', 683107669, 691116221, 'cfajardo@example.net', 'Camino Jose Cámara 56 Piso 0 \nTarragona, 27246', '2023-07-02', '2022-01-16', 'True'),
(42, 'Toribio', 'Pineda', 14353481, '1994-07-23', 603146288, 688882426, 'diazclementina@example.org', 'Cañada de Lucas Vázquez 94 Puerta 4 \nÁvila, 10179', '2021-11-07', '2023-10-14', 'True'),
(43, 'Úrsula', 'Puente', 89339610, '1980-08-14', 686194240, 668885753, 'violeta55@example.org', 'Via de Cristina Mascaró 63\nMelilla, 36188', '2021-03-15', '2022-07-31', 'True'),
(44, 'Guadalupe', 'Acedo', 65327898, '1996-12-02', 640260974, 681685492, 'wvillanueva@example.com', 'Camino Jonatan Salgado 1\nSevilla, 30961', '2022-01-23', '2022-04-30', 'True'),
(45, 'Marc', 'Salazar', 36797398, '1980-04-14', 613218386, 690392259, 'jose-miguel92@example.org', 'Camino de Silvia Jover 6 Piso 0 \nMelilla, 42738', '2023-04-02', '2022-09-25', 'True'),
(46, 'Clementina', 'Herrera', 66434504, '1969-11-26', 620598436, 658935415, 'alvaradocamila@example.org', 'Alameda Juan José Lloret 83\nAsturias, 09459', '2021-09-06', '2023-05-13', 'True'),
(47, 'Nayara', 'Hoz', 25186363, '1960-03-05', 634292800, 633852904, 'vmalo@example.org', 'Alameda de Eloy Cobo 73\nSanta Cruz de Tenerife, 30796', '2021-04-30', '2020-01-15', 'True'),
(48, 'Severino', 'Moliner', 26019938, '1977-02-16', 625131738, 662938061, 'adan97@example.com', 'Pasadizo de Aurora Llorente 1\nCórdoba, 42544', '2022-01-15', '2023-03-08', 'True'),
(49, 'Amor', 'Bonet', 58496141, '2003-02-07', 695266232, 679503747, 'rodrigomercedes@example.net', 'Via de Ileana Criado 22 Apt. 67 \nMurcia, 14712', '2022-01-11', '2020-09-28', 'True'),
(50, 'Manu', 'Villalba', 88402268, '1966-12-27', 616154374, 626158937, 'torrecillahilario@example.com', 'Alameda Alba Zamorano 2 Apt. 73 \nOurense, 18488', '2020-07-20', '2020-04-27', 'True'),
(51, 'Hugo', 'Borrás', 54735371, '2001-03-20', 649163521, 678833871, 'xtorre@example.com', 'Plaza Nazaret Jover 12 Puerta 2 \nBurgos, 23372', '2022-01-01', '2022-12-01', 'True'),
(52, 'Remigio', 'Pozuelo', 19974622, '1999-09-22', 649339552, 637092283, 'itziarmoran@example.net', 'Paseo de Dani Barrera 72\nBadajoz, 12219', '2021-07-23', '2020-01-05', 'True'),
(53, 'Felix', 'Real', 58424478, '1990-09-09', 622846940, 679043571, 'irma30@example.org', 'C. Manu Avilés 8 Apt. 35 \nBurgos, 09730', '2022-09-25', '2023-04-30', 'True'),
(54, 'Dafne', 'Armas', 35763722, '1969-06-07', 649920514, 614953568, 'bolanosvisitacion@example.net', 'Vial de Américo Pagès 51\nCastellón, 27345', '2021-03-15', '2021-06-24', 'True'),
(55, 'Paulino', 'Vilaplana', 42109129, '1980-07-15', 698427404, 632603326, 'angelitavalbuena@example.com', 'Pasaje de Adoración Rosell 7\nZaragoza, 11065', '2023-02-27', '2021-12-26', 'True'),
(56, 'Rosa', 'Leiva', 76016653, '1985-12-10', 682867274, 606968888, 'victoria62@example.org', 'Rambla de Berto Dalmau 42 Apt. 46 \nVizcaya, 33090', '2021-08-04', '2022-04-26', 'True'),
(57, 'Marianela', 'Crespo', 81785811, '1992-05-12', 638338089, 623488959, 'mollyesica@example.net', 'Pasaje de Adalberto Gámez 74\nCiudad, 13405', '2021-01-28', '2022-08-29', 'True'),
(58, 'Cintia', 'Alarcón', 32480194, '1958-05-22', 656585715, 637695745, 'teofila57@example.org', 'Urbanización de Florentina Porta 887\nAsturias, 13293', '2022-07-27', '2020-05-07', 'True'),
(59, 'Flavia', 'Sabater', 22426854, '1994-10-06', 662790784, 607543925, 'zvives@example.org', 'Cuesta Samanta Oller 45 Piso 4 \nCuenca, 27282', '2021-01-11', '2020-10-31', 'True'),
(60, 'Esmeralda', 'Ayuso', 11779558, '1978-01-20', 672113458, 692707697, 'bolanosleandra@example.org', 'Rambla de Fabricio Llorente 75\nSegovia, 01974', '2020-01-20', '2020-08-16', 'True'),
(61, 'Dan', 'Burgos', 93929756, '2004-03-04', 667617190, 655318958, 'octavio58@example.net', 'Callejón de Adelina Moles 626 Apt. 66 \nLeón, 06033', '2023-05-03', '2022-01-30', 'True'),
(62, 'Olga', 'Bravo', 30056477, '1965-07-19', 605240510, 677087123, 'aureliacamino@example.com', 'Via Esther Salvador 8\nLas Palmas, 15737', '2020-09-01', '2021-04-06', 'True'),
(63, 'Edgardo', 'Miranda', 56430324, '1984-01-13', 617084611, 659559873, 'dominguezmelania@example.com', 'Camino de Édgar Infante 222\nMelilla, 18889', '2020-05-12', '2021-12-07', 'True'),
(64, 'Carmen', 'Prado', 71725146, '1977-06-11', 605131329, 647107722, 'paulina98@example.net', 'Paseo de Fabiola Agustín 80 Puerta 4 \nSalamanca, 36230', '2023-09-20', '2023-09-24', 'True'),
(65, 'Amador', 'Chacón', 97732629, '1976-06-22', 621722356, 672557551, 'tecla43@example.org', 'Callejón Jose Francisco Toro 96 Piso 7 \nSoria, 34610', '2023-08-22', '2022-06-08', 'True'),
(66, 'Maximiliano', 'Campos', 54964145, '1966-10-29', 683243871, 644914501, 'eramon@example.net', 'Ronda de Camilo Gisbert 953 Piso 4 \nAlmería, 15826', '2020-01-18', '2021-08-16', 'True'),
(67, 'Yolanda', 'Tena', 51057888, '1963-11-15', 615127871, 648363788, 'tblasco@example.org', 'Ronda de José Calleja 54\nLas Palmas, 31737', '2020-01-06', '2023-05-18', 'True'),
(68, 'Rufino', 'Ramirez', 28336179, '1987-10-05', 612305877, 695593738, 'alcaldeesmeralda@example.com', 'Alameda Clímaco Morcillo 19\nMurcia, 24785', '2022-02-24', '2020-08-31', 'True'),
(69, 'Basilio', 'Solera', 90856197, '2002-03-19', 633016217, 693352611, 'sgutierrez@example.com', 'Cañada de Ambrosio Barón 59 Piso 6 \nToledo, 49406', '2023-02-06', '2023-04-23', 'True'),
(70, 'Guiomar', 'Quintanilla', 59896353, '1959-03-26', 689070591, 609255533, 'lteruel@example.org', 'Ronda Leire Mascaró 36\nAsturias, 49931', '2021-02-03', '2021-07-20', 'True'),
(71, 'Isabel', 'Pedrero', 58139515, '1960-05-22', 697372111, 647901083, 'jordan33@example.org', 'Calle Marisol Bas 97\nLeón, 07672', '2020-01-07', '2022-11-24', 'True'),
(72, 'Eusebia', 'Fabregat', 76721202, '1967-01-06', 660466518, 690325050, 'guadalupe74@example.com', 'Cañada Miriam Nuñez 5 Apt. 07 \nVizcaya, 20585', '2020-12-14', '2022-08-02', 'True'),
(73, 'Andrés', 'Muro', 72325833, '1962-06-27', 653329719, 622079484, 'rouragregorio@example.net', 'Cañada de Ángeles Núñez 1\nCuenca, 48598', '2022-10-13', '2021-05-22', 'True'),
(74, 'Matías', 'Vega', 53316424, '2004-01-06', 696808433, 646936878, 'carlos00@example.net', 'C. Imelda Carrillo 347\nAlmería, 51224', '2021-10-19', '2023-02-08', 'True'),
(75, 'Benita', 'Valbuena', 91205188, '1965-03-06', 655206777, 680981309, 'bledesma@example.org', 'Alameda María Canals 24\nLugo, 39455', '2020-01-06', '2023-05-05', 'True'),
(76, 'Paz', 'Gonzalo', 78305032, '1966-04-14', 615934793, 612325975, 'urio@example.org', 'Callejón Bruno Valero 284\nAsturias, 33413', '2023-08-26', '2020-08-22', 'True'),
(77, 'Dolores', 'Camps', 42905794, '1960-06-21', 656856497, 625865616, 'penasolalla@example.net', 'Calle Cosme Díaz 55\nGuipúzcoa, 37703', '2022-05-02', '2022-11-13', 'True'),
(78, 'Ernesto', 'Tovar', 28879559, '1965-02-27', 682371548, 637035889, 'itziarberenguer@example.com', 'Calle de Aureliano Nogués 12 Apt. 58 \nAsturias, 32653', '2022-10-19', '2020-09-22', 'True'),
(79, 'Febe', 'Yuste', 17207712, '1988-10-20', 667054301, 674308524, 'guerreromaria-cristina@example.com', 'Rambla de Rodolfo Sebastián 31 Puerta 0 \nLa Rioja, 17713', '2021-12-07', '2023-01-29', 'True'),
(80, 'Godofredo', 'Pina', 35060759, '1997-03-06', 649832022, 657438182, 'sandramascaro@example.org', 'Camino de Ximena Quevedo 32\nCiudad, 24545', '2023-02-25', '2020-02-17', 'True'),
(81, 'Urbano', 'Guardiola', 97124297, '1993-09-29', 650517634, 644624010, 'elianarivero@example.org', 'Plaza Milagros Macías 59\nBaleares, 49526', '2020-10-10', '2023-08-07', 'True'),
(82, 'Lola', 'Gascón', 33299635, '1999-06-18', 618215015, 615701868, 'fcardenas@example.com', 'Cañada Jose Francisco Pedro 99\nCórdoba, 35385', '2023-03-11', '2022-06-22', 'True'),
(83, 'Alondra', 'Carbonell', 18443564, '1974-09-20', 672987263, 648412439, 'paula00@example.net', 'Urbanización Reyna Agullo 94\nHuesca, 01793', '2021-10-08', '2020-08-03', 'True'),
(84, 'Ligia', 'Santana', 40536464, '1959-01-15', 645857176, 695343103, 'purificacion46@example.com', 'Cañada de Toni Pina 41\nMurcia, 08249', '2022-12-24', '2021-02-10', 'True'),
(85, 'Antonia', 'Vicens', 60049072, '1971-06-07', 670343853, 664745640, 'uesparza@example.net', 'Paseo Nazaret Canales 428 Apt. 03 \nCantabria, 44073', '2021-02-24', '2023-04-23', 'True'),
(86, 'Adrián', 'Prat', 70472944, '1981-04-11', 603964220, 643652448, 'dbermudez@example.net', 'Pasaje Tania Verdú 60 Apt. 38 \nBadajoz, 30137', '2022-08-05', '2020-12-18', 'True'),
(87, 'Serafina', 'Roldan', 65709997, '1972-08-21', 659049694, 627579397, 'roquepinto@example.net', 'Callejón Ariel Valls 26\nNavarra, 03077', '2023-10-11', '2020-10-07', 'True'),
(88, 'Noé', 'Espada', 96258626, '1961-06-07', 659103775, 663752538, 'maricruzaragones@example.net', 'Paseo de Bienvenida Gomis 85 Piso 8 \nSegovia, 13695', '2023-09-06', '2022-05-02', 'True'),
(89, 'Custodio', 'Llobet', 13645896, '1998-06-27', 676607260, 664517398, 'leticiahurtado@example.org', 'Cañada Jose Gordillo 64\nGuadalajara, 35901', '2020-01-15', '2023-06-12', 'True'),
(90, 'Jesusa', 'Mena', 38185884, '1977-12-19', 623733600, 630174446, 'vpenas@example.com', 'C. Fabiola Nevado 14\nSalamanca, 43301', '2022-06-19', '2020-09-29', 'True'),
(91, 'Azeneth', 'Martorell', 47112133, '1990-03-23', 685765951, 642605639, 'curro90@example.com', 'Pasaje de Loida Lara 83 Puerta 1 \nCuenca, 32137', '2021-01-25', '2023-07-05', 'True'),
(92, 'Elisa', 'Hernando', 14310661, '1999-01-25', 642703636, 634992017, 'herreraerasmo@example.org', 'Acceso Teodora Báez 21\nJaén, 38858', '2023-06-25', '2022-10-19', 'True'),
(93, 'Guadalupe', 'Ricart', 28857207, '1979-12-02', 621575182, 660156064, 'adolfomoya@example.org', 'C. de Emilia Grande 20 Apt. 23 \nCáceres, 14540', '2022-07-05', '2023-04-09', 'True'),
(94, 'Albert', 'Gordillo', 91450100, '1995-05-16', 631960086, 695074899, 'peinadodimas@example.com', 'Cuesta de Laura Mesa 37 Puerta 2 \nValencia, 24487', '2022-02-16', '2023-07-27', 'True'),
(95, 'Elena', 'Duarte', 34642899, '1993-05-30', 603564065, 656089508, 'bolanosalma@example.org', 'Pasadizo Pánfilo Escobar 42\nJaén, 02722', '2020-08-26', '2020-06-10', 'True'),
(96, 'Osvaldo', 'Arteaga', 83624144, '2000-02-17', 698789410, 664843372, 'barbarabarrios@example.com', 'Ronda de Marisol Girón 86\nLa Rioja, 36440', '2022-04-04', '2020-10-20', 'True'),
(97, 'Alejandro', 'Plaza', 95453054, '1964-12-30', 682713498, 643223132, 'checaedelmira@example.com', 'Via de José Luis Machado 5\nÁlava, 47403', '2020-02-03', '2021-11-27', 'True'),
(98, 'Hugo', 'Rosa', 42333317, '2004-11-14', 628832645, 614421779, 'dimasllano@example.net', 'Acceso Anastasia Sarabia 87 Piso 5 \nBaleares, 34584', '2021-02-18', '2022-04-26', 'True'),
(99, 'Julieta', 'Cuesta', 37521421, '1973-08-30', 645981885, 605178712, 'cmelendez@example.org', 'Callejón de Chus Ramos 617 Puerta 2 \nGuipúzcoa, 19181', '2022-06-22', '2022-04-01', 'True'),
(100, 'Bernarda', 'Pinedo', 90308604, '1974-01-06', 623832384, 667442134, 'trinidadmoll@example.net', 'Urbanización de Jimena Vallejo 1\nAsturias, 15265', '2022-02-23', '2020-10-23', 'True'),
(101, 'Mateo', 'Méndez', 26495359, '1996-02-26', 605397310, 657182913, 'cruz12@example.org', 'Calle Juan Francisco Pi 7\nValladolid, 36795', '2021-01-08', '2023-04-29', 'True'),
(102, 'Manola', 'Calderón', 43674045, '1999-09-11', 674356890, 652569835, 'doroteasaenz@example.com', 'Vial de Prudencio Gargallo 60\nLugo, 40024', '2023-07-04', '2020-02-16', 'True'),
(103, 'Chuy', 'Cuervo', 98742349, '1992-03-23', 659790553, 628947173, 'tomemaria@example.net', 'Paseo de Danilo Lledó 2\nVizcaya, 45132', '2021-08-04', '2023-10-17', 'True'),
(104, 'Griselda', 'Calatayud', 57029519, '1989-12-27', 690217945, 694697825, 'nazaret81@example.com', 'Alameda Angelita Barranco 16\nGirona, 47844', '2021-08-18', '2021-05-03', 'True'),
(105, 'Rosenda', 'Rebollo', 79449878, '1965-11-24', 696200187, 604071037, 'sabaterdiego@example.net', 'Via de Hermenegildo Montenegro 606\nPalencia, 25527', '2022-09-17', '2021-10-29', 'True'),
(106, 'Gustavo', 'Luján', 65184618, '1996-03-06', 678406815, 672476357, 'malba@example.org', 'Callejón de Rocío Landa 81 Puerta 1 \nLa Rioja, 25108', '2023-01-22', '2022-07-28', 'True'),
(107, 'Luisa', 'Ariño', 39479368, '1962-01-24', 653672237, 615645214, 'pancho78@example.net', 'Pasaje de Ale Tomé 5\nAsturias, 17000', '2021-07-11', '2021-07-27', 'True'),
(108, 'Rafaela', 'Jaume', 99137439, '2000-11-18', 610048264, 680927264, 'ehigueras@example.net', 'Rambla Angélica Guillén 7 Piso 5 \nLleida, 17251', '2023-03-30', '2022-02-10', 'True'),
(109, 'Fanny', 'Tena', 66715895, '1972-07-08', 687406867, 640732336, 'fneira@example.org', 'Alameda de Luna Pla 5\nZamora, 16770', '2022-10-10', '2023-03-21', 'True'),
(110, 'Rosaura', 'Peinado', 79897510, '1982-09-10', 649311279, 619709183, 'garoca@example.net', 'Cuesta de Amalia Cid 27\nSegovia, 46870', '2022-06-06', '2022-05-28', 'True'),
(111, 'Salud', 'Valentín', 49243072, '1997-10-08', 604808117, 643791361, 'bbarriga@example.com', 'Cuesta Ascensión Samper 6 Apt. 77 \nZaragoza, 47627', '2020-10-27', '2022-10-25', 'True'),
(112, 'Julieta', 'Revilla', 56915859, '1959-11-17', 637810574, 615592419, 'pardoherminia@example.org', 'Rambla Pilar Ródenas 3 Piso 5 \nLa Rioja, 49126', '2021-08-04', '2020-06-27', 'True'),
(113, 'Georgina', 'Ferrera', 87355775, '1969-11-23', 610585067, 686410130, 'estrella30@example.org', 'Vial de Florencia Padilla 347\nVizcaya, 48679', '2022-10-21', '2023-04-14', 'True'),
(114, 'María', 'Rivera', 71817783, '1996-11-02', 639937200, 673900982, 'ndiez@example.org', 'Acceso Luciano Rosado 4 Puerta 4 \nGuipúzcoa, 28012', '2023-04-02', '2020-09-15', 'True'),
(115, 'Paula', 'Gimenez', 87764439, '1965-11-27', 627268703, 697040525, 'ipelaez@example.com', 'Paseo Samuel Mas 91\nCáceres, 34592', '2020-11-27', '2021-02-14', 'True'),
(116, 'Albina', 'Taboada', 64919881, '1987-07-15', 656126446, 653683042, 'encarnacion92@example.org', 'Cuesta Xiomara Aznar 33 Apt. 13 \nHuelva, 22618', '2021-12-01', '2022-05-08', 'True'),
(117, 'Rosa María', 'Pereira', 44078769, '1961-07-04', 669494763, 648174841, 'felicianogueira@example.net', 'Cuesta de Clarisa Ramis 356 Piso 7 \nCuenca, 09755', '2020-12-01', '2023-07-02', 'True'),
(118, 'Odalis', 'Escamilla', 40379579, '1976-08-17', 664067584, 683521470, 'burgosalejo@example.com', 'Glorieta Aroa Solsona 40 Apt. 62 \nGuipúzcoa, 11568', '2021-08-11', '2021-02-14', 'True'),
(119, 'Maximiano', 'Bárcena', 39499098, '2002-05-26', 695084380, 687058708, 'manuelsosa@example.net', 'Cañada Ignacio Boix 46\nAlbacete, 16560', '2023-08-02', '2022-05-06', 'True'),
(120, 'Calisto', 'Sobrino', 95315245, '1999-03-18', 630007898, 622005560, 'wlozano@example.net', 'Calle de Encarnación Adán 6\nLugo, 31573', '2022-08-01', '2020-11-02', 'True'),
(121, 'María', 'Arias', 72672017, '2004-12-31', 692924257, 680255860, 'eustaquiogarate@example.com', 'Pasadizo de Poncio Gras 210 Apt. 63 \nCantabria, 48032', '2022-04-11', '2023-05-17', 'True'),
(122, 'Erasmo', 'Carrasco', 13726771, '1965-01-11', 636942502, 652141884, 'jaenguadalupe@example.org', 'Pasadizo de Judith Ocaña 95 Puerta 8 \nBadajoz, 51710', '2023-10-16', '2021-08-28', 'True'),
(123, 'Isabela', 'Porcel', 87136958, '1974-08-11', 626223270, 699185149, 'maria-cristina43@example.org', 'Pasaje de Julie Trujillo 27\nZaragoza, 20498', '2020-06-26', '2022-08-29', 'True'),
(124, 'Gisela', 'Isern', 87036872, '1990-02-26', 600189848, 655714859, 'manoloalcala@example.org', 'Vial Jordán Ayllón 62\nCiudad, 38907', '2022-02-23', '2022-09-20', 'True'),
(125, 'Hortensia', 'Carbajo', 77132960, '1987-09-17', 691396185, 696881329, 'kcozar@example.net', 'Avenida de Javier Lucena 683 Puerta 2 \nCáceres, 05446', '2020-11-18', '2021-05-14', 'True'),
(126, 'Jerónimo', 'Azorin', 41079420, '1980-07-24', 678835951, 630075637, 'peralcalisto@example.com', 'Alameda Luís Clavero 13 Puerta 7 \nGranada, 47903', '2022-11-25', '2021-11-14', 'True'),
(127, 'Mauricio', 'Carvajal', 84460897, '1981-05-30', 667589493, 662091296, 'carvajaljulia@example.org', 'Urbanización Carlota Palomo 6\nCáceres, 47191', '2023-01-03', '2021-02-03', 'True'),
(128, 'Rafaela', 'Pujol', 15596276, '1964-11-10', 686761956, 627391164, 'anabelpedraza@example.com', 'Calle de Yéssica Perez 209\nSegovia, 45785', '2023-06-04', '2020-01-24', 'True'),
(129, 'Sonia', 'Torres', 45480693, '2000-04-21', 613076844, 610333114, 'bernardo39@example.org', 'Via Prudencia Marco 725 Piso 1 \nValencia, 05081', '2022-03-14', '2020-04-07', 'True'),
(130, 'Imelda', 'Bou', 78280185, '1974-10-03', 668644924, 622614277, 'ordonezsol@example.com', 'Pasaje de Ester Velasco 77\nSalamanca, 07337', '2020-11-27', '2020-04-29', 'True'),
(131, 'Elías', 'Morata', 84853932, '1992-07-18', 631120951, 616938181, 'mercedes41@example.org', 'Rambla de Eugenia Madrigal 26\nMadrid, 33980', '2020-01-21', '2021-03-23', 'True'),
(132, 'Alondra', 'Vizcaíno', 87744707, '1978-08-07', 664008263, 689097893, 'clementina57@example.com', 'Callejón de Mateo Blanes 53 Apt. 68 \nÁvila, 14515', '2022-07-19', '2021-08-05', 'True'),
(133, 'Inocencio', 'Álamo', 13860671, '1989-07-28', 668679298, 640185432, 'qpedrosa@example.net', 'Cañada de Viviana Fuster 510 Piso 9 \nMurcia, 51158', '2023-01-24', '2021-08-08', 'True'),
(134, 'Alfonso', 'Gargallo', 52379199, '1973-05-17', 682393470, 632888656, 'candelariasuarez@example.org', 'Vial de Odalys Castell 754 Apt. 77 \nCantabria, 43402', '2020-01-03', '2021-01-19', 'True'),
(135, 'Leticia', 'Torrent', 60305714, '1978-01-22', 681742310, 627504902, 'carla87@example.com', 'Vial de Leyre Rubio 5 Puerta 6 \nAsturias, 34512', '2023-05-20', '2023-04-01', 'True'),
(136, 'Flavia', 'Salom', 61355942, '1971-03-25', 653043857, 652596190, 'leonpriscila@example.net', 'Urbanización Lucía Aguirre 86 Puerta 2 \nTarragona, 52005', '2023-07-08', '2020-07-29', 'True'),
(137, 'Julio', 'Juliá', 21741334, '2005-03-16', 606267217, 622801222, 'moiseshigueras@example.net', 'Acceso Che Llorente 7 Puerta 4 \nVizcaya, 40440', '2020-02-15', '2021-03-29', 'True'),
(138, 'Pascuala', 'Rocha', 89870724, '1962-10-22', 636874469, 652520449, 'wsolis@example.net', 'Camino Reyes Castell 8 Piso 2 \nGirona, 18682', '2023-01-03', '2020-01-24', 'True'),
(139, 'Olegario', 'Benet', 48976621, '1989-05-16', 621495552, 621142684, 'zacarias41@example.org', 'C. de María Luisa Pineda 512\nGuadalajara, 18343', '2022-03-08', '2021-01-10', 'True'),
(140, 'Juan Francisco', 'Giralt', 76803403, '1976-02-21', 632337026, 658707632, 'grandeligia@example.com', 'Paseo Dionisio Maldonado 25\nLas Palmas, 13748', '2022-07-22', '2022-05-16', 'True'),
(141, 'Curro', 'Gallardo', 54196277, '1978-12-19', 608751195, 653799353, 'artigasadelia@example.com', 'Camino de María Ángeles Comas 44 Piso 1 \nBarcelona, 08585', '2022-06-01', '2020-01-01', 'True'),
(142, 'Roldán', 'Gabaldón', 28156556, '1997-06-27', 692577480, 644624139, 'pparedes@example.net', 'Paseo de Rafael Pons 29\nZaragoza, 45267', '2021-04-06', '2021-10-19', 'True'),
(143, 'Leticia', 'Lobo', 92469791, '2001-02-06', 653368699, 689366180, 'collteo@example.org', 'Ronda Plinio Ribas 4 Puerta 6 \nTeruel, 32162', '2021-12-03', '2022-04-13', 'True'),
(144, 'Fortunata', 'Cabrera', 54890592, '1967-12-19', 630531953, 608959635, 'breyes@example.org', 'Ronda Clotilde Reig 39 Piso 7 \nSevilla, 27471', '2021-08-14', '2021-11-24', 'True'),
(145, 'Aurora', 'Gárate', 72294857, '1971-02-16', 682358961, 618770129, 'jaradaniel@example.org', 'Paseo de Carmelita Cabrera 24\nZamora, 45556', '2020-05-16', '2020-08-02', 'True'),
(146, 'Marciano', 'Cervantes', 53715608, '1963-05-14', 638131224, 640866371, 'nereidaacevedo@example.net', 'Alameda de Nacho Carrión 16 Piso 1 \nMurcia, 22834', '2021-12-18', '2021-12-25', 'True'),
(147, 'Nayara', 'Bru', 71186012, '1985-10-16', 626351366, 687505760, 'irene91@example.com', 'C. de Isaac Jimenez 1\nSoria, 24248', '2021-07-21', '2022-05-24', 'True'),
(148, 'Adelardo', 'Leon', 52272529, '1989-02-09', 621530821, 637841008, 'marina39@example.com', 'Via Severo Montalbán 91 Piso 7 \nBurgos, 07218', '2023-03-12', '2023-04-29', 'True'),
(149, 'Sarita', 'Zabaleta', 48246818, '1977-11-03', 601572341, 651779304, 'josefinaruano@example.net', 'Acceso Sonia Ros 4\nMurcia, 15482', '2022-01-09', '2022-03-13', 'True'),
(150, 'Mónica', 'Estrada', 64534974, '1962-04-13', 683832329, 627831433, 'wescalona@example.net', 'Paseo Espiridión Serra 2\nSanta Cruz de Tenerife, 37765', '2022-09-22', '2022-04-13', 'True'),
(151, 'Lino', 'Varela', 21728707, '1990-07-03', 654930841, 601933458, 'amadorcarlota@example.org', 'Glorieta de Leocadia Ibañez 38\nAlmería, 20588', '2021-07-28', '2023-03-15', 'True'),
(152, 'Teodosio', 'Juliá', 90072173, '1964-06-30', 602379244, 641036605, 'flobo@example.com', 'C. Marcos Barranco 7\nÁvila, 24006', '2020-08-30', '2023-01-09', 'True'),
(153, 'Merche', 'Reig', 99486270, '1965-06-26', 689441411, 609938662, 'imendez@example.com', 'Urbanización de Pancho Garcia 973 Piso 3 \nZaragoza, 28346', '2022-03-04', '2021-05-02', 'True'),
(154, 'Ofelia', 'Sandoval', 79244130, '1970-08-17', 653530820, 603863770, 'krivera@example.org', 'Glorieta de Zaira Coello 76 Puerta 2 \nToledo, 22670', '2022-12-30', '2021-09-01', 'True'),
(155, 'Vicenta', 'Córdoba', 52514703, '2000-07-10', 611492069, 611632444, 'jose-luis10@example.org', 'Rambla Loreto Buendía 35\nBarcelona, 21910', '2023-03-31', '2022-07-11', 'True'),
(156, 'Emigdio', 'Almazán', 18333295, '1990-07-04', 662482562, 692440536, 'operea@example.com', 'Acceso de Custodio Velasco 80 Piso 1 \nSanta Cruz de Tenerife, 09325', '2021-08-17', '2022-06-20', 'True'),
(157, 'Nicolás', 'Barco', 67050467, '1971-02-18', 613683733, 613642619, 'treina@example.net', 'Paseo Fernanda Barrios 1 Apt. 18 \nÁlava, 25390', '2021-04-23', '2023-02-17', 'True'),
(158, 'Juan Carlos', 'Marín', 94388574, '1960-10-12', 625770179, 690376925, 'sebastianportillo@example.org', 'Ronda de Isabel Perez 379\nAlmería, 22381', '2021-06-28', '2023-07-11', 'True'),
(159, 'Porfirio', 'Canales', 74644085, '1972-04-19', 646637983, 650558804, 'shuguet@example.com', 'Vial de Jacinto Tenorio 8\nBaleares, 01262', '2022-09-17', '2020-11-11', 'True'),
(160, 'Sebastián', 'Fábregas', 33385767, '1962-04-25', 658607513, 622840549, 'oprada@example.org', 'Pasaje Edelmira Vizcaíno 11\nAlmería, 49043', '2020-08-04', '2020-05-31', 'True'),
(161, 'Baltasar', 'Garriga', 95943138, '1999-03-12', 618551005, 651653162, 'aguilalupe@example.net', 'Plaza Rafael Saez 544\nValladolid, 43949', '2020-03-04', '2023-03-24', 'True'),
(162, 'Yago', 'Barroso', 44695249, '1974-01-04', 669547954, 637711557, 'baltasarmoya@example.com', 'Rambla de Cloe Feliu 8\nCórdoba, 02782', '2022-06-15', '2022-11-12', 'True'),
(163, 'Anselma', 'Arrieta', 13261821, '1985-05-12', 603916001, 657480112, 'halamo@example.com', 'C. Martina Pla 796 Puerta 4 \nToledo, 18627', '2023-09-20', '2023-02-05', 'True'),
(164, 'Verónica', 'Nuñez', 31221228, '1984-09-08', 653201593, 644171602, 'iris43@example.org', 'Calle Paula Benavente 7\nPalencia, 48824', '2020-02-26', '2021-07-24', 'True'),
(165, 'Teobaldo', 'Morales', 59182557, '1962-03-19', 657327480, 602204899, 'rubengalvan@example.net', 'Pasadizo Adelina Moreno 7\nSegovia, 30564', '2020-08-10', '2023-04-14', 'True'),
(166, 'Azahar', 'Diaz', 46151808, '1982-01-13', 622543110, 684360467, 'cfrancisco@example.net', 'Vial de Reyes Agustín 41\nLa Rioja, 28346', '2021-11-03', '2021-04-03', 'True'),
(167, 'Febe', 'Roura', 78782277, '1999-07-29', 602047609, 615943195, 'belmonteisidora@example.org', 'C. Pía Grande 57\nValladolid, 15628', '2023-02-13', '2021-02-12', 'True'),
(168, 'Herminio', 'Blasco', 37668139, '1967-03-15', 686545581, 699732642, 'maria-pilarbernal@example.com', 'Ronda Manola Frías 16\nLleida, 22452', '2022-11-13', '2021-06-25', 'True'),
(169, 'Liliana', 'Ribera', 40144346, '1987-11-05', 677470685, 633661099, 'barreraloida@example.com', 'Rambla Leire Español 22 Piso 4 \nÁlava, 15566', '2022-01-25', '2020-10-21', 'True'),
(170, 'Selena', 'Torre', 69993487, '1981-06-10', 620019672, 607888069, 'llorenterufino@example.com', 'Ronda de Dionisia Mateu 47 Apt. 34 \nHuelva, 31069', '2023-08-06', '2021-05-09', 'True'),
(171, 'Carlos', 'Navarro', 67947126, '1977-09-26', 633938404, 668816747, 'borjatrinidad@example.net', 'Calle de Begoña Losa 95\nLleida, 47593', '2023-07-03', '2020-01-02', 'True'),
(172, 'Ismael', 'Goñi', 50879185, '1964-10-28', 698776453, 695017082, 'ymendoza@example.org', 'Paseo Jafet Arnaiz 81 Piso 3 \nValladolid, 35820', '2020-09-20', '2021-01-22', 'True'),
(173, 'Carmela', 'Lluch', 81402362, '2000-06-29', 665294630, 682353056, 'gilabertgracia@example.org', 'Vial Emiliana Porta 56\nGuipúzcoa, 48617', '2021-08-25', '2020-10-27', 'True'),
(174, 'Efraín', 'Ferreras', 60290271, '1965-03-05', 608441315, 610944464, 'galianoamalia@example.com', 'Cuesta Josep Montoya 426\nCeuta, 28798', '2020-05-01', '2020-04-14', 'True'),
(175, 'Margarita', 'Doménech', 32660679, '1980-04-30', 641446793, 627093937, 'zaira77@example.org', 'Callejón Bernardo Goñi 147 Apt. 01 \nAlbacete, 27851', '2023-10-15', '2022-07-27', 'True'),
(176, 'Maximiano', 'Mena', 38340584, '1989-03-11', 633890948, 685985227, 'conesaprudencio@example.org', 'Vial de Amor Ávila 53 Puerta 7 \nLugo, 49446', '2021-04-23', '2020-09-21', 'True'),
(177, 'Vidal', 'Porta', 30434222, '1973-02-07', 632083757, 634944531, 'marcosverdu@example.org', 'Camino de María Dolores Calatayud 728 Puerta 6 \nLugo, 01021', '2021-12-13', '2021-10-03', 'True'),
(178, 'Emiliano', 'Boix', 12283761, '1984-11-16', 682088671, 691859264, 'eutimiopedrosa@example.net', 'Cañada de Joel Castellanos 4\nNavarra, 41265', '2022-05-25', '2021-06-22', 'True'),
(179, 'Rosario', 'Arribas', 72606514, '1969-07-25', 623933325, 681944865, 'damigo@example.com', 'Cuesta de Filomena Huertas 1\nBadajoz, 14898', '2022-11-25', '2021-03-28', 'True'),
(180, 'Alondra', 'Villanueva', 91855980, '1969-08-06', 689353752, 681473052, 'maria-cristinahuguet@example.com', 'Acceso Matilde Martinez 44\nValladolid, 49215', '2020-09-26', '2022-04-29', 'True'),
(181, 'Julio', 'Moya', 46416712, '1999-05-20', 695354442, 664842094, 'linasanmartin@example.org', 'Camino de Rosario Salas 302 Apt. 54 \nBadajoz, 36514', '2021-02-22', '2022-10-08', 'True'),
(182, 'Mercedes', 'Acevedo', 90075769, '1989-05-22', 672603479, 665298833, 'rodrigocabanas@example.org', 'Avenida Máxima Amat 51\nSanta Cruz de Tenerife, 26253', '2022-09-29', '2021-05-29', 'True'),
(183, 'Poncio', 'Bárcena', 74973536, '1961-04-04', 641715099, 689037188, 'americabarroso@example.org', 'Via de Dorotea Heredia 40\nLleida, 34309', '2020-07-15', '2021-10-26', 'True'),
(184, 'Úrsula', 'Reguera', 10866193, '1995-04-13', 647240111, 646201866, 'rosendonieto@example.org', 'Pasadizo Susana Torrens 1\nCeuta, 36817', '2023-04-28', '2021-02-05', 'True'),
(185, 'Santos', 'Sánchez', 99472854, '2003-07-06', 646393804, 605402902, 'zalegria@example.org', 'Calle de Julio César Losa 630\nLas Palmas, 09093', '2020-05-16', '2023-08-23', 'True'),
(186, 'Gilberto', 'Canet', 57582830, '1964-02-24', 634100809, 692770714, 'vinajose-maria@example.net', 'Plaza de Lola Redondo 412\nTeruel, 42660', '2020-09-19', '2021-03-16', 'True'),
(187, 'Juanito', 'Diego', 24372439, '1960-06-06', 631600225, 647393159, 'qgalvan@example.org', 'Pasadizo Bruno Ferreras 18\nBarcelona, 25857', '2023-02-22', '2023-09-25', 'True'),
(188, 'Pili', 'Murcia', 33762527, '1962-04-28', 666043706, 691887129, 'jordireal@example.com', 'Plaza Isaac Ferrán 94\nPalencia, 50719', '2023-04-21', '2020-06-28', 'True'),
(189, 'Eligio', 'Santiago', 70992329, '1989-09-18', 643395726, 652580847, 'martinsimo@example.net', 'Paseo de Irene Clavero 90 Piso 9 \nZamora, 04044', '2023-06-02', '2022-08-03', 'True'),
(190, 'Julián', 'Merino', 41196948, '1994-12-16', 620576592, 612457717, 'alberto45@example.com', 'Cañada de Iris Donoso 57 Puerta 3 \nTeruel, 48752', '2022-04-10', '2023-04-11', 'True'),
(191, 'Virgilio', 'Uriarte', 73750790, '1987-06-25', 647782884, 666495256, 'calixtogarcia@example.net', 'Alameda Susanita Vallés 5\nHuelva, 33348', '2022-07-22', '2021-08-01', 'True'),
(192, 'Clemente', 'Echeverría', 12720239, '1995-06-27', 647063317, 627574694, 'juribe@example.org', 'Rambla de Aitana Páez 4\nGranada, 08922', '2021-07-02', '2022-11-07', 'True'),
(193, 'Florina', 'Perera', 29298320, '1990-02-09', 683217525, 683017173, 'violetasalamanca@example.com', 'Calle César Ruano 12 Puerta 7 \nLugo, 40188', '2020-10-22', '2023-08-23', 'True'),
(194, 'Santos', 'Espejo', 46173730, '2000-05-04', 647975633, 672374970, 'amaro81@example.com', 'Plaza Blas Alberdi 260 Puerta 9 \nOurense, 07633', '2021-06-26', '2023-01-14', 'True'),
(195, 'Felipa', 'Lerma', 49826359, '1995-05-08', 620039933, 617013679, 'serafinaquintero@example.org', 'Ronda Laura Cifuentes 295\nValladolid, 31277', '2023-07-06', '2023-06-26', 'True'),
(196, 'Dalila', 'Novoa', 86502990, '1960-10-01', 609415312, 684234996, 'octavia45@example.org', 'Plaza Clotilde Beltrán 377\nHuesca, 14055', '2021-12-29', '2023-03-26', 'True'),
(197, 'Petrona', 'Pagès', 67318349, '1990-11-23', 674017124, 658532780, 'nadia93@example.com', 'Camino Ángeles Salazar 943 Piso 6 \nAlmería, 33554', '2020-02-27', '2022-03-04', 'True'),
(198, 'Celia', 'Francisco', 47005478, '1995-01-31', 675866237, 667949391, 'elvira71@example.org', 'Cuesta Camila Meléndez 46\nMadrid, 07219', '2021-12-19', '2021-11-27', 'True'),
(199, 'Nacho', 'Vall', 89400937, '1973-12-10', 625636863, 679804223, 'eva91@example.net', 'Glorieta Nélida Fuster 973\nSanta Cruz de Tenerife, 42527', '2022-09-07', '2021-06-24', 'True'),
(200, 'Hernán', 'Torrijos', 66208389, '1978-08-01', 611523744, 607114385, 'herminia03@example.net', 'C. de Tomás Cánovas 69\nBaleares, 28420', '2021-10-19', '2021-08-23', 'True'),
(201, 'Irma', 'Alegre', 44473506, '1967-06-08', 603359369, 608208115, 'fortunatoisern@example.org', 'Cuesta de Américo Molina 420 Apt. 33 \nLeón, 45336', '2021-02-17', '2020-04-07', 'True'),
(202, 'Araceli', 'Cerezo', 80922226, '1993-03-20', 648189049, 652868407, 'perellojacinto@example.com', 'Acceso de Alberto Rios 40 Puerta 0 \nAlicante, 07018', '2023-09-19', '2020-05-09', 'True'),
(203, 'Rodolfo', 'Cózar', 44882556, '1999-11-08', 608454094, 666769495, 'hilario49@example.org', 'Calle de Rodrigo Sancho 9 Puerta 6 \nLeón, 18098', '2020-04-10', '2020-07-21', 'True'),
(204, 'Gabino', 'Montaña', 21616205, '1999-10-25', 601315215, 629811436, 'cristina21@example.com', 'Paseo Herberto Castell 35 Piso 6 \nValencia, 26751', '2020-02-19', '2020-01-08', 'True'),
(205, 'Artemio', 'Arribas', 46861598, '1974-04-22', 607215294, 632577355, 'pinillavioleta@example.net', 'Camino Nazaret Lucena 34\nVizcaya, 27044', '2022-11-22', '2022-12-11', 'True'),
(206, 'Elpidio', 'Correa', 27770347, '1976-06-28', 683027046, 646938575, 'xalberola@example.com', 'Rambla Teresita Barco 723\nHuesca, 22030', '2020-06-02', '2022-10-14', 'True'),
(207, 'Nerea', 'Sanz', 40472501, '1987-12-27', 665836969, 671583108, 'moises34@example.com', 'Calle de Guiomar Pedro 66 Puerta 9 \nLugo, 35511', '2020-02-13', '2021-09-02', 'True'),
(208, 'Victorino', 'Rocha', 77500069, '1986-01-23', 652998884, 661208075, 'reinaldoparra@example.org', 'Acceso Luis Vendrell 115\nMurcia, 43870', '2023-08-09', '2020-08-20', 'True'),
(209, 'Timoteo', 'Delgado', 65394121, '1993-01-15', 661093140, 672347786, 'iris05@example.org', 'Avenida de Josep Zaragoza 92\nValladolid, 20270', '2022-03-27', '2023-03-31', 'True'),
(210, 'Diego', 'Sanz', 19357411, '1976-10-10', 650413990, 603525392, 'ezequiel93@example.net', 'Plaza de Dionisio Dalmau 51 Apt. 90 \nBadajoz, 23641', '2022-11-10', '2021-11-21', 'True'),
(211, 'Goyo', 'Hernando', 23502837, '1994-06-26', 629945214, 690096903, 'barrenanilda@example.org', 'Calle Paulina Fábregas 45\nPalencia, 50384', '2021-08-03', '2020-08-08', 'True'),
(212, 'Ignacio', 'Molina', 53796410, '1963-08-20', 679461877, 696603142, 'abigail58@example.org', 'Urbanización Isaac Olivera 3\nSegovia, 12859', '2021-03-22', '2021-04-20', 'True'),
(213, 'Fermín', 'Bou', 42642115, '1964-12-30', 676638614, 636612060, 'irenepolo@example.com', 'Ronda de Adela Molins 23 Puerta 2 \nAsturias, 49053', '2023-04-02', '2022-11-26', 'True'),
(214, 'Pía', 'Piña', 34265277, '1971-08-27', 680685902, 680215259, 'carmen05@example.net', 'Pasadizo Haroldo Echeverría 463 Apt. 80 \nÁlava, 07742', '2020-04-14', '2022-10-26', 'True'),
(215, 'Jacinto', 'Orozco', 12666022, '1990-07-23', 664368702, 674838608, 'oscar37@example.net', 'Avenida de Martín Rosales 92 Piso 6 \nLeón, 25109', '2021-06-09', '2020-01-14', 'True'),
(216, 'Esmeralda', 'Arribas', 95328338, '1992-03-26', 691755142, 607973219, 'nataliolloret@example.com', 'Ronda de José Barbero 65 Puerta 5 \nAlbacete, 28195', '2020-08-10', '2021-09-29', 'True'),
(217, 'Rosalinda', 'Rojas', 17198332, '1982-10-12', 600777931, 660433311, 'heliodoro89@example.net', 'Calle Abel Cuéllar 675 Apt. 47 \nBaleares, 39597', '2021-10-15', '2023-09-11', 'True'),
(218, 'Begoña', 'Pujadas', 19615439, '2000-10-08', 693306494, 623246685, 'ricardocarvajal@example.net', 'Camino de Apolinar Campos 92\nGirona, 07016', '2022-09-05', '2020-05-12', 'True'),
(219, 'Úrsula', 'Segura', 22814816, '2002-11-29', 636639106, 697622390, 'azucenaroca@example.net', 'Urbanización Teodoro Neira 28 Apt. 94 \nÁvila, 29770', '2022-07-10', '2022-05-18', 'True'),
(220, 'Renato', 'Cañete', 48231767, '1994-03-26', 631342776, 666636864, 'regulo58@example.org', 'Pasaje Luciano Pereira 93\nBadajoz, 09255', '2021-12-29', '2020-07-18', 'True'),
(221, 'María Cristina', 'Torre', 18443179, '1999-04-10', 619138850, 659072145, 'novoacandida@example.com', 'Callejón de Montserrat Viana 65 Puerta 6 \nTeruel, 24304', '2020-04-20', '2020-11-18', 'True'),
(222, 'Marcos', 'Salcedo', 68595509, '1987-12-30', 610118247, 644216880, 'sandaliogranados@example.org', 'Alameda de Miguel Andres 3\nPontevedra, 08403', '2020-11-10', '2022-08-15', 'True'),
(223, 'Eugenio', 'Frutos', 98740705, '1999-03-09', 683398125, 616236493, 'tpedrero@example.org', 'Glorieta de Diana Carreras 66 Piso 8 \nZamora, 35655', '2021-10-15', '2021-01-15', 'True'),
(224, 'Urbano', 'Sacristán', 30174946, '1973-03-27', 642448708, 677140739, 'ocuenca@example.org', 'Avenida Gaspar Mate 9\nBurgos, 38693', '2021-06-13', '2022-11-01', 'True'),
(225, 'Dimas', 'Gárate', 38918551, '1996-03-03', 698512109, 690895317, 'yfranco@example.net', 'Vial Pepito Almansa 74\nHuesca, 05878', '2021-12-24', '2022-03-13', 'True'),
(226, 'Cayetana', 'Melero', 16159036, '1980-05-09', 690617841, 604594405, 'wgutierrez@example.org', 'C. Pepito Barroso 33 Piso 9 \nOurense, 26818', '2023-01-13', '2021-09-20', 'True'),
(227, 'Antonio', 'Bertrán', 84540895, '1962-12-05', 645616457, 652079501, 'kboada@example.net', 'Avenida de Juan José Rubio 507 Apt. 37 \nMadrid, 27145', '2023-10-18', '2022-04-07', 'True'),
(228, 'Raúl', 'Barrena', 65133803, '1961-02-15', 600584919, 628977844, 'guillermoserrano@example.com', 'Callejón de Francisco Javier Godoy 27 Piso 5 \nBurgos, 36562', '2020-11-06', '2020-03-28', 'True'),
(229, 'Cristian', 'Suárez', 48775823, '1979-10-28', 600984954, 690909654, 'brunildarios@example.net', 'Vial de Marisol Fabregat 76\nCastellón, 40441', '2020-07-22', '2020-10-24', 'True'),
(230, 'Luz', 'Ariza', 60498472, '1995-08-17', 617290975, 610930159, 'vilanovahoracio@example.org', 'C. Leandra Planas 33\nMelilla, 40109', '2021-12-24', '2022-02-07', 'True'),
(231, 'Ezequiel', 'Ros', 94352330, '2000-04-25', 682594815, 644309750, 'naramburu@example.com', 'Callejón Vera Uribe 791 Apt. 43 \nÁlava, 21938', '2023-05-13', '2023-04-30', 'True'),
(232, 'Adolfo', 'Goicoechea', 97872223, '2001-10-05', 654562764, 679705829, 'faustopla@example.org', 'Ronda María Teresa Ibáñez 11 Piso 8 \nCantabria, 06211', '2022-03-11', '2022-04-29', 'True'),
(233, 'Amando', 'Ibañez', 43536339, '1965-03-23', 696323816, 649980824, 'planashortensia@example.com', 'Callejón Erasmo Terrón 86 Puerta 4 \nToledo, 46572', '2022-11-07', '2020-06-12', 'True'),
(234, 'Cesar', 'Jiménez', 30129249, '1963-07-25', 601157312, 692348366, 'mpavon@example.net', 'Rambla Edmundo Herrera 164\nCastellón, 19996', '2020-09-18', '2020-01-06', 'True'),
(235, 'Yolanda', 'Barrena', 60273784, '2001-02-13', 692516920, 658748677, 'nbarragan@example.com', 'Plaza Donato Alberto 56 Puerta 1 \nSoria, 08532', '2020-08-27', '2022-03-30', 'True'),
(236, 'Ángeles', 'Torre', 87160801, '1967-10-13', 646039113, 696330431, 'quevedoemelina@example.org', 'Plaza Zaida Roca 39 Puerta 2 \nMelilla, 07597', '2021-11-27', '2021-12-26', 'True'),
(237, 'Jafet', 'Mate', 33626015, '1977-06-12', 660260990, 637550563, 'nmorera@example.net', 'Camino Bonifacio Fuente 62 Apt. 23 \nGuipúzcoa, 08913', '2020-11-23', '2023-05-18', 'True'),
(238, 'Aureliano', 'Ballester', 16202994, '1990-12-05', 651449192, 634641290, 'climacocorrea@example.net', 'Pasadizo Gabino Armas 178\nSanta Cruz de Tenerife, 06783', '2020-02-21', '2021-08-28', 'True'),
(239, 'Nacio', 'Adadia', 10923876, '2000-07-01', 647854108, 613874107, 'elba53@example.net', 'Vial de Marisela Porras 542\nCastellón, 15391', '2022-06-23', '2021-08-05', 'True'),
(240, 'Tiburcio', 'Piñol', 51243697, '1973-12-28', 619507598, 629237760, 'jruano@example.com', 'Vial de Anacleto Ortega 791 Piso 9 \nCórdoba, 49945', '2023-05-21', '2021-07-18', 'True'),
(241, 'Chema', 'Cortina', 65222689, '1959-11-05', 627995928, 669417445, 'rosa27@example.net', 'Acceso de Jenny Barrena 77\nZamora, 20907', '2022-08-02', '2021-05-30', 'True'),
(242, 'Áurea', 'Avilés', 39562567, '1993-03-24', 655402647, 616457658, 'dorita32@example.com', 'Vial Loreto Tormo 36\nLeón, 19158', '2021-01-28', '2021-11-29', 'True'),
(243, 'Lidia', 'Olivé', 16622980, '1986-02-17', 610894855, 632143077, 'salome78@example.com', 'Urbanización Luis Miguel Martín 79\nCádiz, 31346', '2022-04-12', '2022-06-01', 'True'),
(244, 'Bernabé', 'Bastida', 50677704, '1968-04-26', 694220609, 655109267, 'octavio34@example.com', 'C. Adelina Páez 70\nBaleares, 14239', '2021-11-11', '2023-03-06', 'True'),
(245, 'Chus', 'Gutiérrez', 17842775, '1969-02-12', 656663566, 618818798, 'campsanita@example.net', 'Plaza de Valentina Aparicio 74\nValencia, 07498', '2021-04-18', '2020-06-29', 'True'),
(246, 'Amado', 'Ferreras', 44800185, '2001-07-27', 661148029, 634979548, 'antonquique@example.net', 'Cuesta Selena Nicolau 2\nCeuta, 23014', '2020-06-19', '2020-01-10', 'True'),
(247, 'Rosario', 'Serrano', 49638181, '1991-09-28', 680310926, 617783593, 'fidela62@example.org', 'Calle Juana Guzman 3 Puerta 9 \nGuipúzcoa, 37967', '2023-07-16', '2020-02-01', 'True'),
(248, 'Erasmo', 'Cózar', 39570234, '1997-10-09', 618452166, 650610998, 'nbejarano@example.com', 'Cañada de Macarena Huerta 9 Piso 3 \nCáceres, 09335', '2021-07-23', '2021-03-17', 'True'),
(249, 'Gaspar', 'Zamorano', 54239383, '1998-09-08', 652204943, 646106905, 'asuncion91@example.com', 'Callejón Anita Lasa 91\nLeón, 22287', '2023-10-10', '2021-10-10', 'True'),
(250, 'Geraldo', 'Azorin', 20966034, '1988-04-08', 639416393, 634897352, 'palominolalo@example.com', 'Glorieta de Mariana Tomás 1\nCórdoba, 45204', '2021-04-07', '2023-08-13', 'True'),
(251, 'Lázaro', 'Riquelme', 15180179, '1996-02-11', 689492341, 666836717, 'olimpia22@example.net', 'Rambla de Ildefonso Chaves 79\nLugo, 44865', '2023-09-04', '2021-07-08', 'True'),
(252, 'Anna', 'Abellán', 56427715, '1962-05-12', 672847623, 654559518, 'bermejoleopoldo@example.net', 'Vial Flavio Hervia 63 Piso 9 \nCantabria, 24117', '2023-01-08', '2020-08-19', 'True'),
(253, 'Ángeles', 'Perez', 38625985, '2001-06-27', 626535192, 684943065, 'mmontoya@example.org', 'Camino Selena Abella 62\nToledo, 38131', '2020-01-30', '2021-08-29', 'True'),
(254, 'Nicolasa', 'Cortés', 21685883, '1970-12-24', 660307277, 607045229, 'priegomario@example.org', 'Plaza de Leonor Macías 6 Piso 3 \nJaén, 41135', '2020-04-24', '2020-07-11', 'True'),
(255, 'Hernán', 'Quevedo', 66728350, '1969-06-20', 611219570, 689878980, 'ligia16@example.com', 'Camino de Isabel Córdoba 85 Piso 5 \nTeruel, 45089', '2021-03-27', '2022-09-12', 'True'),
(256, 'Teodosio', 'Noguera', 67169759, '1977-03-05', 632955548, 676418933, 'orobledo@example.org', 'Glorieta de Manuela Navarro 8 Piso 0 \nCórdoba, 10793', '2021-02-08', '2021-01-26', 'True'),
(257, 'María Cristina', 'Tudela', 57525072, '1983-09-30', 604617054, 665347998, 'graunestor@example.org', 'Via de Amaya Granados 1\nMadrid, 49157', '2022-11-21', '2022-09-16', 'True'),
(258, 'Urbano', 'Arenas', 16869194, '1968-07-11', 626502749, 688138310, 'isanchez@example.org', 'C. Lilia Hidalgo 80 Piso 4 \nLugo, 34450', '2023-07-16', '2023-01-30', 'True'),
(259, 'Araceli', 'Silva', 35040191, '1958-06-11', 687623914, 627483061, 'lorenacueto@example.net', 'Avenida Severiano Echeverría 418 Piso 3 \nMadrid, 06081', '2021-08-09', '2021-10-05', 'True'),
(260, 'Emilia', 'Báez', 84866177, '1990-08-08', 637325998, 649500884, 'jacinto09@example.net', 'Cañada Marta Puga 891 Apt. 51 \nSalamanca, 39480', '2020-03-16', '2020-04-24', 'True'),
(261, 'Emperatriz', 'Santamaría', 39705994, '1959-05-29', 691633188, 671814058, 'luciana15@example.com', 'Vial de Teo Pinedo 608 Puerta 7 \nMálaga, 12833', '2023-09-10', '2021-05-06', 'True'),
(262, 'Asdrubal', 'Espejo', 64939411, '1976-07-06', 654649724, 642479304, 'alejo87@example.com', 'Callejón Carlito Molins 61 Apt. 67 \nCáceres, 14693', '2022-09-15', '2023-08-28', 'True'),
(263, 'Merche', 'Segarra', 11729419, '1999-02-23', 637576243, 691908256, 'amayaramirez@example.org', 'Via de Verónica Sola 6 Apt. 20 \nBadajoz, 30870', '2020-11-07', '2020-01-10', 'True'),
(264, 'Camila', 'Clemente', 66129693, '1975-02-25', 643999690, 641137748, 'wjauregui@example.net', 'Acceso Casandra Marti 811 Apt. 81 \nÁlava, 37592', '2022-07-31', '2022-09-24', 'True'),
(265, 'Duilio', 'Madrid', 74426596, '2000-07-17', 605413129, 608594599, 'florinaagusti@example.org', 'Camino Teresita Pont 44 Apt. 58 \nLeón, 30094', '2021-08-22', '2021-11-09', 'True'),
(266, 'Irene', 'Reguera', 12132040, '2003-01-11', 613274453, 665463658, 'reyvito@example.org', 'Via Nayara Campoy 85 Apt. 48 \nCastellón, 04020', '2021-05-02', '2020-12-20', 'True'),
(267, 'Cristina', 'Bejarano', 31427525, '1976-04-10', 642317861, 635640639, 'daniela23@example.com', 'Pasadizo Andrés Felipe Casal 31 Puerta 1 \nValladolid, 22746', '2022-04-13', '2020-05-27', 'True'),
(268, 'Manola', 'Fábregas', 62084194, '1958-03-07', 663754178, 634778936, 'pepemanjon@example.org', 'Calle de Aarón Marquez 976 Piso 0 \nAlbacete, 28814', '2023-01-24', '2023-05-25', 'True'),
(269, 'Juliana', 'Cuesta', 93772718, '1958-02-16', 634620540, 646799462, 'ana-sofiacastilla@example.net', 'Cuesta Ana Sofía Fernandez 74 Piso 1 \nAlicante, 01594', '2020-04-04', '2022-11-27', 'True'),
(270, 'Adalberto', 'Nieto', 79491600, '1979-03-24', 614286971, 644095270, 'evagalvez@example.net', 'Via de Anastasio Chamorro 38 Apt. 84 \nCantabria, 16117', '2023-03-16', '2023-10-02', 'True'),
(271, 'Leyre', 'Arco', 40109114, '1985-06-18', 667203347, 641037984, 'xnunez@example.com', 'Urbanización Sofía Galindo 38 Piso 7 \nCórdoba, 14179', '2021-07-10', '2022-07-04', 'True');
INSERT INTO `cliente` (`id`, `nombres`, `apellido`, `dni`, `fec_nac`, `celular`, `celular_alt`, `email`, `direccion`, `fecha_creacion`, `fecha_modificacion`, `estado`) VALUES
(272, 'Elpidio', 'Amor', 93691149, '1982-11-10', 681688747, 616677697, 'danielareyes@example.com', 'Vial de Teodosio Gonzalo 660 Piso 2 \nMurcia, 50292', '2020-12-03', '2023-09-28', 'True'),
(273, 'Calisto', 'Alonso', 69238967, '1966-01-16', 642041903, 699453962, 'macarena83@example.com', 'Alameda Carla Acuña 429\nPalencia, 24198', '2021-12-22', '2022-12-02', 'True'),
(274, 'Santos', 'Giménez', 96049639, '1993-12-19', 633912395, 608682316, 'valcolea@example.net', 'Alameda de Manuela Gracia 20 Piso 9 \nCantabria, 42893', '2021-02-06', '2022-03-27', 'True'),
(275, 'Ana Belén', 'Cases', 52428453, '2001-04-15', 661657232, 684862712, 'segoviavirginia@example.com', 'Urbanización de Noelia Jove 2 Puerta 7 \nOurense, 27221', '2020-07-31', '2021-05-09', 'True'),
(276, 'Candela', 'Posada', 90147871, '1964-09-13', 616982650, 669992876, 'calderonisidora@example.net', 'Pasaje de Macario Vazquez 69\nCiudad, 21964', '2020-01-15', '2022-06-02', 'True'),
(277, 'Julie', 'Molina', 95297742, '1991-05-13', 600544368, 645217053, 'xartigas@example.org', 'Cañada de Urbano Doménech 217 Puerta 4 \nÁlava, 03866', '2023-09-29', '2020-11-29', 'True'),
(278, 'Sarita', 'Andres', 17757356, '1961-03-30', 612825076, 627626452, 'roberta67@example.com', 'Avenida Custodia Mayoral 92 Piso 7 \nGuadalajara, 30735', '2021-03-22', '2022-12-11', 'True'),
(279, 'Nacho', 'Vega', 12651454, '2004-03-15', 689939063, 668768158, 'joel72@example.com', 'Vial de Osvaldo Carreras 353\nBadajoz, 21864', '2023-09-02', '2020-12-27', 'True'),
(280, 'Encarnita', 'Piña', 58998725, '2000-12-10', 677381053, 649967820, 'juan-jose92@example.com', 'Pasadizo de Baldomero Aranda 47\nSanta Cruz de Tenerife, 51089', '2022-07-10', '2020-03-04', 'True'),
(281, 'Miriam', 'Pi', 81919807, '1980-10-22', 628783669, 695254294, 'aureliano15@example.com', 'Pasaje de Gerardo Salinas 36\nSanta Cruz de Tenerife, 21565', '2023-05-03', '2021-04-16', 'True'),
(282, 'Caridad', 'Echevarría', 54588787, '1966-03-08', 616285857, 633911519, 'alcidesvendrell@example.org', 'Via de Melchor Iglesia 8 Piso 9 \nCórdoba, 09508', '2023-10-22', '2021-10-26', 'True'),
(283, 'Ainara', 'Vilalta', 27804057, '1978-02-14', 608309686, 694954367, 'wmorcillo@example.net', 'Rambla María Pilar Cerezo 3 Puerta 0 \nPontevedra, 38693', '2022-08-01', '2023-07-20', 'True'),
(284, 'Elena', 'Armas', 76370483, '1987-10-05', 651796126, 623181867, 'puenteblas@example.com', 'Plaza de Heriberto Acedo 6 Puerta 8 \nBadajoz, 29119', '2022-02-14', '2021-03-15', 'True'),
(285, 'Roldán', 'Nicolau', 82954616, '1993-01-24', 651374421, 671881863, 'inocencio44@example.com', 'Vial José Luis Barba 6 Apt. 98 \nAlicante, 50495', '2020-09-16', '2023-03-11', 'True'),
(286, 'Dominga', 'Artigas', 11914167, '1972-07-13', 617573063, 626128651, 'alberto22@example.net', 'Ronda de Rogelio Martínez 50\nTarragona, 10952', '2022-11-01', '2022-12-31', 'True'),
(287, 'Abraham', 'Arellano', 35245158, '1959-05-07', 654616825, 689183354, 'benignacanellas@example.net', 'Cañada de Febe Folch 84 Apt. 04 \nCáceres, 01598', '2021-08-02', '2021-08-24', 'True'),
(288, 'Nacio', 'Falcón', 85665231, '1959-03-26', 603523654, 658004441, 'arizaamerico@example.org', 'Cañada Carmina Iglesia 3\nÁvila, 15567', '2023-02-21', '2022-06-28', 'True'),
(289, 'Marcela', 'Falcón', 74412634, '1984-03-24', 605082456, 628240695, 'carneroxiomara@example.com', 'Calle de Álvaro Batlle 92 Piso 9 \nTeruel, 32326', '2023-01-20', '2022-05-16', 'True'),
(290, 'Armida', 'Barceló', 29320257, '2005-08-04', 676989896, 657885083, 'jodarcamilo@example.com', 'Calle de Julián Gimeno 3 Apt. 98 \nÁlava, 07983', '2020-03-17', '2022-09-20', 'True'),
(291, 'Máximo', 'Royo', 27942255, '1996-01-05', 601110558, 686986100, 'nayara75@example.net', 'Acceso de Julie Arcos 36\nPalencia, 35635', '2020-08-28', '2020-04-12', 'True'),
(292, 'Fernanda', 'Larrea', 46598121, '1967-06-03', 667645386, 684951290, 'nereidapatino@example.com', 'Camino de Donato Pedrosa 31\nNavarra, 42723', '2023-08-03', '2022-04-07', 'True'),
(293, 'Xiomara', 'Vargas', 31646510, '1987-12-08', 656290219, 685851520, 'leticiasolsona@example.com', 'Avenida Gloria Becerra 54 Piso 4 \nMadrid, 32060', '2021-03-12', '2023-02-09', 'True'),
(294, 'Dominga', 'Calatayud', 50404864, '1963-12-15', 604327045, 667556020, 'banosalcides@example.com', 'Pasaje de Anna Almansa 64 Puerta 1 \nTarragona, 44501', '2020-01-27', '2022-08-15', 'True'),
(295, 'Amancio', 'Montes', 63903212, '1985-04-25', 660776113, 635383606, 'edmundomunoz@example.net', 'Via Úrsula Bernad 19\nÁlava, 29980', '2021-09-09', '2021-10-11', 'True'),
(296, 'Ester', 'Girona', 96943797, '1984-07-17', 626213092, 627337600, 'lasaangelita@example.com', 'Ronda de Guadalupe Figuerola 12 Apt. 21 \nToledo, 48015', '2022-04-16', '2022-10-09', 'True'),
(297, 'Antonio', 'Blanco', 98145206, '1964-10-19', 658951406, 616100667, 'llabresleandro@example.org', 'Ronda Ramón Diez 384 Puerta 1 \nLa Rioja, 15953', '2020-12-22', '2023-08-08', 'True'),
(298, 'Manuel', 'Sanz', 45275886, '1980-08-28', 663578522, 635563388, 'lespada@example.net', 'Glorieta de Viviana Ros 6 Puerta 4 \nCuenca, 49841', '2020-11-12', '2020-10-18', 'True'),
(299, 'Emelina', 'Bilbao', 85960943, '1973-11-17', 632043685, 601239832, 'leoncio85@example.org', 'Via Vicenta Salas 557 Piso 5 \nCáceres, 35645', '2023-04-10', '2020-09-15', 'True'),
(300, 'René', 'Llabrés', 57466211, '1973-01-27', 692980761, 670900860, 'etelvina48@example.org', 'Cañada Laura Mate 4\nBaleares, 36176', '2020-03-27', '2021-10-19', 'True'),
(301, 'Pilar', 'Guitart', 34361747, '1986-12-10', 637276254, 689986021, 'rufina56@example.com', 'Pasadizo Kike Viana 897 Apt. 35 \nMadrid, 16576', '2023-09-01', '2020-05-14', 'True'),
(302, 'Patricio', 'Cantero', 76336833, '1966-03-04', 634448266, 667431995, 'millaezequiel@example.org', 'Urbanización Eleuterio Torrijos 96 Puerta 1 \nLa Rioja, 47229', '2021-07-10', '2020-04-03', 'True'),
(303, 'Demetrio', 'Blasco', 65638646, '1980-05-13', 626541324, 640753730, 'carmenabad@example.org', 'Cañada Juliana Donaire 571\nÁlava, 10169', '2022-08-20', '2021-05-10', 'True'),
(304, 'Teófila', 'Velázquez', 80818108, '1986-02-11', 661243797, 667751168, 'natanaelmalo@example.com', 'Urbanización Jovita Maza 6 Piso 4 \nZamora, 52046', '2022-08-05', '2022-01-15', 'True'),
(305, 'Azucena', 'Herrera', 55230133, '1975-05-26', 673336064, 613168418, 'ovidioalonso@example.org', 'Paseo de Flor Trujillo 7 Puerta 9 \nGuipúzcoa, 08959', '2022-02-08', '2023-01-08', 'True'),
(306, 'Casandra', 'Duarte', 29572435, '1972-01-18', 682110186, 681618234, 'felisaalberto@example.org', 'Paseo Lilia Iglesias 318 Apt. 70 \nSanta Cruz de Tenerife, 24223', '2020-01-29', '2021-10-06', 'True'),
(307, 'Candela', 'Puente', 44473378, '1963-05-18', 647889475, 616591192, 'dionisiomarin@example.org', 'Glorieta Andrea Bernal 90 Piso 4 \nPontevedra, 32174', '2023-06-30', '2022-05-17', 'True'),
(308, 'Nacho', 'Garcia', 32786604, '1998-11-30', 699300332, 689630877, 'valentina94@example.net', 'Paseo Edu Fajardo 51 Puerta 3 \nCantabria, 49042', '2020-10-23', '2020-03-18', 'True'),
(309, 'Darío', 'Franco', 12948653, '1978-09-15', 646039140, 653228871, 'evita68@example.com', 'Callejón Cloe Zamora 962 Apt. 86 \nTarragona, 26761', '2020-04-18', '2022-10-11', 'True'),
(310, 'Ágata', 'Salinas', 96144500, '1994-09-27', 617845044, 692354047, 'amaya77@example.com', 'Cañada Jesús Merino 50 Apt. 38 \nSoria, 23048', '2020-07-27', '2020-10-13', 'True'),
(311, 'Gala', 'Barranco', 30324522, '2004-03-22', 611582031, 622027487, 'isabela05@example.com', 'Avenida de Leonardo Álamo 83\nLa Rioja, 46418', '2021-03-14', '2021-08-20', 'True'),
(312, 'César', 'Garay', 53281008, '1969-10-13', 686802201, 666325161, 'jcamps@example.net', 'Camino Concepción Rebollo 53\nPalencia, 11737', '2022-04-12', '2020-09-17', 'True'),
(313, 'Isidora', 'Quirós', 49393202, '2002-12-03', 690917504, 615506986, 'magdalenamoraleda@example.com', 'Glorieta de Moisés Velázquez 63 Piso 5 \nLa Rioja, 40183', '2020-02-22', '2020-11-19', 'True'),
(314, 'María Cristina', 'Ramón', 45347562, '1974-03-20', 616244709, 655734590, 'nuria26@example.com', 'Urbanización Pili Pomares 2 Puerta 3 \nVizcaya, 27368', '2022-02-25', '2020-10-12', 'True'),
(315, 'Trini', 'Jordá', 86780242, '1966-09-21', 659852641, 637490428, 'baezevangelina@example.net', 'Via Rafael Comas 81\nTarragona, 31350', '2021-01-12', '2022-05-22', 'True'),
(316, 'Jose', 'Valderrama', 56881329, '1984-08-30', 682751847, 641670693, 'dmariscal@example.net', 'Avenida Perla Arévalo 84\nAlicante, 18397', '2021-09-13', '2021-09-24', 'True'),
(317, 'Marita', 'Miró', 42691383, '1978-10-02', 686100214, 651879708, 'valbuenaeusebio@example.org', 'Plaza de José Vergara 655\nCádiz, 09515', '2020-10-28', '2022-11-19', 'True'),
(318, 'Humberto', 'Blanch', 56893316, '1999-01-08', 636191292, 604778594, 'filomenapelaez@example.com', 'Callejón Esteban Arregui 47\nHuelva, 43160', '2020-01-21', '2020-12-30', 'True'),
(319, 'Iker', 'Solsona', 92814968, '1979-01-06', 619528626, 617001265, 'zaleman@example.org', 'Cuesta Azahar Chico 7 Apt. 00 \nLas Palmas, 36561', '2022-04-12', '2021-09-09', 'True'),
(320, 'Asdrubal', 'Tolosa', 65359206, '2003-09-14', 692496245, 612694260, 'armidanunez@example.org', 'Cañada de Carina Barragán 12\nLugo, 46751', '2021-03-28', '2021-10-06', 'True'),
(321, 'Belen', 'Barros', 27934947, '1985-08-03', 679678271, 618930018, 'augustotello@example.org', 'Cuesta Narciso Córdoba 83 Puerta 8 \nCórdoba, 43306', '2023-08-08', '2021-11-17', 'True'),
(322, 'Ceferino', 'Castell', 94078105, '1981-09-22', 626300239, 604867989, 'marinoconsuela@example.com', 'Paseo de Juan Carlos Montalbán 88 Apt. 90 \nToledo, 16143', '2021-10-06', '2023-09-16', 'True'),
(323, 'Mirta', 'Jurado', 82343963, '1990-07-22', 602439235, 620828900, 'teobaldoferran@example.org', 'Calle de Feliciano Echevarría 60\nGuipúzcoa, 08598', '2023-05-08', '2023-01-13', 'True'),
(324, 'Melisa', 'Folch', 28048953, '1986-09-17', 693225370, 633932484, 'francisco-jose04@example.com', 'Pasadizo de Jorge Rebollo 47 Piso 1 \nNavarra, 34553', '2022-10-29', '2023-09-08', 'True'),
(325, 'Héctor', 'Villena', 41491848, '2005-02-21', 611326913, 662845400, 'trinihuerta@example.org', 'Vial Valeria Artigas 714 Apt. 64 \nCantabria, 11994', '2022-07-18', '2021-01-27', 'True'),
(326, 'Poncio', 'Carbonell', 99230987, '1981-01-05', 629388823, 633267664, 'jlobo@example.net', 'Acceso Amanda Escamilla 22 Piso 2 \nÁlava, 48320', '2021-02-08', '2020-08-13', 'True'),
(327, 'Heraclio', 'Merino', 64117288, '1975-10-07', 655091150, 661255813, 'xguillen@example.org', 'Avenida Benito Cornejo 68\nSevilla, 46141', '2021-11-25', '2020-05-14', 'True'),
(328, 'Gastón', 'Cornejo', 48032496, '1977-12-18', 653701143, 680561823, 'fulgencioaliaga@example.com', 'Cañada de Baudelio Peñas 93\nToledo, 36016', '2022-08-06', '2022-09-12', 'True'),
(329, 'Nacho', 'Pineda', 28339361, '2004-01-02', 661247764, 631429706, 'edugisbert@example.org', 'Acceso Patricia Luz 609\nVizcaya, 20977', '2022-01-24', '2021-11-01', 'True'),
(330, 'Francisco Jose', 'Sancho', 78402021, '1973-05-03', 663523626, 643112949, 'dosorio@example.com', 'Urbanización Valentín Riba 58 Apt. 38 \nLa Coruña, 44850', '2022-11-01', '2021-04-27', 'True'),
(331, 'Teodoro', 'Abril', 77554761, '1959-03-13', 664667984, 603576293, 'julio15@example.net', 'Callejón de Ramiro Pol 22\nTeruel, 36159', '2022-04-09', '2023-05-13', 'True'),
(332, 'Toribio', 'Arrieta', 55029006, '2004-12-30', 667436902, 646525509, 'nunezruy@example.net', 'Via Lina Uribe 54\nLa Coruña, 49801', '2020-10-12', '2021-08-14', 'True'),
(333, 'Edmundo', 'Paz', 45217854, '1986-09-21', 699040525, 626293397, 'squero@example.org', 'Acceso de Pía Barón 51 Apt. 64 \nBurgos, 36664', '2022-02-20', '2020-07-23', 'True'),
(334, 'Cruz', 'Ponce', 62197355, '2005-04-18', 657732029, 696189701, 'cesar66@example.net', 'Pasaje Gracia Zabala 138 Piso 2 \nCuenca, 09098', '2023-01-16', '2021-02-21', 'True'),
(335, 'Manola', 'Corbacho', 82183552, '1978-11-08', 616989673, 635297486, 'garaysosimo@example.com', 'C. de Celia Palmer 633 Piso 8 \nCuenca, 48914', '2023-01-19', '2022-09-03', 'True'),
(336, 'Luna', 'Lillo', 94589553, '1984-08-05', 656671764, 635201366, 'palmira45@example.net', 'C. Marcelino Perea 223\nOurense, 22133', '2021-01-22', '2023-03-05', 'True'),
(337, 'Marianela', 'Torrens', 91352266, '1960-09-28', 684966386, 686116035, 'carrenovictor@example.org', 'Vial Emiliano Cabello 42 Piso 9 \nCeuta, 16088', '2023-04-10', '2022-05-07', 'True'),
(338, 'Felisa', 'Verdú', 60151956, '1958-09-30', 637280218, 674387612, 'isaura46@example.org', 'Rambla de Guadalupe Moll 44 Piso 1 \nBadajoz, 27448', '2021-09-19', '2023-10-26', 'True'),
(339, 'Guiomar', 'Olivares', 64188689, '1963-06-08', 607209793, 611442402, 'clarisafolch@example.net', 'C. de Miguela Fabregat 35 Apt. 36 \nGranada, 15821', '2021-05-27', '2023-02-15', 'True'),
(340, 'Genoveva', 'Corral', 26868003, '1961-08-18', 649542868, 678038956, 'collmarino@example.com', 'Avenida Rodolfo Hierro 64 Puerta 3 \nMadrid, 40508', '2022-03-21', '2023-09-16', 'True'),
(341, 'Nazaret', 'Manzanares', 88960931, '2000-03-01', 618363745, 633781491, 'guadalupe07@example.org', 'Pasadizo de Anabel Mata 629 Piso 1 \nBadajoz, 43851', '2020-08-26', '2022-02-03', 'True'),
(342, 'Domitila', 'Castillo', 59693610, '2002-11-03', 699849980, 658544423, 'lealmarino@example.net', 'Glorieta de Martina Benavent 53\nSevilla, 47505', '2020-11-26', '2022-09-17', 'True'),
(343, 'Berto', 'García', 19817559, '1984-03-30', 624876029, 623718965, 'amorbarrera@example.org', 'Pasaje Gaspar Páez 1\nGirona, 38854', '2021-07-03', '2021-11-14', 'True'),
(344, 'Conrado', 'Roldan', 82212156, '1958-08-19', 654894717, 650730685, 'rosendo01@example.com', 'Urbanización de Olalla Barranco 99 Piso 5 \nBurgos, 10364', '2020-05-17', '2023-05-22', 'True'),
(345, 'Edu', 'Bustos', 98453891, '1999-10-30', 652195635, 619415932, 'natanael11@example.com', 'Rambla de José Cañellas 84\nLugo, 51156', '2022-11-13', '2023-10-07', 'True'),
(346, 'Tania', 'Canales', 89204859, '1998-07-28', 628683664, 658230113, 'faustinoartigas@example.com', 'Paseo de Martirio Ferrera 534\nLleida, 20792', '2023-01-31', '2022-09-03', 'True'),
(347, 'Adalberto', 'Lucena', 68072994, '1963-06-10', 626710716, 627734733, 'rodriguezoriana@example.org', 'Acceso de Florentina Amigó 805\nÁvila, 15890', '2020-05-28', '2021-05-18', 'True'),
(348, 'Dionisio', 'Ricart', 97209948, '1977-06-05', 614812665, 644107210, 'eloisallabres@example.com', 'Cuesta de Miguel Tejera 65\nGuadalajara, 41212', '2023-06-16', '2023-07-04', 'True'),
(349, 'Hector', 'Donaire', 84277700, '1977-02-22', 656172852, 602843903, 'leandro01@example.com', 'Vial Teresita Crespi 2\nCuenca, 19259', '2023-04-03', '2021-12-15', 'True'),
(350, 'Julio', 'Bautista', 25924020, '1986-04-17', 627438424, 646525127, 'fusteremelina@example.net', 'Cuesta Abel Olivé 61\nAlbacete, 42208', '2022-03-10', '2021-03-30', 'True'),
(351, 'Albano', 'Asenjo', 14471210, '1986-09-01', 614400086, 650697913, 'oterogregorio@example.net', 'Cuesta de Roxana Paredes 26\nMurcia, 32315', '2022-04-26', '2023-04-14', 'True'),
(352, 'Liliana', 'Rosado', 93766054, '1976-05-07', 678993404, 600452241, 'eva-maria47@example.org', 'Paseo de Amor Aragón 54 Puerta 3 \nCórdoba, 24680', '2022-01-13', '2023-02-19', 'True'),
(353, 'Carmelita', 'Sola', 86790010, '1970-12-11', 682350273, 618096595, 'nnarvaez@example.net', 'Urbanización Angélica Rincón 53 Apt. 94 \nGuipúzcoa, 08882', '2022-07-28', '2021-07-18', 'True'),
(354, 'Moreno', 'Molins', 65992581, '1986-04-17', 655104551, 666672619, 'turrutia@example.org', 'Acceso Eli Milla 69 Puerta 1 \nCantabria, 02196', '2023-02-22', '2023-04-16', 'True'),
(355, 'Faustino', 'Girón', 63055499, '1988-10-20', 684690639, 683479870, 'ifarre@example.net', 'Via Julio César Ferrándiz 7 Piso 4 \nPontevedra, 36462', '2022-10-17', '2020-03-04', 'True'),
(356, 'Emelina', 'Solana', 17529046, '1958-07-02', 651773406, 666439043, 'bautista14@example.com', 'Urbanización Noemí Giner 54 Puerta 3 \nMadrid, 09492', '2022-11-26', '2022-05-14', 'True'),
(357, 'Santos', 'Carretero', 81959216, '1984-03-05', 603891259, 619396501, 'wfajardo@example.org', 'Callejón Purificación Cadenas 6 Puerta 5 \nGranada, 13234', '2021-06-11', '2021-08-21', 'True'),
(358, 'Candela', 'Arco', 47095553, '1978-11-25', 688732925, 649706490, 'olivabrigida@example.org', 'Rambla Gaspar Porcel 5\nBarcelona, 19082', '2021-04-10', '2022-09-13', 'True'),
(359, 'Gonzalo', 'Oliver', 97788957, '1981-03-15', 651942226, 675480378, 'jennifer31@example.org', 'Paseo de María Carmen Cañellas 3\nOurense, 24348', '2022-08-12', '2020-06-28', 'True'),
(360, 'Bárbara', 'Arnau', 85124501, '2002-07-07', 638367616, 644509600, 'nieves74@example.net', 'Cañada de Florentino Terrón 7\nPalencia, 37758', '2020-07-31', '2023-07-26', 'True'),
(361, 'Lilia', 'Bartolomé', 68603396, '1972-12-19', 618776036, 615355300, 'tomaslucio@example.com', 'Urbanización de Teófila Juliá 62 Puerta 2 \nCantabria, 02677', '2023-06-15', '2021-12-03', 'True'),
(362, 'Fito', 'Ibarra', 42037374, '1964-06-13', 607916093, 625736233, 'olarranaga@example.org', 'Via Juan Escribano 646\nToledo, 10796', '2021-09-28', '2020-09-10', 'True'),
(363, 'Benito', 'Higueras', 98241999, '1992-05-28', 622857387, 636260344, 'martinezfanny@example.com', 'Cañada de Silvio Lago 14\nCádiz, 44654', '2020-02-14', '2023-07-26', 'True'),
(364, 'Alfredo', 'Alcalá', 18149454, '1999-12-05', 642102334, 683112452, 'demetrio17@example.net', 'Cuesta Fernando Pozuelo 20 Piso 7 \nAlicante, 06796', '2023-03-31', '2021-12-05', 'True'),
(365, 'Sabas', 'Boix', 27931326, '1990-01-11', 699270903, 662847820, 'fortunato76@example.org', 'Camino Elba Acuña 5 Puerta 6 \nLa Rioja, 09840', '2022-03-28', '2023-07-14', 'True'),
(366, 'Jaime', 'Morán', 52462978, '1985-11-25', 662923741, 662923033, 'aaranda@example.org', 'Vial María Pilar Esteban 70\nHuelva, 33496', '2021-06-07', '2023-03-17', 'True'),
(367, 'Eloy', 'Ferrán', 28944694, '1993-10-31', 673156964, 678422931, 'benavidescipriano@example.net', 'Rambla de Elisabet Coloma 81 Apt. 27 \nSoria, 51593', '2021-07-05', '2022-07-17', 'True'),
(368, 'Miriam', 'Cabezas', 90677718, '1992-05-15', 693882261, 623892048, 'hvelazquez@example.net', 'Pasaje de Iván Miranda 1 Apt. 73 \nCeuta, 21339', '2021-07-13', '2021-03-08', 'True'),
(369, 'Susanita', 'Bellido', 35186781, '1980-12-19', 659491668, 637230074, 'maribel52@example.com', 'Glorieta de José Antonio Toro 891 Piso 0 \nAsturias, 27589', '2023-03-27', '2021-07-30', 'True'),
(370, 'Cándida', 'Moraleda', 99687113, '1989-01-03', 638436332, 684746679, 'valenciafito@example.org', 'Cuesta de Moreno Puig 6 Puerta 0 \nCuenca, 32264', '2022-04-17', '2020-07-20', 'True'),
(371, 'Salomé', 'Ramis', 13185008, '1964-10-18', 601111721, 690422546, 'haroldo08@example.net', 'Glorieta Soraya Zaragoza 68\nMelilla, 03976', '2020-05-12', '2023-04-03', 'True'),
(372, 'Flora', 'Dominguez', 89815101, '1979-01-21', 639725963, 694732240, 'morellzoraida@example.net', 'Paseo Apolinar Bernal 9\nPontevedra, 13616', '2021-08-04', '2021-10-18', 'True'),
(373, 'Áurea', 'Arce', 42538332, '1977-09-30', 689977150, 674900470, 'qbarco@example.org', 'Urbanización de Luciana Coll 6 Apt. 71 \nToledo, 49938', '2020-04-28', '2020-09-24', 'True'),
(374, 'Jerónimo', 'Torres', 69465714, '1989-10-12', 612697317, 647684997, 'horaciorosado@example.com', 'Camino Ángela Noriega 25 Piso 3 \nSoria, 43874', '2021-03-13', '2022-09-22', 'True'),
(375, 'Dalila', 'Manso', 52238484, '2000-05-21', 662082546, 623768204, 'palauelvira@example.org', 'Glorieta de Lorena Abascal 8 Puerta 7 \nCuenca, 35562', '2022-08-06', '2021-12-06', 'True'),
(376, 'Anastasio', 'Grande', 65858312, '1974-07-12', 619647315, 670182630, 'iaramburu@example.net', 'Via de Haydée Iñiguez 6\nTarragona, 03525', '2020-07-31', '2020-04-06', 'True'),
(377, 'Marcio', 'Pi', 22247967, '1960-06-30', 655551769, 608259598, 'martinbernabe@example.net', 'C. Amada Vergara 11 Piso 4 \nOurense, 22402', '2021-07-18', '2020-07-02', 'True'),
(378, 'Fátima', 'Perez', 61533217, '1961-05-17', 696728181, 641057075, 'manuelita05@example.com', 'Cuesta Yago Ferrández 38 Piso 8 \nÁlava, 02853', '2020-08-12', '2021-10-20', 'True'),
(379, 'Sebastian', 'Fernández', 37623980, '1989-01-24', 605607145, 627587434, 'marcela08@example.net', 'Camino Luisa Alarcón 948\nBaleares, 51689', '2020-11-09', '2021-03-07', 'True'),
(380, 'César', 'Guzman', 55272446, '2002-03-18', 683506091, 681802238, 'marianootero@example.net', 'Cuesta de Ciriaco Priego 94\nCádiz, 06318', '2022-10-14', '2021-03-08', 'True'),
(381, 'Consuelo', 'Carretero', 59814715, '1989-04-24', 657553489, 618516213, 'carmela64@example.com', 'Ronda de Tatiana Prat 14 Puerta 9 \nSalamanca, 28199', '2022-08-30', '2022-08-19', 'True'),
(382, 'Ismael', 'Jiménez', 61567191, '1973-10-22', 673692927, 687689890, 'anabelfeliu@example.com', 'Acceso de Fabiola Lozano 46\nGirona, 51994', '2022-05-04', '2022-11-20', 'True'),
(383, 'Susana', 'Montalbán', 36757723, '1997-03-30', 645078062, 621468672, 'cardenasmiguel-angel@example.org', 'Plaza Bonifacio Castell 89\nJaén, 02820', '2021-08-23', '2023-03-28', 'True'),
(384, 'Susanita', 'Nieto', 68426368, '1964-01-08', 674805559, 622167011, 'yessica22@example.org', 'Via Victoria Pla 50 Piso 6 \nBaleares, 11103', '2023-07-14', '2020-01-20', 'True'),
(385, 'Jose Manuel', 'Torralba', 70282974, '1998-06-02', 656814715, 679351444, 'bibianamorcillo@example.com', 'Camino Carmela Recio 8\nVizcaya, 35833', '2020-07-26', '2023-08-22', 'True'),
(386, 'Juan Bautista', 'Verdú', 92510869, '1990-03-15', 651412512, 679603874, 'manuelitapinol@example.net', 'Via Sabas Nevado 4 Apt. 36 \nHuesca, 25097', '2022-05-08', '2022-09-13', 'True'),
(387, 'Azeneth', 'Garcés', 88238196, '1960-11-25', 661754359, 626963622, 'ejover@example.org', 'Acceso de Borja Mata 4 Puerta 0 \nLleida, 39833', '2023-05-09', '2022-03-29', 'True'),
(388, 'María Manuela', 'Puga', 14867554, '1960-07-13', 639041558, 641106941, 'rhernandez@example.org', 'Urbanización de Rómulo Sala 452\nGranada, 11090', '2023-08-28', '2021-02-09', 'True'),
(389, 'Arcelia', 'Oliva', 19973899, '1979-12-01', 644175049, 651773821, 'nebotalba@example.org', 'Pasadizo Gervasio Ledesma 9\nTarragona, 31812', '2021-12-06', '2021-03-17', 'True'),
(390, 'Fabricio', 'Varela', 74864774, '1965-11-25', 617813044, 620256553, 'espejobautista@example.com', 'Camino de Urbano Amo 895\nSegovia, 49875', '2023-10-26', '2021-02-27', 'True'),
(391, 'Jordi', 'Vicente', 65615579, '1961-02-16', 662099540, 678875664, 'lillojose-antonio@example.net', 'Camino de Anastasia Barros 91\nOurense, 45325', '2021-09-18', '2022-05-19', 'True'),
(392, 'Marina', 'Miró', 38012522, '1961-01-12', 696825633, 640527528, 'criadoclarisa@example.org', 'Ronda de Brígida Marco 16\nCiudad, 33028', '2023-09-10', '2020-12-29', 'True'),
(393, 'Rogelio', 'Velasco', 65430222, '1972-09-16', 674436108, 660406531, 'ainarazorrilla@example.net', 'Alameda de Maximiano Rivera 43\nSanta Cruz de Tenerife, 11718', '2021-05-10', '2021-06-22', 'True'),
(394, 'Martirio', 'Roselló', 67242469, '1963-07-09', 635853266, 675457739, 'atorres@example.net', 'Glorieta Mar Ochoa 64 Puerta 9 \nAlmería, 36509', '2020-10-08', '2021-06-02', 'True'),
(395, 'Paca', 'Miguel', 18965996, '1972-02-22', 639433965, 642612144, 'pradomacaria@example.net', 'Calle de Javi Morillo 99\nLas Palmas, 27434', '2022-01-17', '2021-03-01', 'True'),
(396, 'Rodrigo', 'Barbero', 93662465, '1982-11-15', 607831460, 623185081, 'ximenacozar@example.org', 'Cuesta Severiano Marti 6\nLeón, 23543', '2020-03-30', '2023-07-07', 'True'),
(397, 'Melisa', 'Jover', 14260243, '1965-06-16', 613758450, 616996294, 'romeroricardo@example.com', 'Paseo Toni Oliva 48\nSegovia, 06037', '2021-02-20', '2020-01-16', 'True'),
(398, 'Genoveva', 'Bayón', 38361465, '1977-07-09', 653471943, 610984218, 'paniaguajose-luis@example.net', 'Avenida de Nuria Tomé 31\nLugo, 23590', '2021-01-05', '2021-10-21', 'True'),
(399, 'Marcio', 'Olivé', 45935256, '1966-06-24', 600779104, 635496816, 'margaritabustos@example.org', 'Via Lázaro Milla 21 Puerta 2 \nHuelva, 21534', '2020-10-20', '2020-08-15', 'True'),
(400, 'Hernán', 'Lastra', 33422131, '1984-10-29', 629560423, 636444501, 'fioldesiderio@example.com', 'Alameda de Cleto Serrano 1 Piso 0 \nZaragoza, 05810', '2021-01-27', '2021-05-09', 'True'),
(401, 'Nando', 'Gimenez', 51813513, '1972-03-18', 666663363, 602010404, 'tania46@example.com', 'Callejón de Reynaldo Abella 67 Piso 0 \nLas Palmas, 45892', '2020-03-09', '2021-10-05', 'True'),
(402, 'Rosendo', 'Grande', 31942912, '1964-07-11', 635459228, 603038558, 'maxipinedo@example.org', 'Pasaje de Maribel Pi 48 Piso 4 \nHuesca, 18729', '2022-04-21', '2022-09-14', 'True'),
(403, 'Bernabé', 'Tamayo', 28256795, '1962-10-05', 631273027, 671029791, 'bernardita09@example.com', 'Calle Pepe Villena 937 Piso 3 \nNavarra, 05703', '2021-08-07', '2023-01-17', 'True'),
(404, 'Soraya', 'Amo', 61767349, '1985-05-18', 636608796, 608616806, 'companynestor@example.com', 'Callejón Alicia Luz 13\nLa Rioja, 37951', '2021-02-06', '2020-12-26', 'True'),
(405, 'Cleto', 'Olmo', 40948200, '2002-11-02', 611580680, 649698941, 'arodriguez@example.net', 'Alameda Nieves Azcona 81\nValladolid, 45176', '2022-09-08', '2021-06-01', 'True'),
(406, 'Beatriz', 'Díez', 85276841, '1999-03-07', 639302214, 699334858, 'mendezemiliano@example.com', 'Glorieta Remigio Amo 6\nGuadalajara, 39055', '2023-10-02', '2023-06-18', 'True'),
(407, 'Bartolomé', 'Villa', 92038365, '1998-06-28', 660673795, 620992890, 'xalarcon@example.net', 'Acceso de Felix Alonso 8 Apt. 96 \nSanta Cruz de Tenerife, 24782', '2023-09-03', '2022-08-26', 'True'),
(408, 'Judith', 'Marti', 46133266, '1992-05-18', 625770850, 611714027, 'laurabravo@example.com', 'Glorieta Bonifacio Salom 2 Apt. 56 \nAsturias, 22796', '2023-01-29', '2021-08-01', 'True'),
(409, 'Flavia', 'Pablo', 50272653, '1991-04-06', 607726815, 629328179, 'jescobar@example.net', 'Avenida Rogelio Gallo 40\nGuipúzcoa, 35486', '2023-07-21', '2023-07-25', 'True'),
(410, 'Paulino', 'Sanjuan', 55840081, '1958-08-10', 694011501, 698879645, 'lucenadelfina@example.com', 'Pasadizo de Ruben Guillen 12\nCeuta, 20778', '2021-12-31', '2023-09-25', 'True'),
(411, 'Salvador', 'Olmedo', 20032691, '1989-12-24', 647523226, 654021471, 'kikecanales@example.net', 'Callejón Joaquín Lumbreras 77\nAlbacete, 26339', '2020-12-15', '2021-02-03', 'True'),
(412, 'Cecilio', 'Huertas', 82899833, '1960-08-27', 602136293, 694626365, 'umancebo@example.net', 'Ronda Felicia Torrents 72\nHuelva, 46550', '2021-06-21', '2021-11-20', 'True'),
(413, 'Calista', 'Castrillo', 48209980, '1991-10-31', 690113294, 625864500, 'eligia14@example.com', 'Calle de Nando Fajardo 15 Apt. 24 \nBurgos, 07630', '2020-05-06', '2022-03-26', 'True'),
(414, 'Marcela', 'Aller', 22298800, '1988-10-31', 644261649, 653568794, 'equerol@example.net', 'Plaza de Elvira Palacio 5 Piso 6 \nBaleares, 33345', '2021-05-06', '2022-02-17', 'True'),
(415, 'Modesto', 'Mesa', 96111967, '1985-06-10', 615314766, 684937674, 'rllanos@example.net', 'Callejón de Candelaria Pintor 18 Apt. 44 \nSevilla, 27000', '2021-08-29', '2022-06-06', 'True'),
(416, 'Jose Ignacio', 'Urrutia', 24845884, '1958-02-22', 687280313, 619330892, 'olegariocasanova@example.com', 'Cañada Tania Quirós 5 Piso 8 \nSegovia, 42012', '2022-03-17', '2020-11-06', 'True'),
(417, 'Tania', 'Vall', 29771742, '1992-05-31', 662696526, 690339626, 'pio87@example.org', 'Cuesta Elena Barrio 18 Apt. 78 \nMurcia, 49961', '2021-11-22', '2020-05-29', 'True'),
(418, 'Dora', 'Salvà', 91243526, '1973-06-25', 660379440, 685509815, 'ypineiro@example.com', 'Glorieta Azucena Barral 85\nMálaga, 41068', '2021-04-26', '2022-08-22', 'True'),
(419, 'Lucila', 'Lopez', 43958790, '1968-08-25', 621745627, 654009830, 'edelmirasalas@example.net', 'Glorieta Natalia Carbajo 53\nBaleares, 05201', '2023-06-16', '2022-01-08', 'True'),
(420, 'Bautista', 'Torrens', 60720842, '1971-06-01', 629590129, 689144720, 'rinconcruz@example.com', 'Rambla de Abel Gelabert 7 Apt. 03 \nMurcia, 40690', '2020-08-06', '2022-05-26', 'True'),
(421, 'Nélida', 'Luz', 38252220, '1995-05-09', 618512130, 603428781, 'vicentaesparza@example.com', 'Cuesta de Ignacio Quero 806 Piso 4 \nLa Coruña, 20433', '2023-04-06', '2022-03-29', 'True'),
(422, 'Desiderio', 'Barros', 98324745, '1972-03-03', 690260766, 608702900, 'zsaez@example.com', 'Callejón Moreno Paniagua 35 Piso 5 \nVizcaya, 26720', '2022-01-12', '2023-08-03', 'True'),
(423, 'Jose Miguel', 'Parra', 24934165, '1990-07-19', 670525182, 630711186, 'narvaezcalisto@example.net', 'Callejón María Pilar Acevedo 132\nLleida, 15312', '2022-10-17', '2020-08-26', 'True'),
(424, 'Iván', 'Pinilla', 62422861, '1998-02-11', 629701378, 631494554, 'sevillasandra@example.net', 'Cañada de Hortensia Garcia 92 Apt. 78 \nGirona, 31038', '2020-02-12', '2020-03-25', 'True'),
(425, 'Florencia', 'Abellán', 21869738, '1962-06-02', 669721651, 647069244, 'marianaplana@example.org', 'Acceso Encarnacion Peñas 30 Apt. 88 \nLleida, 30313', '2023-09-11', '2023-05-29', 'True'),
(426, 'Jacinta', 'Tapia', 88047590, '1962-07-10', 607255916, 662201896, 'talvaro@example.org', 'Urbanización Isidora Narváez 879\nZamora, 02957', '2020-08-07', '2022-03-02', 'True'),
(427, 'Custodio', 'Mármol', 25036491, '1986-04-13', 657664322, 635573156, 'isabelacampos@example.com', 'Calle Marco Pedrosa 43 Piso 0 \nTarragona, 21481', '2022-01-19', '2023-08-15', 'True'),
(428, 'Cornelio', 'Noguera', 54269110, '1963-02-04', 663786497, 660208933, 'maxidiaz@example.com', 'Vial de Judith Benítez 8\nSanta Cruz de Tenerife, 50831', '2023-04-27', '2021-02-04', 'True'),
(429, 'Jose Angel', 'Tapia', 94198111, '1970-09-01', 655233794, 696590020, 'jose-ramon27@example.com', 'Calle de Magdalena Falcó 55\nPontevedra, 51500', '2023-08-12', '2020-10-08', 'True'),
(430, 'José María', 'Martinez', 24931795, '2005-06-29', 658062135, 637823953, 'pedrojoaquina@example.org', 'Via Fito Álamo 8 Apt. 09 \nOurense, 14575', '2023-02-08', '2023-02-09', 'True'),
(431, 'Ale', 'Navarrete', 76917902, '2002-01-07', 662666427, 606260943, 'jvila@example.org', 'Glorieta de Isabela Vidal 583\nLleida, 15991', '2022-08-25', '2022-12-18', 'True'),
(432, 'Ámbar', 'Agudo', 38471735, '1978-06-21', 605645885, 648951850, 'cristianzurita@example.com', 'Urbanización Arcelia Reina 59\nAlbacete, 31401', '2022-01-15', '2023-09-03', 'True'),
(433, 'Marta', 'Porcel', 38881823, '1982-03-17', 657997054, 602012122, 'inocencio92@example.com', 'C. de Noa Amigó 2 Apt. 90 \nValencia, 37413', '2022-02-19', '2021-06-03', 'True'),
(434, 'Begoña', 'Catalán', 76502021, '1961-05-04', 663277973, 671148278, 'palaciossara@example.org', 'Camino Pascuala Criado 5\nHuelva, 44429', '2023-07-15', '2021-04-25', 'True'),
(435, 'Inmaculada', 'Bayona', 80213066, '1971-09-08', 611889563, 614634990, 'simoncatala@example.net', 'Ronda de Adoración Tamarit 6\nAlicante, 27586', '2021-09-22', '2021-07-16', 'True'),
(436, 'Teodora', 'Riquelme', 90142536, '1982-07-12', 699266913, 646252803, 'xespinosa@example.net', 'Alameda Piedad Canet 2\nZamora, 41583', '2020-12-19', '2021-05-12', 'True'),
(437, 'Jose Ignacio', 'Cárdenas', 45858940, '1961-11-18', 679765316, 641067340, 'amarilis24@example.net', 'Callejón Gil Lerma 53 Piso 1 \nTeruel, 40059', '2021-10-13', '2021-09-23', 'True'),
(438, 'Rodrigo', 'Cortés', 28949178, '1977-11-24', 665106635, 651115379, 'uplanas@example.com', 'Pasaje Silvestre Cuenca 3 Piso 4 \nHuelva, 04566', '2021-06-23', '2021-06-29', 'True'),
(439, 'Simón', 'Borrell', 40314301, '1976-04-30', 645670271, 615455519, 'scalvo@example.net', 'Calle de Ángela Talavera 66 Piso 6 \nCáceres, 39883', '2021-07-18', '2020-01-06', 'True'),
(440, 'Néstor', 'Segovia', 20111302, '1965-01-11', 620926090, 680707808, 'nietobonifacio@example.com', 'Callejón Maximino Jáuregui 8 Apt. 05 \nBaleares, 37869', '2020-04-02', '2021-06-10', 'True'),
(441, 'Carolina', 'Raya', 19822959, '2004-10-03', 675183683, 632721651, 'domingallano@example.com', 'Callejón Amando Cardona 496\nSalamanca, 28653', '2022-07-07', '2020-08-23', 'True'),
(442, 'Luis Ángel', 'Sánchez', 43019886, '1981-02-26', 693310437, 614993210, 'naciomenendez@example.org', 'Pasaje Rufino Mayol 2 Apt. 09 \nÁvila, 45171', '2021-12-17', '2020-06-18', 'True'),
(443, 'Moisés', 'Villalobos', 99642119, '1981-08-25', 693200102, 623870306, 'adanmaxi@example.net', 'Ronda Narcisa Niño 95\nGuadalajara, 45013', '2022-02-16', '2022-06-03', 'True'),
(444, 'Azucena', 'Alvarez', 81144350, '1966-08-11', 619269831, 695725577, 'julie22@example.net', 'Paseo Sandra Cantero 78\nLa Rioja, 18779', '2020-04-19', '2022-02-16', 'True'),
(445, 'Priscila', 'Alemany', 63321184, '1996-07-20', 699274504, 618101627, 'melendezsaturnino@example.com', 'Cañada de Eli Hurtado 91\nAlbacete, 44186', '2020-08-15', '2022-08-20', 'True'),
(446, 'Chuy', 'Gallart', 19724805, '1990-12-19', 612147308, 678502481, 'maritaamat@example.net', 'Cañada Carolina Carballo 9 Apt. 12 \nCeuta, 01534', '2020-10-27', '2021-08-25', 'True'),
(447, 'Montserrat', 'Domínguez', 44714151, '1990-10-15', 616793986, 659688404, 'fgarate@example.net', 'Cañada de Íñigo Albero 43\nCórdoba, 44657', '2021-04-03', '2021-07-26', 'True'),
(448, 'Rolando', 'Blanch', 52818183, '1963-03-14', 604686759, 668210766, 'vidalhuertas@example.com', 'Rambla de Pepe Palau 71 Piso 9 \nBadajoz, 02099', '2021-05-21', '2022-04-29', 'True'),
(449, 'Reyes', 'Palomino', 71029451, '1991-08-21', 629105065, 656850824, 'rrobledo@example.com', 'Cañada de Jacinto Blanch 64\nLleida, 33508', '2022-01-30', '2022-09-12', 'True'),
(450, 'Abigaíl', 'Chamorro', 66278642, '1971-11-27', 635997363, 613282957, 'adoracionortuno@example.org', 'Alameda Ámbar Jaume 3 Apt. 46 \nPalencia, 34643', '2021-10-18', '2021-01-31', 'True'),
(451, 'Coral', 'Iglesias', 52853656, '1982-07-01', 654213553, 603323751, 'eleuterio68@example.net', 'Urbanización de Elías Leal 83 Puerta 6 \nLa Coruña, 42024', '2022-01-02', '2023-03-17', 'True'),
(452, 'Lino', 'Corominas', 19260495, '1979-07-31', 653214961, 680592107, 'carla71@example.com', 'Vial de Loida Diego 755\nAlicante, 50094', '2022-05-16', '2022-12-24', 'True'),
(453, 'Tere', 'Noriega', 33207579, '1993-11-17', 606927444, 658034155, 'maria-fernanda74@example.org', 'Avenida de Juana Martin 91\nGuadalajara, 16253', '2021-05-04', '2020-07-01', 'True'),
(454, 'Pastor', 'Pont', 16162963, '1983-07-10', 647168558, 657425937, 'ynevado@example.org', 'Urbanización de Rosalva Bermejo 12\nValencia, 28118', '2020-12-29', '2020-01-10', 'True'),
(455, 'Marco', 'Padilla', 55874216, '1988-12-26', 635095884, 683265459, 'anacletogarate@example.com', 'Via Celestina Valverde 47\nVizcaya, 51497', '2020-04-06', '2022-11-07', 'True'),
(456, 'Mónica', 'Álvarez', 85997558, '1985-11-03', 656928908, 692286074, 'soteloguillermo@example.org', 'Camino de Galo Múñiz 84 Apt. 40 \nAlmería, 51152', '2022-12-15', '2023-04-14', 'True'),
(457, 'Melania', 'Ruano', 37595594, '2003-02-01', 682484393, 694560289, 'falcoyaiza@example.net', 'Cuesta Marta Casas 65\nBurgos, 26968', '2021-03-14', '2020-01-04', 'True'),
(458, 'Horacio', 'Villalonga', 45144665, '1973-02-18', 684769226, 626864749, 'salmeronamada@example.net', 'C. Maite Espinosa 10\nJaén, 42242', '2022-09-01', '2020-05-29', 'True'),
(459, 'Ramón', 'Viñas', 83056012, '1983-08-04', 617697314, 674358685, 'pepe42@example.com', 'Paseo de Glauco Quintero 244 Apt. 29 \nBurgos, 17274', '2020-10-15', '2022-04-17', 'True'),
(460, 'María Belén', 'Chico', 34915801, '1986-02-16', 692692062, 691834079, 'kvalls@example.com', 'Vial de Elías Pavón 14 Apt. 42 \nTeruel, 27544', '2023-06-21', '2022-05-26', 'True'),
(461, 'Olivia', 'Fábregas', 88996831, '1969-03-23', 641173046, 648074467, 'fabioarellano@example.org', 'C. Cristina Carreño 9\nSegovia, 34615', '2021-10-28', '2020-05-21', 'True'),
(462, 'Álvaro', 'Zamora', 75270544, '1971-02-09', 642087658, 675808741, 'soteloalbina@example.org', 'C. Úrsula Mora 41\nCuenca, 01010', '2022-07-12', '2020-10-19', 'True'),
(463, 'Miguel Ángel', 'Gámez', 17605698, '2000-08-06', 656364652, 621869214, 'ericagullo@example.org', 'Rambla de Heriberto Hernando 611 Puerta 3 \nMálaga, 32664', '2023-03-06', '2020-12-27', 'True'),
(464, 'Prudencia', 'Arco', 24743080, '1970-05-09', 690242981, 615400447, 'palomarnilda@example.org', 'Acceso de Tadeo Saavedra 350 Puerta 1 \nBarcelona, 19801', '2020-12-27', '2020-07-29', 'True'),
(465, 'Julieta', 'León', 52854899, '1961-04-28', 640040290, 608238189, 'valeraluisina@example.org', 'Plaza Otilia Perelló 59 Piso 4 \nBadajoz, 13731', '2022-11-14', '2023-02-28', 'True'),
(466, 'Adriana', 'Escalona', 46666024, '1963-03-04', 688984276, 618255941, 'xpuig@example.com', 'Avenida de Nélida Escalona 46 Apt. 08 \nOurense, 10055', '2021-06-28', '2023-05-31', 'True'),
(467, 'Ana Sofía', 'Carpio', 49486429, '2004-04-13', 635486401, 630746608, 'gguijarro@example.com', 'Callejón de Maribel Villena 931 Apt. 93 \nGuipúzcoa, 33674', '2022-09-27', '2021-12-04', 'True'),
(468, 'Amalia', 'Agustín', 90060134, '1967-08-12', 680958137, 684664061, 'meleroangelica@example.com', 'Alameda María Teresa Vallés 345 Puerta 9 \nTarragona, 49669', '2022-03-30', '2021-06-14', 'True'),
(469, 'Socorro', 'Cuesta', 74674409, '2004-09-12', 603608725, 656344299, 'clarisa28@example.com', 'C. de Nacho Calderon 41\nAlmería, 36420', '2020-02-09', '2020-12-04', 'True'),
(470, 'Ruperto', 'Cerdá', 42251413, '1994-03-19', 685836318, 639273911, 'ballesterospio@example.com', 'Rambla de Febe Lerma 68\nJaén, 38645', '2023-02-14', '2023-08-26', 'True'),
(471, 'Jovita', 'Valcárcel', 92447433, '1974-03-11', 673755500, 633337017, 'juan-luis83@example.com', 'Paseo de Gerónimo Reina 14 Apt. 45 \nBadajoz, 23141', '2022-03-24', '2020-09-12', 'True'),
(472, 'Carlota', 'Benet', 21922335, '1971-04-08', 616215981, 609747202, 'aisern@example.net', 'Glorieta de Flor Roura 91 Puerta 7 \nCórdoba, 09345', '2022-09-14', '2023-09-03', 'True'),
(473, 'Inmaculada', 'Pombo', 61908880, '1988-06-24', 656171076, 627862296, 'amor61@example.com', 'C. de Luz Guerra 65 Apt. 57 \nTarragona, 18792', '2020-02-26', '2020-11-07', 'True'),
(474, 'Anabel', 'Bilbao', 76746602, '2005-07-22', 605388144, 628038823, 'mohamedalberdi@example.org', 'Alameda de Prudencia Casals 14\nMálaga, 09769', '2021-11-01', '2022-12-26', 'True'),
(475, 'Victor Manuel', 'Sanz', 64724798, '1992-12-17', 649065532, 674169099, 'reyna15@example.com', 'Paseo Renata Olmedo 8\nNavarra, 26561', '2021-01-27', '2021-09-05', 'True'),
(476, 'Seve', 'Rivero', 76835268, '1977-08-25', 679157291, 606716713, 'timoteo35@example.org', 'Plaza Pablo Palomo 17\nMadrid, 23960', '2022-08-05', '2021-09-28', 'True'),
(477, 'Federico', 'Mata', 37937569, '1978-04-04', 682366776, 678119482, 'maritaalsina@example.net', 'Calle de Rosalina Tomé 60 Apt. 76 \nValencia, 36965', '2020-03-02', '2021-04-22', 'True'),
(478, 'Bernardo', 'Durán', 91170859, '1985-04-30', 655350878, 690149851, 'abel04@example.org', 'Acceso de Amador Costa 82\nCeuta, 03296', '2022-12-29', '2023-04-17', 'True'),
(479, 'Vilma', 'Pomares', 76567578, '1984-10-16', 628081616, 631869801, 'cebrian27@example.net', 'Pasaje de Araceli Goicoechea 56\nBurgos, 06283', '2020-10-28', '2023-10-21', 'True'),
(480, 'Natividad', 'Uribe', 61934494, '1959-01-19', 669524658, 694579142, 'rogelio97@example.org', 'Pasadizo de Mirta Pérez 14 Apt. 97 \nCórdoba, 34517', '2023-10-25', '2023-06-30', 'True'),
(481, 'Íñigo', 'Pagès', 33991912, '1964-08-05', 615204423, 663067305, 'yolanda33@example.com', 'Rambla de Baldomero Nevado 36 Apt. 89 \nCádiz, 27296', '2022-05-30', '2020-08-28', 'True'),
(482, 'Jovita', 'Andres', 16595942, '1993-12-17', 620727056, 643283666, 'ramona62@example.org', 'Pasadizo Ismael Román 674\nPontevedra, 24979', '2020-06-13', '2021-05-11', 'True'),
(483, 'Samuel', 'Manzano', 84590147, '2000-02-19', 637716321, 647324906, 'angelinofortuny@example.net', 'Glorieta de Elisabet Huertas 334\nCeuta, 24451', '2023-05-15', '2022-11-09', 'True'),
(484, 'Salud', 'Gómez', 32796969, '1987-05-16', 625714357, 622881427, 'naranjoclemente@example.com', 'Acceso Olivia Herrero 65 Apt. 05 \nNavarra, 32239', '2020-11-20', '2022-12-07', 'True'),
(485, 'Adelaida', 'Acevedo', 51870100, '1994-12-30', 609317820, 681231427, 'gzabaleta@example.net', 'Glorieta Poncio Diego 9 Piso 7 \nSevilla, 13494', '2023-03-13', '2022-01-01', 'True'),
(486, 'Eustaquio', 'Solís', 80443732, '1976-07-28', 611033664, 600046701, 'cebrian86@example.org', 'Cañada de Cecilia Jove 87\nTeruel, 41015', '2020-04-20', '2023-03-14', 'True'),
(487, 'María José', 'Román', 30001084, '1974-06-13', 628176552, 674817766, 'salomefajardo@example.org', 'Pasaje Mateo Montero 10 Puerta 0 \nZaragoza, 04374', '2021-08-07', '2023-07-01', 'True'),
(488, 'Feliciana', 'Vives', 27007832, '1972-02-26', 660739190, 661809754, 'walter39@example.org', 'Vial de Azeneth Ballester 36\nCeuta, 24045', '2022-04-14', '2020-12-22', 'True'),
(489, 'Nacho', 'Palacio', 28251513, '1964-05-09', 638318679, 614936294, 'gracianamartin@example.net', 'Pasadizo Ángela Sanjuan 42 Puerta 4 \nÁvila, 22463', '2021-02-14', '2023-07-03', 'True'),
(490, 'Aurora', 'Diez', 35732402, '1981-07-21', 664573922, 666126003, 'tejedormariana@example.com', 'Glorieta de Damián Benavides 8 Apt. 20 \nPalencia, 12562', '2021-12-19', '2023-07-06', 'True'),
(491, 'Eugenia', 'Morante', 97379711, '1979-12-27', 632958893, 695179614, 'zacarias35@example.org', 'C. Morena Marti 9 Piso 7 \nPalencia, 36472', '2020-08-13', '2021-03-07', 'True'),
(492, 'Ainara', 'Aparicio', 83502972, '1981-10-01', 676439060, 670957610, 'anacletolarranaga@example.net', 'Plaza Paco Gutiérrez 27\nLa Rioja, 22718', '2021-11-21', '2022-06-06', 'True'),
(493, 'Américo', 'Carvajal', 23274992, '2003-12-21', 627348260, 637733951, 'vlledo@example.net', 'Glorieta de Abraham Antúnez 243 Apt. 06 \nAsturias, 05383', '2021-08-02', '2020-05-11', 'True'),
(494, 'Custodio', 'Priego', 37783929, '2003-06-17', 609716147, 655789227, 'reciochema@example.com', 'Calle de Anabel Peña 391 Puerta 5 \nCuenca, 40281', '2021-08-23', '2023-08-07', 'True'),
(495, 'Noa', 'Rosa', 63363275, '1975-03-30', 647539755, 639579900, 'barraltrinidad@example.com', 'C. Nilda Diez 29\nTarragona, 33720', '2022-03-06', '2021-09-21', 'True'),
(496, 'Jesús', 'Ruiz', 91363196, '1987-11-23', 604802588, 665190866, 'herminiagaray@example.org', 'Via José Córdoba 86 Piso 6 \nCádiz, 50712', '2021-08-24', '2020-11-25', 'True'),
(497, 'Adalberto', 'Puig', 63300727, '1986-01-24', 678026528, 614458758, 'patriciagascon@example.net', 'Cuesta Román Frutos 42\nLugo, 23321', '2021-03-11', '2020-08-21', 'True'),
(498, 'Melchor', 'Salinas', 41151359, '1985-07-10', 600032565, 667256278, 'alfaromarcos@example.net', 'Pasaje de Tecla Mesa 622\nSalamanca, 26959', '2022-09-04', '2022-02-15', 'True'),
(499, 'Benita', 'Cabo', 46586322, '2000-07-27', 604264217, 663115903, 'iluis@example.org', 'Via de Josep Giner 6\nBadajoz, 48899', '2021-03-06', '2023-09-15', 'True');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `cliente_id_id` int(11) NOT NULL,
  `empleado_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(8, 'api', 'cliente'),
(9, 'api', 'compra'),
(10, 'api', 'empleado'),
(20, 'api', 'ingresan'),
(11, 'api', 'ingresos'),
(19, 'api', 'lineadetalle'),
(12, 'api', 'materiaprima'),
(18, 'api', 'pedido'),
(17, 'api', 'producen'),
(13, 'api', 'producto'),
(14, 'api', 'proveedor'),
(16, 'api', 'proveen'),
(15, 'api', 'registra'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(6, 'usuarios', 'area'),
(7, 'usuarios', 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-10-30 03:05:37.227811'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-10-30 03:05:37.261829'),
(3, 'auth', '0001_initial', '2023-10-30 03:05:37.402445'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-10-30 03:05:37.433688'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-10-30 03:05:37.433688'),
(6, 'auth', '0004_alter_user_username_opts', '2023-10-30 03:05:37.449311'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-10-30 03:05:37.449311'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-10-30 03:05:37.449311'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-10-30 03:05:37.449311'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-10-30 03:05:37.464931'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-10-30 03:05:37.464931'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-10-30 03:05:37.480552'),
(13, 'auth', '0011_update_proxy_permissions', '2023-10-30 03:05:37.480552'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-10-30 03:05:37.480552'),
(15, 'usuarios', '0001_initial', '2023-10-30 03:05:37.699252'),
(16, 'admin', '0001_initial', '2023-10-30 03:05:37.777359'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-10-30 03:05:37.792981'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-30 03:05:37.792981'),
(19, 'api', '0001_initial', '2023-10-30 03:05:38.292872'),
(20, 'api', '0002_alter_compra_estado_alter_ingresos_estado_and_more', '2023-10-30 03:05:38.292872'),
(21, 'api', '0003_remove_producto_fecha_produccion', '2023-10-30 03:05:38.308516'),
(22, 'sessions', '0001_initial', '2023-10-30 03:05:38.339728'),
(23, 'usuarios', '0002_alter_usuario_area_alter_usuario_direccion_and_more', '2023-10-30 03:05:38.641817'),
(24, 'usuarios', '0003_usuario_correo', '2023-10-30 03:05:38.674487'),
(25, 'usuarios', '0004_alter_usuario_correo', '2023-10-30 03:05:38.713841'),
(26, 'usuarios', '0005_alter_usuario_correo', '2023-10-30 03:05:38.771546'),
(27, 'usuarios', '0006_remove_usuario_correo', '2023-10-30 03:05:38.791395'),
(28, 'usuarios', '0007_alter_area_codigo_alter_area_nombre', '2023-10-30 03:05:38.849170');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int(11) NOT NULL,
  `nombres` varchar(80) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `fec_nac` date DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `celular_alt` int(11) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `nombres`, `apellido`, `dni`, `fec_nac`, `celular`, `celular_alt`, `email`, `direccion`, `salario`, `area`, `cargo`, `desde`, `hasta`, `fecha_creacion`, `fecha_modificacion`, `estado`) VALUES
(1, 'Zoraida', 'Galán', 14711754, '1994-07-13', 647507440, 692031982, 'vallejoflorina@example.com', 'Rambla de Marciano Cobos 21\nVizcaya, 10230', '43906.55', 'Guardagujas', 'Empleado de centro de llamadas', '2020-01-26', '2020-03-30', '2023-08-04', '2022-08-01', 'True'),
(2, 'Marino', 'Olivera', 20989310, '1982-12-06', 613472738, 697792224, 'ipinedo@example.net', 'Vial de Ariel Fuster 91\nCantabria, 34858', '47734.06', 'Pulidor de metales y afilador de herramientas', 'Operario de la conservación de frutas, legumbres y verduras', '2022-09-27', '2022-08-21', '2022-11-27', '2022-01-24', 'True'),
(3, 'Jessica', 'Pujadas', 60665272, '1967-02-09', 693387221, 682312313, 'umate@example.com', 'Alameda Cipriano Navas 8\nCáceres, 36690', '63384.43', 'Entrevistador de encuestas', 'Trabajador agrícola de subsistencia', '2021-01-21', '2019-09-07', '2022-06-08', '2023-10-01', 'True'),
(4, 'Ibán', 'Tejada', 44942268, '2003-07-02', 634512902, 630442384, 'zamoranososimo@example.com', 'C. Juan Estévez 6 Piso 0 \nGranada, 18911', '34402.02', 'Costurero', 'Secretario jurídicos', '2019-03-11', '2023-05-21', '2021-03-10', '2023-03-30', 'True'),
(5, 'Mauricio', 'Sola', 64980416, '1993-05-24', 661910885, 647706437, 'ajuarez@example.net', 'Callejón Francisco Jose Carro 47\nBadajoz, 07698', '69044.94', 'Analista de sistemas', 'Nutricionista', '2023-02-12', '2020-11-22', '2020-09-05', '2023-10-08', 'True'),
(6, 'Constanza', 'Rico', 60765460, '1990-09-28', 600962973, 636525801, 'azconavictor@example.net', 'Cuesta Juan Francisco Miró 77\nAsturias, 34460', '31428.79', 'Peletero', 'Chapista', '2019-02-14', '2019-07-05', '2023-10-05', '2023-02-19', 'True'),
(7, 'Iker', 'Vives', 85844651, '2001-07-14', 633370887, 678467474, 'espinosamarcio@example.org', 'Camino de Lara Sureda 40\nAlmería, 50732', '71184.90', 'Profesional de enfermería', 'Profesional de nivel medio de medicina tradicional y alternativa', '2019-03-10', '2019-04-06', '2020-12-14', '2020-02-05', 'True'),
(8, 'Rocío', 'Amigó', 85782257, '2005-08-20', 649237275, 637980088, 'zdonoso@example.org', 'Paseo de Bonifacio Pla 92\nJaén, 03961', '49602.53', 'Buzo', 'Empleado del servicio de personal', '2022-09-12', '2022-04-30', '2021-09-03', '2022-02-08', 'True'),
(9, 'César', 'Yáñez', 28868269, '1991-10-26', 650689987, 641331329, 'garridoafrica@example.net', 'Camino de Plinio Mur 83\nMálaga, 19340', '26472.57', 'Veterinario', 'Profesional religioso', '2020-07-28', '2018-12-29', '2022-06-27', '2022-08-17', 'True'),
(10, 'Manuelita', 'Palomo', 23363453, '1991-03-11', 659411781, 614098777, 'malbero@example.com', 'Alameda de Azeneth Gimeno 55 Piso 6 \nLugo, 21660', '47468.53', 'Operador de máquinas de preparación de fibras, hilado y devanado', 'Profesional religioso', '2021-07-05', '2021-02-14', '2022-05-13', '2020-11-23', 'True'),
(11, 'Diego', 'Gil', 87055800, '1963-03-07', 661162121, 663368644, 'virginia67@example.com', 'Pasaje Otilia Antón 15 Piso 9 \nSevilla, 27311', '43525.24', 'Profesional de nivel medio de medicina tradicional y alternativa', 'Mecánico y reparador en electrónica', '2019-07-01', '2022-02-16', '2022-05-01', '2021-08-20', 'True'),
(12, 'Marina', 'Luz', 95019247, '1967-04-17', 665980185, 623847119, 'zpalomares@example.org', 'Via Daniel Bermúdez 88 Piso 2 \nSanta Cruz de Tenerife, 11040', '25452.67', 'Maestro de enseñanza primaria', 'Técnico de prótesis médicas y dentales', '2021-08-24', '2020-04-30', '2020-06-06', '2022-08-08', 'True'),
(13, 'Amado', 'Valenzuela', 64878104, '1983-06-12', 640294662, 673665966, 'herasvicenta@example.com', 'Vial de Patricio Elorza 15 Piso 2 \nLugo, 20792', '67361.67', 'Sociólogo', 'Agrimensor', '2019-08-09', '2021-10-27', '2022-01-19', '2023-01-11', 'True'),
(14, 'Rosendo', 'Bermudez', 99402535, '1988-12-19', 616008472, 688597901, 'almafonseca@example.net', 'Avenida de Jose Ramón Gracia 37 Apt. 03 \nTeruel, 39839', '65482.47', 'Diseñador de prendas', 'Zoólogo', '2022-01-30', '2019-04-22', '2023-08-22', '2021-07-29', 'True'),
(15, 'Sergio', 'Agustín', 39136202, '1994-03-27', 612773961, 679656617, 'abilio97@example.org', 'Ronda de Inmaculada Oliver 72 Apt. 04 \nSoria, 10084', '23607.68', 'Estadístico', 'Mecánico y reparador de máquinas agrícolas e industriales', '2018-11-04', '2022-06-01', '2020-08-14', '2020-04-07', 'True'),
(16, 'Gabriela', 'Cano', 25760044, '1979-03-11', 680277783, 611268929, 'luciano03@example.com', 'C. de Eva María Padilla 25\nHuelva, 02815', '72933.41', 'Fabricante de instrumentos musicales', 'Instalador y reparador de líneas eléctricas', '2022-11-30', '2020-12-18', '2023-10-26', '2023-04-27', 'True'),
(17, 'Morena', 'Alcaraz', 77732227, '1958-11-10', 681727286, 616100023, 'leire12@example.net', 'C. de Ximena Quirós 4 Apt. 73 \nCastellón, 28535', '21774.87', 'Zapatero', 'Perforador y sondista de pozos', '2020-02-06', '2021-06-15', '2020-05-10', '2020-03-13', 'True'),
(18, 'Elodia', 'Roma', 17884324, '2005-04-25', 636081321, 627573053, 'fmartinez@example.net', 'Avenida Perlita Gómez 66\nSevilla, 08808', '26242.47', 'Profesor de música', 'Vendedor ambulantes de productos comestibles', '2023-10-28', '2020-09-17', '2022-12-05', '2022-03-13', 'True'),
(19, 'Victor Manuel', 'Sainz', 28737646, '1995-11-25', 693531663, 658059988, 'florbellido@example.com', 'Acceso de María Manuela Arco 67\nCeuta, 26874', '33036.75', 'Paisajista', 'Oficial maquinistas en navegación', '2020-05-27', '2022-08-03', '2020-04-13', '2020-06-05', 'True'),
(20, 'Francisco Javier', 'Sotelo', 76922199, '1996-03-11', 650636842, 694746963, 'alfredobustos@example.net', 'Calle de Daniela Cuadrado 79 Puerta 2 \nAsturias, 15161', '48640.53', 'Conductor de camiones pesados', 'Miembro de las fuerzas armadas', '2022-01-22', '2019-05-29', '2021-11-11', '2023-03-20', 'True'),
(21, 'Atilio', 'Palomar', 99570494, '1959-10-26', 626791660, 693469539, 'rogeliosegura@example.net', 'Camino Álvaro Carnero 204\nCuenca, 45472', '72949.94', 'Lavandero', 'Bailarín', '2021-07-07', '2019-11-17', '2022-09-16', '2023-06-16', 'True'),
(22, 'Feliciana', 'Alcolea', 20134881, '1970-02-20', 628522601, 611683194, 'maria-del-carmenbastida@example.com', 'Cuesta Celestino Figueroa 8\nSegovia, 25397', '69815.06', 'Dibujante técnico', 'Laminador de vidrio', '2022-02-17', '2023-03-21', '2022-06-12', '2021-11-15', 'True'),
(23, 'María Cristina', 'Roca', 26105305, '1968-03-21', 610077675, 684906370, 'pedro77@example.org', 'Paseo Cándido Núñez 47\nValladolid, 29569', '21555.33', 'Peón forestales', 'Técnico en química industrial', '2022-04-04', '2021-03-17', '2022-10-31', '2023-10-28', 'True'),
(24, 'Jenny', 'Larrea', 33931752, '1962-03-28', 614039664, 667289849, 'wgomis@example.org', 'Glorieta de Lorenza Gordillo 57 Piso 3 \nCuenca, 21674', '32224.74', 'Empleado de contabilidad y cálculo de costos', 'Platero', '2020-04-01', '2023-04-20', '2020-05-12', '2022-03-25', 'True'),
(25, 'Ascensión', 'Huertas', 36371721, '2003-05-24', 624221666, 601192126, 'joel65@example.com', 'Cuesta Eusebia Ordóñez 9\nPalencia, 11998', '40851.80', 'Inspector de policía', 'Empleado de biblioteca', '2019-06-23', '2019-12-20', '2021-01-05', '2021-02-07', 'True'),
(26, 'Bernardita', 'Lasa', 61949820, '1968-01-15', 690173325, 690240327, 'zcamara@example.com', 'Vial de Pelayo Tejera 509\nÁvila, 18885', '79175.02', 'Operador de máquinas de preparación de fibras, hilado y devanado', 'Profesional de nivel medio en actividades culturales y artísticas', '2022-11-20', '2023-07-02', '2021-06-14', '2021-05-05', 'True'),
(27, 'Encarna', 'Coloma', 65012780, '1997-02-11', 687944055, 658417756, 'tomasismael@example.org', 'Camino Gilberto Carbó 359 Apt. 26 \nZaragoza, 40845', '52893.68', 'Controlador de tráfico aéreo', 'Director de servicios de salud', '2020-12-23', '2020-05-31', '2020-02-16', '2020-03-01', 'True'),
(28, 'Román', 'Bernal', 77930281, '1983-08-20', 667209064, 680457000, 'reyes06@example.org', 'Glorieta Chita Luís 55 Puerta 6 \nBadajoz, 27293', '61592.12', 'Cartógrafo', 'Detective', '2022-12-29', '2020-04-05', '2020-08-04', '2020-06-14', 'True'),
(29, 'Guillermo', 'Salvador', 46574341, '2000-05-28', 627385056, 636704387, 'gaston72@example.com', 'Cañada Angélica Barón 1\nMálaga, 08234', '34213.21', 'Operador de máquinas de coser', 'Lavador de vehículos', '2022-12-22', '2019-12-06', '2022-09-22', '2023-03-15', 'True'),
(30, 'Sebastián', 'Naranjo', 48574001, '1978-02-25', 664737936, 684678034, 'aleuribe@example.org', 'Calle Mercedes Sainz 79 Apt. 22 \nGuipúzcoa, 02111', '58111.34', 'Conductor de vehículos y máquinas de tracción animal', 'Pescador, cazador, tramperos y recolector de subsistencia', '2020-05-01', '2019-05-25', '2021-08-20', '2022-07-04', 'True'),
(31, 'Federico', 'Arias', 80454761, '1975-04-14', 668068682, 651329072, 'corona33@example.org', 'Glorieta Bernardino Cuevas 71\nLas Palmas, 11242', '78090.06', 'Geólogo', 'Técnico en química industrial', '2021-12-14', '2022-03-09', '2023-01-28', '2020-07-16', 'True'),
(32, 'Teodosio', 'Tirado', 49970438, '1996-06-11', 611102788, 648204584, 'bvara@example.org', 'Calle de Ruy Girón 39\nSoria, 40791', '60922.69', 'Estadístico', 'Peón de explotaciones de cultivos mixtos y ganaderos', '2023-07-24', '2022-11-21', '2020-07-15', '2020-07-12', 'True'),
(33, 'Natividad', 'Carrasco', 35094360, '1986-03-26', 614540011, 657262818, 'portagala@example.net', 'Acceso de Tania Macias 53 Piso 4 \nMálaga, 01073', '63915.97', 'Ingeniero químico', 'Médico especialista', '2021-12-03', '2019-07-29', '2023-06-17', '2022-10-16', 'True'),
(34, 'Gervasio', 'Acedo', 70365989, '1962-08-15', 685173505, 695394977, 'kcarrera@example.org', 'Rambla de Leonor Núñez 84\nSanta Cruz de Tenerife, 44376', '69625.05', 'Dentista', 'Limpiador y asistente doméstico', '2019-08-02', '2023-03-14', '2020-12-27', '2021-11-17', 'True'),
(35, 'Victor', 'Quintanilla', 35991748, '1979-07-15', 642588454, 607658136, 'darenas@example.com', 'Plaza Clementina Escudero 24 Puerta 1 \nPalencia, 45341', '26413.63', 'Técnico en ingeniería civil', 'Dentista', '2023-08-13', '2019-04-29', '2020-11-19', '2023-09-28', 'True'),
(36, 'Nacho', 'Fajardo', 57149113, '1991-03-22', 623521606, 699510218, 'granadosfrancisca@example.net', 'Acceso Amador Guerrero 61 Piso 1 \nPalencia, 43946', '23035.66', 'Peón de obras públicas y mantenimiento', 'Instalador y reparador de líneas eléctricas', '2022-02-18', '2020-10-15', '2021-07-21', '2023-06-22', 'True'),
(37, 'Fito', 'Casanovas', 43263615, '1986-01-23', 619842106, 645787287, 'bmatas@example.com', 'Alameda de Herminio Suarez 76 Puerta 1 \nCáceres, 05132', '45965.98', 'Ingeniero industrial', 'Educador para necesidades especiales', '2020-02-26', '2023-04-02', '2020-01-19', '2020-10-12', 'True'),
(38, 'Laura', 'Sans', 20169993, '1972-02-05', 615521154, 669932558, 'queropetrona@example.org', 'Cuesta Flora Roselló 770 Apt. 44 \nLleida, 26277', '22658.70', 'Inspector medioambiental y afines', 'Operador de instalaciones de refinación de petróleo y gas natural', '2019-03-30', '2022-05-15', '2021-01-26', '2023-05-03', 'True'),
(39, 'Yolanda', 'Llobet', 13358305, '2002-12-01', 604626134, 667028347, 'acifuentes@example.net', 'Callejón de Angélica Malo 668\nLeón, 26362', '77823.71', 'Maestro preescolar', 'Peón de explotaciones ganaderas', '2022-09-08', '2023-10-15', '2020-04-17', '2021-09-18', 'True'),
(40, 'Susanita', 'Royo', 27754031, '2003-03-17', 667390316, 672716669, 'aguilarprudencio@example.org', 'Acceso de Haroldo Guzman 4 Piso 4 \nCádiz, 03502', '73917.27', 'Músico', 'Peón de carga', '2020-10-12', '2019-11-05', '2021-04-14', '2022-12-08', 'True'),
(41, 'Fabiola', 'Anguita', 96108048, '2001-07-23', 632418012, 625763575, 'heliodoro93@example.org', 'Vial Isabela Salvà 81 Puerta 6 \nSegovia, 38514', '59624.91', 'Administrador de bases de datos', 'Fumigador', '2020-01-29', '2023-02-18', '2021-09-30', '2021-09-17', 'True'),
(42, 'Evelia', 'Solé', 11335407, '1989-10-27', 673169079, 671937948, 'felicidad33@example.org', 'Acceso de Maricruz Sanjuan 6\nJaén, 14316', '31010.20', 'Mecánico y ajustador electricista', 'Cortador de vidrio', '2022-08-31', '2022-06-21', '2023-05-19', '2020-04-24', 'True'),
(43, 'Nicanor', 'Herrera', 56376780, '1994-06-28', 623019221, 655996461, 'inmaculadacruz@example.org', 'Cañada Glauco Girón 89\nLa Rioja, 05311', '45066.88', 'Empleado del servicio de personal', 'Guardia de protección', '2020-05-09', '2023-07-10', '2023-06-04', '2023-03-04', 'True'),
(44, 'Victorino', 'Alegre', 74496206, '2004-03-23', 612512756, 671991367, 'maragon@example.net', 'Pasaje Modesta Bejarano 922\nAsturias, 17001', '71915.08', 'Escritor', 'Mecánico y reparador de motores de avión', '2022-04-16', '2022-11-25', '2023-09-02', '2022-11-08', 'True'),
(45, 'Belén', 'Roldan', 79728861, '1998-09-17', 600365798, 631126701, 'novoacarla@example.org', 'Pasaje de Edu Mariño 98 Puerta 8 \nHuesca, 32604', '56105.58', 'Profesional de medicina alternativa', 'Operador de instalaciones de tratamiento de agua', '2022-07-01', '2023-03-09', '2022-08-27', '2020-08-30', 'True'),
(46, 'Dafne', 'Bárcena', 24290106, '1994-01-07', 642430791, 607711937, 'carmela43@example.org', 'Vial de Eusebio Carrera 106 Apt. 59 \nMálaga, 23945', '52881.50', 'Bombero', 'Profesional de partería', '2021-01-10', '2021-01-23', '2021-07-14', '2022-02-16', 'True'),
(47, 'Cosme', 'Jáuregui', 15023852, '1986-11-15', 694095331, 650807489, 'irene11@example.org', 'Calle de Lucila Carballo 21\nSoria, 08483', '34075.34', 'Productor y trabajador calificado de explotaciones agropecuarias mixtas', 'Gestor de aduana', '2018-11-13', '2019-03-07', '2022-04-26', '2020-01-28', 'True'),
(48, 'Leonardo', 'Coll', 35198733, '1995-11-06', 697225606, 664756351, 'patricio49@example.org', 'Cuesta de Pascuala Tamayo 4 Piso 5 \nLa Coruña, 05807', '77083.81', 'Lavandero', 'Impresor', '2021-03-27', '2023-09-27', '2022-06-01', '2020-12-20', 'True'),
(49, 'Esperanza', 'Tur', 46196745, '1966-03-05', 683703964, 640793873, 'wfarre@example.net', 'Vial de María Carmen Llano 53 Apt. 84 \nGranada, 06304', '45501.36', 'Carpintero', 'Ensamblador de maquinaria mecánica', '2023-10-21', '2021-12-24', '2020-12-22', '2020-05-11', 'True');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresan`
--

CREATE TABLE `ingresan` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(12,2) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `ingreso_id_id` int(11) NOT NULL,
  `materia_prima_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineadetalle`
--

CREATE TABLE `lineadetalle` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(12,2) DEFAULT NULL,
  `pedido_id_id` int(11) NOT NULL,
  `producto_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_prima`
--

CREATE TABLE `materia_prima` (
  `id` int(11) NOT NULL,
  `plastico` varchar(100) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `presentacion` varchar(100) DEFAULT NULL,
  `stock_act` int(11) DEFAULT NULL,
  `stock_inf` int(11) DEFAULT NULL,
  `precio` decimal(12,2) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materia_prima`
--

INSERT INTO `materia_prima` (`id`, `plastico`, `descripcion`, `presentacion`, `stock_act`, `stock_inf`, `precio`, `fecha_creacion`, `fecha_modificacion`, `estado`) VALUES
(1, 'PS', 'Fugit commodi pariatur enim vitae dolore at. Alias hic soluta alias mollitia ab praesentium.', 'Caja de madera', 423, 27, '34.55', '2023-07-07', '2022-04-25', 'True'),
(2, 'PP', 'Pariatur doloribus corrupti dignissimos cum tenetur. Iure natus et quae ipsa unde dolor.\nFuga occaecati aliquam non corporis aspernatur dolorem.', 'Caja de carton', 190, 44, '91.27', '2023-07-07', '2021-07-19', 'True'),
(3, 'PET', 'Corporis debitis voluptates iste perferendis nulla perferendis. Ea amet optio minima similique. Iure ipsa aliquid.', 'Simple', 299, 39, '64.46', '2022-12-01', '2021-07-21', 'True'),
(4, 'PEBD', 'Eveniet pariatur laborum. Ut iusto amet. Beatae repudiandae ad distinctio voluptates reiciendis exercitationem.', 'Caja de madera', 896, 45, '99.36', '2022-11-16', '2022-01-18', 'True'),
(5, 'PVC', 'Facere modi aliquam. Ratione harum impedit ipsam maiores totam deleniti. Sapiente amet quis aliquam ex unde.', 'Caja de madera', 977, 25, '52.59', '2020-11-16', '2023-04-27', 'True'),
(6, 'PS', 'Non earum animi. Aut voluptates labore non.', 'Caja de carton', 389, 32, '39.21', '2021-12-25', '2020-01-28', 'True'),
(7, 'PVC', 'Eveniet quidem veniam ad voluptatem assumenda. Nam vitae vero ipsam distinctio.', 'Simple', 926, 37, '29.45', '2021-02-16', '2020-06-18', 'True'),
(8, 'PVC', 'Fugit rerum ipsum sed fugiat non inventore. Ad placeat consectetur distinctio quasi voluptates distinctio.', 'Caja de madera', 615, 46, '60.63', '2021-09-06', '2023-09-13', 'True'),
(9, 'PET', 'Maxime praesentium praesentium nesciunt modi minus quae. Quas fugiat pariatur ab iste nobis voluptates maxime. Aut vel dicta quaerat quas.', 'Caja de carton', 742, 26, '27.93', '2022-10-13', '2023-01-21', 'True'),
(10, 'PP', 'Eligendi voluptates aspernatur. Quasi eligendi ipsum repudiandae illo. Ratione aliquid eos illo sequi corporis.', 'Simple', 16, 39, '94.95', '2022-09-12', '2021-12-08', 'True'),
(11, 'PET', 'Rerum quae voluptatum quaerat officia. Maiores velit nam quibusdam qui fuga maiores deleniti. Sunt numquam inventore sunt ut voluptates.', 'Caja de madera', 615, 37, '30.34', '2021-03-23', '2020-01-14', 'True'),
(12, 'PET', 'Fugit ab quas rem expedita error. Illo tenetur amet quam error asperiores inventore.', 'Caja de carton', 808, 49, '9.59', '2022-09-06', '2020-02-07', 'True'),
(13, 'PS', 'Sit aperiam porro est. Velit quibusdam et provident dolores ex. Eligendi id blanditiis nihil fugit natus aliquid.', 'Caja de carton', 790, 50, '51.92', '2020-02-11', '2023-02-12', 'True'),
(14, 'PS', 'Cupiditate sunt hic impedit libero illum. Ipsum totam nisi architecto perferendis. Impedit laboriosam saepe magni optio excepturi.', 'Bolsa', 496, 41, '26.78', '2022-10-08', '2021-04-05', 'True'),
(15, 'PEBD', 'Quia ipsa quaerat fugiat rerum eaque. Modi optio deserunt debitis. Vero sed rerum vero aperiam consequuntur.', 'Caja de carton', 626, 28, '66.21', '2022-06-30', '2020-06-21', 'True'),
(16, 'PVC', 'Officia similique distinctio doloribus expedita iste vero. Veniam quasi magnam excepturi fuga rem.', 'Simple', 902, 43, '9.49', '2022-01-31', '2020-08-02', 'True'),
(17, 'PET', 'Cumque impedit ipsam dolorem culpa. Velit quam ex eius est sequi ullam.', 'Bolsa', 375, 32, '81.79', '2020-12-21', '2022-07-25', 'True'),
(18, 'PS', 'Consectetur esse vitae repellendus cupiditate voluptate eligendi. Dolorum magni ipsa quidem ipsa. Magnam corporis voluptate consectetur.', 'Caja de carton', 752, 39, '98.48', '2021-02-22', '2022-09-11', 'True'),
(19, 'PP', 'Dolores sit harum et quaerat. Saepe quod error autem doloremque odio eveniet quae.', 'Caja de madera', 37, 31, '79.60', '2023-10-21', '2022-01-27', 'True');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `compra_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producen`
--

CREATE TABLE `producen` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(12,2) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `empleado_id_id` int(11) NOT NULL,
  `producto_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `presentacion` varchar(100) DEFAULT NULL,
  `lote` int(11) DEFAULT NULL,
  `stock_act` int(11) DEFAULT NULL,
  `stock_inf` int(11) DEFAULT NULL,
  `precio` decimal(12,2) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `presentacion`, `lote`, `stock_act`, `stock_inf`, `precio`, `fecha_creacion`, `fecha_modificacion`, `estado`) VALUES
(1, 'Botella EcoSplash', 'Botella de agua reutilizable fabricada con plástico reciclado.', 'Bolsa', 7782, 822, 49, '88.67', '2021-09-29', '2020-03-04', 'True'),
(2, 'Bolsa ReciBag', 'Bolsa de compras ecológica hecha de plástico reciclado.', 'Bolsa', 8654, 68, 42, '70.15', '2021-12-10', '2022-04-10', 'True'),
(3, 'Silla GreenLounge', 'Muebles de jardín sostenibles hechos con plástico reciclado.', 'Caja de carton', 9995, 200, 47, '96.81', '2022-07-19', '2021-10-18', 'True'),
(4, 'Camiseta EcoBlend', 'Prenda de vestir fabricada con fibras de plástico reciclado.', 'Caja de carton', 12118, 676, 20, '76.41', '2021-09-05', '2021-07-20', 'True'),
(5, 'Envases LimpioNature', 'Envases de productos de limpieza doméstica fabricados con plástico reciclado.', 'Caja de carton', 15941, 885, 36, '62.90', '2021-08-28', '2021-03-18', 'True'),
(6, 'Juguete RePlayFun', 'Juguetes sostenibles hechos de plástico reciclado.', 'Bolsa', 386, 799, 47, '37.37', '2022-03-08', '2023-07-26', 'True'),
(7, 'Panel Ecoluxe', 'Paneles de construcción respetuosos con el medio ambiente fabricados con plástico reciclado.', 'Caja de madera', 2202, 236, 43, '82.81', '2021-09-04', '2021-02-14', 'True'),
(8, 'Maceta GreenGrow', 'Macetas y contenedores de jardinería fabricados con plástico reciclado.', 'Bolsa', 11817, 123, 27, '72.72', '2021-03-22', '2020-11-09', 'True'),
(9, 'Utensilios EcoKitchen', 'Utensilios de cocina sostenibles hechos de plástico reciclado.', 'Simple', 5116, 387, 35, '61.59', '2020-07-24', '2021-02-15', 'True'),
(10, 'Funda de teléfono RenewCase', 'Fundas para teléfonos móviles fabricadas con plástico reciclado.', 'Caja de carton', 5640, 21, 29, '56.05', '2023-07-03', '2023-02-17', 'True'),
(11, 'Bicicleta ReCyclePro', 'Bicicletas ecológicas con marcos de plástico reciclado.', 'Caja de madera', 3912, 135, 20, '21.34', '2021-07-25', '2020-09-25', 'True'),
(12, 'Tablero EcoSurf', 'Tablas de surf sostenibles hechas con materiales reciclados.', 'Simple', 701, 235, 41, '84.38', '2020-11-19', '2021-06-04', 'True'),
(13, 'Reloj EcoTime', 'Relojes con correas y carcasas de plástico reciclado.', 'Simple', 7188, 464, 39, '10.87', '2020-08-30', '2022-01-17', 'True'),
(14, 'Lámpara GreenGlow', 'Lámparas y luminarias respetuosas con el medio ambiente.', 'Caja de madera', 19429, 450, 26, '82.94', '2022-04-30', '2021-06-15', 'True'),
(15, 'Estuche RenewPack', 'Estuches y maletas fabricados con plástico reciclado.', 'Caja de madera', 6004, 410, 38, '70.85', '2020-04-30', '2020-12-17', 'True'),
(16, 'Pelota PlayGreen', 'Pelotas deportivas fabricadas con plástico reciclado.', 'Simple', 9650, 252, 20, '83.61', '2022-05-18', '2020-07-30', 'True'),
(17, 'Auriculares ReSound', 'Auriculares y audífonos sostenibles.', 'Simple', 10284, 444, 37, '70.05', '2022-11-19', '2021-04-09', 'True'),
(18, 'Mochila EcoTrail', 'Mochilas y mochileros confeccionados con materiales reciclados.', 'Caja de carton', 7001, 53, 23, '22.92', '2020-04-29', '2021-11-01', 'True'),
(19, 'Escritorio RecycleDesk', 'Muebles de oficina ecológicos y escritorios sostenibles.', 'Caja de carton', 16536, 480, 31, '32.84', '2020-12-27', '2021-06-19', 'True'),
(20, 'Comida para Mascotas EcoPaws', 'Alimentos y envases sostenibles para mascotas.', 'Bolsa', 1226, 904, 31, '97.88', '2023-02-06', '2023-01-10', 'True'),
(21, 'Botella EcoHydrate', 'Botellas reutilizables y respetuosas con el medio ambiente.', 'Simple', 885, 479, 25, '40.79', '2023-03-14', '2023-07-02', 'True'),
(22, 'Bolígrafo ReWrite', 'Bolígrafos y material de escritura sostenibles.', 'Caja de carton', 1549, 437, 41, '94.20', '2020-01-03', '2023-02-23', 'True'),
(23, 'Cepillo RenewClean', 'Cepillos de limpieza y utensilios de hogar sostenibles.', 'Bolsa', 19182, 504, 21, '41.88', '2022-09-21', '2020-04-27', 'True'),
(24, 'Juguete GreenPlay', 'Juguetes y juegos infantiles ecológicos.', 'Simple', 2686, 225, 37, '64.29', '2022-01-27', '2020-02-14', 'True'),
(25, 'Zapatos RecycleStep', 'Calzado y zapatillas hechos con plástico reciclado.', 'Caja de carton', 11009, 188, 26, '36.12', '2023-01-06', '2021-01-03', 'True'),
(26, 'Toallas EcoDry', 'Toallas y productos de cuidado personal sostenibles.', 'Bolsa', 13791, 778, 25, '89.58', '2021-08-25', '2023-02-27', 'True'),
(27, 'Muebles ReVive', 'Muebles y decoración para el hogar fabricados con materiales reciclados.', 'Caja de carton', 10518, 855, 35, '74.08', '2021-05-03', '2023-04-10', 'True'),
(28, 'Lápices ReDraw', 'Lápices y material de dibujo sostenibles.', 'Bolsa', 9999, 837, 48, '5.15', '2020-03-28', '2021-10-15', 'True'),
(29, 'Maletín EcoCommute', 'Maletines y accesorios para viajar respetuosos con el medio ambiente.', 'Caja de madera', 18127, 369, 44, '21.27', '2021-10-22', '2021-05-14', 'True'),
(30, 'Baterías GreenPower', 'Baterías recargables y energía sostenible.', 'Simple', 2602, 313, 22, '58.00', '2021-08-10', '2020-06-29', 'True');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `nombre_fantasia` varchar(100) DEFAULT NULL,
  `cuit` int(11) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `celular_alt` int(11) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `razon_social`, `nombre_fantasia`, `cuit`, `celular`, `celular_alt`, `email`, `direccion`, `fecha_creacion`, `fecha_modificacion`, `estado`) VALUES
(1, 'Sotelo-Torrecilla', 'Group', 2147483647, 661055357, 692705416, 'wfalcon@example.org', 'Paseo de Rogelio Olmedo 65\nÁvila, 51639', '2022-09-19', '2020-01-02', 'True'),
(2, 'Luján Inc', 'Inc', 2147483647, 614113334, 610932225, 'etelvina78@example.net', 'Ronda de Sofía Alarcón 4 Puerta 1 \nMadrid, 01567', '2022-05-17', '2020-06-15', 'True'),
(3, 'Fortuny, Alba and Acosta', 'PLC', 2147483647, 646825230, 684585523, 'bermudezalejandra@example.com', 'Alameda de Martina Bayona 74\nAlbacete, 18813', '2021-10-23', '2021-09-04', 'True'),
(4, 'Carmona Group', 'Ltd', 2147483647, 618775028, 693660186, 'pizarrocaridad@example.com', 'Glorieta Balduino Losada 88\nPalencia, 09949', '2021-05-14', '2021-06-27', 'True'),
(5, 'Acevedo, Cárdenas and Correa', 'and Sons', 2147483647, 626084301, 646085891, 'severogalvez@example.org', 'C. de Soledad Cañizares 8 Piso 6 \nCantabria, 26642', '2021-08-30', '2022-09-29', 'True'),
(6, 'Moles, Gallo and Aguilar', 'LLC', 2147483647, 653471272, 660673302, 'qpalomino@example.org', 'Glorieta de Wálter Benavente 602\nCantabria, 42020', '2020-01-09', '2021-10-06', 'True'),
(7, 'Leiva, Calzada and Gilabert', 'Group', 2147483647, 627128651, 617320718, 'viriarte@example.org', 'Glorieta Carmelo Laguna 60\nHuelva, 37935', '2020-05-28', '2021-01-05', 'True'),
(8, 'Viana Ltd', 'PLC', 2147483647, 687443718, 615089594, 'ygimeno@example.com', 'Callejón de Valentina Lamas 83 Apt. 02 \nSoria, 23813', '2020-04-06', '2022-01-23', 'True'),
(9, 'Iniesta, Álvarez and Mateu', 'PLC', 2147483647, 626312667, 671428171, 'wrosales@example.com', 'Rambla Ildefonso Manzano 77\nCantabria, 01533', '2023-09-13', '2020-01-30', 'True'),
(10, 'Esteban-Marí', 'LLC', 2147483647, 609092598, 616548696, 'wtamayo@example.org', 'Camino Jimena Quiroga 13 Piso 1 \nPontevedra, 27824', '2020-09-20', '2023-05-28', 'True'),
(11, 'Campillo and Sons', 'Inc', 2147483647, 609906875, 610598243, 'santiago75@example.org', 'Rambla Felicia Pardo 879\nLugo, 22602', '2020-08-20', '2022-06-16', 'True'),
(12, 'Tomé, Hoyos and Gibert', 'Inc', 2147483647, 656558953, 698698882, 'nadiatapia@example.com', 'Urbanización Feliciano Saavedra 30\nCádiz, 01477', '2021-05-27', '2022-01-12', 'True'),
(13, 'Cardona-Ríos', 'Ltd', 2147483647, 679453966, 653063098, 'emelinacarrasco@example.net', 'Urbanización Lorenzo Peiró 3\nJaén, 12245', '2022-06-23', '2023-10-27', 'True'),
(14, 'Pellicer Group', 'Ltd', 2147483647, 611886316, 663370251, 'deboracuenca@example.org', 'Rambla de Dalila Baró 6 Piso 3 \nGranada, 20206', '2023-07-16', '2020-07-07', 'True'),
(15, 'Guijarro Ltd', 'Inc', 2147483647, 618130630, 662047454, 'esperanza27@example.org', 'Pasaje Vasco Quevedo 91 Puerta 9 \nCórdoba, 37888', '2022-01-16', '2023-08-10', 'True'),
(16, 'Vall, Yáñez and Reguera', 'Inc', 2147483647, 660205424, 654606079, 'qsebastian@example.com', 'Vial de Dorotea Arjona 6\nSanta Cruz de Tenerife, 38676', '2021-02-02', '2020-07-26', 'True'),
(17, 'Galan-Folch', 'PLC', 2147483647, 606152377, 689314668, 'jordan99@example.net', 'Pasaje Ignacia Álvarez 39 Piso 1 \nTarragona, 36629', '2021-03-20', '2023-09-28', 'True'),
(18, 'Barral-Gallo', 'and Sons', 2147483647, 667255719, 639680597, 'ptorralba@example.org', 'C. de Celso Huerta 6 Puerta 4 \nCeuta, 18436', '2021-04-04', '2023-04-12', 'True'),
(19, 'Velázquez, Sandoval and Cortes', 'LLC', 2147483647, 699356462, 675642585, 'alexmaestre@example.org', 'Avenida de Eliseo Nebot 54\nSevilla, 40105', '2022-12-06', '2023-10-16', 'True'),
(20, 'Fernandez-Molins', 'Ltd', 2147483647, 659412585, 690358421, 'angela44@example.org', 'Rambla Gisela Morillo 685\nCantabria, 17573', '2020-10-26', '2023-08-26', 'True'),
(21, 'Hernández Inc', 'PLC', 2147483647, 698084672, 685507157, 'solartigas@example.net', 'Glorieta de Agustina Zaragoza 370\nLas Palmas, 04164', '2023-02-24', '2021-04-09', 'True'),
(22, 'Blanch, Fortuny and Ferrández', 'Inc', 2147483647, 639343279, 661258039, 'daniela71@example.com', 'Camino de María Dolores Grau 329 Piso 0 \nAlicante, 12710', '2020-08-10', '2022-11-03', 'True'),
(23, 'Bustos-Novoa', 'PLC', 2147483647, 649277899, 672288986, 'calixtolillo@example.com', 'Pasaje Hortensia Escobar 7 Puerta 0 \nLa Coruña, 41284', '2022-09-30', '2023-07-08', 'True'),
(24, 'Mariscal Ltd', 'Ltd', 2147483647, 686539765, 673875727, 'casalolimpia@example.net', 'Calle de Vito Seguí 86 Piso 2 \nLeón, 03008', '2022-01-17', '2021-03-14', 'True'),
(25, 'Poza, Téllez and Pablo', 'Inc', 2147483647, 656915957, 623981139, 'ncarbo@example.org', 'Rambla Alejo Mateo 46 Apt. 43 \nOurense, 05017', '2023-07-12', '2023-01-19', 'True'),
(26, 'Arce, León and Blanch', 'LLC', 2147483647, 637030845, 604249984, 'nfernandez@example.net', 'C. María Peiró 444 Puerta 3 \nGranada, 26743', '2023-06-13', '2020-05-17', 'True'),
(27, 'Cabo LLC', 'and Sons', 2147483647, 628847453, 608231053, 'peraltafabio@example.com', 'Alameda de Joaquina Vera 883 Puerta 7 \nGuipúzcoa, 34338', '2020-04-21', '2022-03-18', 'True'),
(28, 'Colom, Vilar and Puga', 'Group', 2147483647, 693214468, 642248607, 'georgina29@example.net', 'Calle de Jafet Machado 79\nLeón, 44371', '2021-07-04', '2021-07-13', 'True'),
(29, 'Segura-Moya', 'PLC', 2147483647, 640501979, 675137786, 'gabaldonatilio@example.org', 'C. de Custodio Rubio 252 Piso 7 \nPalencia, 31209', '2021-05-12', '2021-02-20', 'True');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveen`
--

CREATE TABLE `proveen` (
  `id` int(11) NOT NULL,
  `materia_prima_id_id` int(11) NOT NULL,
  `proveedor_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registra`
--

CREATE TABLE `registra` (
  `id` int(11) NOT NULL,
  `compra_id_id` int(11) NOT NULL,
  `empleado_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_area`
--

CREATE TABLE `usuarios_area` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `codigo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_usuario`
--

CREATE TABLE `usuarios_usuario` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_usuario_groups`
--

CREATE TABLE `usuarios_usuario_groups` (
  `id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_usuario_user_permissions`
--

CREATE TABLE `usuarios_usuario_user_permissions` (
  `id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compra_empleado_id_id_4fb7aa5a_fk_empleado_id` (`empleado_id_id`),
  ADD KEY `compra_cliente_id_id_4c99c4fd_fk_cliente_id` (`cliente_id_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_usuarios_usuario_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingresan`
--
ALTER TABLE `ingresan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingresan_ingreso_id_id_38405d3c_fk_ingresos_id` (`ingreso_id_id`),
  ADD KEY `ingresan_materia_prima_id_id_64d695a3_fk_materia_prima_id` (`materia_prima_id_id`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lineadetalle`
--
ALTER TABLE `lineadetalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lineadetalle_pedido_id_id_a36e303f_fk_pedido_id` (`pedido_id_id`),
  ADD KEY `lineadetalle_producto_id_id_35350490_fk_producto_id` (`producto_id_id`);

--
-- Indices de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_compra_id_id_bda66fbd_fk_compra_id` (`compra_id_id`);

--
-- Indices de la tabla `producen`
--
ALTER TABLE `producen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producen_empleado_id_id_b44425a7_fk_empleado_id` (`empleado_id_id`),
  ADD KEY `producen_producto_id_id_0eab1748_fk_producto_id` (`producto_id_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveen`
--
ALTER TABLE `proveen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proveen_materia_prima_id_id_b885124c_fk_materia_prima_id` (`materia_prima_id_id`),
  ADD KEY `proveen_proveedor_id_id_8a393024_fk_proveedor_id` (`proveedor_id_id`);

--
-- Indices de la tabla `registra`
--
ALTER TABLE `registra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registra_compra_id_id_2890493b_fk_compra_id` (`compra_id_id`),
  ADD KEY `registra_empleado_id_id_7883df21_fk_empleado_id` (`empleado_id_id`);

--
-- Indices de la tabla `usuarios_area`
--
ALTER TABLE `usuarios_area`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `usuarios_usuario`
--
ALTER TABLE `usuarios_usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `usuarios_usuario_area_id_c273d4eb_fk_usuarios_area_id` (`area_id`);

--
-- Indices de la tabla `usuarios_usuario_groups`
--
ALTER TABLE `usuarios_usuario_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuarios_usuario_groups_usuario_id_group_id_4ed5b09e_uniq` (`usuario_id`,`group_id`),
  ADD KEY `usuarios_usuario_groups_group_id_e77f6dcf_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `usuarios_usuario_user_permissions`
--
ALTER TABLE `usuarios_usuario_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuarios_usuario_user_pe_usuario_id_permission_id_217cadcd_uniq` (`usuario_id`,`permission_id`),
  ADD KEY `usuarios_usuario_use_permission_id_4e5c0f2f_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `ingresan`
--
ALTER TABLE `ingresan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lineadetalle`
--
ALTER TABLE `lineadetalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producen`
--
ALTER TABLE `producen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `proveen`
--
ALTER TABLE `proveen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registra`
--
ALTER TABLE `registra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios_area`
--
ALTER TABLE `usuarios_area`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios_usuario`
--
ALTER TABLE `usuarios_usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios_usuario_groups`
--
ALTER TABLE `usuarios_usuario_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios_usuario_user_permissions`
--
ALTER TABLE `usuarios_usuario_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_cliente_id_id_4c99c4fd_fk_cliente_id` FOREIGN KEY (`cliente_id_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `compra_empleado_id_id_4fb7aa5a_fk_empleado_id` FOREIGN KEY (`empleado_id_id`) REFERENCES `empleado` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_usuarios_usuario_id` FOREIGN KEY (`user_id`) REFERENCES `usuarios_usuario` (`id`);

--
-- Filtros para la tabla `ingresan`
--
ALTER TABLE `ingresan`
  ADD CONSTRAINT `ingresan_ingreso_id_id_38405d3c_fk_ingresos_id` FOREIGN KEY (`ingreso_id_id`) REFERENCES `ingresos` (`id`),
  ADD CONSTRAINT `ingresan_materia_prima_id_id_64d695a3_fk_materia_prima_id` FOREIGN KEY (`materia_prima_id_id`) REFERENCES `materia_prima` (`id`);

--
-- Filtros para la tabla `lineadetalle`
--
ALTER TABLE `lineadetalle`
  ADD CONSTRAINT `lineadetalle_pedido_id_id_a36e303f_fk_pedido_id` FOREIGN KEY (`pedido_id_id`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `lineadetalle_producto_id_id_35350490_fk_producto_id` FOREIGN KEY (`producto_id_id`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_compra_id_id_bda66fbd_fk_compra_id` FOREIGN KEY (`compra_id_id`) REFERENCES `compra` (`id`);

--
-- Filtros para la tabla `producen`
--
ALTER TABLE `producen`
  ADD CONSTRAINT `producen_empleado_id_id_b44425a7_fk_empleado_id` FOREIGN KEY (`empleado_id_id`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `producen_producto_id_id_0eab1748_fk_producto_id` FOREIGN KEY (`producto_id_id`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `proveen`
--
ALTER TABLE `proveen`
  ADD CONSTRAINT `proveen_materia_prima_id_id_b885124c_fk_materia_prima_id` FOREIGN KEY (`materia_prima_id_id`) REFERENCES `materia_prima` (`id`),
  ADD CONSTRAINT `proveen_proveedor_id_id_8a393024_fk_proveedor_id` FOREIGN KEY (`proveedor_id_id`) REFERENCES `proveedor` (`id`);

--
-- Filtros para la tabla `registra`
--
ALTER TABLE `registra`
  ADD CONSTRAINT `registra_compra_id_id_2890493b_fk_compra_id` FOREIGN KEY (`compra_id_id`) REFERENCES `compra` (`id`),
  ADD CONSTRAINT `registra_empleado_id_id_7883df21_fk_empleado_id` FOREIGN KEY (`empleado_id_id`) REFERENCES `empleado` (`id`);

--
-- Filtros para la tabla `usuarios_usuario`
--
ALTER TABLE `usuarios_usuario`
  ADD CONSTRAINT `usuarios_usuario_area_id_c273d4eb_fk_usuarios_area_id` FOREIGN KEY (`area_id`) REFERENCES `usuarios_area` (`id`);

--
-- Filtros para la tabla `usuarios_usuario_groups`
--
ALTER TABLE `usuarios_usuario_groups`
  ADD CONSTRAINT `usuarios_usuario_gro_usuario_id_7a34077f_fk_usuarios_` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios_usuario` (`id`),
  ADD CONSTRAINT `usuarios_usuario_groups_group_id_e77f6dcf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `usuarios_usuario_user_permissions`
--
ALTER TABLE `usuarios_usuario_user_permissions`
  ADD CONSTRAINT `usuarios_usuario_use_permission_id_4e5c0f2f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `usuarios_usuario_use_usuario_id_60aeea80_fk_usuarios_` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios_usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
