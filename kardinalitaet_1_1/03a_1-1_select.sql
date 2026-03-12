\! cls

-- Einzeltabellen
SELECT * FROM design.cats;
SELECT * FROM design.servants;

-- Kreuzprodukt (Kartesisches Produkt)
-- Erzeugt jede mögliche Kombination (3 Katzen x 3 Diener = 9 Zeilen)
SELECT * FROM design.cats CROSS JOIN design.servants;

-- Inner Join 1 / Gesamte Tabelle
-- Verknüpft nur dort, wo Übereinstimmungen vorliegen
SELECT * FROM design.cats
INNER JOIN design.servants 
ON design.cats.id = design.servants.cats_id;


-- Inner Join 2 / (Wer dient wem?)
-- Wer dient Grizabella?
-- Wem dient X?
SELECT servant_name FROM design.servants
JOIN design.cats ON design.cats.id = design.servants.cats_id
WHERE cat_name = 'Grizabella';

-- Inner Join 2a / (Wer dient wem?)
-- 'X ist der Diener von Y'  / Dienstverhältnis
SELECT CONCAT(design.servants.servant_name, 
    ' ist der Diener von ', design.cats.cat_name) AS Dienstverhaeltnis
FROM design.cats
JOIN design.servants ON design.cats.id = design.servants.cats_id
WHERE servant_name = 'Maria Callas';

-- Inner Join 3 / Dienstzeit
SELECT cat_name, servant_name, yrs_served
FROM design.cats
JOIN design.servants ON design.cats.id = design.servants.cats_id
ORDER BY yrs_served DESC;


-- Inner Join 4 / Dienstzeit 
-- 'X - der Diener von Y - ist der Diener mit der längsten Dienstzeit' // MAX()
SELECT CONCAT(s.servant_name, ' - der Diener von ', c.cat_name,
    ' - ist der Diener mit der laengsten Dienstzeit') AS 'Dienstaeltester Diener mit MAX()'
FROM design.servants AS s
JOIN design.cats AS c ON s.cats_id = c.id
WHERE s.yrs_served = (SELECT MAX(yrs_served) FROM design.servants);

-- 1. LIMIT (QUICK & DIRTY / Nur bei einem MAX-Wert vollständige Lösung)
-- Nachteil: Findet nur einen Treffer, auch wenn zwei gleichauf liegen.
SELECT CONCAT(servant_name, ' - der Diener von ', cat_name,
    ' - ist der Diener mit der laengsten Dienstzeit') AS 'Dienstaeltester Diener mit LIMIT 1'
FROM design.servants
JOIN design.cats ON design.cats.id = design.servants.cats_id
ORDER BY yrs_served DESC
LIMIT 1;

-- 2. Subquery
-- Vorteil: Findet alle Diener, falls mehrere den exakt gleichen Maximalwert haben.
SELECT CONCAT(servant_name, ' - der Diener von ', cat_name, ' - ist der Diener mit der laengsten Dienstzeit') AS 'Dienstaeltester Diener mit Subquery'
FROM design.servants
JOIN design.cats ON design.cats.id = design.servants.cats_id
WHERE yrs_served = (SELECT MAX(yrs_served) FROM design.servants);

-- QUERY / MAX()
-- SELECT MAX(yrs_served) FROM design.servants;





-- 3. VIEW / QUERY / MAX() in VIEW gekapselt
