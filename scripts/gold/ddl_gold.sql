-- GOLD LAYER
/*
===========================================================
DDL Script: Create Gold Views
===========================================================

Purpose:
This script defines the business-ready views in the Gold layer.
It builds dimension and fact views that form a star schema structure,
enriched and cleaned for reporting, dashboarding, and analytics.

When to use:
✔ After Silver tables are populated and cleaned  
✔ To expose data for BI tools and business users  
✔ For consistent, standardized reporting views  

Actions Performed:
✔ CREATE VIEW statements under the Gold schema  
✔ Joins and transformations applied to build dimensions and facts  

Usage Notes:
- Do not modify Gold views directly; change logic upstream if needed
- Views are non-materialized; performance depends on underlying Silver tables

===========================================================
*/

CREATE VIEW gold.dim_customers AS
SELECT
ROW_NUMBER() OVER (ORDER BY cst_id) AS customer_key,  --surrogate key(unique identifier needed for a dimension table)
ci.cst_id AS customer_id,
ci.cst_key AS customer_number,
ci.cst_firstname AS first_name,
ci.cst_lastname AS last_name,
la.cntry AS country,
ci.cst_marital_status AS marital_status,
CASE 
	WHEN ci.cst_gndr!='n/a' THEN ci.cst_gndr  -- CRM is master for gender info
	ELSE COALESCE(ca.gen,'n/a')
END gender,
ca.bdate AS birthdate,
ci.cst_create_date AS create_date                   --metadata info no needed in gold layer
FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_cust_az12 ca
ON ci.cst_key=ca.cid
LEFT JOIN silver.erp_loc_a101 la
ON ci.cst_key=la.cid 



CREATE VIEW gold.dim_products AS
SELECT
ROW_NUMBER() OVER (ORDER BY pn.prd_start_dt,pn.prd_key) AS product_key, --surrogate key
pn.prd_id AS product_id,
pn.prd_key AS product_number,
pn.prd_nm AS product_name,
pn.cat_id AS category_id,
pc.cat AS category,
pc.subcat AS subcategory,
pc.maintenance,
pn.prd_cost AS cost,
pn.prd_line AS product_line,
pn.prd_start_dt AS start_date
FROM silver.crm_prd_info pn
LEFT JOIN silver.erp_px_cat_g1v2 pc
ON pn.cat_id=pc.id
WHERE prd_end_dt IS NULL --Filter out  all historical data(here only current data)





CREATE VIEW gold.fact_sales AS
SELECT
sd.sls_ord_num AS order_number,
pr.product_key,
cu.customer_key,
sd.sls_order_dt AS order_date,
sd.sls_ship_dt AS shipping_date,
sd.sls_due_dt AS due_date,
sd.sls_sales AS sales_Amount,
sd.sls_quantity AS quantity,
sd.sls_price AS price
FROM silver.crm_sales_details sd
LEFT JOIN gold.dim_products pr
ON sd.sls_prd_key=pr.product_number
LEFT JOIN gold.dim_customers cu
ON sd.sls_cust_id =cu.customer_id
