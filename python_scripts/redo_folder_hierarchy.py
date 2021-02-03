import os
from shutil import copytree
import pandas as pd


def main():

    df = pd.read_csv("../demographics.csv")
    subjs = list(set(df["contact_info"].tolist()))

    groups = df.groupby(['contact_info'])

    new_df = pd.DataFrame()
    for g in groups:
        g[1][['Date', 'Session']] = df['Subject'].str.split("_", expand=True)
        g[1]['Date'] = pd.to_datetime(g[1]['Date'])
        g[1].sort_values(by=['Date', 'Session'])

        for indx, row in enumerate(g[1].iterrows()):
            row[1]['sess'] = int(indx + 1)
            new_df = new_df.append(row[1])

    groups = new_df.groupby(['contact_info'])

    for i, g in enumerate(groups):
        for row in enumerate(g[1].iterrows()):
            dir_name = f"./new_folder/par_{i}/session_{int(row[1][1]['sess'])}/"
            if not os.path.exists(dir_name):
                os.makedirs(dir_name)
            target = f"../finger_tapping_data/{row[1][1]['Subject']}"
            dest = f"{dir_name}{row[1][1]['Subject']}"
            print(f"Copying {target} to {dest}")
            copytree(target, dest)








if __name__ == "__main__":
    main()
