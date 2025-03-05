# Exercice 1 Validation d'aquis 

## Questionnaire avec réponse :

*1. Qu’est ce qu’un conteneur ?*

    Un conteneur est un programme indépendant qui permet de contenir une application avec ses dépendances dans un environnement propre.


*2. Est-ce que Docker a inventé les conteneurs Linux ? Qu’a apporté Docker à cette technologie ?*

    Docker n'as pas inventeé les conteneurs Linux, Docker a permis la simplification l'utilisation des conteneurs avec une standadisation de celui-ci.


*3. Pourquoi est-ce que Docker est particulièrement pensé et adapté pour la conteneurisation de
processus sans états (fichiers, base de données, etc.) ?*

    Dans Docker les conteneurs peuvent être éphémères et recréent à la demande.


*4. Quel artefact distribue-t-on et déploie-t-on dans le workflow de Docker ? Quelles propriétés
désirables doit-il avoir ?*

    L'artefact distribué et déployé est une image, elle doit être légère, reproductible et contenir le strict nécessaire à son exécution.


*5. Quelle est la différence entre les commandes docker run et docker exec ?*

    * docker run : crée et démarre un conteneur.
    * docker exec : exécute une commande dans un conteneur en cours d'exécution.


*6. Peut-on lancer des processus supplémentaires dans un même conteneur docker en cours
d’execution ?*

    Oui avec la commande docker exec qui vien exécuter une nouvelle tache dans le conteneur, comme lancer une commande dans une terminal. 


*7. Pourquoi est il fortement recommandé d’utiliser un tag précis d’une image et de ne pas utiliser le
tag latest dans un projet Docker ?*

    Car le tag latest ne pointe pas vers une version fixe, ce qui peut entraîner des bugs du a des mises à jour non voulu.


*8. Décrire le résultat de cette commande : docker run -d -p 9001:80 --name my-php -v
"$PWD":/var/www/html php:8.2-apache.*

    * docker run : crée et démarre un nouveau conteneur.
    * -d : L'option lance un conteneur en arrière-plan.
    * -p 9001:80 : Mappe le port 9001 de l’hôte au port 80 du conteneur.
    * --name my-php : Définie le nom du conteneur.
    * -v "$PWD":/var/www/html : Sert à monter un volume le $PWD represente le répertoire de la machine hôte,
        et le /var/www/html représente le dossier ou monter le volum dans le conteneur.


*9. Avec quelle commande docker peut-on arrêter tous les conteneurs ?*

    docker stop $(docker ps -q)

*10. Quelles précautions doit-on prendre pour construire une image afin de la garder de petite taille et
faciliter sa reconstruction ? (2 points)*

    Il faut utiliser une image de base légère et supprimer les fichier temporaires.


*11. Lorsqu’un conteneur s’arrête, tout ce qu’il a pu écrire sur le disque ou en mémoire est perdu. Vrai
ou faux ? Pourquoi ?*

    Faux, les données écrite sur le disque du conteneur sont conservées mais pas celles en mémoire.


*12. Lorsqu’une image est crée, elle ne peut plus être modifiée. Vrai ou faux ?*

    Vrai.


*13. Comment peut-on publier et obtenir facilement des images ?*

    On peut publier des images sur un registre avec docker push après s’être connecté et obtenir des images avec docker pull.


*14. Comment s’appelle l’image de plus petite taille possible ? Que contient-elle ?*

    L’image la plus petite possible s’appelle scratch, elle ne contient rien


*15. Par quel moyen le client docker communique avec le serveur dockerd ? Est-il possible de
communiquer avec le serveur via le protocole HTTP ? Pourquoi ?*

    Le client Docker communique via un socket Unix sur Linux "docker.socket" ou un pipe nommé sur windows.
    Non pas par HTTP pour des raisons de sécurité.



*16. Un conteneur doit lancer un processus par défaut que l’on pourra override à l’execution. Quelle
commande faut-il utiliser pour lancer ce processus : CMD ou ENTRYPOINT ?*

    Il faut utiliser CMD pour lancer ce processus.

