# 🏢 Data Warehouse and Analytics Project

A complete **SQL Server Data Warehouse** project built using the **Medallion Architecture (Bronze, Silver, Gold)**. This project demonstrates the end-to-end process of designing, building, and analyzing a modern data warehouse using SQL Server.

It covers data ingestion, ETL development, data modeling, and SQL analytics to generate business insights from ERP and CRM datasets.

---

## 📌 Project Overview

This project focuses on building a centralized data warehouse by integrating data from multiple source systems.

The solution includes:

- Designing a modern data warehouse architecture
- Building ETL pipelines using SQL
- Data cleansing and transformation
- Creating Star Schema data models
- Developing analytical SQL queries for reporting
- Generating business insights for decision-making

---

# 🏗️ Data Architecture

This project follows the **Medallion Architecture**, which organizes data into three layers.

## 🥉 Bronze Layer
- Stores raw ERP and CRM CSV files
- Performs data ingestion into SQL Server
- No transformations applied
- Maintains source data integrity

## 🥈 Silver Layer
- Cleans and validates data
- Removes duplicates
- Handles missing values
- Standardizes formats
- Applies business rules

## 🥇 Gold Layer
- Creates business-ready datasets
- Implements Star Schema
- Builds Fact and Dimension tables
- Optimized for reporting and analytics

---

# 🔄 ETL Pipeline

The ETL process consists of:

1. Extract data from ERP and CRM CSV files
2. Load raw data into Bronze layer
3. Clean and transform data in Silver layer
4. Create analytical models in Gold layer
5. Perform SQL analysis and reporting

---

# ⭐ Data Modeling

The Gold layer follows a **Star Schema** consisting of:

### Fact Tables
- Fact Sales

### Dimension Tables
- Dim Customer
- Dim Product
- Dim Date

The model is optimized for fast analytical queries and reporting.

---

# 📊 Analytics & Reporting

SQL queries are written to analyze:

- Customer Behavior
- Product Performance
- Sales Trends
- Revenue Analysis
- Business KPIs

---

# 🛠️ Technologies Used

- SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL
- Draw.io
- Git & GitHub

---

# 📁 Repository Structure

```
data-warehouse-project/
│
├── datasets/
│   ├── source_crm/
│   └── source_erp/
|
├── docs/
│
│
├── scripts/
│   ├── bronze/
│   ├── silver/
│   └── gold/
│
├── tests/
│
├── README.md
├── LICENSE
├── .gitignore
```

---

# 🚀 Project Workflow

```
ERP CSV Files
        │
        ▼
CRM CSV Files
        │
        ▼
 Bronze Layer
(Raw Data Storage)
        │
        ▼
 Silver Layer
(Data Cleaning & Transformation)
        │
        ▼
 Gold Layer
(Star Schema & Analytics)
        │
        ▼
SQL Reports & Business Insights
```

---

# 📂 Project Objectives

- Build a scalable SQL Server Data Warehouse
- Apply Medallion Architecture
- Design Fact and Dimension tables
- Develop reusable ETL pipelines
- Improve data quality
- Generate analytical reports
- Practice industry-standard data engineering concepts

---

# 📋 Features

- End-to-End ETL Pipeline
- Data Cleansing
- Data Validation
- Data Standardization
- Star Schema Design
- SQL Analytics
- Business Reporting
- Documentation
- Modular SQL Scripts

---

# 📈 Business Insights

The project enables analysis of:

- Sales Performance
- Revenue Growth
- Customer Purchasing Patterns
- Product Sales Analysis
- Monthly Sales Trends
- Top Customers
- Best Selling Products

---

# 📚 Learning Outcomes

Through this project, I gained hands-on experience in:

- Data Warehousing
- ETL Development
- SQL Server
- T-SQL
- Data Modeling
- Star Schema Design
- Medallion Architecture
- SQL Analytics
- Git & GitHub
- Documentation

---

# 🎯 Project Requirements

### Data Sources

- ERP CSV Files
- CRM CSV Files

### Data Engineering

- Import CSV files
- Build Bronze layer
- Clean data
- Transform data
- Load Gold layer

### Data Analysis

Develop SQL reports to analyze:

- Customer Behavior
- Product Performance
- Sales Trends
- Business KPIs

---

# 📖 Documentation

The `docs` folder contains:

- Data Architecture
- ETL Flow
- Data Catalog
- Star Schema
- Naming Conventions

---

# 👨‍💻 Author

**Elvis Titus Cherukara**

M.Sc. Computer Applications  
Aspiring Data Engineer | SQL | Azure Data Factory | Data Warehousing

---

