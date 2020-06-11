-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 08 2018 г., 17:05
-- Версия сервера: 5.7.20
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `gamemagaz`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `created_at`, `updated_at`, `name`, `description`, `deleted_at`) VALUES
(1, '2018-07-06 12:24:06', '2018-07-06 19:11:40', 'Action', 'Экшн игры', NULL),
(2, '2018-07-06 12:24:24', '2018-07-06 19:11:33', 'RPG', 'Ролевые игры', NULL),
(3, '2018-07-06 12:24:34', '2018-07-06 12:24:34', 'Квесты', 'Квесты', NULL),
(4, '2018-07-06 19:11:56', '2018-07-06 19:11:56', 'Онлайн-игры', 'Многопользовательские игры', NULL),
(5, '2018-07-06 19:12:05', '2018-07-07 16:44:11', 'Стратегии', 'Стратегии', NULL),
(8, '2018-07-07 19:33:36', '2018-07-07 19:33:36', 'Гонки', 'Гоночные соревнования', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `created_at`, `updated_at`, `name`) VALUES
(1, '2018-07-07 17:05:58', '2018-07-07 17:05:58', 'Main'),
(2, '2018-07-07 17:05:58', '2018-07-07 17:05:58', 'Admin');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `created_at`, `updated_at`, `menu_id`, `title`, `route_name`) VALUES
(1, '2018-07-07 17:22:42', '2018-07-07 17:22:42', 2, 'Настройки', 'admin.settings'),
(2, '2018-07-07 17:22:42', '2018-07-07 17:22:42', 2, 'Категории', 'admin.categories'),
(3, '2018-07-07 17:22:42', '2018-07-07 17:22:42', 2, 'Продукты', 'admin.products'),
(4, '2018-07-07 17:22:42', '2018-07-07 17:22:42', 2, 'Заказы', 'admin.orders'),
(5, '2018-07-07 17:22:42', '2018-07-07 17:22:42', 2, 'Новости', 'admin.news'),
(6, '2018-07-07 17:22:42', '2018-07-07 17:22:42', 2, 'Пользователи', 'users.index'),
(7, '2018-07-07 17:22:42', '2018-07-07 17:22:42', 1, 'Главная', 'home'),
(8, '2018-07-07 17:22:42', '2018-07-07 17:22:42', 1, 'Мои заказы', 'myOrders'),
(9, '2018-07-07 17:22:42', '2018-07-07 17:22:42', 1, 'Новости', 'news'),
(10, '2018-07-07 17:22:42', '2018-07-07 17:22:42', 1, 'О компании', 'about');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(90, '2014_10_12_000000_create_users_table', 1),
(91, '2014_10_12_100000_create_password_resets_table', 1),
(92, '2018_07_02_182748_create_categories_table', 1),
(93, '2018_07_02_182930_create_products_table', 1),
(94, '2018_07_04_133441_create_orders_table', 1),
(95, '2018_07_04_184646_create_jobs_table', 1),
(96, '2018_07_04_202533_create_settings_table', 1),
(97, '2018_07_06_133325_add_userdata_to_orders', 1),
(98, '2018_07_06_144235_create_order_positions_table', 1),
(101, '2018_07_06_184027_create_news_table', 2),
(102, '2018_07_07_194707_create_menus_table', 3),
(103, '2018_07_07_194854_create_menu_items_table', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `created_at`, `updated_at`, `title`, `thumbnail`, `excerpt`, `text`) VALUES
(9, '2018-07-06 17:09:27', '2018-07-06 19:01:36', 'О новых играх в режиме VR', '/storage/uploads/news/news-id-9/thumbnail.jpg', '<p>Сейчас VR игры уже не кажутся нам таким уж чудом техники, но еще не так давно мы и представить себе не могли, что попасть в любимую игровую вселенную можно будет практически в прямом смысле – как минимум, создать убедительное ощущение. Мы составили список лучших на наш взгляд игр для очков виртуальной реальности на ПК, PS4 и Xbox One.</p>', '<p>Сейчас VR игры уже не кажутся нам таким уж чудом техники, но еще не так давно мы и представить себе не могли, что попасть в любимую игровую вселенную можно будет практически в прямом смысле – как минимум, создать убедительное ощущение. Мы составили список лучших на наш взгляд игр для очков виртуальной реальности на ПК, PS4 и Xbox One.</p>\r\n<p>Для описания всего происходящего в этой игре будет достаточно двух слов – «мясо» и «кровища». Казалось бы, от игры про абсолютную жестокость для VR стоило бы ожидать ультра-реалистичной графики и полной серьезности всего происходящего. Но, к счастью, GORN разрабатывала студия Free Lives, известная в первую очередь по пародийному экшену Broforce. Так что овер-кровопролитные гладиаторские бои здесь представлены в забавной мультяшной графике и сдобрены огромными порциями отменного юмора.</p>'),
(10, '2018-07-06 17:09:54', '2018-07-06 19:01:43', 'О новой PS4 Pro', '/storage/uploads/news/news-id-10/thumbnail.jpg', '<p>Sony PlayStation 4 Pro — обновленная и модернизированная PS 4, консоль 8-го поколения. Это первая игровая приставка (Xbox One S тоже может выводить 4K, но не в играх), которая поддерживает игры в 4K UHD с высоким динамическим диапазоном (HDR). Видеокарта и другое аппаратное обеспечение заменены на лучшие, но по сути, это все та же PlayStation 4.</p>', '<p>Sony PlayStation 4 Pro — обновленная и модернизированная PS 4, консоль 8-го поколения. Это первая игровая приставка (Xbox One S тоже может выводить 4K, но не в играх), которая поддерживает игры в 4K UHD с высоким динамическим диапазоном (HDR). Видеокарта и другое аппаратное обеспечение заменены на лучшие, но по сути, это все та же PlayStation 4.</p>\r\n<p> 4K-телевизоры с поддержкой HDR все ещё очень дорогие и мало распространены. В таком формате PS 4 Pro отлично проявляет себя, но без него, консоль может предложить только чуть лучшее качество изображение и немного более быструю загрузку игр. При этом, настройки сложные, что теряется главное преимущество консолей над ПК — простота в запуске игр.</p>'),
(11, '2018-07-06 17:10:38', '2018-07-06 17:54:35', 'Как живут обычные люди в Deus Ex: Mankind Divided.', '/storage/uploads/news/news-id-11/thumbnail.jpg', '<p>Совместно с партнерами из LG мы подготовили серию материалов, подчеркивающих преимущества широкоформатных мониторов. В рамках спецпроекта «Игра месяца с LG» мы устраиваем конкурсы, рассказываем о ключевых релизах и демонстрируем, как они выглядят в UltraWide™ формате 21:9. Читайте, смотрите, участвуйте в конкурсе и выиграйте крутой монитор!</p>', '<p>Совместно с партнерами из LG мы подготовили серию материалов, подчеркивающих преимущества широкоформатных мониторов. В рамках спецпроекта «Игра месяца с LG» мы устраиваем конкурсы, рассказываем о ключевых релизах и демонстрируем, как они выглядят в UltraWide™ формате 21:9. Читайте, смотрите, участвуйте в конкурсе и выиграйте крутой монитор!</p>\r\n<p>Новый Deus Ex не зря имеет подзаголовок Mankind Divided («Раскол человечества»). Общество поделилось на людей обычных и аугментированных. Друг на друга они глядят с презрением. Первые подвергаются жестким гонениям, урезаются в правах, что вынуждает их даже создавать собственную религию.</p>\r\n<p>А какой образ жизни сложился в этом мире у обычных людей вроде нас с вами?</p>'),
(12, '2018-07-07 20:58:14', '2018-07-07 21:02:31', 'Red Dead Redemptions 2 может скоро выйти на ПК', '/storage/uploads/news/news-id-12/thumbnail.jpg', '<p>Cвeршилocь чудo — cocтoялcя oфициaльный aнoнc cкoрoгo рeлизa Red Dead Redemption 2 нa ПК. Cлуxи o нём xoдили в ceти c мoмeнтa выxoдa вecтeрнa нa кoнcoляx, фaнaты кoпaлиcь в игрoвoм кoдe и иcкaли нaмёки нa PC-вeрcию, нo рaзрaбoтчики прoдoлжaли oтмaлчивaтьcя.</p>', '<p>Cвeршилocь чудo — cocтoялcя oфициaльный aнoнc cкoрoгo рeлизa Red Dead Redemption 2 нa ПК. Cлуxи o нём xoдили в ceти c мoмeнтa выxoдa вecтeрнa нa кoнcoляx, фaнaты кoпaлиcь в игрoвoм кoдe и иcкaли нaмёки нa PC-вeрcию, нo рaзрaбoтчики прoдoлжaли oтмaлчивaтьcя. Вчeрa жe oни oшaрaшили игрoвoe кoммьюнити, зaявив, чтo нa ПК RDR 2 выйдeт coвceм cкoрo, 5 нoября. Oнa будeт врeмeнным экcклюзивoм Epic Games Store и coбcтвeннoгo мaгaзинa Rockstar, нo тoлькo врeмeнным — чeрeз мecяц пocлe рeлизa oнa пoявитcя в грядущeм oблaчнoм ceрвиce Google Stadia (кoтoрый нa cтaртe вcё рaвнo, увы, вряд ли будeт рaбoтaть c пoльзoвaтeлями из Рoccии), a в дeкaбрe пoявитcя и в Steam. Прeдзaкaз в мaгaзинe рaзрaбoтчикoв oткрoeтcя чeрeз нecкoлькo днeй, 8 чиcлa, и вce, ктo oфoрмит eгo дo 22 чиcлa, пoлучaт в пoдaрoк двe из прeдыдущиx игр Rockstar нa выбoр, нo cпиcoк дocтупныx прoдуктoв нeвeлик. В ceрвиce oт Epic Games прeдзaкaз cтaнeт дocтупeн 23 oктября.</p>');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_positions`
--

CREATE TABLE `order_positions` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorie_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `created_at`, `updated_at`, `name`, `categorie_id`, `price`, `pic`, `description`, `deleted_at`) VALUES
(1, '2018-07-06 12:25:19', '2018-07-06 12:25:19', 'Batman - Telltale Game Series', 3, '300.00', '/storage/uploads/products/prod-id-1/productPic.jpg', '<p>Batman: A Telltale Game Series - это эпизодическая приключенческая игра от Telltale Games, рассказывающая совершенно новую историю о приключениях Темного рыцаря Готэма. Принятые игроком решения оказывают влияние на сюжет и отношения с другими персонажами игры.</p>', NULL),
(2, '2018-07-06 12:25:38', '2018-07-06 12:25:38', 'Deus Ex: Mankind Divided', 2, '600.00', '/storage/uploads/products/prod-id-2/productPic.jpg', '<p>Deus Ex: Mankind Divided - новая часть сериала Deus Ex, продолжающая историю Адама Дженсена, главного героя Human Revolution. Игра не поддерживает перенос сохранений из предыдущей части, и ни одна из концовок Human Revolution таким образом не является каноничной. События Mankind Divided разворачиваются спустя два года после событий Human Revolution. Мир раскололся на две части, каждая из которых - аугментированные и обычные люди - не терпит друг друга.</p>\r\n<p>Дженсен, агент специального подразделения Интерпола, оказывается втянут в заговор, цель которого - подставить аугментированных и выставить их террористами. Адаму приходится самолично заниматься этой проблемой. В процессе расследования выясняются куда более пугающие обстоятельства, нежели были известны сначала, и Адаму приходится делать тяжелый выбор, который так или иначе повлияет на будущее разделенного мира.</p>', NULL),
(3, '2018-07-06 12:25:51', '2018-07-06 12:25:51', 'Call Of Duty: Black Ops 2', 1, '100.00', '/storage/uploads/products/prod-id-3/productPic.jpg', '<p>Black Ops 2 - это шутер от первого лица, продолжающий события первой части Black Ops. Дэвид Мэйсон, сын Алекса Мэйсона из первой части Black Ops, вместе со своим отрядом пытается остановить террориста по имени Рауль Менендес, который является лидером крупнейшей террористической организации на планете. Игра начинается с допроса Фрэнка Вудса в локации «Убежище», месте, где живут престарелые бывшие сотрудники ЦРУ. Фрэнк рассказывает Мэйсону все, что он знает.</p>\r\n<p>Всего в игре 11 сюжетных миссий, на протяжении которых игроки перемещаются по локациям как на своих двоих, так и на транспорте. Помимо сюжетного режима, в игре присутствуют обязательный для серии многопользовательский режим, а так же сверхпопулярный зомби-режим, в котором четверым игрокам предстоит отбиваться от толп живых мертвецов.</p>', NULL),
(4, '2018-07-06 19:12:53', '2018-07-06 19:12:53', 'Dishonored 2', 1, '500.00', '/storage/uploads/products/prod-id-4/productPic.jpg', '<p>В игре Dishonored 2, вы снова окажетесь в роли ассасина со сверхъестественными способностями.
Сайт IGN назвал эту игру «удивительной» и «идеальным продолжением», Eurogamer признал ее «шедевром», а Game Informer считает, что «эта история о мести – одна из лучших в своем жанре и проходить мимо нее ни в коем случае нельзя»; Dishonored 2 – это продолжение знаменитого боевика Dishonored от Arkane Studios, завоевавшего более сотни наград «Игра года».</p>\r\n<p>Окунитесь в удивительный мир, в котором мистика и технологии живут рука об руку. Решите, за кого играть: за императрицу Эмили Колдуин или за защитника короны, Корво Аттано. Выберите свой стиль: пройдите игру, не попавшись никому на глаза, воспользовавшись всем арсеналом убийственных приемов или соединив оба подхода так, как вам нравится. Найдите уникальное сочетание способностей, оружия и снаряжения, позволяющее с легкостью уничтожать врагов. Игра реагирует на каждое ваше решение: в зависимости от ваших действий у каждого задания может быть разный исход.</p>', NULL),
(5, '2018-07-06 19:13:10', '2018-07-06 19:13:10', 'Overwatch', 4, '200.00', '/storage/uploads/products/prod-id-5/productPic.jpg', '<p>Overwatch 2 - это продолжение командного многопользовательского шутера от Blizzard, в котором авторы добавили сюжетную кампанию, особые героические миссии, кастомизацию навыков и предметы. Все это - для нового PvE-режима, который предназначен для развития вселенной Overwatch. PvP-режимы при этом никуда не делись, более того - все игроки в первую часть будут играть на тех же картах и теми же героями, что и владельцы сиквела.</p>\r\n<p>Если же игрок решился перейти из первой части во вторую, то он ничего не теряет. В сиквел переносится абсолютно весь прогресс, включая все облики, реплики персонажей, граффити и многое другое.</p>', NULL),
(6, '2018-07-06 19:13:27', '2018-07-06 19:13:27', 'Rocket League', 1, '400.00', '/storage/uploads/products/prod-id-6/productPic.jpg', '<p>Rocket Racing League - трехмерный симулятор ракетного самолета, который принимает участие в гонках среди себе подобных. Есть возможность посоревноваться с реальными соперниками в режиме мультиплеера.</p>\r\n<p>В футуристической спортивной игре Rocket League® игроки могут управлять мощными болидами, разрушать все вокруг ради наград и мастерски избегать столкновений на самых разнообразных аренах. Rocket League® реалистично передает взаимодействия в игре за счет продвинутой физической системы и реализации законов массы и импульса, что дает игрокам возможность интуитивного управления в этом невероятно энергичном варианте футбола.</p>', NULL),
(7, '2018-07-06 19:13:43', '2018-07-06 19:52:10', 'This War of Mine', 3, '1000.00', '/storage/uploads/products/prod-id-7/productPic.jpg', '<p>This War of Mine: Final Cut – это завершающее, обновленное издание игры, которое включает все дополнения и бесплатные расширения, выпущенные на данный момент, а также новый сценарий и дополнительные локации к эпизодам Stories DLC – даже если вы ими не владеете. Это значит, что теперь у вас появится множество новых вариантов прохождения и новых испытаний.</p>\r\n<p>В This War of Mine вы играете не за элитного солдата, а за группу гражданских, которые пытаются выжить в осажденном городе и страдают от нехватки воды, лекарств и постоянной угрозы снайперов и мародеров. Игра позволяет посмотреть на войну под совершенно непривычным углом.</p>\r\n<p>Темп игры задает смена дня и ночи. Днем снайперы на улицах не позволяют вам покидать укрытие, поэтому вам остается поддерживать жизнь в убежище: мастерить, торговать и заботиться о выживших. Зато ночью вы с одним из горожан отправляетесь по уникальным локациям в поисках полезных предметов.</p>\r\n<p>Слушайте свою совесть и принимайте решения, от которых зависят жизни людей. Постарайтесь защитить всех в своем укрытии, либо приносите жертвы ради долгосрочного выживания. На войне нет хороших и плохих решений, есть только выживание. Чем раньше вы это усвоите, тем лучше для вас.</p>', NULL),
(8, '2018-07-06 19:14:07', '2018-07-06 19:14:07', 'The Witcher 3: Wild Hunt', 2, '700.00', '/storage/uploads/products/prod-id-8/productPic.jpg', '<p>The Witcher 3: Wild Hunt - Game of the Year Edition — это сюжетная ролевая игра с открытым миром. Её действие разворачивается в поразительной волшебной вселенной, и любое ваше решение может повлечь за собой серьёзные последствия. Вы играете за профессионального охотника на монстров Геральта из Ривии, которому поручено найти Дитя предназначения в огромном мире, полном торговых городов, пиратских островов, опасных горных перевалов и заброшенных пещер.</p>', NULL),
(9, '2018-07-06 19:14:22', '2018-07-06 19:14:22', 'World of Warcraft: Legion', 4, '500.00', '/storage/uploads/products/prod-id-9/productPic.jpg', '<p>World of Warcraft: Legion - это очередное дополнение, в котором Орде и Альянсу предстоит столкнуться с демоническим Пылающим Легионом. Введен новый играбельный класс - охотник на демонов. Еще одним нововведением являются артефакты - мощное оружие. Обновлена система чести.</p>', NULL),
(11, '2018-07-07 12:25:07', '2018-07-07 12:25:07', 'Gothic 2', 2, '9999.00', '/storage/uploads/products/prod-id-11/productPic.jpg', '<p>Практически все та же Gothic 2, обросшая дополнительными возможностями и еще более увлекательными приключениями. Бессмысленно рекомендовать Night of the Raven людям, игравшим в оригинал, — репутация Piranha Bytes достаточно красноречива. Игра может прийтись не по нраву лишь любителям глубоких разветвленных диалогов и передовых графических решений.</p>', NULL),
(12, '2018-07-07 12:26:49', '2018-07-07 12:26:49', 'The Elder Scrolls 3: Morrowind', 2, '800.00', '/storage/uploads/products/prod-id-12/productPic.jpg', '<p>Эпическая, нелинейная одиночная RPG Morrowind позволяет вам создать и играть любым персонажем, которого вы только сможете придумать. Вы можете идти по главной сюжетной линии и найти источник пагубной болезни, отравляющей землю или отправиться в собственное путешествие, изучая удивительные локации и совершенствуя образ своего персонажа его поступками в игре. Обладая сногсшибательной 3D графикой, нелинейным сюжетом и невероятным уровнем детализации и интерактивности, Morrowind предлагает вам геймплей, который вы больше нигде не найдете.</p>\r\n<p>В Tribunal вы совершаете путешествие в столицу Морроувинда, Морнхолд, для того, чтобы встретить двух королей-богов Морроувинда, Алмалексию и Сота Сила. Ваше путешествие приведет вас к Заводному Городу Сота Сила и массивным, исполинским подземельям, в которых вас ждут странные и смертельно опасные существа: гоблины, лорды-личи и загадочные Фабриканты.</p>\r\n<p>Bloodmoon переносит вас на ледяной остров Солстхейм, на котором вас ждут снег, метели и новые существа, такие как морозные тролли, ледяные големы, волки... и еще много других. Вы сможете выбрать один из двух путей развития сюжета и получите возможность защищать колонию, самому решить, как она будет построена, и уничтожить оборотней. Однако, вы можете также присоединиться к оборотням, стать одним из них, открыв для себя абсолютно новый стиль игры.</p>', NULL),
(13, '2018-07-07 12:28:08', '2018-07-07 12:28:08', 'Risen 3: Titan Lords', 2, '400.00', '/storage/uploads/products/prod-id-13/productPic.jpg', '<p>Risen 3: Titan Lords - это третья часть ролевой серии от создателей Gothic, действие которой разворачивается в том же мире, что и события Risen и Dark Waters, однако главный герой - совершенно новый, а сюжетные события связаны с оригиналом и сиквелом крайне слабо.</p>', NULL),
(14, '2018-07-07 12:29:00', '2018-07-07 12:29:00', 'The Elder Scrolls 5: Skyrim', 2, '600.00', '/storage/uploads/products/prod-id-14/productPic.jpg', '<p>The Elder Scrolls V: Skyrim - это приключенческая ролевая игра, пятая часть в серии The Elder Scrolls, с огромным открытым миром, который с самого начала полностью доступен для исследования. Игрокам предстоит выступить в роли Довакина, Драконорожденного, который появляется в провинции Скайрим аккурат во время возвращения легендарных драконов, которые, по преданию, собираются разрушить мир. Довакину предстоит преодолеть множество трудностей на пути к своей цели - остановить драконьего повелителя Алдуина, который готовится обрушить свою ярость на весь мир.</p>\r\n<p>Игроки вольны выбирать, проходить им сюжетную линию, заняться побочными заданиями или же просто бродить по миру. В Skyrim нет четкого понятия "класс персонажа" - протагониста можно развивать, как понравится игроку, создавая всевозможные комбинации из стандартных "ролевых" классов.</p>', NULL),
(15, '2018-07-07 12:30:09', '2018-07-07 12:30:09', 'Vampires The Masquerade: Bloodlines', 2, '900.00', '/storage/uploads/products/prod-id-15/productPic.jpg', '<p>Vampire: The Masquerade - Bloodlines - ролевая игра с элементами экшена, разработанная компанией Troika Games. Игра ведется от лица вампира, в самом начале необходимо выбрать клан, от которого зависит, какими способностями сможет овладеть ваш персонаж. Помимо выполнения сюжетных заданий, можно брать сторонние квесты практически и любого подвернувшегося персонажа.</p>\r\n<p>Bloodlines основана на настольной ролевой игре Vampire: The Masquerade, выпускаемой издательством White Wolf Publishing, и еt действие происходит в той же вселенной — World of Darkness, "Мире тьмы", где одновременно с людьми существуют вампиры, оборотни и другие фантастические существа. Игроку в роли новообращенного вампира предстоит расследовать появление в Лос-Анджелесе загадочного "Анкарского Саркофага", из-за чего он оказывается впутан в заговор сразу нескольких организаций, жаждущих заполучить этот предмет. Игра предоставляет игроку возможность присоединиться к одному из нескольких вампирских кланов и выполнять задания в различных районах Лос-Анджелеса — как в ходе боевых действий, так и мирным общением.</p>', NULL),
(16, '2018-07-07 20:23:44', '2018-07-07 20:23:45', 'GTA V', 8, '600.00', '/storage/uploads/products/prod-id-16/productPic.jpg', '<p>Когда молодой уличный жулик, отставной грабитель банков и опасный для общества психопат оказываются втянуты в разборки с самыми пугающими и сумасшедшими представителями криминального мира, правительства США и индустрии развлечений, им приходится выполнить серию рискованных налетов, чтобы выжить в безжалостном городе, где они не могут доверять никому – и в первую очередь друг другу.</p>\r\n<p>Grand Theft Auto V для PC позволяет игрокам исследовать знаменитый мир Лос-Сантоса и округа Блэйн в разрешении до 4k и выше с частотой 60 кадров в секунду.</p>\r\n<p>Игра предлагает множество уникальных для компьютера настроек, в том числе более 25 отдельных параметров для настройки качества текстур, шейдеров, тесселяции, сглаживания и не только, а также поддержку и настройку управления с помощью клавиатуры и мыши. Из дополнительных возможностей можно отметить ползунок населенности города, управляющий плотностью потока машин и пешеходов, поддержку двух и трех мониторов, поддержку 3D и функцию «plug-and-play» для геймпадов.</p>\r\n<p>А еще Grand Theft Auto V для PC включает Grand Theft Auto Online с поддержкой 30 игроков и двух зрителей. В состав Grand Theft Auto Online для PC входят все ранее выпущенные улучшения игрового процесса и созданные Rockstar материалы, в том числе недавно вышедшее обновление «Ограбления» и режим «Противоборство», которые доступны с первого дня.</p>', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `created_at`, `updated_at`, `name`, `value`) VALUES
(1, '2018-07-06 12:23:51', '2018-07-08 12:54:30', 'order_email', 'gamesmarket@inbox.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `order_positions`
--
ALTER TABLE `order_positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_positions_order_id_foreign` (`order_id`),
  ADD KEY `order_positions_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_categorie_id_foreign` (`categorie_id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_unique` (`name`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `order_positions`
--
ALTER TABLE `order_positions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `order_positions`
--
ALTER TABLE `order_positions`
  ADD CONSTRAINT `order_positions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_positions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
