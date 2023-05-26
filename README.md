# OpenNMT_m1tal

## Comment lancer les scripts ?

### pretraitement.sh

S'assurer d'être dans le dossier src/

`./pretraitement.sh $SOURCE $CIBLE`
Par exemple:
- SOURCE = ../data/Europarl/Europarl_train_10k.fr
- CIBLE = ../data/Europarl/Europarl_train_10k.en

### entrainement.sh

`./entrainement.sh $CONFIG $N_SAMPLE
Avec:
- $CONFIG le lien vers le fichier yaml
- $N_SAMPLE le nombre de lignes qui sera utilisé pour créer le vocabulaire.

### corpus_europarl_emea.sh

Script qui extrait non aléatoirement (donc en se basant sur le rang des phrases) les corpus d'Europarl et d'Emea pour l'exercice III.
Il faut se mettre dans un sous-dossier de data/ (par exemple: data/EuroparlEMEA/)
`../../src/corpus_europar_emea.sh`


### train_test_split.py

Script qui extrait aléatoirement les corpus d'Europarl et d'Emea pour l'exercice III.
Il faut se mettre dans un sous-dossier de data/ (par exemple: data/EuroparlEMEA/)

`../../src/train_test_split.py`

### lemmatize.py

Script qui lemmatise un fichier (.en ou .fr).
Il prend un seul argument: -f ou --fichier et le nom du fichier à lemmatiser.

`./lemmatize.py -f ../data/EuroparlEMEA/Europarl_EMEA_110k.tok.true.en`
