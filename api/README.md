# Kookie API - THE Batch Cooking API

Meilleure application de batch cooking qui optimise votre temps, le frontend se trouve ici [Kookie](https://gitlab.com/Elayve/kookie/-/tree/master/mobile/kookie)

## Description long

Conservez toutes vos recettes préférées en un seul endroit!
Kookie est un gestionnaire de recettes avec de nombreuses fonctionnalités dont l'optimisation de votre recette.  
Une fois que vous avez créé votre compte, vous pourriez synchroniser vos recettes à travers vos appareils.

## Guide de démarrage
### Pour commencer il faut
 - créer une BDD prostgresql
 - modifier /src/main/resources/application.properties
   - spring.datasource.url=127.0.0.1:<port de ta BDD>
   - spring.datasource.username=tonlogin
   - spring.datasource.password=tonmddp
### RTFM
[Lire les docs](https://spring.io/guides/gs/rest-service/)

## Dépendance utilisée:
- [json_annotation](https://pub.dev/packages?q=json_annotation)
- [http](https://pub.dev/packages?q=http)
- [shared_preferences](https://pub.dev/packages?q=shared_preferences)
- [image_picker](https://pub.dev/packages?q=image_picker)
- [flutter_launcher_icons](https://pub.dev/packages?q=flutter_launcher_icons)
- [build_runner](https://pub.dev/packages?q=build_runner)
- [json_serializable](https://pub.dev/packages?q=json_serializable)

## Fonctionnalités
## Fonctionnalités actuelles:
- Créer un compte
- S'authentifier
- Afficher une liste de recette (thumbnail)
- Afficher une liste de recette par catégorie (thumbnail)
- Ajouter une recette en favoris
- Afficher des recette dans les favoris
- Afficher de son profil
- Créer une recette
- Afficher ses recette crée sur l'ecran
    - mes recettes
    - accueil
- Afficher la page de recette (détaille)
- Lancer la préparation de la recette
- Optimiser une recette au lancement de la préparation

Voir les infos liée a la version actuelle:
- [Milestone](https://gitlab.com/Elayve/kookie/-/milestones/1)
- [tag](https://gitlab.com/Elayve/kookie/-/tags/LIVRAISON_FINALE)
- [Release](https://gitlab.com/Elayve/kookie/-/releases)

## Fonctionnalités Future:
Le futur milestone est en cours, nous sommes entrain de definir les fonctionalités de la version suivante.  
Voici ce qu'on a pour le moment :
- Modifier le nombre de repas de la recette
- Rechercher une recette par son nom
- Filtrer les recettes en fonction des ingrédients
- Générer une liste de courses avec une recette
- Ajouter des recettes en favoris
- Modification d'une recette
- Ajout un champ difficulté dans recette
- Système de ratings sur recette
- Système de commentaire sur les recettes
- Pouvoir saisir ses électroménagers
- Pouvoir saisir ses ustensiles

Si vous avez des propositions, n'hésites pas [c'est par ici](https://gitlab.com/Elayve/kookie/-/issues)  
Un petit rapelle de guideline d'issues :
- Fonctionalité :
    - feat(mobile): superfeature
    - feat(api): superfeature
    - feat(api-mobile): superfeature
- Bug :
    - bug(mobile): Petite Description
    - bug(api): Petite Description
    - bug(api-mobile): Petite Description
## Screenshots:

 <div style="display: flex; flex-wrap: wrap;">
 <img style="flex: 1 1 auto" src="https://gitlab.com/Elayve/kookie/-/tree/master/archive/media/1.png" />
 <img style="flex: 1 1 auto" src="https://gitlab.com/Elayve/kookie/-/tree/master/archive/media/2.png" />
 <img style="flex: 1 1 auto" src="https://gitlab.com/Elayve/kookie/-/tree/master/archive/media/3.png" />
 <img style="flex: 1 1 auto" src="https://gitlab.com/Elayve/kookie/-/tree/master/archive/media/4.png" />
 <img style="flex: 1 1 auto" src="https://gitlab.com/Elayve/kookie/-/tree/master/archive/media/5.png" />
 <img style="flex: 1 1 auto" src="https://gitlab.com/Elayve/kookie/-/tree/master/archive/media/6.png" />
 <img style="flex: 1 1 auto" src="https://gitlab.com/Elayve/kookie/-/tree/master/archive/media/7.png" />
 <img style="flex: 1 1 auto" src="https://gitlab.com/Elayve/kookie/-/tree/master/archive/media/8.png" />
 <img style="flex: 1 1 auto" src="https://gitlab.com/Elayve/kookie/-/tree/master/archive/media/9.png" />
 <img style="flex: 1 1 auto" src="https://gitlab.com/Elayve/kookie/-/tree/master/archive/media/10.png" />
 <img style="flex: 1 1 auto" src="https://gitlab.com/Elayve/kookie/-/tree/master/archive/media/11.png" />
 <img style="flex: 1 1 auto" src="https://gitlab.com/Elayve/kookie/-/tree/master/archive/media/12.png" />
 <img style="flex: 1 1 auto" src="https://gitlab.com/Elayve/kookie/-/tree/master/archive/media/13.png" />
 <img style="flex: 1 1 auto" src="https://gitlab.com/Elayve/kookie/-/tree/master/archive/media/14.png" />
 <img style="flex: 1 1 auto" src="https://gitlab.com/Elayve/kookie/-/tree/master/archive/media/15.png" />
 </div>