-- GOLD LAYER DATA QUALITY CHECKS
-- Purpose: Quick checks to validate Gold layer data integrity and cleanliness

--To check whether both gender are correct and same
SELECT DISTINCT
ci.cst_gndr,
ca.gen,
CASE 
	WHEN ci.cst_gndr!='n/a' THEN ci.cst_gndr  -- CRM is master for gender info
	ELSE COALESCE(ca.gen,'n/a')
END new_gen
FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_cust_az12 ca
ON ci.cst_key=ca.cid
LEFT JOIN silver.erp_loc_a101 la
ON ci.cst_key=la.cid 
ORDER BY 1,2


--check gold.dim_customers 
SELECT distinct gender FROM gold.dim_customers

SELECT * FROM gold.dim_products

SELECT * FROM gold.fact_sales

--Foreign key Integrity(Dimensions) to check any issue
SELECT
*
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key=f.customer_key
LEFT JOIN gold.dim_products p
ON p.product_key=f.product_key
WHERE c.customer_key IS NULL
