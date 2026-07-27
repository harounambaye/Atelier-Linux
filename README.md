# Atelier Linux — Préparation d'un environnement de développement IA

## Contexte

Dans le cadre de notre formation en IA promo 1 à la Sonatel Académie, nous
travaillons sur la mise en place complète d'un environnement de développement
Linux destiné à un projet d'Intelligence Artificielle.

L'objectif de cet atelier est de maîtriser les fondamentaux de l'administration
système Linux qui constituent le socle de tout projet Data / IA : structurer
les données, manipuler les fichiers en ligne de commande, gérer les
utilisateurs et leurs droits d'accès, installer l'outillage, récupérer un jeu
de données depuis Internet, superviser les processus, sauvegarder le travail
et automatiser l'ensemble par un script Bash.

## Objectifs pédagogiques

- Organiser les données d'un projet IA dans une arborescence claire
- Manipuler des fichiers : lecture, recherche, copie, archivage
- Gérer les utilisateurs, les groupes et les permissions (modèle UGO/rwx)
- Sécuriser l'accès aux jeux de données et aux modèles
- Installer et vérifier les outils nécessaires (git, python3, curl, wget...)
- Télécharger et inspecter un dataset
- Lancer, surveiller et arrêter des traitements (gestion des processus)
- Sauvegarder le projet sous forme d'archive compressée
- Automatiser la mise en place complète via `setup_project.sh`

## Arborescence du projet

IA_Project/
├── api/                 # Code de l'API de prédiction
├── backup/              # Archives de sauvegarde (.tar.gz)
├── config/              # Fichiers de configuration
│   ├── settings.conf
│   └── model.conf
├── datasets/            # Jeux de données
│   ├── brut/            # Données brutes (jamais modifiées)
│   └── clean/           # Données nettoyées
├── documentation/       # Documentation du projet
├── logs/                # Journaux applicatifs et d'entraînement
│   ├── application.log
│   └── training.log
├── models/              # Modèles entraînés et métadonnées
├── scripts/             # Scripts Python et Bash
│   ├── train.py
│   ├── preprocess.py
│   └── print-pause.py
└── shared/              # Espace de travail partagé entre équipes

## Utilisateurs et groupes

| Utilisateur | Fonction        | Groupes        |
|-------------|-----------------|----------------|
| alice       | Data Scientist  | data, models   |
| bob         | Data Engineer   | data           |
| charles     | Développeur API | api            |
| diane       | MLOps Engineer  | mlops          |
| eva         | Stagiaire       | interns        |
| frank       | Data Scientist  | data, models   |

## Environnement

- Distribution : Ubuntu 24.04 LTS (WSL 2 sous Windows 11)
- Shell : Bash
- Python : 3.x

## Auteur

HAROUNA MBAYE
Formation IA — Promo 1 — Sonatel Académie
