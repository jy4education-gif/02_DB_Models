\! cls

# Vorbereitungen
DROP TABLE IF EXISTS design.purchases;
DROP TABLE IF EXISTS design.products;
DROP TABLE IF EXISTS design.servants;
DROP TABLE IF EXISTS design.cats;

# Struktur: CREATE - DESCRIBE - INSERT - SELECT

# Mastertabelle (MT): unverändert
CREATE TABLE design.cats
(
  id        INT         NOT NULL AUTO_INCREMENT,
  fur_color VARCHAR(45) NOT NULL,
  cat_name  VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
) COMMENT 'Tabelle der Katzen';

# Struktur: MT
DESCRIBE design.cats;

#Inserts: MT 
INSERT INTO design.cats (id, cat_name,fur_color) VALUES 
(DEFAULT, "Grizabella", "white"),
(DEFAULT, "Alonzo", "grey"),
(DEFAULT, "Mausi", "striped")
;

# Inhalte: MT
SELECT * FROM design.cats;

# Detailtabelle (DT) Verbindung zur MT über Fremdschlüssel
CREATE TABLE design.servants
(
  id           INT         NOT NULL AUTO_INCREMENT,
  yrs_served   INT         NOT NULL,
  servant_name VARCHAR(45) NOT NULL,
  cats_id      INT         NOT NULL,
  PRIMARY KEY (id)
) COMMENT 'Tabelle der Servants';

# Fremdschlüssel: DT
ALTER TABLE design.servants
  ADD CONSTRAINT FK_cats_TO_servants -- sprechender Name für die FK-Constraint
      FOREIGN KEY (cats_id)
      REFERENCES cats (id),
  ADD CONSTRAINT UQ_servant_cats_id    -- erzwingt 1:1 Beziehung 
      UNIQUE (cats_id);

# Struktur: DT
DESCRIBE design.servants;

# Inserts: DT
INSERT INTO design.servants (id, servant_name, yrs_served, cats_id) VALUES
(DEFAULT, 'Wolfgang Amadeus', 5, 1), -- Diener für Grizabella
(DEFAULT, 'Maria Callas', 2, 2),  -- Diener für Alonzo
(DEFAULT, 'Felix Mendelssohn', 10, 3); -- Diener für Mausi

# Inhalte: DT
SELECT * FROM design.servants;
 # Struktur: CREATE DESCRIBE INSERT SELECT







