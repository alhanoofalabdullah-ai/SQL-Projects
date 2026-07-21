-- Load one sales transaction into the warehouse.

CREATE OR REPLACE PROCEDURE load_sales_transaction(
    p_order_id         VARCHAR,
    p_full_date        DATE,
    p_customer_id      VARCHAR,
    p_product_id       VARCHAR,
    p_employee_id      VARCHAR,
    p_region_code      VARCHAR,
    p_quantity         INT,
    p_unit_price       DECIMAL,
    p_discount_amount  DECIMAL
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_date_key      INT;
    v_customer_key  INT;
    v_product_key   INT;
    v_employee_key  INT;
    v_region_key    INT;
    v_unit_cost     DECIMAL(12,2);
    v_sales_amount  DECIMAL(14,2);
    v_cost_amount   DECIMAL(14,2);
BEGIN
    SELECT date_key
    INTO v_date_key
    FROM dim_date
    WHERE full_date = p_full_date;

    SELECT customer_key
    INTO v_customer_key
    FROM dim_customer
    WHERE customer_id = p_customer_id
      AND is_current = TRUE;

    SELECT product_key, unit_cost
    INTO v_product_key, v_unit_cost
    FROM dim_product
    WHERE product_id = p_product_id;

    SELECT employee_key
    INTO v_employee_key
    FROM dim_employee
    WHERE employee_id = p_employee_id;

    SELECT region_key
    INTO v_region_key
    FROM dim_region
    WHERE region_code = p_region_code;

    v_sales_amount :=
        (p_quantity * p_unit_price) - p_discount_amount;

    v_cost_amount :=
        p_quantity * v_unit_cost;

    INSERT INTO fact_sales (
        order_id,
        date_key,
        customer_key,
        product_key,
        employee_key,
        region_key,
        quantity,
        unit_price,
        discount_amount,
        sales_amount,
        cost_amount,
        profit_amount
    )
    VALUES (
        p_order_id,
        v_date_key,
        v_customer_key,
        v_product_key,
        v_employee_key,
        v_region_key,
        p_quantity,
        p_unit_price,
        p_discount_amount,
        v_sales_amount,
        v_cost_amount,
        v_sales_amount - v_cost_amount
    );
END;
$$;
