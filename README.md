# Storio - Data Principal Engineer Assignment

This repo contains a scuffed version of `jaffle_shop`, a fictional ecommerce store. This project will be used to test your refactoring skills. In a nutshell: This dbt project transforms raw data from an app database into models ready for analytics.
However, the project is not well-structured, and the code is not very readable. Your task is to refactor the code to make it more readable and maintainable.
Things to consider:

- Warehouse layers
- Code readability
- Testing

The project contains [seeds](https://docs.getdbt.com/docs/building-a-dbt-project/seeds) that includes some (fake) raw data from a fictional app along with some basic dbt [models](https://docs.getdbt.com/docs/building-a-dbt-project/building-models), tests, and docs for this data.

## Running this project

Prerequisities: Python >= 3.8

1. Install the project in a virtual environment using your favorite python/env management tool
   - `uv`
   - `pipenv`
   - `poetry`
   - `venv`
   - ...
2. (`uv run`) `dbt build`
3. (`uv run`) `dbt docs generate`
4. (`uv run`) `dbt docs serve`

## Verifying your environment

1. Ensure your [profile](https://docs.getdbt.com/reference/profiles.yml) is setup correctly from the command line:

   ```shell
   dbt --version
   dbt debug
   ```

2. Load the CSVs with the demo data set, run the models, and test the output of the models using the [dbt build](https://docs.getdbt.com/reference/commands/build) command:

   ```shell
   dbt build
   ```

3. Query the data:

   Launch a DuckDB command-line interface (CLI):

   ```shell
   duckcli jaffle_shop.duckdb
   ```

   Run a query at the prompt and exit:

   ```
   select * from customers_with_order_info where customer_id = 42;
   exit;
   ```

   Alternatively, use a single-liner to perform the query:

   ```shell
   duckcli jaffle_shop.duckdb -e "select * from customers_with_order_info where customer_id = 42"
   ```

   or:

   ```shell
   echo 'select * from customers_with_order_info where customer_id = 42' | duckcli jaffle_shop.duckdb
   ```

4. Generate and view the documentation for the project:
   ```shell
   dbt docs generate
   dbt docs serve
   ```

## Running `build` steps independently

1. Load the CSVs with the demo data set. This materializes the CSVs as tables in your target schema. Note that a typical dbt project **does not require this step** since dbt assumes your raw data is already in your warehouse.

   ```shell
   dbt seed
   ```

2. Run the models:

   ```shell
   dbt run
   ```

   > **NOTE:** If you decide to run this project in your own data warehouse (outside of this DuckDB demo) and steps fail, it might mean that you need to make small changes to the SQL in the models folder to adjust for the flavor of SQL of your target database. Definitely consider this if you are using a community-contributed adapter.

3. Test the output of the models using the [test](https://docs.getdbt.com/reference/commands/test) command:
   ```shell
   dbt test
   ```

## Browsing the data

Some options:

- [DuckDB UI](https://duckdb.org/docs/stable/extensions/ui.html)
- [duckcli](https://pypi.org/project/duckcli/)
- [DuckDB CLI](https://duckdb.org/docs/installation/?environment=cli)
