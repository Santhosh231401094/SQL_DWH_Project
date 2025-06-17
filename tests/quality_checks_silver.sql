--duplicates
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
