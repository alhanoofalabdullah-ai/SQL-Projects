SELECT 
    SUM(revenue) AS total_revenue,
    SUM(cost) AS total_cost,
    SUM(revenue - cost) AS total_profit
FROM sales;

SELECT 
    product_id,
    SUM(revenue) AS product_revenue
FROM sales
GROUP BY product_id
ORDER BY product_revenue DESC;

SELECT 
    DATE_FORMAT(sale_date, '%Y-%m') AS month,
    SUM(revenue) AS monthly_revenue
FROM sales
GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
ORDER BY month;

SELECT 
    DATE_FORMAT(sale_date, '%Y-%m') AS month,
    SUM(revenue) AS revenue,
    LAG(SUM(revenue)) OVER (ORDER BY DATE_FORMAT(sale_date, '%Y-%m')) AS previous_month_revenue
FROM sales
GROUP BY DATE_FORMAT(sale_date, '%Y-%m');

SELECT 
    DATE_FORMAT(sale_date, '%Y-%m') AS month,
    SUM(revenue) AS revenue,
    ROUND(
        (SUM(revenue) - LAG(SUM(revenue)) OVER (ORDER BY DATE_FORMAT(sale_date, '%Y-%m')))
        / LAG(SUM(revenue)) OVER (ORDER BY DATE_FORMAT(sale_date, '%Y-%m')) * 100,
    2) AS growth_percentage
FROM sales
GROUP BY DATE_FORMAT(sale_date, '%Y-%m');

SELECT 
    ROUND(SUM(revenue - cost) / SUM(revenue) * 100, 2) AS profit_margin_percentage
FROM sales;
