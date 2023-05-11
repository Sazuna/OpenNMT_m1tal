#!/bin/bash

# Tokenisation
../../mosesdecoder/scripts/tokenizer/tokenizer.perl -l en < ../Translation/Europarl_train_10k.en > ../Translation/Europarl_train_10k.tok.en
../../mosesdecoder/scripts/tokenizer/tokenizer.perl -l fr < ../Translation/Europarl_train_10k.fr > ../Translation/Europarl_train_10k.tok.fr

# Apprentissage du modèle de transformation
../../mosesdecoder/scripts/recaser/train-truecaser.perl --model ../Translation/truecase-model.en --corpus ../Translation/Europarl_train_10k.tok.en
../../mosesdecoder/scripts/recaser/train-truecaser.perl --model ../Translation/truecase-model.fr --corpus ../Translation/Europarl_train_10k.tok.fr

# Transformation des majuscules en minuscules

../../mosesdecoder/scripts/recaser/truecase.perl --model ../Translation/truecase-model.en < ../Translation/Europarl_train_10k.tok.en > ../Translation/Europarl_train_10k.tok.true.en
../../mosesdecoder/scripts/recaser/truecase.perl --model ../Translation/truecase-model.fr < ../Translation/Europarl_train_10k.tok.fr > ../Translation/Europarl_train_10k.tok.true.fr
