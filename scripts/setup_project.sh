#!/bin/bash
# =====================================================
#  setup_project.sh - Creation automatique d'un projet IA
#  Formation IA - Promo 1 - Sonatel Academie
#  Auteur: HAROUNA MBAYE
# =====================================================

# 1. Demander le nom du projet
read -p "Nom du projet : " NOM
PROJET="$HOME/$NOM"

# 2. Creer l'arborescence
mkdir -p $PROJET/{datasets/brut,datasets/clean,config,logs,scripts,models,api,backup,documentation,shared}

# 3. Creer le fichier de configuration
cat > $PROJET/config/settings.conf << EOF
PROJECT_NAME=$NOM
DATA_PATH=datasets/brut
MODEL_PATH=models
LOG_LEVEL=INFO
API_PORT=8000
AUTHOR=$(whoami)
EOF

# 4. Installer les outils
sudo apt install -y git curl wget htop tree python3 python3-pip unzip

# 5. Telecharger le dataset
wget -q -O $PROJET/datasets/brut/iris.csv \
     https://raw.githubusercontent.com/mwaskom/seaborn-data/master/iris.csv

# 6. Compresser le projet
tar -czf $PROJET/backup/$NOM.tar.gz -C $HOME --exclude="$NOM/backup" $NOM

# 7. Afficher le resume
echo "=========================="
echo "Projet cree"
echo "Nom : $NOM"
echo "Arborescence : OK"
echo "Fichier de config : OK"
echo "Logiciels : OK"
echo "Datasets : OK"
echo "Archive : backup/$NOM.tar.gz"
echo "Installation terminee."
echo "=========================="
