--duplicates
/*
===========================================================
Script: Quality Checks – Silver Schema
===========================================================

Purpose:
This script ensures the data loaded into the Silver schema is clean, accurate,
and follows formatting and consistency standards.

Checks Included:
✔ NULL or duplicate values in primary keys  
✔ Unwanted spaces in string fields  
✔ Standardized and consistent data  
✔ Invalid date ranges or sequences  
✔ Data consistency between related fields

Usage Notes:
- Run this script after loading the Silver Layer
- Review and resolve any records returned during the checks

===========================================================
*/
SELECT
cst_id,COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*)>1 OR cst_id IS NULL;


--check for unwanted spaces

SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname!=TRIM(cst_firstname)


--data standardization & consistency
SELECT DISTINCT(cst_gndr)
FROM silver.crm_cust_info

SELECT * FROM silver.crm_cust_info

SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm!=TRIM(prd_nm)

SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost<0 OR prd_cost IS NULL

SELECT *
FROM silver.crm_prd_info
WHERE prd_end_dt<prd_start_dt


--check for unwanted spaces
SELECT * FROM bronze.erp_px_cat_g1v2
WHERE cat!=TRIM(cat) OR subcat!=TRIM(subcat) OR maintenance!=TRIM(maintenance)

--Data Standardization & Consistency
SELECT DISTINCT(cat) --maintenance check too
FROM bronze.erp_px_cat_g1v2

SELECT * FROM silver.erp_px_cat_g1v2

--Data Standardization & Consistency
SELECT DISTINCT(cntry)
FROM bronze.erp_loc_a101
ORDER BY cntry

SELECT * FROM silver.erp_loc_a101
