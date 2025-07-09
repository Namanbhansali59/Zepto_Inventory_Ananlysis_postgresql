CREATE  TABLE Zepto_inventory(
category TEXT,
name Text,
mrp numeric,
discountPercent Numeric,
AvailableQuantity Integer,
discountedSellingPrice Numeric,
weighInGms Numeric,
outOfStock Boolean,
quantity integer
);

-- Changed Column Name Because of spelling mistake

ALTER TABLE zepto_inventory
RENAME COLUMN weighingms TO weightInGms;

-- Total Products in Inventory

SELECT COUNT(*) AS total_products
FROM zepto_inventory;

-- Products That Are Out of Stock

SELECT COUNT(*) AS out_of_stock_items
FROM zepto_inventory
WHERE outOfStock = TRUE;

-- Top 5 Categories by Product Count

SELECT category, COUNT(*) AS product_count
FROM zepto_inventory
GROUP BY category
ORDER BY product_count DESC
LIMIT 5;


--  Products with the Highest Discount

SELECT name, mrp, discountedSellingPrice, discountPercent
FROM zepto_inventory
ORDER BY discountPercent DESC
LIMIT 10;

--  Average Discount Per Category

SELECT category, ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto_inventory
GROUP BY category
ORDER BY avg_discount DESC;

-- Total Stock Value Available (After Discount)

SELECT ROUND(SUM(discountedSellingPrice * availableQuantity), 2) AS total_stock_value
FROM zepto_inventory
WHERE outOfStock = FALSE;


-- Products with >50% Discount and Still in Stock

SELECT name, category, mrp, discountPercent, discountedSellingPrice, availableQuantity
FROM zepto_inventory
WHERE discountPercent > 50 AND outOfStock = FALSE
ORDER BY discountPercent DESC;

--Top 3 Heaviest Products Per Category

SELECT *
FROM (
  SELECT *, 
         ROW_NUMBER() OVER (PARTITION BY category ORDER BY weightInGms DESC) AS rank
  FROM zepto_inventory
  WHERE outOfStock = FALSE
) AS ranked
WHERE rank <= 3;


-- Duplicate Product Names (possible duplicates in the dataset)

SELECT name, COUNT(*) AS duplicate_count
FROM zepto_inventory
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;


-- Estimated Revenue by Category

SELECT category,
       ROUND(SUM(discountedSellingPrice * availableQuantity), 2) AS potential_revenue
FROM zepto_inventory
WHERE outOfStock = FALSE
GROUP BY category
ORDER BY potential_revenue DESC;

-- Margin Analysis Per Product

SELECT name, category, mrp, discountedSellingPrice,
       ROUND(mrp - discountedSellingPrice, 2) AS absolute_margin,
       ROUND(((mrp - discountedSellingPrice) / mrp) * 100, 2) AS margin_percent
FROM zepto_inventory
WHERE mrp > 0
ORDER BY margin_percent DESC;







