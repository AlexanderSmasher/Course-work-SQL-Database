-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 04 2021 г., 23:40
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `RealEstateAgency`
--

-- --------------------------------------------------------

--
-- Структура таблицы `buyers`
--

CREATE TABLE `buyers` (
  `buyers_ID` int NOT NULL,
  `full_name` varchar(40) NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(24) NOT NULL,
  `telephone` varchar(13) NOT NULL,
  `bank_details` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `buyers`
--

INSERT INTO `buyers` (`buyers_ID`, `full_name`, `birth_date`, `address`, `telephone`, `bank_details`) VALUES
(1, 'Alexander Slobodianyk', '2001-07-02', 'Sumy, Ukraine', '+380990970983', '5458649871742135'),
(2, 'Anastasia Sokruta', '2001-04-08', 'Sumy, Ukraine', '+380956655529', '5456897125523641'),
(3, 'Makarov Kirill', '2001-05-23', 'Sumy, Ukraine', '+380509884859', '5458145666577812'),
(4, 'Tkachenko Serhii', '2001-06-13', 'Sumy, Ukraine', '+380506816975', '5458568922123674'),
(5, 'Dashenko Vladislab', '2001-03-26', 'Sumy, Ukraine', '+380503075113', '5457655693010458'),
(6, 'Voytenko Deod', '1996-07-06', 'Kyiv, Ukraine', '+380504108989', '5457566578910234'),
(7, 'Vasilenko Ruslan', '2000-12-24', 'Jashkiv, Ukraine', '+380993078510', '5457644644880023'),
(8, 'Leontiev Valeriy', '1964-09-04', 'Moscow, Russia', '+740418569797', '4798644644880023'),
(9, 'Pilipp Kirkorov', '1954-11-25', 'Moscow, Russia', '+740419969701', '4798689971880023'),
(10, 'Molchanov Dmitro', '2001-04-12', 'Sumy, Ukraine', '+380991976901', '5454689971883363'),
(11, 'Kuzyachkin Chepolino', '1944-07-14', 'Vologda, Russia', '+740944102001', '4747689971866396'),
(12, 'Kekanister Popanister', '1999-11-01', 'Drogobich, Ukraine', '+380945557411', '5459689971878396'),
(13, 'Cal` Vitaliy', '1992-10-22', 'Vinnitsa, Ukraine', '+380505556561', '5459684100878996'),
(14, 'Micro Zavrich', '1947-04-06', 'Vinnitsa, Ukraine', '+380990988541', '5459414100232354'),
(15, 'Papanister Pukanister', '1966-08-30', 'Stambul, Turkey', '+460557894141', '6569412445570012'),
(16, 'Vasilisa Kekveshnaya', '1974-11-04', 'Homel, Russia', '+746657890012', '5757412449870012'),
(17, 'Valentin Skoromniy', '2001-06-18', 'Romni, Ukraine', '+380665126768', '5456122100397845'),
(18, 'Fop Tallantiy', '2013-06-18', 'Stambul, Turkey', '+465517890012', '6969144100037814'),
(19, 'Ihor Galant', '1996-01-18', 'Kyiv, Ukraine', '+380954560102', '4546788734570100'),
(20, 'Vladislav Chernosliv', '1967-03-24', 'Poltava, Ukraine', '+380954588742', '4546336745570180'),
(21, 'Vladislav Kiberslav', '2006-11-14', 'Jovtneve, Ukraine', '+38066478782', '4546336744418989'),
(22, 'Alexander Dee', '2000-01-08', 'Poltava, Ukraine', '+38066775698', '5586336789418989'),
(23, 'Kortal Vombat', '1998-07-13', 'Gavat, Turkey', '+46476775108', '6686454570012323'),
(24, 'Julia Believe', '1955-12-21', 'Hopnyak, Russia', '+74076775808', '5757454570332300'),
(25, 'Yevhenia Vatrushka', '1999-04-14', 'Pidoprigori, Ukraine', '+380967750011', '5454122174740003'),
(26, 'Kultyap Ivanovich', '1967-10-10', 'Moscow, Russia', '+740967750227', '5457228813371488'),
(27, 'Kekanister Michiganister', '1988-04-26', 'Vologda, Russia', '+740967711327', '5457228815578288'),
(28, 'Joyko Voitek', '1974-10-25', 'Taitsanu, Japan', '+554178888961', '8998228814478208'),
(29, 'Insa Tualin', '1998-01-05', 'Taitsanu, Japan', '+554178998127', '8998228814478207'),
(30, 'Insa Ukinori', '2007-08-13', 'Tokio, Japan', '+554178978128', '8998228774478737'),
(31, 'Maks Galant', '2002-11-13', 'Hopnyak, Russia', '+74076875831', '575745997037712');

-- --------------------------------------------------------

--
-- Структура таблицы `premises`
--

CREATE TABLE `premises` (
  `premises_ID` int NOT NULL,
  `sellers_ID` int NOT NULL,
  `code` varchar(8) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `destination` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `premises`
--

INSERT INTO `premises` (`premises_ID`, `sellers_ID`, `code`, `type`, `destination`) VALUES
(1, 1, '55512389', 1, 1),
(2, 2, '51510389', 1, 1),
(3, 3, '00033089', 1, 0),
(4, 4, '00004789', 0, 0),
(5, 5, '01120489', 0, 0),
(6, 6, '02278936', 1, 0),
(7, 7, '02277936', 1, 0),
(8, 8, '02277936', 1, 1),
(9, 9, '02773036', 0, 1),
(10, 10, '01073010', 0, 1),
(11, 11, '33373010', 0, 0),
(12, 12, '33312310', 0, 0),
(13, 12, '33565310', 1, 0),
(14, 13, '33888944', 1, 1),
(15, 14, '55687894', 1, 1),
(16, 15, '55880894', 0, 0),
(17, 15, '58874894', 1, 0),
(18, 16, '58871174', 1, 1),
(19, 17, '00051174', 1, 0),
(20, 18, '01251174', 0, 0),
(21, 19, '01556174', 0, 0),
(22, 20, '99987174', 0, 0),
(23, 21, '99000874', 1, 1),
(24, 22, '99000974', 1, 1),
(25, 23, '55500987', 1, 0),
(26, 24, '55509977', 1, 0),
(27, 24, '55509017', 0, 0),
(28, 25, '55500017', 1, 1),
(29, 26, '55600017', 1, 1),
(30, 27, '55074517', 0, 0),
(31, 28, '11474517', 1, 0),
(32, 28, '11574517', 1, 0),
(33, 29, '11887117', 1, 1),
(34, 30, '11887178', 0, 0),
(35, 30, '15567178', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `sellers`
--

CREATE TABLE `sellers` (
  `sellers_ID` int NOT NULL,
  `full_name` varchar(40) NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(24) NOT NULL,
  `telephone` varchar(13) NOT NULL,
  `bank_details` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `sellers`
--

INSERT INTO `sellers` (`sellers_ID`, `full_name`, `birth_date`, `address`, `telephone`, `bank_details`) VALUES
(1, 'Insa Ukinori', '2007-08-13', 'Tokio, Japan', '+554178978128', '8998228774478737'),
(2, 'Kukaracha Nimacha', '2001-07-24', 'Tokio, Japan', '+554178977787', '8998228774499005'),
(3, 'Hibrid Konechniy', '1999-07-01', 'Sumy, Ukraine', '+380990990695', '5656878712347056'),
(4, 'Valeriy Gogotav', '1986-04-26', 'Pripyat, Ukraine', '+380885514695', '5656998112347056'),
(5, 'Jargon Evron', '1945-01-25', 'Evpatoria, Ukraine', '+380877514695', '56569981444166'),
(6, 'Eva Koldovskaya', '2001-03-02', 'Sumy, Ukraine', '+380332512285', '5654993344416786'),
(7, 'Vladislav Holivan', '2005-12-17', 'Poltava, Ukraine', '+380452512285', '5654997466416786'),
(8, 'Mikhail Sakavsin', '2000-06-22', 'Kyiv, Ukraine', '+382217512275', '5654933066416786'),
(9, 'Vasiliy Stus', '2012-06-11', 'Kyiv, Ukraine', '+382217996275', '5549332166434786'),
(10, 'Kozak Kovalenko', '2001-04-30', 'Lviv, Ukraine', '+382288796275', '5549300226433786'),
(11, 'Alexander Muzak', '1996-04-03', 'Sumy, Ukraine', '+380188796111', '5549322746433556'),
(12, 'Kolya Kaban', '1977-10-12', 'Kyiv, Ukraine', '+380187796419', '5549322746400176'),
(13, 'Vitya Neptun', '1967-06-07', 'Kyiv, Ukraine', '+380557796779', '5549314746400079'),
(14, 'Kostya Dzuban', '1999-10-04', 'Kyiv, Ukraine', '+380668796779', '5541222474613079'),
(15, 'Vova Riba', '1979-11-30', 'Kyiv, Ukraine', '+380661196720', '5541222411213324'),
(16, 'Vova Chudak', '1989-01-04', 'Moscow, Russia', '+740573691024', '5457221121230024'),
(17, 'Alexey Navalniy', '1974-07-12', 'Moscow, Russia', '+740773111024', '5457298121231127'),
(18, 'Fiat Nemcuga', '1956-11-23', 'Stambul, Turkey', '+460781132071', '5668998125547127'),
(19, 'Gusap Vatsap', '1998-01-05', 'Stambul, Turkey', '+463207811071', '5668912554987887'),
(20, 'Tsukuyomi Dream', '1977-12-31', 'Tokio, Japan', '+87207327111', '5678865748912547'),
(21, 'Kakashi Uchiha', '1984-09-03', 'Tokio, Japan', '+88484327111', '5678869909912547'),
(22, 'Vasya Zibava', '1995-06-10', 'Poltava, Ukraine', '+380990410357', '5456747612023634'),
(23, 'Zihte Drihte', '2014-08-18', 'Poltava, Ukraine', '+381112410357', '5456700612897634'),
(24, 'Nikita Hupalo', '2000-04-12', 'Kyiv, Ukraine', '+380660478912', '5456700611114734'),
(25, 'Mihail Shinobi', '2007-04-01', 'Kyiv, Ukraine', '+380660012912', '5456397415410473'),
(26, 'Sasha Vava', '2002-10-11', 'Sumy, Ukraine', '+38950121912', '545071233410073'),
(27, 'Anton Mahno', '1998-04-01', 'Sumy, Ukraine', '+38959974912', '5450711377410993'),
(28, 'Kent Neputeviy', '1971-11-23', 'Poltava, Ukraine', '+38959971412', '5450733777002993'),
(29, 'Matvey Mopedniy', '1993-03-13', 'Sumy, Ukraine', '+38959117812', '5459843770025563'),
(30, 'Anastasia Kekulya', '1945-12-27', 'Poltava, Ukraine', '+389546578112', '545984447875563');

-- --------------------------------------------------------

--
-- Структура таблицы `transaction_log`
--

CREATE TABLE `transaction_log` (
  `transaction_ID` int NOT NULL,
  `sellers_ID` int NOT NULL,
  `buyers_ID` int NOT NULL,
  `premises_ID` int NOT NULL,
  `registration_number` int NOT NULL,
  `transaction_type` tinyint DEFAULT NULL,
  `transaction_value` int NOT NULL,
  `rental_period` varchar(21) NOT NULL,
  `rental_terms` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `transaction_log`
--

INSERT INTO `transaction_log` (`transaction_ID`, `sellers_ID`, `buyers_ID`, `premises_ID`, `registration_number`, `transaction_type`, `transaction_value`, `rental_period`, `rental_terms`) VALUES
(1, 1, 1, 1, 58, 1, 551800, '2021-06-29/2021-12-29', 'Nothing info'),
(2, 2, 2, 2, 59, 1, 317000, '2018-06-09/2021-02-09', 'Nothing info'),
(3, 3, 3, 3, 12, 2, 45000, '2017-04-21/2020-07-21', 'Nothing info'),
(4, 4, 4, 4, 17, 1, 98999, '2015-04-21/2021-07-21', 'Nothing info'),
(5, 5, 5, 13, 89, 1, 44409, '1998-04-21/2021-07-21', 'Nothing info'),
(6, 6, 6, 5, 47, 2, 18000, '2007-04-21/2021-07-21', 'Nothing info'),
(7, 7, 7, 6, 48, 2, 19500, '2007-04-21/2011-07-21', 'Bad neighbourhoods'),
(8, 8, 8, 23, 73, 3, 78999, '2021-04-21/2026-07-21', 'Bad neighbourhoods'),
(9, 9, 9, 9, 78, 3, 12000, '2016-04-21/2022-09-13', 'Bad neighbourhoods'),
(10, 10, 10, 29, 11, 3, 14890, '2012-04-21/2017-09-13', 'Bad neighbourhoods');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `login` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`login`, `password`) VALUES
('admin', 'admin'),
('user', 'user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `buyers`
--
ALTER TABLE `buyers`
  ADD PRIMARY KEY (`buyers_ID`);

--
-- Индексы таблицы `premises`
--
ALTER TABLE `premises`
  ADD PRIMARY KEY (`premises_ID`),
  ADD KEY `sellers_ID` (`sellers_ID`);

--
-- Индексы таблицы `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`sellers_ID`),
  ADD KEY `sellersname` (`full_name`);

--
-- Индексы таблицы `transaction_log`
--
ALTER TABLE `transaction_log`
  ADD PRIMARY KEY (`transaction_ID`),
  ADD KEY `buyers_ID` (`buyers_ID`),
  ADD KEY `premises_ID` (`premises_ID`),
  ADD KEY `sellers_ID` (`sellers_ID`) USING BTREE;

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`login`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `premises`
--
ALTER TABLE `premises`
  ADD CONSTRAINT `premises_ibfk_1` FOREIGN KEY (`sellers_ID`) REFERENCES `sellers` (`sellers_ID`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `transaction_log`
--
ALTER TABLE `transaction_log`
  ADD CONSTRAINT `transaction_log_ibfk_1` FOREIGN KEY (`sellers_ID`) REFERENCES `sellers` (`sellers_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_log_ibfk_2` FOREIGN KEY (`buyers_ID`) REFERENCES `buyers` (`buyers_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_log_ibfk_3` FOREIGN KEY (`premises_ID`) REFERENCES `premises` (`premises_ID`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
