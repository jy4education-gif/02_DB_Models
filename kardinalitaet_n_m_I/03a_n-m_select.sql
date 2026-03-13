-- 03. SELECTS / Servants, Products, Purchases
\! cls

-- Einzeltabellen
SELECT * FROM design.servants;
SELECT * FROM design.products;
SELECT * FROM design.purchases;

-- Inner Join 1 / Kombi (servants / products / purchases)
-- SELECT 
--     s.servant_name, 
--     p.product_name, 
--     p.product_price, 
--     pu.created_at
-- FROM design.purchases AS pu
-- INNER JOIN design.servants AS s ON pu.id_servant = s.id
-- INNER JOIN design.products AS p ON pu.id_product = p.id;


-- Welche Artikel hat X/Y gekauft?





-- Wieviele Produkte hat X gekauft?
-- "X kauft Y Produkte"





-- Wieviel Geld hat jeder Diener ausgegeben?





-- Wer hat das Produkt X gekauft?  
-- Irgendwas mit Lachs / Irgendwas mit Sauce LIKE
-- Spalten --> Diener / Produkt
-- WHERE / LIKE





-- Wie oft wurde das Produkt X gekauft?




-- Welche Umsätze hatte das Produkt X?
