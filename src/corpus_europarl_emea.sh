#!/bin/bash

# S'assurer d'être dans le répertoire EuroparlEMEA/

# Corpus train
cat ../AllEuroparl/Europarl.en-fr.fr | head -100000 > Europarl_train_100k.fr
cat ../AllEuroparl/Europarl.en-fr.en | head -100000 > Europarl_train_100k.en
cat ../EMEA/EMEA.en-fr.en | head -10000 > Emea_train_10k.en 
cat ../EMEA/EMEA.en-fr.fr | head -10000 > Emea_train_10k.fr

# Corpus de dev
cat ../AllEuroparl/Europarl.en-fr.fr | head -103751 | tail -3750 > Europarl_dev_3750.fr
cat ../AllEuroparl/Europarl.en-fr.en | head -103751 | tail -3750 > Europarl_dev_3750.en

# Corpus de test
cat ../AllEuroparl/Europarl.en-fr.fr | head -104251 | tail -500 > Europarl_test_500.fr
cat ../AllEuroparl/Europarl.en-fr.en | head -104251 | tail -500 > Europarl_test_500.en
cat ../EMEA/EMEA.en-fr.en | head -10501 | tail -500 > Emea_test_500.en 
cat ../EMEA/EMEA.en-fr.fr | head -10501 | tail -500 > Emea_test_500.fr
