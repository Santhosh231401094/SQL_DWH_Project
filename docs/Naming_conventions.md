🧾 Naming Conventions
This document defines standard naming practices used across all layers (Bronze, Silver, Gold) of the data warehouse to ensure consistency, clarity, and maintainability.

🔹 General Guidelines
Rule	Description
Style	Use snake_case — lowercase with underscores
Language	All names must be in English
Reserved Words	Avoid SQL reserved keywords as object names
Clarity > Brevity	Prefer meaningful, descriptive names over abbreviations

🟤 Bronze & ⚪ Silver Layer
Table Format: source_system_entity

Reflects the original source system structure

Avoid renaming tables during ingestion and cleansing

Examples:

crm_customer_info → Customer info from CRM

erp_sales_data → Sales records from ERP

🟡 Gold Layer
Table Format: category_entity

Tables are business-aligned and analytics-ready

Prefix	Meaning	Example
dim_	Dimension table	dim_products
fact_	Fact table	fact_sales
report_	Reporting views (optional)	report_sales_qtr

🧷 Column Naming
Type	Convention	Example
Surrogate Key	<entity>_key	customer_key
Technical Column	dwh_<purpose>	dwh_load_date
Business Column	Descriptive & meaningful	order_date, sales_amount

🛠️ Stored Procedures
Layer	Format	Example
Any	load_<layer>	load_gold
