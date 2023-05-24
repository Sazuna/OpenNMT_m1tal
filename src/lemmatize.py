#!/bin/python3
import argparse
import nltk
from nltk.stem import WordNetLemmatizer
from french_lefff_lemmatizer.french_lefff_lemmatizer import FrenchLefffLemmatizer

def main(args):
	nouveau_fichier = args.fichier.split('.')
	nouveau_fichier.insert(-1, 'lemma')
	extension = nouveau_fichier[-1]
	with open(args.fichier, "r") as f:
		tokens = f.read().split(' ')
	if extension == "en":
		nltk.download('wordnet')
		lemmatizer = WordNetLemmatizer()
	elif extension == "fr":
		lemmatizer = FrenchLefffLemmatizer()
	else:
		print("Extension non acceptée. Le nom du fichier doit se terminer par .en ou .fr")
	lemmas = [lemmatizer.lemmatize(token) for token in tokens]
	nouveau_fichier = '.'.join(nouveau_fichier)

	with open(nouveau_fichier, "w") as f:
		f.write(' '.join(lemmas))

if __name__ == "__main__":
	parser = argparse.ArgumentParser()
	parser.add_argument("-f", "--fichier", type=str)
	args = parser.parse_args()
	main(args)
