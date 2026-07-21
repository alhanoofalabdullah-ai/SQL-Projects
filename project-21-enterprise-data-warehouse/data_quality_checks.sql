-- Duplicate business customers

SELECT
    customer_id,
    COUNT(*) AS duplicate_count
FROM dim_customer
WHERE is_current = TRUE
GROUP BY customer_id
HAVING COUNT(*) > 1;


-- Invalid sales calculations

SELECT *
FROM fact_sales
WHERE sales_amount <>
      (quantity * unit_price) - discount_amount;


-- Invalid profit calculations

SELECT *
FROM fact_sales
WHERE profit_amount <>
      sales_amount - cost_amount;


-- Missing dimension references

SELECT f.*
FROM fact_sales f
LEFT JOIN dim_customer c
    ON f.customer_key = c.customer_key
LEFT JOIN dim_product p
    ON f.product_key = p.product_key
LEFT JOIN dim_date d
    ON f.date_key = d.date_key
WHERE c.customer_key IS NULL
   OR p.product_key IS NULL
   OR d.date_key IS NULL;


-- Negative financial values

SELECT *
FROM fact_sales
WHERE sales_amount < 0
   OR cost_amount < 0;


-- Expired customer records incorrectly marked current

SELECT *
FROM dim_customer
WHERE valid_to IS NOT NULL
  AND is_current = TRUE;
