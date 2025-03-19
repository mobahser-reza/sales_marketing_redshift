# dbt Project: Marketing and Sales Performance

This dbt project is designed to transform and analyze marketing and sales data. It includes staging models, a final fact model, data quality tests, and a reusable macro for calculating the revenue-to-cost ratio.

---

## Table of Contents
1. [Project Overview](#project-overview)
2. [Setup Instructions](#setup-instructions)
   - [Local Setup](#local-setup)
   - [Cloud Setup](#cloud-setup)
3. [Project Structure](#project-structure)
4. [Running the Project](#running-the-project)
   - [Running Models](#running-models)
   - [Running Tests](#running-tests)
5. [Documentation](#documentation)
6. [Macros](#macros)
7. [Data Quality Tests](#data-quality-tests)
8. [Troubleshooting](#troubleshooting)
9. [Contact Information](#contact-information)

---

## Project Overview
This project aggregates marketing and sales data to generate key performance metrics, such as:
- Total revenue and cost.
- Total marketing cost and events.
- Revenue-to-cost ratio.

The project is structured into staging models and a final fact model:
- **Staging Models**:
  - `stg_sales_transactions`: Aggregates sales data by year, month, and category.
  - `stg_marketing_events`: Aggregates marketing data by year, month, and campaign.
  - `stg_product_catalog`: Contains product details.
- **Final Model**:
  - `fct_marketing_sales_performance`: Combines sales and marketing data to calculate performance metrics.

---

## Setup Instructions

### Local Setup
1. **Install dbt**:
   - Ensure you have Python installed (version 3.7 or higher).
   - Install dbt and the Redshift adapter:
     ```bash
     pip install dbt-redshift
     ```
2. **Initialize the Project**:
   - Run the following command to create a new dbt project:
     ```bash
     dbt init my_project
     ```
   - This will create a new folder called `my_project` with the default dbt project structure.
3. **Navigate to the Project Folder**:
   - Move into the newly created project folder:
     ```bash
     cd my_project
     ```
4. **Configure `profiles.yml`**:
   - Create or update the `profiles.yml` file in your `.dbt` folder (located at `~/.dbt/` on macOS/Linux or `C:\Users\<YourUsername>\.dbt\` on Windows).
   - Example `profiles.yml`:
     ```yaml
     my_project:
       target: dev
       outputs:
         dev:
           type: redshift
           host: <your_host>
           port: 5439
           user: <your_username>
           password: <your_password>
           dbname: <your_database>
           schema: public
     ```
5. **Test the Connection**:
   - Run the following command to test the connection to your data warehouse:
     ```bash
     dbt debug
     ```

### Cloud Setup
1. **Set Up dbt Cloud**:
   - Log in to your dbt Cloud account.
   - Create a new project and connect it to your data warehouse (e.g., Redshift).
2. **Configure Credentials**:
   - In dbt Cloud, configure the connection credentials for your data warehouse.
3. **Test the Connection**:
   - Use the dbt Cloud interface to test the connection.

---

## Project Structure
my_project/

├── dbt_project.yml # Project configuration

├── models/ # SQL models

│ ├── stg_sales_transactions.sql

│ ├── stg_marketing_events.sql

│ ├── stg_product_catalog.sql

│ └── fct_marketing_sales_performance.sql

├── macros/ # Reusable macros

│ └── calculate_revenue_to_cost_ratio.sql

├── schema.yml # Documentation and tests

└── README.md # This file



---

## Running the Project

### Running Models

1. **Run All Models**:
   ```bash
   dbt run
Run a Specific Model:


dbt run --models stg_sales_transactions

Running Tests
Run All Tests:


dbt test

Run Tests for a Specific Model:


dbt test --models stg_sales_transactions
Documentation
Model Documentation

stg_sales_transactions:

Aggregates sales data by year, month, and category.

Key Columns:


transaction_year: Year of the transaction.

transaction_month: Month of the transaction.

unique_customers: Number of unique customers.

total_revenue: Total revenue from transactions.

total_cost: Total cost of transactions.


fct_marketing_sales_performance:

Combines sales and marketing data to calculate performance metrics.


Key Columns:

revenue_to_cost_ratio: Ratio of total revenue to total cost.

Test Documentation

not_null Tests:

Ensure that critical columns (e.g., transaction_year, transaction_month) are not null.


accepted_values Tests:

Ensure that the revenue_to_cost_ratio falls within a valid range (0 to 5).

Macros
calculate_revenue_to_cost_ratio


Purpose:

Calculates the revenue-to-cost ratio for a given set of revenue and cost values.

Avoids division by zero by returning 0 if the cost is zero or negative.


Usage:

sql

{{ calculate_revenue_to_cost_ratio('s.total_revenue', 's.total_cost') }} AS revenue_to_cost_ratio
Data Quality Tests


The following tests are implemented to ensure data quality:


not_null:

Ensures that critical columns are not null.


unique:

Ensures that primary key columns are unique.


accepted_values:

Ensures that specific columns fall within a valid range.

Troubleshooting
Common Issues


Connection Errors:

Ensure that your profiles.yml file is correctly configured.

Test the connection using dbt debug.


Model Errors:

Check the logs for detailed error messages.

Verify that all dependencies (e.g., staging models) are correctly defined.



Test Failures:

Investigate the failing rows using the dbt test --store-failures command.

Generating Documentation
To generate and view the project documentation, run the following commands:


Generate Documentation:

dbt docs generate


Serve Documentation:


After generating the documentation, you can view it locally by running:
dbt docs serve


This will start a local web server, and you can access the documentation by opening your browser and navigating to:

http://localhost:8080
Contact Information


For questions or support, please contact:

Name: M. Mobasher Reza

Email: mobasher8787@gmail.com
