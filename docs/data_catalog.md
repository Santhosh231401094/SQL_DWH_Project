## Data Catalog – Gold Layer

### 1. gold.dim_customers
**Purpose:** Stores customer details enriched with demographic and geographic data.

| Column Name     | Data Type     | Description |
|-----------------|---------------|-------------|
| customer_key    | INT           | Surrogate key uniquely identifying each customer. |
| customer_id     | INT           | Unique ID for each customer. |
| customer_number | NVARCHAR(50)  | Alphanumeric customer code. |
| first_name      | NVARCHAR(50)  | Customer's first name. |
| last_name       | NVARCHAR(50)  | Customer's last name. |
| country         | NVARCHAR(50)  | Country of residence. |
| marital_status  | NVARCHAR(50)  | Marital status. |
| gender          | NVARCHAR(50)  | Gender. |
| birthdate       | DATE          | Date of birth. |
| create_date     | DATE          | Record creation date. |

---

### 2. gold.dim_products
**Purpose:** Provides product information and attributes.

| Column Name         | Data Type     | Description |
|---------------------|---------------|-------------|
| product_key         | INT           | Surrogate key for each product. |
| product_id          | INT           | Internal product ID. |
| product_number      | NVARCHAR(50)  | Alphanumeric product code. |
| product_name        | NVARCHAR(50)  | Product name with details. |
| category_id         | NVARCHAR(50)  | Category identifier. |
| category            | NVARCHAR(50)  | Broad product category. |
| subcategory         | NVARCHAR(50)  | Detailed category classification. |
| maintenance_required| NVARCHAR(50)  | Whether product needs maintenance. |
| cost                | INT           | Base price of product. |
| product_line        | NVARCHAR(50)  | Product line (e.g., Road, Mountain). |
| start_date          | DATE          | Product availability start date. |

---

### 3. gold.fact_sales
**Purpose:** Sales transactions data for analytics.

| Column Name    | Data Type     | Description |
|----------------|---------------|-------------|
| order_number   | NVARCHAR(50)  | Unique sales order code. |
| product_key    | INT           | FK to product dimension. |
| customer_key   | INT           | FK to customer dimension. |
| order_date     | DATE          | Date of order placement. |
| shipping_date  | DATE          | Date of shipment. |
| due_date       | DATE          | Due date for payment. |
| sales_amount   | INT           | Total sale amount. |
| quantity       | INT           | Quantity ordered. |
| price          | INT           | Price per unit. |
