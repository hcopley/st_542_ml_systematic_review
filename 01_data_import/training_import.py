# -*- coding: utf-8 -*-
"""
Created on Thu Jan 29 02:44:39 2026

@author: Heather
"""

import pandas as pd

# Training data: 
train = pd.read_csv("pdr006_nodups.csv")[['id', 'title', 'title2','abstract']]

# Training data labels: 

labeled = pd.read_excel("Copy of full-text screening 20190909.xlsx")[['id']]

labeled['screened '] = 1

train_labeled = pd.merge(train, labeled, on='id', how='left')


# Basic structure
print(pd.shape)
print(df.columns)
df.head()
