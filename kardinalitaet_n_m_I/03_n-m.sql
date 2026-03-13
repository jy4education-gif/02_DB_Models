\! cls
-- Vorbereitung
SET NAMES 'utf8';
DROP TABLE IF EXISTS design.purchases;
DROP TABLE IF EXISTS design.products;
DROP TABLE IF EXISTS design.servants;

/* SERVANTS */
-- Servants: ohne Fremdschlüssel
CREATE TABLE design.servants
(
  id           INT         NOT NULL AUTO_INCREMENT COMMENT 'PK',
  servant_name VARCHAR(45) NULL    ,
  yrs_served   TINYINT     NULL    ,
  PRIMARY KEY (id)
);

-- Servants: Struktur
DESCRIBE design.servants;

-- Servants: Inserts
INSERT INTO design.servants (servant_name, yrs_served) VALUES 
('Max', 5),
('Maxine', 2),
('Maria Callas', 12);

-- Servants: Inhalte 
SELECT * FROM design.servants;


/*  PRODUCTS */
-- Products: ohne Fremdschlüssel
CREATE TABLE design.products
(
  id            INT          NOT NULL AUTO_INCREMENT COMMENT 'PK',
  product_name  VARCHAR(45)  NOT NULL,
  product_price DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (id)
);

-- Products: Struktur
DESCRIBE design.products;

-- Products: Inserts
INSERT INTO design.products (product_name, product_price) VALUES 
('Lachs-Leckerli', 3.50),
('Kratzbaum "Sky"', 45.99),
('Baldrian-Kissen', 2.95),
('Goldfisch-Snack', 1.20);

-- Products: Inhalte 
SELECT * FROM design.products;

-- ServantsProducts (purchases)
CREATE TABLE design.purchases
(
  id         INT       NOT NULL AUTO_INCREMENT COMMENT 'PK',
  id_servant INT       NOT NULL COMMENT 'FK',
  id_product INT       NOT NULL COMMENT 'FK',
  p_time     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) COMMENT 'Mapping Tabelle für n:m Beziehung';

-- Purchases: Struktur
DESCRIBE design.purchases;

/*  PURCHASES (Kaufprozesse)*/
-- Purchases: Inserts (Kaufprozesse : Käufer - Produkt)
INSERT INTO design.purchases (id_servant, id_product) VALUES 
(1, 1), -- Max kauft Lachs
(1, 3), -- Max kauft Baldrian
(2, 1), -- Maxine kauft Lachs
(3, 2), -- Maria kauft Kratzbaum
(3, 4); -- Maria kauft Goldfisch

-- Purchases: Inhalte, Anzeige der Mapping-Tabelle
SELECT * FROM design.purchases;

-- BONUS: Wer hat was gekauft? (Der n:m Join)
SELECT 
    s.servant_name AS Diener, 
    p.product_name AS Produkt
FROM design.purchases AS pu
JOIN design.servants AS s ON pu.id_servant = s.id
JOIN design.products AS p ON pu.id_product = p.id;
