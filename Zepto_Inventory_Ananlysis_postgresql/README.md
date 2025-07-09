# Zepto Inventory SQL Analysis

This project explores product-level data from Zepto’s online grocery catalog using PostgreSQL.  
I imported, cleaned, and analyzed 3,700+ rows of inventory data to gain insights into stock availability, discounts, margins, and revenue opportunities.

---

## Tech Stack
- PostgreSQL
- pgAdmin
- SQL (window functions, aggregation, filtering)
- CSV Data (Zepto’s inventory)

---

## Key Insights & Queries
- Total products in inventory
- Out-of-stock tracking
- Top 5 categories by volume
- High discount items in stock
- Duplicate product detection
- Estimated stock value & revenue
- Margin analysis per product
- Heaviest items per category using `ROW_NUMBER()`

---

## Screenshots

All screenshots showing query execution and results are available in the `screenshots` folder.

---

## Dataset

A single CSV file (`zepto_v2.csv`) containing 9 columns and ~3,732 rows of product data from Zepto.

---

## Run It Yourself

1. Clone the repo  
2. Create the table using `zepto_inventory_analysis.sql`  
3. Run it in pgAdmin or any PostgreSQL-compatible tool

---

## 📬 Connect with me
Naman Jain  
[LinkedIn](https://www.linkedin.com/in/naman-jain-3247831b7/)  
