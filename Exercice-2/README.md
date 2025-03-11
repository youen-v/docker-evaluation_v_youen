# Exercice 2

_2. Quelle commande faut-il utiliser pour ouvrir un processus bash interactif sur le conteneur de la base de données MySQL ? Donner ensuite les commandes shell à utiliser pour vérifier que la base par défaut est bien présente ainsi que son contenu initial._

    Pour ouvrir un processus bash dans le conteneur MySQL: - docker exec -it database bash
        1. docker exec -it database mysql -u root -p
        2. SHOW DATABASES;
        3. USE docker_doc_dev;
        4. SHOW TABLES;
        5. SELECT * FROM article;
        6. exit (Quitte l'interface en ligne de commande MySQL)

_3. Réaliser un dump de la base de données sur votre machine hôte avec mysqldump en executant une commande supplémentaire sur le conteneur mysql avec docker compose exec sans utiliser le mode interactif (sans ouvrir de session bash au préalable). Stocker le dump dans un fichier dump.sql. Donner la commande pour réaliser cette tâche. Remarque: le conteneur mysql dispose déjà programme mysqldump, inutile de l’installer._

    docker compose exec database mysqldump -u root -p${MYSQL_ROOT_PASSWORD} --databases docker_doc_dev > database/dump.sql

_5. Au lancement du projet, le service client doit interroger la base de données docker_doc_dev et afficher le contenu de la table article de la base de données docker_doc_dev sur une page web(document HTML).Donner l’URL locale pour accéder à cette page web._

[Lien vers localhost port 8080](http://localhost:8080/)

_6. Configurer le fichier Compose pour permettre de développer le script client PHP (le modifier, l’éditer) sans avoir à reconstruire l’image à chaque changement. Indiquer la commande pour relancer le projet permettant de recharger les sources dès qu’elles changent._

    ``
    volumes:
      - ./client:/var/www/html
    ``
    Permet de modifier le script client PHP sans avoir à reconstruire l’image.
    La commande est: docker compose up --watch

_7. En vous basant sur une stratégie de votre choix, créer des fichiers d’environnement et modifier le fichier Compose pour configurer les deux environnement différents au lancement du projet (docker compose up). Fournissez les deux commandes suivantes :_
_Une commande pour lancer le projet dans l’environnement dev;_
_Une autre pour lancer le projet dans l’environnement prod._

    J'ai choisi une stratégie basée sur deux volumes un pour chaque environnement pour des raisons de sécurité entre les Base de Données.
    Commande pour l'environnement de Dev : `docker compose --env-file .env.dev up -d`
    Commande pour l'environnement de Prod : `docker compose --env-file .env.prod up -d`

_8. Est-ce une bonne pratique de placer des données sensibles (password, clés secrètes, etc.) dans des variables d’environnement comme on le fait ici ? Pourquoi ? Quelle autre option mise à disposition par Docker faut-il privilégier pour le faire et pourquoi ?_

    Non ce n'est pas une bonne pratique, car les variables d’environnement exposent les données sensibles.
    Docker mets a disposition `Docker Secrets`, il stocke les données sensibles de manière chiffrée et limite leur accès aux services autorisés.

## Mode Opératoire

1. git clone du repository
2. docker compose up -d --build
3. Env DEV : docker compose --env-file .env.dev up -d
   ([localhost port 8080](http://localhost:8080/) avec donnée dans la DB)
4. Env PROD : docker compose --env-file .env.pro up -d
   ([localhost port 8080](http://localhost:8080/) sans données)
