# OpenNMT_m1tal

## Comment lancer les scripts ?

### pretraitement.sh

`./pretraitement.sh $SOURCE $CIBLE`
Par exemple:
- SOURCE = Europarl_train_10k.fr
- CIBLE = Europarl_train_10k.en

### corpus_europarl_emea.sh

Script qui extrait non aléatoirement (donc en se basant sur le rang des phrases) les corpus d'Europarl et d'Emea pour l'exercice III.
Il faut se mettre dans un sous-dossier de data/ (par exemple: data/EuroparlEMEA/)
`../../src/corpus_europar_emea.sh`


### train_test_split.py

Script qui extrait aléatoirement les corpus d'Europarl et d'Emea pour l'exercice III.
Il faut se mettre dans un sous-dossier de data/ (par exemple: data/EuroparlEMEA/)

`../../src/train_test_split.py`

