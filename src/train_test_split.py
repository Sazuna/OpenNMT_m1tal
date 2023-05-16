#!/bin/python3

from sklearn.model_selection import train_test_split

# s'assurer d'être dans le dossier EuroparlEMEA

source_Europarl=[]
with open ("../AllEuroparl/Europarl.en-fr.fr", 'r') as f:
	for line in f:
		source_Europarl.append(line)
target_Europarl=[]
with open ("../AllEuroparl/Europarl.en-fr.en", 'r') as f:
	for line in f:
		target_Europarl.append(line)

source_Emea=[]
with open ("../EMEA/EMEA.en-fr.fr", 'r') as f:
	for line in f:
		source_Emea.append(line)

target_Emea=[]
with open ("../EMEA/EMEA.en-fr.en", 'r') as f:
	for line in f:
		target_Emea.append(line)

train_Europarl_prop = 100000 / len(source_Europarl)
test_Europarl_prop = 500 / len(source_Europarl)
print(train_Europarl_prop)
X_train, X_test, y_train, y_test = train_test_split(source_Europarl, target_Europarl, test_size=test_Europarl_prop, train_size=train_Europarl_prop, random_state=42)

with open("./Europarl_train_100k.fr", "w") as f:
	for line in X_train:
		f.write(line)

with open("./Europarl_train_100k.en", "w") as f:
	for line in y_train:
		f.write(line)

with open("./Europarl_test_500.fr", "w") as f:
	for line in X_test:
		f.write(line)

with open("./Europarl_test_500.en", "w") as f:
	for line in y_test:
		f.write(line)

train_Emea_prop = 10000 / len(source_Emea)
test_Emea_prop = 500 / len(source_Emea)
X_train, X_test, y_train, y_test = train_test_split(source_Emea, target_Emea, test_size=test_Emea_prop, train_size=train_Emea_prop, random_state=42)

with open("./Emea_train_10k.fr", "w") as f:
	for line in X_train:
		f.write(line)

with open("./Emea_train_10k.en", "w") as f:
	for line in y_train:
		f.write(line)

with open("./Emea_test_500.fr", "w") as f:
	for line in X_test:
		f.write(line)

with open("./Emea_test_500.en", "w") as f:
	for line in y_test:
		f.write(line)
