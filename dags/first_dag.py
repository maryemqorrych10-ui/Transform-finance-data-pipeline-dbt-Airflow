from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

with DAG(
    dag_id="test_dag",
    start_date=datetime(2024, 1, 1),
    schedule=None,
    catchup=False
) as dag:

    task1 = BashOperator(
        task_id="print_hello",
        bash_command="cd /opt/airflow/dbt_project && dbt run --profiles-dir /home/airflow/.dbt"
    )
# from airflow import DAG
# from airflow.providers.standard.operators.bash import BashOperator
# from datetime import datetime

# with DAG(
#     dag_id="dbt_run_test",
#     start_date=datetime(2026, 2, 28),
#     schedule_interval=None,
#     catchup=False,
# ) as dag:

#     dbt_run = BashOperator(
#         task_id="dbt_run",
#         bash_command="cd /opt/airflow/dbt_project && dbt run --profiles-dir /home/airflow/.dbt"
#     )

#     dbt_test = BashOperator(
#         task_id="dbt_test",
#         bash_command="cd /opt/airflow/dbt_project && dbt test --profiles-dir /home/airflow/.dbt"
#     )

#     dbt_run >> dbt_test