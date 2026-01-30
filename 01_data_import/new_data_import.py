# -*- coding: utf-8 -*-
"""
Import new data to predict on
"""

import pandas as pd
from rispy import load

# Path to RIS file
ris_path = "C:/Users/Heather/Documents/ST 542 Project/20190401_20200131.ris"

# Read the RIS file
with open(ris_path, "r", encoding="utf-8", errors="ignore") as f:
    records = load(f)

# records is now a list of dictionaries (one per citation)
len(records)

df = pd.DataFrame(records)

df.head()
df.columns

# How many records?
n_records = len(df)

# Missing abstracts
pct_missing_abstracts = (df["abstract"].isna() | (df["abstract"] == "")).mean()

# Abstract length (in characters)
df["abstract_len"] = df["abstract"].fillna("").str.len()

print(f"Records: {n_records}")
print(f"% missing abstracts: {pct_missing_abstracts:.1%}")
print(df["abstract_len"].describe())

print(df["abstract"][1])
