# Projet d'automatisation de tests Glisshop

Ce projet d'automatisation de tests m'a permis de monter rapidement en competences sur Robot Framework et sur SeleniumLibrary.

L'objectif est de couvrir plusieurs parcours utilisateurs autour du site Glisshop, notamment la connexion, la creation de compte, l'ajout de produit dans le panier et la validation de commande.

## Stack utilisee

- Robot Framework
- SeleniumLibrary
- Python
- Chrome en mode headless

## Organisation du projet

- tests : suites de tests Robot Framework
- resources/keywords : mots-cles metier reutilisables
- resources/locators : centralisation des selecteurs
- resources/pages : mots-cles techniques et navigation
- variables : variables globales du projet
- data : donnees de test
- results : rapports et logs d'execution

## Prerequis

- Python installe
- Google Chrome installe
- Un environnement virtuel Python recommande

## Installation

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

## Lancer les tests

Execution de toutes les suites de tests :

```bash
source venv/bin/activate
robot -d results tests
```

Execution d'une seule suite :

```bash
source venv/bin/activate
robot -d results tests/connexion.robot
```

Execution d'un cas de test cible :

```bash
source venv/bin/activate
robot -d results -t "Nom du cas de test" tests/connexion.robot
```

## Mode headless et pipeline CI

Le projet est configure pour fonctionner en mode headless, ce qui le rend adapte a une execution en pipeline CI sans interface graphique.

La configuration navigateur ajoute notamment les options suivantes :

- --headless=new
- --no-sandbox
- --disable-dev-shm-usage
- --window-size=1920,1080

Cela permet d'executer les tests dans un environnement CI de maniere plus stable et plus proche d'un usage industrialise.

La commande a utiliser dans une pipeline CI reste donc la meme :

```bash
robot -d results tests
```

## Rapports generes

Apres execution, Robot Framework genere les fichiers suivants dans le dossier results :

- output.xml
- log.html
- report.html

Ces fichiers peuvent etre publies comme artefacts de pipeline pour consulter le detail des executions.