## Project Overview
This project implements an ELT (Extract, Load, Transform) pipeline within an AWS cloud infrastructure, designed to process data from the Guardian API and load it into a Data Warehouse for analysis.

## Tools and Technologies

#### Terraform: Used for infrastructure provisioning, ensuring consistent and repeatable deployment of AWS resources.
#### Python: Handles the extraction, transformation, and loading (ETL) processes.
#### Apache Airflow: Orchestrates and schedules the workflow, managing dependencies and task execution.
#### Amazon Web Services (AWS): Cloud infrastructure provider, with the following key components:
#### Amazon S3: Serves as the Data Lake, storing raw data extracted from the Guardian API.
#### Amazon Redshift: The Data Warehouse where transformed data is loaded and made available for querying and analysis.
![Bimmy_Architecture](https://github.com/RukayatJimoh/AWS-resources-deploy-using-Terraform-/assets/107076451/5a922ef1-7923-416b-b2e3-05cc05f07c5f)
