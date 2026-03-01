📊 Finance Data Pipeline (dbt + Airflow)

Projet de pipeline de données moderne utilisant :

GitHub (versioning)

dbt (transformation)

Apache Airflow (orchestration)

Snowflake / PostgreSQL (warehouse)

Tests et snapshots

🚀 Objectif

Ce projet :

✔ extrait et transforme les données
✔ applique des tests de qualité
✔ crée des tables analytiques (marts)
✔ automatise le pipeline via Airflow
✔ versionne le code proprement

📂 Structure
/dbt_project
│
├── dags/                 # DAG Airflow
├── models/
│   ├── staging/          # Staging
│   ├── marts/             # Tables analytiques
├── snapshots/            # Snapshots
├── tests/                 # Tests dbt
├── macros/                # Macros dbt
├── profiles.yml           # Configuration dbt
├── docker-compose.yml     # Conteneurs
⚙️ Installation
1️⃣ Cloner le projet
git clone https://github.com/TON_USERNAME/finance-data-pipeline.git
cd finance-data-pipeline
2️⃣ Installer dbt
pip install dbt-snowflake  # ou dbt-postgres
3️⃣ Lancer Airflow (Docker)
docker-compose up -d
▶️ Lancer dbt
cd dbt_project
dbt run
dbt test
dbt snapshot