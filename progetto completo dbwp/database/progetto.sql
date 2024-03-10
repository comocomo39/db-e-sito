-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Set 19, 2022 alle 17:35
-- Versione del server: 8.0.30
-- Versione PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `progetto`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `album_artista`
--

CREATE TABLE `album_artista` (
  `ID_Album` int NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Lingua` varchar(20) NOT NULL,
  `Data` year NOT NULL,
  `codiceA` int NOT NULL,
  `Durata` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `album_artista`
--

INSERT INTO `album_artista` (`ID_Album`, `Nome`, `Lingua`, `Data`, `codiceA`, `Durata`) VALUES
(1, 'The Rise and Fall of Ziggy Stardust and the Spiders From Mars', 'Inglese', 1972, 1, '00:38:29'),
(2, 'Blackstar', 'Inglese', 2016, 1, '00:41:13'),
(3, 'Patterns of Consciousness ', 'Italiano', 2016, 2, '01:09:25'),
(4, 'Ecstatic Computation', 'Italiano', 2019, 2, '00:36:00'),
(5, 'Scacco matto ', 'Italiano', 2020, 3, '00:41:37'),
(6, 'Superimpositions', 'Italiano', 2020, 3, '00:38:10'),
(7, 'Illmatic', 'Inglese', 1994, 17, '00:39:44'),
(8, 'It Was Written', 'Inglese', 1996, 17, '00:58:29');

-- --------------------------------------------------------

--
-- Struttura della tabella `album_gruppo`
--

CREATE TABLE `album_gruppo` (
  `ID_Album` int NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Lingua` varchar(20) NOT NULL,
  `Data` year NOT NULL,
  `codiceG` int NOT NULL,
  `Durata` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `album_gruppo`
--

INSERT INTO `album_gruppo` (`ID_Album`, `Nome`, `Lingua`, `Data`, `codiceG`, `Durata`) VALUES
(1, 'Remain in Light', 'Inglese', 1980, 1, '00:40:10'),
(2, 'Fear Of Music', 'Inglese', 1979, 1, '00:40:40'),
(3, 'Talking Heads: 77', 'Inglese', 1977, 1, '00:38:37'),
(4, 'Ok Computer', 'Inglese', 1997, 2, '00:53:21'),
(5, 'Kid A', 'Inglese', 2000, 2, '00:49:55'),
(6, 'In Rainbows', 'Inglese', 2000, 2, '00:42:38'),
(7, 'Loveless', 'Inglese', 1991, 3, '01:02:38'),
(8, 'Isnt Anything', 'Inglese', 1988, 3, '01:10:38'),
(9, 'm b v', 'Inglese', 1988, 3, '00:46:36');

-- --------------------------------------------------------

--
-- Struttura della tabella `artista`
--

CREATE TABLE `artista` (
  `ID_Artista` int NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Nazione` varchar(20) NOT NULL,
  `DataNascita` year NOT NULL,
  `DataMorte` year DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `artista`
--

INSERT INTO `artista` (`ID_Artista`, `Nome`, `Nazione`, `DataNascita`, `DataMorte`) VALUES
(1, 'David Bowie', 'Regno Unito', 1947, 2016),
(2, 'Caterina Barbieri', 'Italia', 1990, NULL),
(3, 'Lorenzo Senni', 'Italia', 1983, NULL),
(4, 'David Byrne', 'Stati Uniti', 1952, NULL),
(5, 'Tina Weymouth', 'Stati Uniti', 1949, NULL),
(6, 'Jerry Harrison', 'Stati Uniti', 1952, NULL),
(7, 'Chris Frantz', 'Stati Uniti', 1951, NULL),
(8, 'Thom Yorke', 'Regno Unito', 1968, NULL),
(9, 'Jonny Greenwood', 'Regno Unito', 1971, NULL),
(10, 'Ed O Brien', 'Regno Unito', 1968, NULL),
(11, 'Colin Greenwood', 'Regno Unito', 1969, NULL),
(12, 'Philip Selway', 'Regno Unito', 1967, NULL),
(13, 'Kevin Shields', 'Irlanda', 1963, NULL),
(14, 'Colm O Ciosoig', 'Irlanda', 1967, NULL),
(15, 'Debbie Googe', 'Irlanda', 1965, NULL),
(16, 'Bilinda Butcher', 'Irlanda', 1961, NULL),
(17, 'Nas', 'Stati Uniti', 1973, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `canzone_artista`
--

CREATE TABLE `canzone_artista` (
  `ID_Canzone` int NOT NULL,
  `Ntracklist` int NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `FK_ALBUMARTISTA` int NOT NULL
) ;

--
-- Dump dei dati per la tabella `canzone_artista`
--

INSERT INTO `canzone_artista` (`ID_Canzone`, `Ntracklist`, `Nome`, `FK_ALBUMARTISTA`) VALUES
(1, 1, 'Five Years', 1),
(2, 2, 'Soul Love', 1),
(3, 3, 'Moonage Daydream', 1),
(4, 4, 'Starman', 1),
(5, 5, 'It Aint Easy', 1),
(6, 6, 'Lady Stardust', 1),
(7, 7, 'Star', 1),
(8, 8, 'Hang On to Yourself', 1),
(9, 9, 'Ziggy Stardust', 1),
(10, 10, 'Suffragette City', 1),
(11, 11, 'Rock n Roll Suicide', 1),
(12, 1, 'Blackstar', 2),
(13, 2, 'Tis a Pity She Was a Whore', 2),
(14, 3, 'Lazarus', 2),
(15, 4, 'Sue (Or In a Season of Crime)', 2),
(16, 5, 'Girl Loves Me', 2),
(17, 6, 'Dollar Days', 2),
(18, 7, 'I Cant Give Everything Away', 2),
(19, 1, 'This Causes Consciousness to Fracture', 3),
(20, 2, 'TCCTF', 3),
(21, 3, 'Information Needed to Create an Entire Body', 3),
(22, 4, 'INTCAEB', 3),
(23, 5, 'Scratches on the Readable Surface ', 3),
(24, 6, 'SOTRS', 3),
(25, 7, 'Gravity that Binds', 3),
(26, 1, 'Fantas', 4),
(27, 2, 'Spine of Desire', 4),
(28, 3, 'Closest Approach to Your Orbit', 4),
(29, 4, 'Arrows of Time', 4),
(30, 5, 'Pinnacles of You', 4),
(31, 6, 'Bow of Perception', 4),
(32, 1, 'Discipline of Enthusiasm', 5),
(33, 2, 'XBreakingEdgeX', 5),
(34, 3, 'Move in Silence', 5),
(35, 4, 'Canone infinito', 5),
(36, 5, 'Dance Tonight Revolution Tomorrow', 5),
(37, 6, 'The Power of Failing', 5),
(38, 7, 'Wasting Time Writing Lorenzo Senni Songs', 5),
(39, 8, 'THINK BIG', 5),
(40, 1, 'Happic', 6),
(41, 2, 'Elegant, and Never Tiring', 6),
(42, 3, 'Zeroth-order Approximation', 6),
(43, 4, 'Superimpositions', 6),
(44, 5, 'Forever Headline', 6),
(45, 6, 'Xxx1', 6),
(46, 7, 'PointillistiC', 6),
(47, 1, 'The Genesis', 7),
(48, 2, 'N.Y. State of Mind', 7),
(49, 3, 'Life is a Bitch', 7),
(50, 4, 'The World Is Yours', 7),
(51, 5, 'Halftime', 7),
(52, 6, 'Memory Lane', 7),
(53, 7, 'One Love', 7),
(54, 8, 'One Time 4 Your Mind', 7),
(55, 9, 'Represent', 7),
(56, 10, 'It Ain t Hard to Tell', 7),
(57, 1, 'Album Intro', 8),
(58, 2, 'The Message', 8),
(59, 3, 'Street Dreams', 8),
(60, 4, 'I Gave You Power', 8),
(61, 5, 'Watch Dem Niggas', 8),
(62, 6, 'Take It in Blood', 8),
(63, 7, 'Nas Is Coming', 8),
(64, 8, 'Affirmative Action', 8),
(65, 9, 'The Set Up', 8),
(66, 10, 'Black Girl Lost', 8),
(67, 11, 'Suspect', 8),
(68, 12, 'Shootouts', 8),
(69, 13, 'Live Nigga Rap', 8),
(70, 14, 'If I Ruled the World (Imagine That)', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `canzone_gruppo`
--

CREATE TABLE `canzone_gruppo` (
  `ID_Canzone` int NOT NULL,
  `Ntracklist` int NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `FK_ALBUMGRUPPO` int NOT NULL
) ;

--
-- Dump dei dati per la tabella `canzone_gruppo`
--

INSERT INTO `canzone_gruppo` (`ID_Canzone`, `Ntracklist`, `Nome`, `FK_ALBUMGRUPPO`) VALUES
(1, 1, 'Born Under Punches (The Heat Goes On)', 1),
(2, 2, 'Crosseyed and Painless', 1),
(3, 3, 'The Great Curve', 1),
(4, 4, 'Once in a Lifetime', 1),
(5, 5, 'Houses in Motion', 1),
(6, 6, 'Seen and Not Seen', 1),
(7, 7, 'Listening Wind', 1),
(8, 8, 'The Overload', 1),
(9, 1, 'I Zimbra', 2),
(10, 2, 'Mind', 2),
(11, 3, 'Paper', 2),
(12, 4, 'Cities', 2),
(13, 5, 'Life During Wartime', 2),
(14, 6, 'Memories Cant Wait', 2),
(15, 7, 'Air', 2),
(16, 8, 'Heaven', 2),
(17, 9, 'Animals', 2),
(18, 10, 'Electric Guitar', 2),
(19, 11, 'Drugs', 2),
(20, 1, 'Uh-Oh, Love Comes to Town', 3),
(21, 2, 'New Feeling', 3),
(22, 3, 'Tentative Decisions', 3),
(23, 4, 'Happy Day', 3),
(24, 5, 'Who Is It?', 3),
(25, 6, 'No Compassion', 3),
(26, 7, 'The Book I Read', 3),
(27, 8, 'Dont Worry About the Government', 3),
(28, 9, 'First Week / Last Week...Carefree', 3),
(29, 10, 'Psycho Killer', 3),
(30, 11, 'Pulled Up', 3),
(31, 1, 'Airbag', 4),
(32, 2, 'Paranoid Android', 4),
(33, 3, 'Subterranean Homesick Alien', 4),
(34, 4, 'Exit Music (For a Film)', 4),
(35, 5, 'Let Down', 4),
(36, 6, 'Karma Police', 4),
(37, 7, 'Fitter Happier', 4),
(38, 8, 'Electioneering', 4),
(39, 9, 'Climbing Up the Walls', 4),
(40, 10, 'No Surprises', 4),
(41, 11, 'Lucky', 4),
(42, 12, 'The Tourist', 4),
(43, 1, 'Everything in Its Right Place', 5),
(44, 2, 'Kid A', 5),
(45, 3, 'The National Anthem', 5),
(46, 4, 'How to Disappear Completely', 5),
(47, 5, 'Treefingers', 5),
(48, 6, 'Optimistic', 5),
(49, 7, 'In Limbo', 5),
(50, 8, 'Idioteque', 5),
(51, 9, 'Morning Bell', 5),
(52, 10, 'Motion Picture Soundtrack', 5),
(53, 1, '15 Step', 6),
(54, 2, 'Bodysnatchers', 6),
(55, 3, 'Nude', 6),
(56, 4, 'Weird Fishes / Arpeggi', 6),
(57, 5, 'All I Need', 6),
(58, 6, 'Faust Arp', 6),
(59, 7, 'Reckoner', 6),
(60, 8, 'House of Cards', 6),
(61, 9, 'Jigsaw Falling Into Place', 6),
(62, 10, 'Videotape', 6),
(63, 1, 'Only Shallow', 7),
(64, 2, 'Loomer', 7),
(65, 3, 'Touched', 7),
(66, 4, 'To Here Knows When', 7),
(67, 5, 'When You Sleep', 7),
(68, 6, 'I Only Said', 7),
(69, 7, 'Come In Alone', 7),
(70, 8, 'Sometimes', 7),
(71, 9, 'Blown a Wish', 7),
(72, 10, 'What You Want', 7),
(73, 11, 'Soon', 7),
(74, 1, 'Soft as Snow (But Warm Inside)', 8),
(75, 2, 'Lose My Breath', 8),
(76, 3, 'Cupid Come', 8),
(77, 4, '(When You Wake) You are Still in a Dream', 8),
(78, 5, 'No More Sorry', 8),
(79, 6, 'All I Need', 8),
(80, 7, 'Feed Me With Your Kiss', 8),
(81, 8, 'Sueisfine', 8),
(82, 9, 'Several Girls Galore', 8),
(83, 10, 'You Never Should', 8),
(84, 11, 'Nothing Much to Lose', 8),
(85, 12, 'I Can See It (But I Cant Feel It)', 8),
(86, 1, 'She Found Now', 9),
(87, 2, 'Only Tomorrow', 9),
(88, 3, 'Who Sees You', 9),
(89, 4, 'Is This and Yes', 9),
(90, 5, 'If I Am', 9),
(91, 6, 'New You', 9),
(92, 7, 'In Another Way', 9),
(93, 8, 'Nothing Is', 9),
(94, 9, 'Wonder 2', 9);

-- --------------------------------------------------------

--
-- Struttura della tabella `commento`
--

CREATE TABLE `commento` (
  `ID_Commento` int NOT NULL,
  `Corpo` varchar(400) NOT NULL,
  `FK_Thread` int NOT NULL,
  `FK_Utente` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `commento`
--

INSERT INTO `commento` (`ID_Commento`, `Corpo`, `FK_Thread`, `FK_Utente`) VALUES
(1, 'Bel disco, il mio è Ecstatic Computation', 1, 'Matteo00'),
(2, 'Il mio Illmatic.', 1, 'beax34'),
(3, 'Difficile decidere, ci son tanti album belli.', 1, 'rossonero45'),
(4, 'Ho delle beyer che suonano molto bene', 2, 'Andrea'),
(5, 'Uso delle Porta pro della Koss', 2, 'beax34'),
(6, 'Sto decidendo quali comprare perche le mie si son rotte, darò una occhiata a queste che avete detto', 2, 'rossonero45'),
(7, 'Brutto', 5, 'Antonio'),
(8, 'Bello', 5, 'Antonio'),
(9, 'ok', 5, 'Antonio'),
(11, 'Boss', 2, 'Antonio'),
(20, 'bose soundlin II, perfette', 2, 'comocomo39'),
(21, 'Ciao', 1, 'dzekoh'),
(22, 'oooohhhh', 8, 'dzekoh');

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `conteggiocommenti`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `conteggiocommenti` (
`NumCommenti` bigint
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `conteggiothread`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `conteggiothread` (
`NumThread` bigint
);

-- --------------------------------------------------------

--
-- Struttura della tabella `descrizione_al_ar`
--

CREATE TABLE `descrizione_al_ar` (
  `FK_GENERE` int NOT NULL,
  `FK_ALBUM` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `descrizione_al_ar`
--

INSERT INTO `descrizione_al_ar` (`FK_GENERE`, `FK_ALBUM`) VALUES
(2, 1),
(2, 2),
(3, 3),
(5, 3),
(3, 4),
(3, 5),
(5, 5),
(3, 6),
(4, 7),
(4, 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `descrizione_al_gr`
--

CREATE TABLE `descrizione_al_gr` (
  `FK_GENERE` int NOT NULL,
  `FK_ALBUM` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `descrizione_al_gr`
--

INSERT INTO `descrizione_al_gr` (`FK_GENERE`, `FK_ALBUM`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(6, 7),
(6, 8),
(6, 9);

-- --------------------------------------------------------

--
-- Struttura della tabella `descrizione_ar`
--

CREATE TABLE `descrizione_ar` (
  `FK_GENERE` int NOT NULL,
  `FK_ARTISTA` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `descrizione_ar`
--

INSERT INTO `descrizione_ar` (`FK_GENERE`, `FK_ARTISTA`) VALUES
(2, 1),
(3, 2),
(5, 2),
(5, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `descrizione_g`
--

CREATE TABLE `descrizione_g` (
  `FK_GENERE` int NOT NULL,
  `FK_GRUPPO` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `descrizione_g`
--

INSERT INTO `descrizione_g` (`FK_GENERE`, `FK_GRUPPO`) VALUES
(1, 1),
(1, 2),
(6, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `formazione`
--

CREATE TABLE `formazione` (
  `FK_ARTISTA` int NOT NULL,
  `FK_GRUPPO` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `formazione`
--

INSERT INTO `formazione` (`FK_ARTISTA`, `FK_GRUPPO`) VALUES
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 3),
(14, 3),
(15, 3),
(16, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `genere`
--

CREATE TABLE `genere` (
  `ID_Genere` int NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Descrizione` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `genere`
--

INSERT INTO `genere` (`ID_Genere`, `Nome`, `Descrizione`) VALUES
(1, 'Rock', 'Il termine rock viene utilizzato per indicare la varietà di stili musicali nati dall?evoluzione del rock and roll. È a partire dalla prima metà degli anni Sessanta del Novecento che il rock inizia a costituire un identità musicale distinta da quella nata e proliferata dal pionieristico rock and roll, anche se a essa strettamente legata. Oggi, dopo almeno un cinquantennio dal suo utilizzo sistematico da parte dei media e della critica musicale specializzata, è possibile considerare il termine rock come una sorta di parola-ombrello che copre molteplici stili di musica leggera o di consumo e, per estensione, anche quel rock and roll che ne sta alla base'),
(2, 'Pop', 'Il pop è un genere di musica popolare che ha avuto origine nella sua forma moderna durante la metà degli anni 50 negli Stati Uniti e nel Regno Unito . I termini musica popolare e musica pop sono spesso usati in modo intercambiabile, sebbene il primo descriva tutta la musica popolare e includa molti stili disparati. Durante gli anni 50 e 60, il pop comprendeva il rock and roll e gli stili orientati ai giovani che influenzava. Rock e pop rimasero più o meno sinonimi fino alla fine degli anni 60, dopodiché il pop divenne associato a musica più commerciale, effimera e accessibile. '),
(3, 'Ambient', 'Con il termine musica di ambiente (o, sempre in una traduzione italiana, musica ambientale), in inglese ambient music o, in forma abbreviata, ambient (in italiano è infatti comunemente chiamata anche musica ambient), si indica un genere musicale in cui il tono e l atmosfera possono assumere più importanza dei valori di ritmo e struttura così come vengono tradizionalmente concepiti in ambito musicale. Non va confusa con la musica per ambienti o Muzak, alla quale si oppone. Della musica ambientale si dice che evochi qualità di \"atmosfera\", \"visive\" oppure di \"discrezione\". È generalmente identificabile come un genere musicale caratterizzato da suoni ampiamente atmosferici e naturali.'),
(4, 'Hip Hop', 'La musica hip hop, anche nota come hip hop o musica rap, è un genere musicale nato negli Stati Uniti d America negli anni settanta, caratterizzato da musica ritmica, da differenziare dal rapping propriamente detto, che è un discorso ritmato e pronunciato in rima. Il rap già era praticato in una forma molto rudimentale, ma da quando è diventato una delle discipline fatte proprie dall hip hop (quasi subito dopo la nascita dell hip hop) si è sviluppato enormemente. Il concetto culturale di hip hop si differenzia da quello più specifico di musica hip hop, in quanto è definito da quattro elementi stilistici caratteristici: MCing/rapping, DJing/scratching con giradischi, break dance e graffitismo.'),
(5, 'Trance', 'La Trance è un genere di musica elettronica nato all inizio degli anni novanta in Germania.È caratterizzata da un tempo che va dai 110 ai 150 bpm, fraseggi melodici ripetuti e da una marcata costruzione della tensione musicale spesso culminante in uno e due \"picchi\" (o \"drops\"). Nonostante la trance sia un genere a sé stante essa incorpora liberamente influenze provenienti da altri generi musicali quali techno, house, pop, chill-out, musica classica, ambient e colonne sonore cinematografiche.'),
(6, 'Shoegaze', 'Lo shoegaze (o anche shoegazing) è un sottogenere musicale dell alternative rock, sviluppatosi nel Regno Unito alla fine degli anni ottanta. Tra gli elementi identificativi, oltre a un significativo utilizzo di effetti (perlopiù distorsore e riverbero) per le chitarre spesso impegnate in riff monocorda (drone), vi è un forte senso melodico delle parti vocali, trattate come mero strumento supplementare e quasi \"sognanti\", tanto che il genere è in buona misura legato al dream pop. Grazie al muro di feedback prodotto dalle chitarre, il risultato è quasi assimilabile a certe produzioni di Phil Spector e ad una versione aggiornata e corretta (con l utilizzo dell elemento \"rumore\") del suo Wall of Sound. ');

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppo`
--

CREATE TABLE `gruppo` (
  `ID_Gruppo` int NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Nazione` varchar(20) NOT NULL,
  `Inizio_attivita` year NOT NULL,
  `Fine_attivita` year DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `gruppo`
--

INSERT INTO `gruppo` (`ID_Gruppo`, `Nome`, `Nazione`, `Inizio_attivita`, `Fine_attivita`) VALUES
(1, 'Talking Heads', 'Stati Uniti', 1974, 1991),
(2, 'Radiohead', 'Regno Unito', 1985, NULL),
(3, 'My Bloody Valentine', 'Irlanda', 1983, NULL);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `numerorecensioni`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `numerorecensioni` (
`nomeutente` varchar(20)
,`cont` bigint
);

-- --------------------------------------------------------

--
-- Struttura della tabella `recensione_ar`
--

CREATE TABLE `recensione_ar` (
  `ID_RECENSIONE` int NOT NULL,
  `FK_Utente` varchar(20) NOT NULL,
  `FK_Album_AR` int NOT NULL,
  `Intestazione` varchar(50) DEFAULT NULL,
  `Corpo` varchar(400) DEFAULT NULL,
  `voto` int NOT NULL
) ;

--
-- Dump dei dati per la tabella `recensione_ar`
--

INSERT INTO `recensione_ar` (`ID_RECENSIONE`, `FK_Utente`, `FK_Album_AR`, `Intestazione`, `Corpo`, `voto`) VALUES
(1, 'Andrea', 1, 'Il disco mi ha sorpreso', 'Ottimo disco del cantante David Bowie che mi ha sorpreso in positivo.', 7),
(2, 'Andrea', 4, 'Pensavo meglio', 'Per me non un passso avanti rispetto al primo album, ma indietro.', 5),
(3, 'Matteo00', 2, 'Ultimo album, chiusura in grande stile', 'Ultimo disco di Bowie, che chiude la carriera perfettamente.', 7),
(4, 'Matteo00', 4, 'Fantastico sound', 'Prima volta che sento qualcosa di simile, son sorpreso.', 9),
(5, 'beax34', 8, 'Un passo indietro', 'Non siamo ai livelli del primo album', 6),
(6, 'rossonero45', 7, NULL, NULL, 5),
(7, 'rossonero45', 4, NULL, NULL, 3),
(26, 'Antonio', 5, '', '', 9),
(29, 'comocomo39', 4, 'una bomba ', 'troppo serio cazzooo', 9),
(30, 'dzekoh', 1, '', '', 2),
(32, 'Fagiolo', 1, '', '', 1),
(33, 'Fagiolo', 8, '', '', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `recensione_gr`
--

CREATE TABLE `recensione_gr` (
  `ID_RECENSIONE` int NOT NULL,
  `FK_Utente` varchar(20) NOT NULL,
  `FK_Album_GR` int NOT NULL,
  `Intestazione` varchar(50) DEFAULT NULL,
  `Corpo` varchar(400) DEFAULT NULL,
  `voto` int NOT NULL
) ;

--
-- Dump dei dati per la tabella `recensione_gr`
--

INSERT INTO `recensione_gr` (`ID_RECENSIONE`, `FK_Utente`, `FK_Album_GR`, `Intestazione`, `Corpo`, `voto`) VALUES
(1, 'Andrea', 7, 'Miglior disco della loro carriera', 'Bellissimo album, uno dei miei preferiti', 9),
(2, 'Matteo00', 1, 'Molto bello', 'Bellissimo album, uno dei miei preferiti', 8),
(3, 'Matteo00', 3, 'Miglior disco della loro carriera', 'Bellissimo album, uno dei miei preferiti', 8),
(4, 'beax34', 7, NULL, NULL, 8),
(5, 'beax34', 8, 'Carino', 'Bello ma non bellissimo', 7),
(6, 'rossonero45', 2, NULL, NULL, 7),
(7, 'rossonero45', 5, NULL, NULL, 8),
(10, 'Antonio', 4, '', '', 2),
(12, 'Antonio', 1, '', '', 2),
(13, 'Antonio', 6, '', '', 4),
(15, 'Antonio', 8, 'Ottimo Album', 'Questo album mi è piaciuto molto, devo dire', 5),
(16, 'comocomo39', 1, '', '', 3),
(17, 'comocomo39', 2, '', '', 4),
(18, 'dzekoh', 8, '', '', 3),
(19, 'dzekoh', 7, '', '', 9),
(20, 'dzekoh', 1, '', '', 1),
(21, 'dzekoh', 9, '', '', 2),
(22, 'dzekoh', 4, '', '', 8),
(28, 'Fagiolo', 1, '', '', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `thread`
--

CREATE TABLE `thread` (
  `ID_Thread` int NOT NULL,
  `Intestazione` varchar(50) NOT NULL,
  `Corpo` varchar(400) NOT NULL,
  `FK_Utente` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `thread`
--

INSERT INTO `thread` (`ID_Thread`, `Intestazione`, `Corpo`, `FK_Utente`) VALUES
(1, 'Il vostro album preferito?', 'Il mio è Loveless', 'Andrea'),
(2, 'Che cuffia usate per ascoltare musica', 'Io uso delle bose', 'Matteo00'),
(5, 'Meteo', 'Com\'è oggi', 'Antonio'),
(8, 'Disco', 'k', 'dzekoh');

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `NomeUtente` varchar(20) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`NomeUtente`, `Email`, `Password`) VALUES
('Andrea', 'andrea@uniss.it', '12345678'),
('Antonio', 'anto00@gmail.com', '$2y$10$OT3o6NDUG5c7eWlgHF87g.OxVMa/.hG3aqrBEB/s.8WMw6/5Rkt1S'),
('beax34', 'beax34@uniss.it', '12345678'),
('ciao', 'ciao@cono.com', '$2y$10$opOhXb7r2mRHL8vfLMAa5evpyljG5Qg.1Jj/40DVtrHR5vJSSFZn6'),
('comocomo39', 'm.comini@uniss.it', '$2y$10$VlQrE0v5in4gtiilMvaO4.Uq/0bAPmqSWqvXARvAHZxdRkxwjVu8.'),
('dzekoh', 'carbo090@gmail.com', '$2y$10$5RtrSDrTuHVD5A6SFu5sq.06NnySom7WfPcHuqPOHiyhTHdj2XITK'),
('Fagiolo', 'fagiolo@gmail.com', '$2y$10$Uwh9SWF06DT975Bg1SO17.J5ET8o14k3tmFC/goe3w7MM2yWgI5DO'),
('Luigi21', 'luigi214@uniss.it', '12345678'),
('Matteo00', 'matt00@uniss.it', '12345678'),
('rossonero45', 'gianluca@uniss.it', '12345678'),
('Rox243', 'rox4@uniss.it', '12345678'),
('sofi1995', 'sofi95@uniss.it', '12345678');

-- --------------------------------------------------------

--
-- Struttura per vista `conteggiocommenti`
--
DROP TABLE IF EXISTS `conteggiocommenti`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `conteggiocommenti` (`NumCommenti`) AS   select count(`commento`.`ID_Commento`) AS `count(ID_Commento)` from `commento`  ;

-- --------------------------------------------------------

--
-- Struttura per vista `conteggiothread`
--
DROP TABLE IF EXISTS `conteggiothread`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `conteggiothread` (`NumThread`) AS   select count(`thread`.`ID_Thread`) AS `count(ID_Thread)` from `thread`  ;

-- --------------------------------------------------------

--
-- Struttura per vista `numerorecensioni`
--
DROP TABLE IF EXISTS `numerorecensioni`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `numerorecensioni` (`nomeutente`, `cont`) AS   select `utente`.`NomeUtente` AS `nomeutente`,count(`utente`.`NomeUtente`) AS `cont` from (`utente` join `recensione_gr`) where (`utente`.`NomeUtente` = `recensione_gr`.`FK_Utente`) group by `utente`.`NomeUtente` union select `utente`.`NomeUtente` AS `nomeutente`,count(`utente`.`NomeUtente`) AS `cont` from (`utente` join `recensione_ar`) where (`utente`.`NomeUtente` = `recensione_ar`.`FK_Utente`) group by `utente`.`NomeUtente`  ;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `album_artista`
--
ALTER TABLE `album_artista`
  ADD PRIMARY KEY (`ID_Album`),
  ADD KEY `FK2` (`codiceA`);

--
-- Indici per le tabelle `album_gruppo`
--
ALTER TABLE `album_gruppo`
  ADD PRIMARY KEY (`ID_Album`),
  ADD KEY `FK1` (`codiceG`);

--
-- Indici per le tabelle `artista`
--
ALTER TABLE `artista`
  ADD PRIMARY KEY (`ID_Artista`);

--
-- Indici per le tabelle `canzone_artista`
--
ALTER TABLE `canzone_artista`
  ADD PRIMARY KEY (`ID_Canzone`),
  ADD KEY `FK6` (`FK_ALBUMARTISTA`);

--
-- Indici per le tabelle `canzone_gruppo`
--
ALTER TABLE `canzone_gruppo`
  ADD PRIMARY KEY (`ID_Canzone`),
  ADD KEY `FK7` (`FK_ALBUMGRUPPO`);

--
-- Indici per le tabelle `commento`
--
ALTER TABLE `commento`
  ADD PRIMARY KEY (`ID_Commento`),
  ADD KEY `FK4` (`FK_Thread`),
  ADD KEY `FK5` (`FK_Utente`);

--
-- Indici per le tabelle `descrizione_al_ar`
--
ALTER TABLE `descrizione_al_ar`
  ADD PRIMARY KEY (`FK_GENERE`,`FK_ALBUM`),
  ADD KEY `FK17` (`FK_ALBUM`);

--
-- Indici per le tabelle `descrizione_al_gr`
--
ALTER TABLE `descrizione_al_gr`
  ADD PRIMARY KEY (`FK_GENERE`,`FK_ALBUM`),
  ADD KEY `FK19` (`FK_ALBUM`);

--
-- Indici per le tabelle `descrizione_ar`
--
ALTER TABLE `descrizione_ar`
  ADD PRIMARY KEY (`FK_GENERE`,`FK_ARTISTA`),
  ADD KEY `FK15` (`FK_ARTISTA`);

--
-- Indici per le tabelle `descrizione_g`
--
ALTER TABLE `descrizione_g`
  ADD PRIMARY KEY (`FK_GRUPPO`,`FK_GENERE`),
  ADD KEY `FK12` (`FK_GENERE`);

--
-- Indici per le tabelle `formazione`
--
ALTER TABLE `formazione`
  ADD PRIMARY KEY (`FK_GRUPPO`,`FK_ARTISTA`),
  ADD KEY `FK20` (`FK_ARTISTA`);

--
-- Indici per le tabelle `genere`
--
ALTER TABLE `genere`
  ADD PRIMARY KEY (`ID_Genere`);

--
-- Indici per le tabelle `gruppo`
--
ALTER TABLE `gruppo`
  ADD PRIMARY KEY (`ID_Gruppo`);

--
-- Indici per le tabelle `recensione_ar`
--
ALTER TABLE `recensione_ar`
  ADD PRIMARY KEY (`ID_RECENSIONE`),
  ADD UNIQUE KEY `Rec_UNICA` (`FK_Utente`,`FK_Album_AR`),
  ADD KEY `FK9` (`FK_Album_AR`);

--
-- Indici per le tabelle `recensione_gr`
--
ALTER TABLE `recensione_gr`
  ADD PRIMARY KEY (`ID_RECENSIONE`),
  ADD UNIQUE KEY `Rec_UNICA` (`FK_Utente`,`FK_Album_GR`),
  ADD KEY `FK11` (`FK_Album_GR`);

--
-- Indici per le tabelle `thread`
--
ALTER TABLE `thread`
  ADD PRIMARY KEY (`ID_Thread`),
  ADD KEY `FK3` (`FK_Utente`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`NomeUtente`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `album_artista`
--
ALTER TABLE `album_artista`
  MODIFY `ID_Album` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `album_gruppo`
--
ALTER TABLE `album_gruppo`
  MODIFY `ID_Album` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `artista`
--
ALTER TABLE `artista`
  MODIFY `ID_Artista` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT per la tabella `canzone_artista`
--
ALTER TABLE `canzone_artista`
  MODIFY `ID_Canzone` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `canzone_gruppo`
--
ALTER TABLE `canzone_gruppo`
  MODIFY `ID_Canzone` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `commento`
--
ALTER TABLE `commento`
  MODIFY `ID_Commento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT per la tabella `genere`
--
ALTER TABLE `genere`
  MODIFY `ID_Genere` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `gruppo`
--
ALTER TABLE `gruppo`
  MODIFY `ID_Gruppo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `recensione_ar`
--
ALTER TABLE `recensione_ar`
  MODIFY `ID_RECENSIONE` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `recensione_gr`
--
ALTER TABLE `recensione_gr`
  MODIFY `ID_RECENSIONE` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `thread`
--
ALTER TABLE `thread`
  MODIFY `ID_Thread` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `album_artista`
--
ALTER TABLE `album_artista`
  ADD CONSTRAINT `FK2` FOREIGN KEY (`codiceA`) REFERENCES `artista` (`ID_Artista`);

--
-- Limiti per la tabella `album_gruppo`
--
ALTER TABLE `album_gruppo`
  ADD CONSTRAINT `FK1` FOREIGN KEY (`codiceG`) REFERENCES `gruppo` (`ID_Gruppo`);

--
-- Limiti per la tabella `canzone_artista`
--
ALTER TABLE `canzone_artista`
  ADD CONSTRAINT `FK6` FOREIGN KEY (`FK_ALBUMARTISTA`) REFERENCES `album_artista` (`ID_Album`);

--
-- Limiti per la tabella `canzone_gruppo`
--
ALTER TABLE `canzone_gruppo`
  ADD CONSTRAINT `FK7` FOREIGN KEY (`FK_ALBUMGRUPPO`) REFERENCES `album_gruppo` (`ID_Album`);

--
-- Limiti per la tabella `commento`
--
ALTER TABLE `commento`
  ADD CONSTRAINT `FK4` FOREIGN KEY (`FK_Thread`) REFERENCES `thread` (`ID_Thread`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK5` FOREIGN KEY (`FK_Utente`) REFERENCES `utente` (`NomeUtente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `descrizione_al_ar`
--
ALTER TABLE `descrizione_al_ar`
  ADD CONSTRAINT `FK16` FOREIGN KEY (`FK_GENERE`) REFERENCES `genere` (`ID_Genere`),
  ADD CONSTRAINT `FK17` FOREIGN KEY (`FK_ALBUM`) REFERENCES `album_artista` (`ID_Album`);

--
-- Limiti per la tabella `descrizione_al_gr`
--
ALTER TABLE `descrizione_al_gr`
  ADD CONSTRAINT `FK18` FOREIGN KEY (`FK_GENERE`) REFERENCES `genere` (`ID_Genere`),
  ADD CONSTRAINT `FK19` FOREIGN KEY (`FK_ALBUM`) REFERENCES `album_gruppo` (`ID_Album`);

--
-- Limiti per la tabella `descrizione_ar`
--
ALTER TABLE `descrizione_ar`
  ADD CONSTRAINT `FK14` FOREIGN KEY (`FK_GENERE`) REFERENCES `genere` (`ID_Genere`),
  ADD CONSTRAINT `FK15` FOREIGN KEY (`FK_ARTISTA`) REFERENCES `artista` (`ID_Artista`);

--
-- Limiti per la tabella `descrizione_g`
--
ALTER TABLE `descrizione_g`
  ADD CONSTRAINT `FK12` FOREIGN KEY (`FK_GENERE`) REFERENCES `genere` (`ID_Genere`),
  ADD CONSTRAINT `FK13` FOREIGN KEY (`FK_GRUPPO`) REFERENCES `gruppo` (`ID_Gruppo`);

--
-- Limiti per la tabella `formazione`
--
ALTER TABLE `formazione`
  ADD CONSTRAINT `FK20` FOREIGN KEY (`FK_ARTISTA`) REFERENCES `artista` (`ID_Artista`),
  ADD CONSTRAINT `FK21` FOREIGN KEY (`FK_GRUPPO`) REFERENCES `gruppo` (`ID_Gruppo`);

--
-- Limiti per la tabella `recensione_ar`
--
ALTER TABLE `recensione_ar`
  ADD CONSTRAINT `FK8` FOREIGN KEY (`FK_Utente`) REFERENCES `utente` (`NomeUtente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK9` FOREIGN KEY (`FK_Album_AR`) REFERENCES `album_artista` (`ID_Album`);

--
-- Limiti per la tabella `recensione_gr`
--
ALTER TABLE `recensione_gr`
  ADD CONSTRAINT `FK10` FOREIGN KEY (`FK_Utente`) REFERENCES `utente` (`NomeUtente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK11` FOREIGN KEY (`FK_Album_GR`) REFERENCES `album_gruppo` (`ID_Album`);

--
-- Limiti per la tabella `thread`
--
ALTER TABLE `thread`
  ADD CONSTRAINT `FK3` FOREIGN KEY (`FK_Utente`) REFERENCES `utente` (`NomeUtente`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
