# 📊 Finance Data Pipeline with dbt + Airflow + Snowflake

A modern, production-ready data engineering solution for extracting, transforming, and orchestrating financial data using industry best practices.

## 🎯 Project Overview

This project demonstrates a complete **enterprise-grade data pipeline** that combines:

- **Data Orchestration**: Apache Airflow for workflow automation
- **Data Transformation**: dbt for SQL-based transformations
- **Cloud Data Warehouse**: Snowflake for scalable analytics storage
- **Version Control**: GitHub for code management
- **Quality Assurance**: Integrated dbt tests and snapshots
- **Containerization**: Docker for reproducible environments

### Key Objectives

✅ Extract and load financial data into Snowflake  
✅ Apply multi-layer data transformations (staging → marts)  
✅ Implement data quality tests and validation  
✅ Create analytical tables (marts) for BI tools  
✅ Automate the entire pipeline via Airflow DAGs  
✅ Track historical changes with dbt snapshots  
✅ Maintain clean, versioned code with Git  

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    DATA SOURCES                             │
│          (APIs, Databases, Files)                           │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│         APACHE AIRFLOW (Orchestration)                      │
│  - DAG scheduling and monitoring                            │
│  - Data extraction and loading                              │
│  - Error handling and retry logic                           │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│              SNOWFLAKE DATA WAREHOUSE                       │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ RAW LAYER (External Tables)                         │   │
│  │ - Raw financial transaction data                    │   │
│  └─────────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ STAGING LAYER (dbt models)                          │   │
│  │ - Data cleaning & standardization                   │   │
│  │ - Type casting & normalization                      │   │
│  └─────────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ MARTS LAYER (Analytical Models)                     │   │
│  │ - Dimension tables (customers, accounts)            │   │
│  │ - Fact tables (transactions, balances)              │   │
│  │ - Aggregated metrics & KPIs                         │   │
│  └─────────────────────────────────────────────────────┘   │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│              BI & ANALYTICS TOOLS                           │
│        (Tableau, Power BI, Looker, etc.)                    │
└─────────────────────────────────────────────────────────────┘
```

---

## 📁 Project Structure

```
Transform-finance-data-pipeline-dbt-Airflow/
│
├── dags/                           # Airflow DAGs
│   └── [Your DAG files here]
│
├── models/                         # dbt Models
│   ├── staging/                    # Staging layer - Data cleaning
│   │   ├── stg_transactions.sql
│   │   ├── stg_customers.sql
│   │   └── stg_accounts.sql
│   │
│   └── marts/                      # Mart layer - Analytics ready
│       ├── fct_transactions.sql    # Fact tables
│       ├── dim_customers.sql       # Dimension tables
│       └── dim_accounts.sql
│
├── snapshots/                      # Historical data tracking
│   └── [Snapshot files]
│
├── tests/                          # dbt Data Quality Tests
│   ├── generic_tests/
│   └── specific_tests/
│
├── macros/                         # dbt Custom Macros
│   └── [Reusable SQL functions]
│
├── seeds/                          # Static reference data
│   └── [CSV reference files]
│
├── analyses/                       # Ad-hoc analyses
│   └── [Exploratory SQL queries]
│
├── dbt_project.yml                 # dbt Configuration
├── profiles.yml                    # dbt Snowflake Connection
├── docker-compose.yml              # Docker services
├── Dockerfile                      # Container image
├── requirements.txt                # Python dependencies
└── README.md                       # This file
```

---

## 🔧 Tech Stack

| Component | Version | Purpose |
|-----------|---------|---------|
| **Snowflake** | Cloud | Data Warehouse |
| **dbt** | Latest | Data Transformation & Testing |
| **Apache Airflow** | 2.x+ | Workflow Orchestration |
| **Python** | 3.9+ | DAG Development |
| **Docker** | Latest | Containerization |
| **Docker Compose** | Latest | Multi-container Orchestration |

---

## 📋 Prerequisites

Before getting started, ensure you have:

- ✅ **Snowflake Account** with appropriate credentials
- ✅ **Python 3.9+** installed
- ✅ **Docker & Docker Compose** installed
- ✅ **Git** for version control
- ✅ **GitHub Account** (for pushing code)

---

## 🚀 Installation & Setup

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/maryemqorrych10-ui/Transform-finance-data-pipeline-dbt-Airflow.git
cd Transform-finance-data-pipeline-dbt-Airflow
```

### 2️⃣ Set Up Python Environment

```bash
# Create virtual environment
python -m venv venv

# Activate virtual environment
# On macOS/Linux:
source venv/bin/activate

# On Windows:
venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

### 3️⃣ Configure Snowflake Connection

Create or update `profiles.yml` in your dbt project directory:

```yaml
finance_pipeline:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: [your-snowflake-account-id]
      user: [your-username]
      password: [your-password]
      role: TRANSFORMER
      database: FINANCE_DB
      schema: DBT_DEV
      threads: 4
      client_session_keep_alive: False
    prod:
      type: snowflake
      account: [your-snowflake-account-id]
      user: [service-account-user]
      password: [service-account-password]
      role: TRANSFORMER
      database: FINANCE_DB
      schema: DBT_PROD
      threads: 8
      client_session_keep_alive: False
```

### 4️⃣ Set Up Airflow with Docker

```bash
# Start Airflow services
docker-compose up -d

# Access Airflow UI at http://localhost:8080
# Default credentials: airflow / airflow
```

### 5️⃣ Configure Airflow Connections

Add Snowflake connection in Airflow UI:
- **Connection ID**: `snowflake_default`
- **Connection Type**: Snowflake
- **Account**: Your Snowflake account ID
- **Database**: FINANCE_DB
- **Schema**: DBT_DEV
- **Username**: [your-username]
- **Password**: [your-password]

---

## 🏃 Running the Pipeline

### Execute dbt Models Locally

```bash
# Navigate to project directory
cd .

# Install dbt dependencies
dbt deps

# Run all models
dbt run

# Run models with threading for faster execution
dbt run --threads 4

# Run only staging models
dbt run --select staging

# Run only marts models
dbt run --select marts
```

### Execute dbt Tests

```bash
# Run all tests
dbt test

# Run tests with detailed output
dbt test --debug

# Run tests for specific model
dbt test -s stg_transactions
```

### Create dbt Snapshots

```bash
# Create snapshots to track historical changes
dbt snapshot

# Snapshot specific models
dbt snapshot --select customers_snapshot
```

### Trigger Airflow DAG

```bash
# Manually trigger a DAG
airflow dags trigger finance_pipeline_dag

# List all DAGs
airflow dags list

# View DAG details
airflow dags show finance_pipeline_dag
```

---

## 📊 Data Layers

### 1. **Raw Layer (External Tables)**
- Source data loaded directly from external systems
- Minimal transformations
- Used as input for staging layer

### 2. **Staging Layer (dbt Models)**
- Data cleaning and standardization
- Type casting and null handling
- Data deduplication
- Surrogate key generation
- Input validation with dbt tests

### 3. **Marts Layer (Analytics-Ready)**
- **Fact Tables**: Transaction-level data (immutable)
- **Dimension Tables**: Reference data (slowly changing dimensions)
- **Aggregate Tables**: Pre-computed metrics
- Business logic implementation
- Performance optimization

---

## 🧪 Data Quality & Testing

This project implements comprehensive dbt tests:

### Generic Tests
```yaml
- not_null: Ensures no null values
- unique: Validates primary key uniqueness
- relationships: Enforces referential integrity
- accepted_values: Validates allowed values
```

### Custom Tests
```yaml
- Custom financial data validations
- Business rule validations
- Freshness checks
- Volume anomaly detection
```

### Snapshots
Track historical changes in dimension tables:
```sql
-- Tracks changes in customer master data
SELECT *
FROM {{ ref('dim_customers') }}
```

---

## 🔄 CI/CD & Automation

### GitHub Actions (Optional)
Set up automated testing on every commit:
- Run dbt test
- Generate dbt documentation
- Check for model dependencies
- Validate schema changes

### Airflow Scheduling

DAGs are scheduled to run:
- Daily: Nightly data load and transformation
- Weekly: Snapshot captures
- On-demand: Manual triggers for special runs

---

## 📈 Performance Optimization

### Snowflake Best Practices
✅ Separate compute and storage layers  
✅ Use clustering keys for large tables  
✅ Implement query result caching  
✅ Use dynamic partition pruning  
✅ Monitor warehouse credits usage  

### dbt Optimization
✅ Use incremental models for large fact tables  
✅ Implement materialized views for heavy joins  
✅ Optimize SQL queries with EXPLAIN ANALYZE  
✅ Use packages for reusable macros  

---

## 🔐 Security Best Practices

- ✅ Use **environment variables** for credentials (never commit secrets)
- ✅ Enable **Snowflake IP whitelisting**
- ✅ Implement **role-based access control (RBAC)**
- ✅ Use **service accounts** for automation
- ✅ Enable **Snowflake audit logging**
- ✅ Encrypt **sensitive data at rest**

---

## 📚 dbt Documentation

Generate and view dbt documentation:

```bash
# Generate documentation
dbt docs generate

# Serve documentation locally
dbt docs serve
# Visit http://localhost:8000
```

---

## 🐛 Troubleshooting

### dbt Connection Issues
```bash
# Test Snowflake connection
dbt debug

# Check profile configuration
dbt profiles show
```

### Airflow DAG Errors
```bash
# View DAG logs
airflow dags logs [DAG_ID]

# Check task logs
airflow tasks logs [DAG_ID] [TASK_ID]
```

### Common Issues

| Issue | Solution |
|-------|----------|
| `Database connection refused` | Verify Snowflake credentials and IP whitelist |
| `Permission denied` | Check Snowflake role and database permissions |
| `Out of memory` | Increase Docker memory limits or reduce threads |
| `Schema not found` | Ensure schema exists in Snowflake |

---

## 📞 Support & Documentation

- **dbt Documentation**: https://docs.getdbt.com
- **Apache Airflow**: https://airflow.apache.org/docs
- **Snowflake Documentation**: https://docs.snowflake.com
- **dbt Slack Community**: https://community.getdbt.com

---

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/YourFeature`)
3. Commit your changes (`git commit -m 'Add YourFeature'`)
4. Push to the branch (`git push origin feature/YourFeature`)
5. Open a Pull Request

---

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 👤 Author

**Maryem Qorrych**

- GitHub: [@maryemqorrych10-ui](https://github.com/maryemqorrych10-ui)
- LinkedIn: [Your LinkedIn Profile]

---

## 🔗 Project Links

- **Repository**: https://github.com/maryemqorrych10-ui/Transform-finance-data-pipeline-dbt-Airflow
- **Issues**: [Report Issues](https://github.com/maryemqorrych10-ui/Transform-finance-data-pipeline-dbt-Airflow/issues)
- **Discussions**: [Join Discussions](https://github.com/maryemqorrych10-ui/Transform-finance-data-pipeline-dbt-Airflow/discussions)

---

## 📌 Roadmap

- [ ] Add real-time streaming with Kafka
- [ ] Implement advanced monitoring & alerting
- [ ] Add data lineage with dbt Cloud
- [ ] Implement cost optimization features
- [ ] Add dbt-expectations for advanced data quality
- [ ] Create comprehensive Terraform configuration

---

**Last Updated**: May 13, 2026  
**Status**: Active Development ✅
