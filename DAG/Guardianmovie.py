from datetime import datetime
from airflow import DAG
from airflow.operators.python import PythonOperator
import awswrangler as wr


#storing dataset into s3 bucket in AWS 
def movies_to_load(destination, dataframe_name):
    wr.s3.to_parquet(
        df=dataframe_name,
        path=destination
        dataset=True)
    
movies_to_load(destination="s3://bimmy-module-bucket/GuardianMovies.parquet/",
               dataframe_name=movies_dataset)

# A DAG represents a workflow, a collection of tasks
with DAG(dag_id="Guardian_API_workflow",
        start_date=datetime(2024, 4, 16), 
        schedule=("0 * * * *"),
        catchup=False,
        default_view="graph") as dag:
    
    # Tasks are represented as operators
    guardian_movies_load = PythonOperator(task_id="guardian_movies_load",
                                                   python_callable=movies_to_load
                                                   retries=2,
                                                   retry_delay=timedelta(seconds=300))
    #set dependencies between tasks
    guardian_movies_load
    

 