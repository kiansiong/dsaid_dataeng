import os
import pandas as pd
from nameparser import HumanName
from datetime import date


def split_name(name):
    n = HumanName(name)
    return pd.Series([n.first, n.last])


def process_dataset(df):
    # COMMENTS: Re-ordered the processing steps for efficiency

    df_tmp = df.copy()
    # 1. Remove rows which do not have a name
    df_tmp = df_tmp[df_tmp['name'].notna()]

    # 2. Split name into first_name and last_name columns
    df_tmp[['first_name', 'last_name']] = df_tmp['name'].apply(lambda x: split_name(x))

    # 3. Remove 0 prepended to the price field by converting the data type of 'price' column to float
    df_tmp['price'] = pd.to_numeric(df_tmp['price'])

    # 4. Create new field if row has price > 100
    df_tmp['above_100'] = df_tmp['price'].apply(lambda x: True if x>100 else False)

    return df_tmp[['first_name','last_name','price','above_100']]

if __name__ == "__main__":
    data_input_path = '/data'
    data_output_path = 'processed'
    file_list = os.listdir(os.getcwd() + data_input_path)

    # Get current date
    dt_str = date.today().strftime("%Y%m%d")

    for f in file_list:
        if f.endswith('.csv'):
            print("Processing file ", f)
            df = pd.read_csv('data/'+f)
            df = process_dataset(df)

            f_name = os.path.splitext(f)[0]
            f_output_name = '{}_cleaned_{}.csv'.format(f_name, dt_str)
            f_output = os.path.join(data_output_path, f_output_name)
            df.to_csv(f_output, index=False)

            print(df.head(10))
