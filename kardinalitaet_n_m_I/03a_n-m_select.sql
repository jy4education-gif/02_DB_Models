-- 03. SELECTS / Servants, Products, Purchases
-- \! cls

-- Einzeltabellen
-- SELECT * FROM design.servants;
-- SELECT * FROM design.products;
-- SELECT * FROM design.purchases;

-- Inner Join 1 / Kombi (servants / products / purchases)
-- -- SELECT 
-- --     s.servant_name, 
-- --     p.product_name, 
-- --     p.product_price, 
-- --     pu.created_at
-- -- FROM design.purchases AS pu
-- -- INNER JOIN design.servants AS s ON pu.id_servant = s.id
-- -- INNER JOIN design.products AS p ON pu.id_product = p.id;
-- SELECT
--     *
-- FROM design.purchases
-- INNER JOIN design.servants ON design.servants.id = design.purchases.servants_id
-- INNER JOIN design.products ON design.products.id = design.purchases.products_id
-- ;


-- Welche Artikel hat X/Y gekauft?
-- SELECT
--     servant_name AS Diener,
--     product_name AS "Von X gekaufte Produkte:",
--     CONCAT(servant_name, " kauft ", product_name, ".") AS Kaufhandlung
-- FROM design.purchases
-- INNER JOIN design.servants ON design.servants.id = design.purchases.servants_id
-- INNER JOIN design.products ON design.products.id = design.purchases.products_id
-- -- WHERE servant_name = "Max"
-- -- 
-- ;


-- Wieviele Produkte hat X gekauft?
-- "X kauft Y Produkte"
-- SELECT
--     servant_name AS Diener,
--     COUNT(product_name) AS 'Anzahl gekaufte Produkte:'
-- FROM design.purchases
-- INNER JOIN design.servants ON design.servants.id = design.purchases.servants_id
-- INNER JOIN design.products ON design.products.id = design.purchases.products_id
-- GROUP BY servant_name
-- ;
-- Variante 1
-- SELECT
--     servant_name AS Diener,
--     product_name AS "Von X gekaufte Produkte:",
--     CONCAT(servant_name, " kauft ", product_name, ".") AS Kaufhandlung
-- FROM design.purchases
-- INNER JOIN design.servants ON design.servants.id = design.purchases.servants_id
-- INNER JOIN design.products ON design.products.id = design.purchases.products_id
-- -- WHERE servant_name = "TBA"
-- -- WHERE servant_name LIKE "TBA"
-- ;


-- Variante 2
-- SELECT
--     CONCAT(servant_name, " kauft ", COUNT(product_name), " Produkte.") AS Kaufhandlung
-- FROM design.purchases
-- INNER JOIN design.servants ON design.servants.id = design.purchases.servants_id
-- INNER JOIN design.products ON design.products.id = design.purchases.products_id
-- GROUP BY servant_name -- organisch / aggregiert
-- -- HAVING servant_name = "TBA"
-- -- HAVING servant_name LIKE "TBA"
-- ;

-- Wieviel Geld hat jeder Diener ausgegeben?
-- SELECT
--     servant_name AS Diener,
--     product_name, product_price,
--     COUNT(product_name) AS 'Anzahl gekaufte Produkte:',
--     SUM(product_price) AS 'Ausgegebener Betrag:'
-- FROM design.purchases
-- INNER JOIN design.servants ON design.servants.id = design.purchases.servants_id
-- INNER JOIN design.products ON design.products.id = design.purchases.products_id
-- GROUP BY servant_name, product_name, product_price
-- ;



-- Wer hat das Produkt X gekauft?  
-- Irgendwas mit Lachs / Irgendwas mit Sauce LIKE
-- Spalten --> Diener / Produkt
-- WHERE / LIKE
-- SELECT
-- 	servant_name AS Diener,
--     product_name AS "Irgendwas mit Sauce oder Lachs"
-- FROM design.purchases
-- INNER JOIN design.servants ON design.servants.id = design.purchases.servants_id
-- INNER JOIN design.products ON design.products.id = design.purchases.products_id
-- -- WHERE product_name LIKE "%Lachs%" OR product_name LIKE "%Sauce%" -- IN() ??
-- -- WHERE product_name LIKE "%Huhn%"
-- ;





-- Wie oft wurde das Produkt X gekauft?
-- SELECT
-- 	product_name AS Produkte,
--     COUNT(product_name) AS Anzahl
-- FROM design.purchases
-- INNER JOIN design.servants ON design.servants.id = design.purchases.servants_id
-- INNER JOIN design.products ON design.products.id = design.purchases.products_id
-- GROUP BY product_name
-- ORDER BY Anzahl DESC
-- ;




-- Welche Umsätze hatte das Produkt X?
SELECT
    product_name AS Produkt, product_price AS Einzelpreis,
    COUNT(product_name) AS Anzahl_Kaeufe,
    SUM(product_price) AS Umsatz
FROM design.purchases
INNER JOIN design.servants ON design.servants.id = design.purchases.servants_id
INNER JOIN design.products ON design.products.id = design.purchases.products_id
GROUP BY product_name, product_price
ORDER BY Umsatz DESC;