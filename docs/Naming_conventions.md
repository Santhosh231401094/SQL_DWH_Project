# 🧾 Naming Conventions

This document defines standard naming practices across all layers of the data warehouse (Bronze, Silver, Gold) to ensure consistency, clarity, and maintainability.

---

## 🔹 General Guidelines

| Rule               | Description                                      |
|--------------------|--------------------------------------------------|
| Style              | Use `snake_case` — lowercase with underscores    |
| Language           | All names must be in **English**                 |
| Reserved Words     | Avoid SQL **reserved keywords** as object names |
| Clarity > Brevity  | Prefer **descriptive names** over abbreviations |

---

## 🟤 Bronze & ⚪ Silver Layers

**Table Format:** `source_system_entity`  
These layers reflect the original structure of source systems.

- Do **not** rename tables during ingestion or cleansing.
- Maintain traceability to source systems.

**Examples:**
- `crm_customer_info` → Customer info from CRM
- `erp_sales_data` → Sales records from ERP

---

## 🟡 Gold Layer

**Table Format:** `category_entity`  
This layer contains **business-aligned** and **analytics-ready** tables.

| Prefix    | Meaning           | Example         |
|-----------|-------------------|-----------------|
| `dim_`    | Dimension table    | `dim_customers` |
| `fact_`   | Fact table         | `fact_sales`    |

No reporting or temporary tables should exist here — only finalized star schema entities.

---

## 🧷 Column Naming Conventions

| Type             | Format              | Example             |
|------------------|---------------------|---------------------|
| Surrogate Key    | `*_key`             | `customer_key`      |
| Technical Column | `dwh_*`             | `dwh_load_date`     |
| Business Column  | Descriptive name    | `order_date`, `sales_amount` |

---

## 🛠️ Stored Procedure Naming

**Format:** `load_<layer>`  
Used for ETL/ELT procedures targeting each layer.

**Examples:**
- `load_bronze`
- `load_silver`
- `load_gold`

---

✅ Adhering to these standards improves collaboration, reduces confusion, and ensures a professional and scalable data warehouse structure.
