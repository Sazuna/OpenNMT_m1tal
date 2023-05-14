#!/bin/bash

SOURCE=$1
CIBLE=$2

source moses.env
EXT1=$(echo $SOURCE | rev | cut -d'.' -f 1 | rev)
EXT2=$(echo $CIBLE | rev | cut -d'.' -f 1 | rev)

# Tokenisation
SOURCE1=$(echo $SOURCE | sed 's/10k\./10k.tok./g')
CIBLE1=$(echo $CIBLE | sed 's/10k\./10k.tok./g')
$SCRIPTS_HOME/tokenizer/tokenizer.perl -l en < $SOURCE > $SOURCE1
$SCRIPTS_HOME/tokenizer/tokenizer.perl -l en < $CIBLE > $CIBLE1

# Apprentissage du modèle de transformation
MODEL1=${SOURCE%/*}/truecase-model.$EXT1
MODEL2=${CIBLE%/*}/truecase-model.$EXT2
$SCRIPTS_HOME/recaser/train-truecaser.perl --model $MODEL1 --corpus $SOURCE1
$SCRIPTS_HOME/recaser/train-truecaser.perl --model $MODEL2 --corpus $CIBLE1 


# Transformation des majuscules en minuscules
SOURCE2=$(echo $SOURCE1 | sed 's/tok\./tok.true./g')
CIBLE2=$(echo $CIBLE1 | sed 's/tok\./tok.true./g')
$SCRIPTS_HOME/recaser/truecase.perl --model $MODEL1 < $SOURCE1 > $SOURCE2
$SCRIPTS_HOME/recaser/truecase.perl --model $MODEL2 < $CIBLE1 > $CIBLE2


# Nettoyage en imitant la longueur des phrases à 80 caractères

BASE=${SOURCE2%.*}
$SCRIPTS_HOME/training/clean-corpus-n.perl $BASE $EXT1 $EXT2 $BASE.clean 1 80
