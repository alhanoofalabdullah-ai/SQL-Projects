INSERT INTO dim_date (
    date_key, full_date, day_number, month_number,
    month_name, quarter_number, year_number, is_weekend
)
VALUES
(20260105, '2026-01-05', 5, 1, 'January', 1, 2026, FALSE),
(20260110, '2026-01-10', 10, 1, 'January', 1, 2026, TRUE),
(20260214, '2026-02-14', 14, 2, 'February', 1, 2026, TRUE),
(20260321, '2026-03-21', 21, 3, 'March', 1, 2026, TRUE),
(20260410, '2026-04-10', 10, 4, 'April', 2, 2026, FALSE),
(20260518, '2026-05-18', 18, 5, 'May', 2, 2026, FALSE);

INSERT INTO dim_customer (
    customer_id, customer_name, customer_type, industry,
    city, country, valid_from, is_current
)
VALUES
('C001', 'Najd Digital Solutions', 'Enterprise', 'Technology',
 'Riyadh', 'Saudi Arabia', '2026-01-01', TRUE),

('C002', 'Red Sea Retail Group', 'Enterprise', 'Retail',
 'Jeddah', 'Saudi Arabia', '2026-01-01', TRUE),

('C003', 'Eastern Health Services', 'Government', 'Healthcare',
 'Dammam', 'Saudi Arabia', '2026-01-01', TRUE),

('C004', 'Gulf Logistics Company', 'Enterprise', 'Logistics',
 'Khobar', 'Saudi Arabia', '2026-01-01', TRUE);

INSERT INTO dim_product (
    product_id, product_name, category, unit_cost, list_price
)
VALUES
('P001', 'Enterprise Analytics License', 'Software', 9000, 15000),
('P002', 'Cloud Migration Package', 'Professional Services', 18000, 30000),
('P003', 'Cybersecurity Assessment', 'Consulting', 12000, 22000),
('P004', 'Managed Support Subscription', 'Support', 5000, 10000);

INSERT INTO dim_employee (
    employee_id, employee_name, department, job_title
)
VALUES
('E001', 'Sara Ahmed', 'Sales', 'Enterprise Account Manager'),
('E002', 'Mohammed Ali', 'Sales', 'Regional Sales Manager'),
('E003', 'Noura Khalid', 'Consulting', 'Solution Consultant');

INSERT INTO dim_region (
    region_code, region_name, country, manager_name
)
VALUES
('R-CEN', 'Central Region', 'Saudi Arabia', 'Mohammed Ali'),
('R-WES', 'Western Region', 'Saudi Arabia', 'Lina Hassan'),
('R-EAS', 'Eastern Region', 'Saudi Arabia', 'Fahad Omar');

INSERT INTO fact_sales (
    order_id, date_key, customer_key, product_key,
    employee_key, region_key, quantity, unit_price,
    discount_amount, sales_amount, cost_amount, profit_amount
)
VALUES
('ORD-1001', 20260105, 1, 1, 1, 1, 3, 15000, 1500, 43500, 27000, 16500),
('ORD-1002', 20260110, 2, 2, 2, 2, 1, 30000, 2000, 28000, 18000, 10000),
('ORD-1003', 20260214, 3, 3, 3, 3, 2, 22000, 4000, 40000, 24000, 16000),
('ORD-1004', 20260321, 1, 4, 1, 1, 5, 10000, 5000, 45000, 25000, 20000),
('ORD-1005', 20260410, 4, 2, 2, 3, 2, 30000, 3000, 57000, 36000, 21000),
('ORD-1006', 20260518, 2, 1, 1, 2, 4, 15000, 4000, 56000, 36000, 20000);
