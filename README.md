# SQL_DWH_Project
Building a modern data warehouse with SQL server,including ETL,data modeling,and analytics

##📌 Overview                                                                                                                                                                                      
This project demonstrates a modern Data Warehouse Architecture using Microsoft SQL Server. It leverages a multi-layered structure — Bronze, Silver, and Gold layers — to transform raw data into meaningful insights for BI, reporting, ad-hoc analysis, and machine learning.

##🧱 Architecture
📂 Sources
Data comes from:

CRM Systems

ERP Systems

Format: CSV Files

Interface: Files placed in a designated folder

###🧊 Bronze Layer (Raw Data)
Object Type: Tables

Load Type:

Batch Processing

Full Load (Truncate & Insert)

Transformations: None (Raw as-is)

Data Model: None

###🥈 Silver Layer (Cleaned Data)
Object Type: Tables

Load Type:

Batch Processing

Full Load (Truncate & Insert)

Transformations:

Data Cleansing

Standardization

Normalization

Derived Columns

Data Enrichment

Data Model: None

###🥇 Gold Layer (Business-Ready Data)
Object Type: Views

Transformations:

Data Integration

Aggregation

Business Logic

Data Model:

Star Schema

Flat Table

Aggregated Table

##🚀 Consumption
The cleaned and aggregated data from the Gold Layer can be used for:

📊 BI & Reporting (e.g., Power BI, SSRS)

🔍 Ad-Hoc SQL Queries

🤖 Machine Learning 
