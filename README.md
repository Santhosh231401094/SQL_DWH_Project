# SQL_DWH_Project
# 📊 Data Warehouse & Analytics Project (Portfolio)

Welcome to my **Data Warehouse & Analytics** portfolio project!  
This hands-on project showcases the end-to-end development of a modern data warehouse — from raw data ingestion to business-ready insights — using industry-standard practices and tools.

---

## 🧱 Architecture Overview

This project adopts the **Medallion Architecture** for organizing data into progressive layers:
![DWH_ARCHITECTURE](https://github.com/user-attachments/assets/2022d843-2850-4c5d-b43f-c253d22e73e8)

- **🟤 Bronze Layer**: Raw data directly ingested from CRM and ERP CSV files, minimal processing.
- **⚪ Silver Layer**: Cleansed and transformed data — cleansing,standardization, enrichment.
- **🟡 Gold Layer**: Final star schema with **fact** and **dimension views** designed for reporting and analytics.

Architecture diagrams and flows are included in the `/docs` folder.

---

## 🎯 Project Goals

- Design a simplified data warehouse using **SQL Server**
- Clean and integrate data from multiple sources (CRM & ERP)
- Build reusable ETL logic and business-friendly data models
- Run data quality checks to ensure trust in analytics
- Enable basic reporting on customers, products, and sales

---

## 📦 Key Features

- ✅ **ETL Pipelines** for Bronze → Silver → Gold
- ✅ **Data Modeling** using Star Schema (facts & dimensions)
- ✅ **Custom SQL logic** for resolving gender, handling nulls, FK integrity
- ✅ **Quality Checks** to validate relationships and duplicates
- ✅ **Documentation** with data catalog, flow diagrams, and scripts

---

## 📂 Folder Structure







