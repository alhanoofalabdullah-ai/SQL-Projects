# Enterprise Data Warehouse

A professional SQL data warehouse project designed to consolidate
sales, customer, product, employee, regional and time-based data into
a centralized analytical platform.

## Project Objective

The objective of this project is to demonstrate enterprise-level SQL
skills through dimensional modeling, ETL procedures, data-quality
validation and advanced analytical queries.

## Business Scenario

A large organization stores sales information across multiple
operational systems.

Management needs a centralized warehouse to answer questions such as:

- Which products generate the highest revenue?
- Which regions deliver the strongest profit margin?
- Who are the most valuable customers?
- How is monthly revenue trending?
- Which employees generate the most sales?
- Are warehouse calculations accurate and complete?

## Architecture

```text
Operational Sources
        |
        v
ETL Procedures
        |
        v
Dimension Tables
        |
        v
Sales Fact Table
        |
        v
Analytics and BI Reporting
```

## Data Model

The project uses a star schema.

### Fact Table

- `fact_sales`

### Dimension Tables

- `dim_date`
- `dim_customer`
- `dim_product`
- `dim_employee`
- `dim_region`

## Repository Structure

```text
project-21-enterprise-data-warehouse/
├── README.md
├── schema.sql
├── sample_data.sql
├── etl_procedures.sql
├── analytics_queries.sql
└── data_quality_checks.sql
```

## Features

- Enterprise star-schema design
- Sales fact table
- Customer dimension with historical fields
- Product and employee dimensions
- Date and regional dimensions
- Foreign-key relationships
- Indexing strategy
- ETL stored procedure
- Revenue and profit calculations
- Customer lifetime value
- Regional performance analysis
- Product ranking
- Running revenue totals
- Window functions
- CTEs
- Data-quality validation

## Advanced SQL Skills Demonstrated

- Dimensional modeling
- Star schemas
- Stored procedures
- Common Table Expressions
- Window functions
- Aggregate functions
- Ranking functions
- Referential integrity
- Check constraints
- Index creation
- Data-quality rules
- Analytical reporting
- Profitability analysis

## How to Run

Run the files in this order:

```text
1. schema.sql
2. sample_data.sql
3. etl_procedures.sql
4. analytics_queries.sql
5. data_quality_checks.sql
```

PostgreSQL example:

```bash
psql -U postgres -d enterprise_dw -f schema.sql
psql -U postgres -d enterprise_dw -f sample_data.sql
psql -U postgres -d enterprise_dw -f etl_procedures.sql
psql -U postgres -d enterprise_dw -f analytics_queries.sql
psql -U postgres -d enterprise_dw -f data_quality_checks.sql
```

## Analytical Outputs

The project provides:

- Executive revenue summary
- Monthly sales performance
- Product ranking
- Customer lifetime value
- Regional profitability
- Running monthly revenue
- Employee performance
- Category contribution analysis

## Data Quality Controls

The validation queries detect:

- Duplicate customers
- Invalid sales calculations
- Invalid profit calculations
- Missing dimension references
- Negative financial values
- Invalid customer-history records

## Future Enhancements

- Slowly Changing Dimension Type 2 automation
- Staging tables
- Incremental loading
- ETL audit logging
- Rejected-record management
- Fiscal calendar support
- Currency conversion
- Budget versus actual analysis
- Power BI dashboard
- Partitioning for large fact tables

## Author

**Alhanoof Alabdullah**

SQL • Data Warehousing • Analytics • Business Intelligence
