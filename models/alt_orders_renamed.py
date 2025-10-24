from datetime import datetime

import pandas as pd

def fix_df (orders_df: pd.DataFrame):
    ... # Implement this


def model(dbt, session):
    df: pd.DataFrame = dbt.ref("orders_csv").to_df()
    fix_df(df)
    return df