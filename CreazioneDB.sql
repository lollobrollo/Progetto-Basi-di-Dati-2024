-- creazione database

DROP DATABASE IF EXISTS DRGbeer;
CREATE DATABASE IF NOT EXISTS DRGbeer;
USE DRGbeer;

CREATE TABLE `birra` (
  `Nome` varchar(30) PRIMARY KEY,
  `Descrizione` varchar(255) NOT NULL,
  `BB` tinyint NOT NULL,
  `YC` tinyint NOT NULL,
  `MS` tinyint NOT NULL,
  `SN` tinyint NOT NULL
);

CREATE TABLE `licenza` (
  `Giocatore` varchar(30),
  `Birra` varchar(30),
  `Possesso` bool NOT NULL,
  PRIMARY KEY (`Giocatore`, `Birra`)
);

CREATE TABLE `giocatore` (
  `Nome` varchar(30) PRIMARY KEY,
  `BB` tinyint NOT NULL,
  `YC` tinyint NOT NULL,
  `MS` tinyint NOT NULL,
  `SN` tinyint NOT NULL
);

CREATE TABLE `suggerimento` (
  `Genericità` varchar(30),
  `Materiale` varchar(30),
  `Classe` varchar(30) NOT NULL,
  `Incarico` varchar(30) NOT NULL,
  `Anomalia` varchar(30) NOT NULL,
  `Bioma` varchar(30) NOT NULL,
  PRIMARY KEY (`Genericità`, `Materiale`)
);

CREATE TABLE `classe` (
  `Nome` varchar(30) PRIMARY KEY
);

CREATE TABLE `incarico` (
  `Nome` varchar(30) PRIMARY KEY
);

CREATE TABLE `anomalia` (
  `Nome` varchar(30) PRIMARY KEY
);

CREATE TABLE `bioma` (
  `Nome` varchar(30) PRIMARY KEY
);

CREATE TABLE `missione` (
  `ID` INT PRIMARY KEY AUTO_INCREMENT,
  `Versione` varchar(30)  NOT NULL,
  `Giocatore` varchar(30)  NOT NULL
);

CREATE TABLE `contenuto` (
  `ID` INT PRIMARY KEY AUTO_INCREMENT,
  `Classe` varchar(30) NOT NULL,
  `Incarico` varchar(30) NOT NULL,
  `Anomalia` varchar(30) NOT NULL,
  `Bioma` varchar(30) NOT NULL,
  `BB` tinyint NOT NULL,
  `YC` tinyint NOT NULL,
  `MS` tinyint NOT NULL,
  `SN` tinyint NOT NULL,
  FOREIGN KEY (`Classe`) REFERENCES classe(`Nome`),
  FOREIGN KEY (`Incarico`) REFERENCES incarico(`Nome`),
  FOREIGN KEY (`Anomalia`) REFERENCES anomalia(`Nome`),
  FOREIGN KEY (`Bioma`) REFERENCES bioma(`Nome`)
);

-- inserisco i campi generici all'interno della tabella suggerimento
INSERT INTO suggerimento VALUES ('0', 'BB', 'NA', 'NA', 'NA', 'NA');
INSERT INTO suggerimento VALUES ('0', 'YC', 'NA', 'NA', 'NA', 'NA');
INSERT INTO suggerimento VALUES ('0', 'MS', 'NA', 'NA', 'NA', 'NA');
INSERT INTO suggerimento VALUES ('0', 'SN', 'NA', 'NA', 'NA', 'NA');


-- popolo le tabelle classe, incarico, anomalia, bioma, birra

INSERT INTO `classe` (`Nome`) VALUES
('Driller'),
('Engineer'),
('Gunner'),
('Scout');

INSERT INTO `incarico` (`Nome`) VALUES
('Mining Expedition'),
('Egg Hunt'),
('Salvage Operation'),
('Point Extraction'),
('Elimination'),
('Escort Duty'),
('On-Site Refining'),
('Industrial Sabotage');

INSERT INTO `anomalia` (`Nome`) VALUES
('Cave Leech Cluster'),
('Elite Threat'),
('Exploder Infestation'),
('Haunted Cave'),
('Lethal Enemies'),
('Litophage Outbreak'),
('Low Oxygen'),
('Mactera Plague'),
('Parasites'),
('Regenerative Bugs'),
('Rival Presence'),
('Shield Disruption'),
('Swarmageddon'),
('Critical Weakness'),
('Double XP'),
('Gold Rush'),
('Golden Bugs'),
('Low Gravity'),
('Mineral Mania'),
('Rich Atmosphere'),
('Volatile Guts'),
('');

INSERT INTO `bioma` (`Nome`) VALUES
('Crystalline Cavern'),
('Salt Pits'),
('Fungus Bogs'),
('Radioactive Exclusion Zone'),
('Dense Biozone'),
('Glacial Strata'),
('Hollow Bough'),
('Azure Weald'),
('Magma Core'),
('Sandblasted Corridors');

INSERT INTO birra (Nome, Descrizione, BB, YC, MS, SN) VALUES
('Oily Oaf Brew', 'No Effect', 0, 0, 0, 0),
('Glyphid Slammer', 'No Effect', 0, 0, 0, 0),
('Leaf Lover’s Special', 'Removes Drunk status effect', 0, 0, 0, 0),
('Backbreaker Stout', 'x1.32 Carry Movement Speed', 1, 0, 0, 0),
('Dark Morkite', 'x1.44 Morkite mined', 2, 0, 0, 0),
('Pots O’ Gold', 'x4 Gold mined', 3, 0, 0, 0),
('Red Rock Blaster', 'x1.69 Max Health', 1, 0, 0, 0),
('Rocky Mountain', '-2 Pickaxe hit per terrain', 3, 0, 0, 0),
('Skull Crusher Ale', '+20 Base Pickaxe damage', 2, 0, 0, 0),
('Slayer Stout', 'x0.25 Pickaxe power attack cooldown', 2, 0, 0, 0),
('Tunnel Rat', '-60% Fall damage', 3, 0, 0, 0),
('Best Wurst Beer', 'No Effect', 0, 0, 0, 0),
('Arkenstout', 'A blizzard freezes you and encases you in ice', 0, 0, 4, 0),
('Blacklock Lager', 'Your screen will darken and you’ll hear ghostly sounds', 0, 2, 0, 5),
('Blackout Stout', 'Immediately maxes your drunk level, causing you to pass out', 0, 0, 0, 3),
('Blackreach Blonde', 'Receive the Jukebox effect and start dancing', 0, 3, 3, 0),
('Burning Love', 'You catch on fire', 0, 0, 6, 0),
('Flintlocke’s Delight', 'Explosions surround you, tossing you in random directions', 0, 3, 0, 2),
('Gut Wrecker', 'You release a loud burp and shake the screen', 1, 0, 0, 4),
('Mactera Brew', 'You release a loud fart and create a green cloud around you', 1, 0, 0, 6),
('Malt Rockbearer', 'You will grow in size', 0, 6, 0, 0),
('Randoweisser', 'Your loadout and cosmetics will be randomized', 0, 0, 0, 10),
('Seasoned Moonrider', 'You receive low gravity and gain an upward boost in momentum', 0, 0, 3, 4),
('Smart Stout', 'Become temporarily smart and talk like a scientist', 0, 0, 4, 2),
('Underhill Deluxe', 'You shrink in size', 0, 4, 0, 0),
('Wormhole Special', 'Teleports you to a random location (either the Drop Pod or outside the Space Rig)', 0, 1, 2, 3);







-- Prepared statement



-- per comodità, definisco una funzione che prende un materiale e la genericità e aggiorna il suggerimento relativo
DROP PROCEDURE IF EXISTS CalcoloSuggerimento;
DELIMITER //
CREATE PROCEDURE CalcoloSuggerimento (IN TargetMat VARCHAR(30), IN TargetGen VARCHAR(30))
BEGIN
    DECLARE Ver VARCHAR(30);
-- ricavo l'ultima verisone di gioco
    SELECT versione INTO Ver FROM missione ORDER BY ID DESC LIMIT 1;

    -- costruisco un prepared statement filtrando per genericità richiesta; in caso non ci fossero dati da utilizzare ritorno un suggerimento qualsiasi 
    IF STRCMP(TargetGen, '0') = 0 THEN
        -- calcolo i suggerimenti per i quattro campi generali
        SET @Query1 = CONCAT("SELECT IFNULL((SELECT LOWER(c.classe) FROM missione m INNER JOIN contenuto c ON m.ID = c.ID WHERE m.versione = '", Ver, "' GROUP BY LOWER(c.classe) ORDER BY SUM(", TargetMat, ")/COUNT(", TargetMat, ") LIMIT 1), 'Driller')");
        SET @Query2 = CONCAT("SELECT IFNULL((SELECT LOWER(c.incarico) FROM missione m INNER JOIN contenuto c ON m.ID = c.ID WHERE m.versione = '", Ver, "' GROUP BY LOWER(c.incarico) ORDER BY SUM(", TargetMat, ")/COUNT(", TargetMat, ") LIMIT 1), 'Point Extraction')");
        SET @Query3 = CONCAT("SELECT IFNULL((SELECT LOWER(c.anomalia) FROM missione m INNER JOIN contenuto c ON m.ID = c.ID WHERE m.versione = '", Ver, "' GROUP BY LOWER(c.anomalia) ORDER BY SUM(", TargetMat, ")/COUNT(", TargetMat, ") LIMIT 1), 'Critical Weakness')");
        SET @Query4 = CONCAT("SELECT IFNULL((SELECT LOWER(c.bioma) FROM missione m INNER JOIN contenuto c ON m.ID = c.ID WHERE m.versione = '", Ver, "' GROUP BY LOWER(c.bioma) ORDER BY SUM(", TargetMat, ")/COUNT(", TargetMat, ") LIMIT 1), 'Crystalline Caverns')");
    ELSE
        -- calcolo i suggerimenti per i campi specifici
        SET @Query1 = CONCAT("SELECT IFNULL((SELECT LOWER(c.classe) FROM missione m INNER JOIN contenuto c ON m.ID = c.ID WHERE m.versione = '", Ver, "' AND m.giocatore = '", TargetGen, "' GROUP BY LOWER(c.classe) ORDER BY SUM(", TargetMat, ")/COUNT(", TargetMat, ") LIMIT 1), 'Driller')");
        SET @Query2 = CONCAT("SELECT IFNULL((SELECT LOWER(c.incarico) FROM missione m INNER JOIN contenuto c ON m.ID = c.ID WHERE m.versione = '", Ver, "' AND m.giocatore = '", TargetGen, "' GROUP BY LOWER(c.incarico) ORDER BY SUM(", TargetMat, ")/COUNT(", TargetMat, ") LIMIT 1), 'Point Extraction')");
        SET @Query3 = CONCAT("SELECT IFNULL((SELECT LOWER(c.anomalia) FROM missione m INNER JOIN contenuto c ON m.ID = c.ID WHERE m.versione = '", Ver, "' AND m.giocatore = '", TargetGen, "' GROUP BY LOWER(c.anomalia) ORDER BY SUM(", TargetMat, ")/COUNT(", TargetMat, ") LIMIT 1), 'Critical Weakness')");
        SET @Query4 = CONCAT("SELECT IFNULL((SELECT LOWER(c.bioma) FROM missione m INNER JOIN contenuto c ON m.ID = c.ID WHERE m.versione = '", Ver, "' AND m.giocatore = '", TargetGen, "' GROUP BY LOWER(c.bioma) ORDER BY SUM(", TargetMat, ")/COUNT(", TargetMat, ") LIMIT 1), 'Crystalline Caverns')");
    END IF;

    -- compongo ed eseguo le query
    SET @Query1 = CONCAT("UPDATE suggerimento SET classe = (", @Query1, ") WHERE Genericità = '", TargetGen, "' AND Materiale = '", TargetMat, "'");
    SET @Query2 = CONCAT("UPDATE suggerimento SET incarico = (", @Query2, ") WHERE Genericità = '", TargetGen, "' AND Materiale = '", TargetMat, "'");
    SET @Query3 = CONCAT("UPDATE suggerimento SET anomalia = (", @Query3, ") WHERE Genericità = '", TargetGen, "' AND Materiale = '", TargetMat, "'");
    SET @Query4 = CONCAT("UPDATE suggerimento SET bioma = (", @Query4, ") WHERE Genericità = '", TargetGen, "' AND Materiale = '", TargetMat, "'");
    PREPARE stmt1 FROM @Query1;
    PREPARE stmt2 FROM @Query2;
    PREPARE stmt3 FROM @Query3;
    PREPARE stmt4 FROM @Query4;
    EXECUTE stmt1;
    EXECUTE stmt2;
    EXECUTE stmt3;
    EXECUTE stmt4;
    DEALLOCATE PREPARE stmt1;
    DEALLOCATE PREPARE stmt2;
    DEALLOCATE PREPARE stmt3;
    DEALLOCATE PREPARE stmt4;
END //
DELIMITER ;

-- creazione di un utente (interattiva) e controllo unicità del nome
DROP PROCEDURE IF EXISTS InserimentoGiocatore;
DELIMITER //
CREATE PROCEDURE InserimentoGiocatore (IN NomeUtente VARCHAR(30))
BEGIN
    DECLARE unicità INT DEFAULT 0;
    -- controllo l'unicità del nome
    SELECT COUNT(*) INTO unicità FROM giocatore g WHERE NomeUtente = g.Nome;

    -- se il nome esiste termino la procedura
    IF unicità > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nome già utilizzato';
	END IF;

    START TRANSACTION;
    -- modifico la tabella giocatore
        INSERT INTO giocatore VALUES (NomeUtente, 0, 0, 0, 0);
	
    -- modifico la tabella licenza
        INSERT INTO licenza SELECT NomeUtente, b.Nome, FALSE FROM birra b;
    
	-- ora modifico la tabella suggerimento, inserendo temporaneamente suggerimenti qualsiasi in attesa di avere dati da elaborare
    -- inserisco il punto prima del nome per garantire il riconoscimento del campo generico
        INSERT INTO suggerimento Values (CONCAT('.',NomeUtente),'BB','Driller','Mining Expedition','Low Oxigen','Azure Weald');
        INSERT INTO suggerimento Values (CONCAT('.',NomeUtente),'YC','Engineer','On-Site Refining','Litophage Outbreak','Fungus Bogs');
        INSERT INTO suggerimento Values (CONCAT('.',NomeUtente),'MS','Gunner','Salvage Operation','Lethal Enemies','Salt Pits');
        INSERT INTO suggerimento Values (CONCAT('.',NomeUtente),'SN','Scout','Industrial Sabotage','Low Gravity','Magma Core');
	COMMIT;
END //
DELIMITER ;

-- inserire una nuova missione (interattiva)
DROP PROCEDURE IF EXISTS InserimentoPartita;
DELIMITER //
CREATE PROCEDURE InserimentoPartita (IN Versione VARCHAR(30), IN Giocatore VARCHAR(30), IN Classe VARCHAR(30), IN Incarico VARCHAR(30),
                                     IN Anomalia VARCHAR(30), IN Bioma VARCHAR(30),IN BB TINYINT, IN YC TINYINT, IN MS TINYINT, IN SN TINYINT)
BEGIN
    DECLARE missioneID INT;
    DECLARE EsistenzaUsr INT DEFAULT 0;
    DECLARE InClasse varchar(30);
    DECLARE InIncarico varchar(30);
    DECLARE InAnomalia varchar(30);
    DECLARE InBioma varchar(30);
    
    -- controllo l'esistenza dell'utente e dei campi inseriti
    SELECT COUNT(*) INTO EsistenzaUsr FROM giocatore g WHERE STRCMP(LOWER(Giocatore), LOWER(g.Nome)) = 0;
	SELECT COUNT(*) INTO InClasse FROM classe c WHERE STRCMP(LOWER(c.nome),LOWER(Classe)) = 0;
    SELECT COUNT(*) INTO InIncarico FROM incarico i WHERE STRCMP(LOWER(i.nome),LOWER(Incarico)) = 0;
    SELECT COUNT(*) INTO InAnomalia FROM anomalia a WHERE STRCMP(LOWER(a.nome),LOWER(Anomalia)) = 0;
    SELECT COUNT(*) INTO InBioma FROM bioma b WHERE STRCMP(LOWER(b.nome),LOWER(Bioma)) = 0;

    -- se uno di questi campi non esiste termino la procedura
    IF EsistenzaUsr = 0 OR InClasse = 0 OR InIncarico = 0 OR InAnomalia = 0 OR InBioma = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Errore nell'inserimento della partita";
    END IF;
    
-- per inserire la entry nelle due tabelle relative, uso una transazione
    START TRANSACTION;
        INSERT INTO missione(Versione, Giocatore) VALUES(Versione, Giocatore);
        -- mi salvo l'ultimo ID inserito e lo uso nel prossimo inserimento
        SET missioneID = LAST_INSERT_ID();
        INSERT INTO contenuto VALUES(missioneID, Classe, Incarico, Anomalia, Bioma, BB, YC, MS, SN);
    COMMIT;
END //
DELIMITER ;

-- aggiornamento settimanale dei suggerimenti (batch)
DROP PROCEDURE IF EXISTS AggiornamentoSuggerimenti;
DELIMITER //
CREATE PROCEDURE AggiornamentoSuggerimenti ()
BEGIN
    -- voglio ciclare su tutte le righe della tabella suggerimento, lo faccio con un cursore 
    DECLARE flag INT DEFAULT FALSE;
    DECLARE TargetGen VARCHAR(30);
    DECLARE TargetMat VARCHAR(30);

    -- dichiaro il cursore
    DECLARE CursoreGiocatori CURSOR FOR SELECT Genericità, Materiale FROM suggerimento;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag = TRUE;
    OPEN CursoreGiocatori;

    -- ciclo sulla chiave primaria della tabella suggerimento e aggiorno i valori
    read_loop: LOOP
        FETCH CursoreGiocatori INTO TargetGen, TargetMat;
        IF flag THEN
            LEAVE read_loop;
        END IF;
        CALL CalcoloSuggerimento(TargetMat, TargetGen);
    END LOOP;

    -- chiudo il cursore
    CLOSE CursoreGiocatori;
END //
DELIMITER ;

-- richieste di consigli per i materiali (interattiva)
DROP PROCEDURE IF EXISTS Consiglio;
DELIMITER //
CREATE PROCEDURE Consiglio (IN GenRichiesta VARCHAR (30), IN MatRichiesto VARCHAR(30))
BEGIN
    SELECT s.Classe, s.Incarico, s.Anomalia, s.Bioma FROM suggerimento s WHERE s.Genericità = GenRichiesta AND s.Materiale = MatRichiesto;
END//
DELIMITER ;

-- aggiornamento inventario (interattiva)
DROP PROCEDURE IF EXISTS AggiornamentoInventario;
DELIMITER //
CREATE PROCEDURE AggiornamentoInventario (IN NomeUtente VARCHAR(30), IN BB TINYINT, IN YC TINYINT, IN MS TINYINT, IN SN TINYINT)
BEGIN
    UPDATE giocatore g SET g.BB = BB, g.YC = YC, g.MS = MS, g.SN = SN WHERE g.nome = NomeUtente;
END //
DELIMITER ;

-- aggiornamento licenze possedute (interattiva)
DROP PROCEDURE IF EXISTS AggiuntaLicenza;
DELIMITER //
CREATE PROCEDURE AggiuntaLicenza (IN NomeGiocatore VARCHAR(30), IN NomeBirra VARCHAR(30))
BEGIN
    UPDATE licenza l SET Possesso = TRUE WHERE l.Birra = NomeBirra AND l.giocatore = NomeGiocatore;
END //
DELIMITER ;

-- richiesta licenze sbloccabili (interattiva)
DROP PROCEDURE IF EXISTS LicenzeSbloccabili;
DELIMITER //
CREATE PROCEDURE LicenzeSbloccabili (IN NomeGiocatore VARCHAR(30))
BEGIN
    SELECT l.Birra, b.Descrizione, b.BB, b.YC, b.MS, b.SN  FROM licenza l INNER JOIN birra b ON l.Birra = b.Nome INNER JOIN giocatore g ON l.Giocatore = g.Nome
    WHERE l.Giocatore = NomeGiocatore AND b.BB <= g.BB AND b.YC <= g.YC AND b.MS <= g.MS AND b.SN <= g.SN AND l.possesso = FALSE;
END //
DELIMITER ;

-- richiesta licenze da sbloccare e relativi costi (interattiva)
DROP PROCEDURE IF EXISTS LicenzeBloccate;
DELIMITER //
CREATE PROCEDURE LicenzeBloccate (IN NomeUtente VARCHAR(30))
BEGIN
   SELECT l.Birra, b.Descrizione, b.BB, b.YC, b.MS, b.SN FROM licenza l INNER JOIN birra b ON l.Birra = b.Nome
   WHERE l.Giocatore = NomeUtente AND l.possesso = FALSE;
END //
DELIMITER ;












-- Popolamento della tabella `giocatore`
INSERT INTO `giocatore` (`Nome`, `BB`, `YC`, `MS`, `SN`) VALUES
('Giocatore1', 1, 2, 3, 4),
('Giocatore2', 4, 3, 2, 1),
('Giocatore3', 2, 2, 2, 2),
('Giocatore4', 3, 3, 3, 3),
('Giocatore5', 1, 1, 1, 1);

-- Popolamento della tabella `licenza`
INSERT INTO `licenza` (`Giocatore`, `Birra`, `Possesso`) VALUES
('Giocatore1', 'Oily Oaf Brew', true),
('Giocatore1', 'Glyphid Slammer', true),
('Giocatore1', 'Leaf Lover’s Special', true),
('Giocatore1', 'Backbreaker Stout', true),
('Giocatore2', 'Dark Morkite', true),
('Giocatore2', 'Pots O’ Gold', true),
('Giocatore2', 'Red Rock Blaster', true),
('Giocatore2', 'Rocky Mountain', true),
('Giocatore3', 'Skull Crusher Ale', true),
('Giocatore3', 'Slayer Stout', true),
('Giocatore3', 'Tunnel Rat', true),
('Giocatore3', 'Best Wurst Beer', true),
('Giocatore4', 'Arkenstout', true),
('Giocatore4', 'Blacklock Lager', true),
('Giocatore4', 'Blackout Stout', true),
('Giocatore4', 'Blackreach Blonde', true),
('Giocatore5', 'Flintlocke’s Delight', true),
('Giocatore5', 'Gut Wrecker', true),
('Giocatore5', 'Mactera Brew', true),
('Giocatore5', 'Malt Rockbearer', true);

-- Inserire le licenze non possedute (Possesso = false)
INSERT INTO `licenza` (`Giocatore`, `Birra`, `Possesso`) 
SELECT g.Nome, b.Nome, false
FROM giocatore g, birra b
WHERE NOT EXISTS (
    SELECT 1 
    FROM licenza l
    WHERE l.Giocatore = g.Nome 
    AND l.Birra = b.Nome
);

-- Popolamento della tabella `missione`
INSERT INTO `missione` (`Versione`, `Giocatore`) VALUES
('v1.0', 'Giocatore1'),
('v1.0', 'Giocatore2'),
('v1.0', 'Giocatore3'),
('v1.0', 'Giocatore4'),
('v1.0', 'Giocatore5');

-- Popolamento della tabella `contenuto`
INSERT INTO `contenuto` (`ID`, `Classe`, `Incarico`, `Anomalia`, `Bioma`, `BB`, `YC`, `MS`, `SN`) VALUES
(1, 'Driller', 'Mining Expedition', 'Cave Leech Cluster', 'Crystalline Cavern', 1, 2, 3, 4),
(2, 'Engineer', 'Egg Hunt', 'Elite Threat', 'Salt Pits', 4, 3, 2, 1),
(3, 'Gunner', 'Salvage Operation', 'Exploder Infestation', 'Fungus Bogs', 2, 2, 2, 2),
(4, 'Scout', 'Point Extraction', 'Haunted Cave', 'Radioactive Exclusion Zone', 3, 3, 3, 3),
(5, 'Driller', 'Mining Expedition', 'Cave Leech Cluster', 'Crystalline Cavern', 1, 1, 1, 1);


INSERT INTO suggerimento Values (CONCAT('.','Giocatore1'),'BB','Driller','Mining Expedition','Low Oxigen','Azure Weald');
INSERT INTO suggerimento Values (CONCAT('.','Giocatore1'),'YC','Engineer','On-Site Refining','Litophage Outbreak','Fungus Bogs');
INSERT INTO suggerimento Values (CONCAT('.','Giocatore1'),'MS','Gunner','Salvage Operation','Lethal Enemies','Salt Pits');
INSERT INTO suggerimento Values (CONCAT('.','Giocatore1'),'SN','Scout','Industrial Sabotage','Low Gravity','Magma Core');
INSERT INTO suggerimento VALUES (CONCAT('.', 'Giocatore2'), 'BB', 'Engineer', 'Escort Duty', 'Mactera Plague', 'Dense Biozone');
INSERT INTO suggerimento VALUES (CONCAT('.', 'Giocatore2'), 'YC', 'Scout', 'Elimination', 'Gold Rush', 'Glacial Strata');
INSERT INTO suggerimento VALUES (CONCAT('.', 'Giocatore2'), 'MS', 'Driller', 'Egg Hunt', 'Critical Weakness', 'Hollow Bough');
INSERT INTO suggerimento VALUES (CONCAT('.', 'Giocatore2'), 'SN', 'Gunner', 'Point Extraction', 'Rich Atmosphere', 'Radioactive Exclusion Zone');
INSERT INTO suggerimento VALUES (CONCAT('.', 'Giocatore3'), 'BB', 'Scout', 'On-Site Refining', 'Shield Disruption', 'Salt Pits');
INSERT INTO suggerimento VALUES (CONCAT('.', 'Giocatore3'), 'YC', 'Driller', 'Mining Expedition', 'Double XP', 'Azure Weald');
INSERT INTO suggerimento VALUES (CONCAT('.', 'Giocatore3'), 'MS', 'Engineer', 'Salvage Operation', 'Parasites', 'Magma Core');
INSERT INTO suggerimento VALUES (CONCAT('.', 'Giocatore3'), 'SN', 'Gunner', 'Escort Duty', 'Low Gravity', 'Fungus Bogs');
INSERT INTO suggerimento VALUES (CONCAT('.', 'Giocatore4'), 'BB', 'Gunner', 'Mining Expedition', 'Elite Threat', 'Crystalline Cavern');
INSERT INTO suggerimento VALUES (CONCAT('.', 'Giocatore4'), 'YC', 'Engineer', 'Point Extraction', 'Swarmageddon', 'Sandblasted Corridors');
INSERT INTO suggerimento VALUES (CONCAT('.', 'Giocatore4'), 'MS', 'Scout', 'Elimination', 'Rival Presence', 'Glacial Strata');
INSERT INTO suggerimento VALUES (CONCAT('.', 'Giocatore4'), 'SN', 'Driller', 'Industrial Sabotage', 'Volatile Guts', 'Hollow Bough');
INSERT INTO suggerimento VALUES (CONCAT('.', 'Giocatore5'), 'BB', 'Driller', 'Escort Duty', 'Mineral Mania', 'Salt Pits');
INSERT INTO suggerimento VALUES (CONCAT('.', 'Giocatore5'), 'YC', 'Gunner', 'Salvage Operation', 'Regenerative Bugs', 'Radioactive Exclusion Zone');
INSERT INTO suggerimento VALUES (CONCAT('.', 'Giocatore5'), 'MS', 'Engineer', 'Egg Hunt', 'Haunted Cave', 'Dense Biozone');
INSERT INTO suggerimento VALUES (CONCAT('.', 'Giocatore5'), 'SN', 'Scout', 'On-Site Refining', 'Exploder Infestation', 'Crystalline Cavern');

-- aggiornamento dei suggerimenti
CALL AggiornamentoSuggerimenti();





-- creazione utente
/*
CREATE USER 'utente'@'localhost' IDENTIFIED BY 'pwd_ESAM3';
GRANT INSERT, SELECT, UPDATE, EXECUTE ON DRGbeer.* TO 'utente'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'utente'@'localhost';
*/