#!/usr/bin/env bash

set -e

git clone https://github.com/jbeder/yaml-cpp
git clone https://github.com/brandonprry/yaml-fuzz

mv yaml-fuzz/raw_testcases seed_corpus
rm -rf yaml-fuzz

cd yaml-cpp
git checkout ee99c4151c1af794a412b101a75921c086acaac0

