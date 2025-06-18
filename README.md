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

SQL_DWH_project/                                                                                                                                                                                                                            
├── datasets/              # CRM and ERP source files (.csv)                                                                                                                                                                                       
├── docs/                  # Draw.io diagrams (architecture, flow, models)                                                                                                                                                                    
├── scripts/                                                                                                                                                                                                                                    
│   ├── bronze/            # Load raw data                                                                                                                                                                                                      
│   ├── silver/            # Clean and join tables                                                                                                                                                                                                
│   └── gold/              # Star schema views (facts and dimensions)                                                                                                                                                                            
├── tests/                 # SQL checks for data integrity & quality                                                                                                                                                                          
├── README.md              # Project overview (this file)                                                                                                                                                                                        
└── requirements.txt       # Tools and dependencies                                                                                                                                                                                            


---

## 🛠️ Tech Stack

| Tool                  | Use Case                           |
|-----------------------|------------------------------------|
| SQL Server Express    | Data warehouse engine              |
| SSMS                  | Managing SQL development           |
| GitHub                | Version control and collaboration  |
| Draw.io               | Diagrams (architecture, data model)|
| Notion (optional)     | Task tracking, project planning    |

---

## 🔍 Analytical Focus Areas

- **Customer Analysis**: Gender, age group, geography, and engagement
- **Product Insights**: Category-level performance, maintenance needs, pricing
- **Sales Metrics**: Orders over time, quantity sold, revenue patterns

All data is modeled in a **star schema** to support BI tools and SQL analytics.

---

## 🧪 Data Quality Checks

- Foreign key relationship validation (fact to dimension)
- Null checks on surrogate and business keys
- Duplicate detection in dimension tables
- Verification of gender resolution logic

Sample queries included in `/tests/` folder.

---

## 🙋‍♂️ Why I Built This

This project was inspired by content from **Baara’s YouTube channel**, but I added my own:

- Query logic improvements
- Custom data validations
- Cleaner repo structure
- Focus on quality checks and metadata




