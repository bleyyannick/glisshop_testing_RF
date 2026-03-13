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

## Documentation des keywords

Les keywords sont organises en 2 niveaux pour separer le metier de la technique :

- `resources/keywords/` : keywords metier (actions fonctionnelles lisibles pour les tests)
- `resources/pages/` : keywords techniques (interaction bas niveau Selenium, synchronisation, UI)

Cartographie des keywords metier :

- `resources/keywords/common_keywords.robot` : authentification, deconnexion, assertions de connexion
- `resources/keywords/connexion_keywords.robot` : scenario metier de tentative de connexion
- `resources/keywords/creation_compte.keywords.robot` : scenario metier de creation de compte
- `resources/keywords/ajout_ski_keywords.robot` : parcours panier/commande/paiement

Cartographie des keywords techniques :

- `resources/pages/common_page.robot` : primitives techniques reutilisables (clic, scroll, attente, iframe, checkbox Angular)
- `resources/pages/connexion_page.robot` : formulaire/validations techniques de connexion
- `resources/pages/creation_compte.robot` : formulaire/validations techniques de creation de compte

Bonnes pratiques keywords :

- Nommer les keywords en phrase orientee action (ex: `Valider la commande`).
- Garder les assertions explicites dans des keywords dedies (`Verifier ...`).
- Eviter d'utiliser des selecteurs en dur dans les tests: passer par les locators centralises.
- Utiliser les keywords techniques de `common_page.robot` pour toute interaction Selenium (attentes, clics, iframe).

## Documentation des locators

Les locators sont centralises dans `resources/locators/` pour faciliter la maintenance.

Repartition :

- `common_locators.robot` : locators partages (connexion/deconnexion, boutons communs)
- `connexion_locators.robot` : formulaire de connexion et messages d'erreur
- `creation_compte_locators.robot` : formulaire de creation de compte
- `ajout_ski_locators.robot` : menu produit, panier, livraison, paiement

Conventions locators :

- Prefixe explicite par type si pertinent (`xpath_`, `selecteur_`) et nom metier stable.
- Preferer `id` ou `css` quand possible; utiliser `xpath` pour les cas dynamiques/complexes.
- Pour les XPath dynamiques, toujours encadrer les variables Robot avec des quotes dans les predicats.
- Regrouper les locators par ecran/zone fonctionnelle avec des commentaires courts.

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