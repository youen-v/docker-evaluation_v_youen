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
