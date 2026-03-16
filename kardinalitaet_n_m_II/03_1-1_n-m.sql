
-- Vorbereitung
ET NAMES 'utf8';
DROP TABLE IF EXISTS design.purchases;
DROP TABLE IF EXISTS design.products;
DROP TABLE IF EXISTS design.servants;


/* Cats */

-- Mastertabelle: unverändert
CREATE TABLE design.cats
(
  id        INT         NOT NULL AUTO_INCREMENT,
  cat_name  VARCHAR(45) NOT NULL,
  fur_color VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
);

-- Struktur: MT
DESCRIBE design.cats;
-- Inserts: MT (Mastertable)


/* SERVANTS */

-- Detailtabelle: Verbindung zur MT über Fremdschlüssel




-- Fremdschlüssel: DT




-- wichtig bei 1:1  UNIQUE im fk



-- Struktur: DT

-- Inserts: DT


-- Servants: Struktur


/*  PRODUCTS */

-- Products: ohne Fremdschlüssel




-- Products: Struktur



-- Products: Inserts





-- Products: Inhalte 




/*  PURCHASES (Kaufprozesse)*/



-- ServantsProducts (purchases)

-- Purchases: Struktur

-- Purchases: Inserts (Kaufprozesse : Käufer - Produkt)

-- Purchases: Inhalte 
