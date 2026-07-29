#!/bin/bash
# =====================================================
#  setup_project.sh - Creation automatique d'un projet IA
#  Formation IA - Promo 1 - Sonatel Academie
#  Auteur: HAROUNA MBAYE
# =====================================================

# 1. Demander le nom du projet
# read affiche un message et attend que l'utilisateur tape le nom
read -p "Nom du projet : " NOM
# On construit le chemin complet du projet dans le dossier personnel
PROJET="$HOME/$NOM"

# 2. Creer l'arborescence
# mkdir -p cree les dossiers et leurs parents en une seule fois
# Les accolades {} evitent de repeter le chemin pour chaque dossier
mkdir -p $PROJET/{datasets/brut,datasets/clean,config,logs,scripts,models,api,backup,documentation,shared}

# 3. Creer le fichier de configuration
# cat > fichier << EOF ecrit tout le bloc de texte dans le fichier
# Les variables $NOM et $(whoami) sont remplacees par leurs valeurs
cat > $PROJET/config/settings.conf << EOF
PROJECT_NAME=$NOM
DATA_PATH=datasets/brut
MODEL_PATH=models
LOG_LEVEL=INFO
API_PORT=8000
AUTHOR=$(whoami)
EOF

# 4. Installer les outils
# -y repond automatiquement oui pour ne pas bloquer le script
sudo apt install -y git curl wget htop tree python3 python3-pip unzip

# 5. Telecharger le dataset
# -q mode silencieux, -O choisit le nom et l'emplacement du fichier
wget -q -O $PROJET/datasets/brut/iris.csv \
     https://raw.githubusercontent.com/mwaskom/seaborn-data/master/iris.csv

# 6. Compresser le projet
# -c creer, -z compresser en gzip, -f nom de l'archive
# -C se place dans le dossier personnel, --exclude evite d'archiver backup dans lui-meme
tar -czf $PROJET/backup/$NOM.tar.gz -C $HOME --exclude="$NOM/backup" $NOM

# 7. Afficher le resume
# echo affiche un message a l'ecran pour confirmer que tout s'est bien passe
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
