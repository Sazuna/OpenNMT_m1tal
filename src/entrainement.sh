#!/bin/bash

CONFIG=$1 # configuration file (yaml)
N_SAMPLE=$2 # nombre de samples (10000 par ex)

# Construction du vocabulaire
onmt_build_vocab -config $CONFIG -n_sample $N_SAMPLE

# Entraînement
onmt_train -config $CONFIG
